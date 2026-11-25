"""Independently check the composition, paired budgets and published totals of the hardware control."""
import collections
import hashlib
import json
import statistics
from pathlib import Path


def source_labels(targets, rows):
    needed=set(targets)
    retained=[]
    for t,a,_,b,_,_ in reversed(rows):
        if t in needed:
            retained.append(t)
            needed.update((abs(a),abs(b)))
    return frozenset(retained)


def check():
    root=Path('results')
    raw=json.loads((root/'matched-hardware.json').read_text())
    pairs={tuple(map(int,s.split())) for s in Path('data/panel.tsv').read_text().splitlines()}
    hcub=collections.defaultdict(list)
    for line in (root/'fft-hcub32.jsonl').open():
        row=json.loads(line)
        pair=tuple(map(int,row['name'].split(',')))
        if pair in pairs:hcub[pair].append(source_labels(pair,row['gates']))
    exact=collections.defaultdict(list)
    for line in (root/'panel-variants.tsv').open():
        a,b,*rest=map(int,line.split())
        exact[a,b].append(frozenset(rest))
    scores=collections.defaultdict(list)
    added=0
    assert len(pairs)==29 and set(hcub)==set(exact)==pairs
    for pair in sorted(pairs):
        name='-'.join(map(str,pair))+'.json'
        old=json.loads((root/'panel'/name).read_text())
        row=json.loads((root/'matched-panel'/name).read_text())
        assert tuple(row['targets'])==pair
        snapshot=row['designs']
        ids=set(snapshot)
        assert row['newly_mapped']==len(ids-old['designs'].keys())
        added+=row['newly_mapped']
        for sig,g in snapshot.items():
            assert sig==g['id']==hashlib.sha256(json.dumps(g['gates'],separators=(',',':')).encode()).hexdigest()
            seen={1}
            for t,a,i,b,j,r in g['gates']:
                assert t not in seen and t>0 and t%2==1 and {abs(a),abs(b)}<=seen
                assert t*(2**r)==a*(2**i)+b*(2**j)
                seen.add(t)
            assert set(pair)<=seen
            for result in g['maps'].values():assert result['checked_inputs']==65536
        base,altern=hcub[pair],exact[pair]
        distinct=min(len(set(base)),len(set(altern)))
        assert distinct>0 and len(base)==32
        for group in ('matched','full','conservative'):
            chosen=row['groups'][group]
            assert all(len(v)==len(set(v)) and set(v)<=ids for v in chosen.values())
            if group!='conservative':
                meta=row['portfolio_sizes'][group]
                assert len(chosen['hcub'])==len(chosen['exact'])==meta['mapped_per_side']
                if group=='matched':
                    left=tuple(dict.fromkeys(base))[:distinct]
                    right=tuple(dict.fromkeys(altern))[:distinct]
                else:
                    left,right=base,altern
                assert (len(left),len(right))==(meta['hcub_sequences'],meta['exact_sequences'])
                for side,allowed in [('hcub',left),('exact',right)]:
                    for sig in chosen[side]:
                        labels={gate[0] for gate in snapshot[sig]['gates']}
                        assert any(labels<=x for x in allowed)
                        if side=='exact':assert len(labels)==6
            else:
                assert set(chosen['hcub'])==set(old['reference'])|set(row['groups']['matched']['hcub'])|set(row['groups']['full']['hcub'])
                assert chosen['exact']==row['groups']['full']['exact']
            for flow in ('standard','resyn2'):
                for metric in ('area','delay_ps'):
                    scores[group,flow,metric].append([min(snapshot[k]['maps'][flow][metric] for k in chosen[side]) for side in ('hcub','exact')])
    assert added==raw['additional_graphs'] and 2*added==raw['additional_mapped_netlists']
    for (group,flow,metric),values in scores.items():
        a,b=map(sum,zip(*values))
        expected=raw['groups'][group][flow][metric]
        assert (round(a,2),round(b,2))==(expected['reference_sum'],expected['candidate_sum'])
        difference=[100*(x-y)/x for x,y in values]
        assert abs(100*(a-b)/a-expected['sum_saving_pct'])<0.000051
        assert abs(statistics.median(difference)-expected['median_saving_pct'])<0.000051
        assert [sum(v>0 for v in difference),sum(v==0 for v in difference),sum(v<0 for v in difference)]==[expected[k] for k in ('smaller','equal','larger')]
    print('Verified 29 source portfolios, label membership, signed gates, matched budgets and all 12 paired summaries.')


if __name__=='__main__':check()
