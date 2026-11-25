"""Re-establish the lower bound on every CP row from its coefficient list."""
import collections,itertools,json,subprocess
from pathlib import Path
from graphs import instruction
def main():
    ledger=json.load(open('results/cp-census.json'));rows={}
    for name,row in ledger.items():
        T=row['targets'];cost=row['minimum'];r=cost-len(T)
        if not r:
            result=dict(kind='distinct_nontrivial_targets',count=len(T))
        elif r==1:
            ready={1}
            while True:
                extra={t for t in set(T)-ready if any(instruction(a,b,t) for a,b in itertools.combinations_with_replacement(sorted(ready),2))}
                if not extra:break
                ready.update(extra)
            assert not set(T)<=ready;result=dict(kind='integer_target_only_closure',ready=sorted(ready))
        elif name in ('YEUNG04_40','VINOD03_26B'):
            file=Path(f'results/reverse-{name}-{r-1}.json');j=json.load(open(file))
            assert j['targets']==T and j['line'].startswith('IMPOSSIBLE ')
            result=dict(kind='dual_modular_exclusion',period=23,excluded_helpers=r-1,replay=j['line'])
        else:
            for p in (19,23,29,31):
                raw=subprocess.check_output(['build/independent_forward','--budget',str(r-1),str(p),*map(str,T)],text=True).strip()
                if raw.startswith('IMPOSSIBLE '):
                    result=dict(kind='forward_modular_exclusion',period=p,excluded_helpers=r-1,replay=raw);break
            else:raise RuntimeError((name,T,r,'no conclusive modulus'))
        rows[name]=result
    assert len(rows)==83
    Path('results/fresh-cp-lower.json').write_text(json.dumps(rows,indent=2,sort_keys=True)+'\n')
    print(dict(collections.Counter(x['kind'] for x in rows.values())),flush=True)
if __name__=='__main__':main()
