"""Give both label pools the same parent reassignment, selection rule and mapping budget."""
import argparse,collections,json,statistics
from pathlib import Path
from graphs import live_gates
from panel import assemble,design_id,portfolio,map_one


def unique_orders(orders):
    kept={}
    for seq in orders:kept.setdefault(tuple(sorted(seq)),seq)
    return list(kept.values())


def rewritten(T,orders,cache):
    pool={}
    for seq in orders:
        if seq not in cache:
            rr=[]
            for mode in ('span','delay'):
                g,proxy=assemble(T,seq,key=mode)
                live=live_gates(T,g)
                if len(live)!=len(g):
                    g,proxy=assemble(T,[z[0] for z in live],[(abs(z[1]),abs(z[3])) for z in live])
                rr.append((g,proxy))
            cache[seq]=rr
        pool.update(cache[seq])
    return pool


def compare(T,old,orders,exact,abc,lib):
    cache={};hold={}
    h_unique,e_unique=map(unique_orders,(orders,exact))
    n=min(len(h_unique),len(e_unique))
    ceiling=len(old['reference'])
    families={'matched':(h_unique[:n],e_unique[:n]),'full':(orders,exact)}
    groups={};pool_sizes={}
    for name,(ha,ea) in families.items():
        h=rewritten(T,ha,cache);e=rewritten(T,ea,cache)
        count=min(ceiling,len(h),len(e));assert count>0
        a,b=portfolio(h,count),portfolio(e,count)
        groups[name]={'hcub':[design_id(g) for g in a],'exact':[design_id(g) for g in b]}
        pool_sizes[name]=dict(hcub_sequences=len(ha),exact_sequences=len(ea),hcub_designs=len(h),exact_designs=len(e),mapped_per_side=count)
        for g in [*a,*b]:hold[design_id(g)]=g
    groups['conservative']={'hcub':sorted(set(old['reference']+groups['matched']['hcub']+groups['full']['hcub'])),
                            'exact':groups['full']['exact']}
    maps={}
    for k in set(old['reference'])|hold.keys():
        if k in old['designs']:
            v=old['designs'][k]
            if k in hold:assert [list(z) for z in hold[k]]==v['gates']
        else:v=map_one(hold[k],T,abc,lib)
        maps[k]=v
    return dict(targets=T,portfolio_sizes=pool_sizes,groups=groups,designs=maps,newly_mapped=sum(k not in old['designs'] for k in maps))


def summary(out):
    records=[json.loads(f.read_text()) for f in sorted(out.glob('*.json'))];assert len(records)==29
    report={};totals={}
    for group in ('matched','full','conservative'):
        report[group]={}
        for flow in ('standard','resyn2'):
            report[group][flow]={}
            for metric in ('area','delay_ps'):
                scores=[]
                for r in records:
                    ids=r['groups'][group]
                    if group!='conservative':assert len(ids['hcub'])==len(ids['exact'])
                    row=[]
                    for side in ('hcub','exact'):
                        vals=[r['designs'][k]['maps'][flow] for k in ids[side]]
                        assert all(v['checked_inputs']==65536 for v in vals)
                        row.append(min(v[metric] for v in vals))
                    scores.append(row)
                base,exact=map(sum,zip(*scores));delta=[100*(1-b/a) for a,b in scores]
                report[group][flow][metric]=dict(reference_sum=round(base,2),candidate_sum=round(exact,2),
                        sum_saving_pct=round(100*(1-exact/base),4),median_saving_pct=round(statistics.median(delta),4),
                        smaller=sum(v>0 for v in delta),equal=delta.count(0),larger=sum(v<0 for v in delta))
    totals['additional_graphs']=sum(r['newly_mapped'] for r in records)
    totals['additional_mapped_netlists']=2*totals['additional_graphs']
    totals['cases']=len(records);totals['groups']=report
    Path('results/matched-hardware.json').write_text(json.dumps(totals,indent=2)+'\n')
    print(json.dumps(totals,indent=2),flush=True)


def main():
    p=argparse.ArgumentParser();p.add_argument('abc',type=Path);p.add_argument('lib',type=Path);a=p.parse_args()
    out=Path('results/matched-panel');out.mkdir(exist_ok=True)
    pairs=[tuple(map(int,l.split())) for l in open('data/panel.tsv')]
    baseline=collections.defaultdict(list);exact=collections.defaultdict(list)
    for line in open('results/fft-hcub32.jsonl'):
        r=json.loads(line);T=tuple(map(int,r['name'].split(',')))
        if T in pairs:
            assert r['seed']==len(baseline[T])+1
            baseline[T].append(tuple(z[0] for z in live_gates(T,r['gates'])))
    for line in open('results/panel-variants.tsv'):
        x,y,*v=map(int,line.split());exact[x,y].append(tuple(v))
    for T in pairs:
        assert len(baseline[T])==32
        n=f'{T[0]}-{T[1]}.json';f=out/n
        if f.exists():continue
        old=json.load(open(Path('results/panel')/n))
        row=compare(T,old,baseline[T],exact[T],a.abc.resolve(),a.lib.resolve())
        temp=f.with_suffix('.part');temp.write_text(json.dumps(row,separators=(',',':'))+'\n');temp.replace(f)
        print(T,'matched sizes',row['portfolio_sizes']['matched'],'extra',row['newly_mapped'],flush=True)
    summary(out)


if __name__=='__main__':main()
