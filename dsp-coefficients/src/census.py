"""Create the per-target optimum table from integer circuits and modular negatives."""
import collections,hashlib,json,subprocess
from pathlib import Path
from graphs import instruction,validate,recover
from table import tables,normalize

def go():
    source=Path('data/arm_common_tables.c'); all_tables=tables(source)
    sets={normalize(raw) for T in all_tables.values() for raw in T}
    gates={}
    for key,old in json.loads(Path('data/prior-graphs.json').read_text()).items():
        t=tuple(map(int,key.split(','))) if key else ()
        g=[instruction(a,b,z) for z,a,b in old];validate(t,g);gates[t]=g
    for p in ('six.tsv','last-six.tsv'):
        for line in Path('results',p).read_text().splitlines():
            a,b,*xs=map(int,line.split());g=recover((a,b),xs);assert len(g)==6;gates[a,b]=g
    assert set(gates)==sets and len(sets)==2044
    prior_replay={tuple(r['targets']):r for l in Path('results/independent-lower.jsonl').read_text().splitlines() if(r:=json.loads(l))}
    info={}
    for t,g in gates.items():
        if len(g)==0:info[t]=dict(method='gate_count_nonnegative')
        elif len(g)==6:info[t]=dict(method='forward_modular_exclusion',period=prior_replay[t]['period'],excluded_budget=5)
    for cost in sorted({len(g) for t,g in gates.items() if t not in info}):
        unknown={t for t,g in gates.items() if len(g)==cost and t not in info}
        path=Path('build',f'cost-{cost}.tsv')
        def inputs(t):return tuple(sorted(([1]*(2-len(t)))+list(t)))
        assert len({inputs(t) for t in unknown})==len(unknown)
        for period in (17,19,23,29,31):
            path.write_text(''.join('%s %s\n'%inputs(t) for t in sorted(unknown)))
            proc=subprocess.run(['build/batch_five',str(period),str(path),str(cost-1)],text=True,capture_output=True,check=True)
            hits={tuple(v[:2]):v[2] for l in proc.stdout.splitlines() if(v:=list(map(int,l.split())))}
            assert set(hits)=={inputs(t) for t in unknown}
            for t in list(unknown):
                if not hits[inputs(t)]:
                    info[t]=dict(method='modular_exclusion',period=period,excluded_budget=cost-1);unknown.remove(t)
            if not unknown:break
        assert not unknown,(cost,unknown)
    rows=[dict(targets=t,minimum=len(gates[t]),gates=gates[t],lower=info[t]) for t in sorted(sets)]
    result=dict(model='Exact signed integer shift/add from one input. Cost counts normalized odd coefficient gates.',source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),table_positions=sum(map(len,all_tables.values())),cases=rows)
    Path('results/census.json').write_text(json.dumps(result,separators=(',',':'))+'\n')
    stats=collections.Counter(len(g) for g in gates.values());print('sets',len(sets),'positions',result['table_positions'],'histogram',dict(sorted(stats.items())),flush=True)
if __name__=='__main__':go()
