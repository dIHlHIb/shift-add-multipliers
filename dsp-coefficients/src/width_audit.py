"""Prove bounded feasibility by integer circuits and independently rule out five bounded gates at the exception."""
import argparse,collections,functools,json,os,subprocess,sys,tempfile
from pathlib import Path
from graphs import instruction,live_gates,recover,validate
from table import normalize,tables


@functools.lru_cache(maxsize=30000)
def direct_outputs(a,b,cap):
    labels=set()
    for u,v in ((a,b),(b,a)):
        x=u
        while x<=cap+v:
            for z in (x+v,abs(x-v)):
                if z:
                    n=z//(z & -z)
                    if 1<n<=cap:labels.add(n)
            x*=2
    return frozenset(labels)


def forward(a,b,width,budget):
    cap=2**width-1;targets={a,b}
    def successors(g):
        return set().union(*(direct_outputs(x,y,cap) for x in g for y in g if x<=y))
    visited=set()
    def walk(g,remaining):
        while True:
            extra=(successors(g)&targets)-g
            if not extra:break
            g=g|extra
        if targets<=g:return True
        if not remaining or (g,remaining) in visited:return False
        visited.add((g,remaining))
        # For a terminal birth, test only its actual forward children using the new parent.
        births=successors(g)-g
        if remaining==1:
            for u in births:
                seen=g|{u};child=set().union(*(direct_outputs(min(u,z),max(u,z),cap) for z in seen))
                if targets<=seen|child:return True
                for t in (targets-seen)&child:
                    other=next(iter(targets-{t}))
                    if any(other in direct_outputs(min(t,z),max(t,z),cap) for z in seen|{t}):return True
            return False
        return any(walk(g|{u},remaining-1) for u in births)
    return walk(frozenset((1,)),budget)


def main():
    root=Path(__file__).resolve().parents[1];os.chdir(root)
    ledger={tuple(r['targets']):r for r in json.load(open('results/census.json'))['cases']}
    def fits(t,g):return all(v[0].bit_length()<=max(t,default=1).bit_length() for v in g)
    bounded={t:r['gates'] for t,r in ledger.items() if fits(t,r['gates'])}
    for l in open('results/fft-hcub32.jsonl'):
        r=json.loads(l);t=tuple(map(int,r['name'].split(',')))
        if t in bounded:continue
        g=live_gates(t,r['gates'])
        if len(g)==ledger[t]['minimum'] and fits(t,g):bounded[t]=g
    for k,g in json.load(open('results/width-probes.json')).items():
        t=tuple(map(int,k.split(',')));assert fits(t,g) and len(g)==ledger[t]['minimum'];bounded[t]=g
    ex=(5897,7643);assert set(ledger)-set(bounded)=={ex}
    bounded[ex]=recover(ex,[9,23,5897,279,549,7643])
    for t,g in bounded.items():
        validate(t,g);assert fits(t,g) and len(g)==ledger[t]['minimum']+(t==ex)
    with tempfile.TemporaryDirectory() as tmp:
        prog=Path(tmp)/'bounded'
        subprocess.run([os.environ.get('CXX','c++'),'-std=c++17','-O2','src/bounded_helpers.cpp','-o',prog],check=True)
        tests={}
        for w,h in ((13,3),(13,4),(14,3)):
            s=subprocess.check_output([prog,str(w),str(h),*map(str,ex)],text=True).strip()
            assert s.startswith('IMPOSSIBLE' if (w,h)==(13,3) else 'POSSIBLE')
            tests[f'{w} bits, {h} helpers']=s
        # Every pair of nontrivial odd targets at widths 3..5 and helper budgets 0..2.
        import itertools
        controls=0
        for w in (3,4,5):
            for a,b in itertools.combinations(range(3,2**w,2),2):
                for h in range(3):
                    s=subprocess.check_output([prog,str(w),str(h),str(a),str(b)],text=True)
                    assert s.startswith('POSSIBLE')==forward(a,b,w,h);controls+=1
    assert not forward(*ex,13,3)
    cp=json.load(open('results/cp-census.json'));assert all(fits(t['targets'],t['gates']) for t in cp.values())
    where=[(n,i,c) for n,cs in tables('data/arm_common_tables.c').items() for i,c in enumerate(cs) if normalize(c)==ex]
    out=dict(arm_sets=len(ledger),exceptions=1,cp_rows=len(cp),cp_exceptions=0,positions=where,exception_tests=tests,
             independent_forward_excludes_five=True,small_cases=controls,
             replacements=[dict(targets=t,gates=g) for t,g in sorted(bounded.items()) if g!=ledger[t]['gates']])
    Path('results/width-census.json').write_text(json.dumps(out,separators=(',',':'))+'\n')
    print({k:v for k,v in out.items() if k!='replacements'},flush=True)


if __name__=='__main__':
    main()
