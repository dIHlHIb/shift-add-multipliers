"""Explore one-helper replacements and acyclic parent reassignments at a certified gate count."""
import argparse,collections,functools,itertools,json,random
from pathlib import Path
from graphs import odd_part,validate
from panel import operation,portfolio,design_id,map_one
pairs=itertools.combinations_with_replacement
@functools.lru_cache(maxsize=500000)
def gate(a,b,t):
    for u,v,z in ((a,b,t),(a,t,b),(b,t,a)):
        for n in (u+v,abs(u-v)):
            if n>z and odd_part(n)==z:return True
    return False
@functools.lru_cache(maxsize=45000)
def children(a,b,cap):
    out={odd_part(a+b),odd_part(a-b)}
    for x,y in ((a,b),(b,a)):
        z=2*x
        while z<=cap+y:
            out.add(z+y);out.add(abs(z-y));z*=2
    return frozenset(h for h in out if 1<h<=cap)
def replacement(T,H,h,cap):
    pool=(T|set(H)|{1})-{h}
    birth=set().union(*(children(a,b,cap) for a,b in pairs(sorted(pool),2)))-pool-{h}
    for t in sorted(pool-{1}):
        others=pool-{t}
        if any(gate(a,b,t) for a,b in pairs(sorted(others),2)):continue
        supported=set().union(*(children(t,a,cap) for a in others))
        for j in range(1,cap.bit_length()+2):
            for f in ((1<<j)-1,(1<<j)+1):
                if t%f==0:supported.add(t//f)
        birth.intersection_update(supported)
        if not birth:break
    return sorted(birth)
def options(T,H):
    nodes=sorted(T|set(H));return {t:[(a,b) for a,b in pairs([1,*[u for u in nodes if u!=t]],2) if gate(a,b,t)] for t in nodes}
def realization(opts):
    active={1}
    while True:
        new={t for t,p in opts.items() if t not in active and any(a in active and b in active for a,b in p)}
        if not new:return len(active)==len(opts)+1
        active.update(new)
def sample(T,opts,rng,rounds):
    graphs={}
    for i in range(rounds):
        deps={1:0};steps={1:0};rows=[];total=0;todo=list(sorted(opts))
        alpha=(0,0.1,0.5,1,2)[i%5];noise=(1,3,8,20)[i%4]
        while todo:
            live=[]
            for t in todo:
                choices=[]
                for a,b in opts[t]:
                    if a not in deps or b not in deps:continue
                    span,_,ins=operation(min(a,b),max(a,b),t)
                    delay=span+max(deps[a],deps[b]);depth=1+max(steps[a],steps[b])
                    choices.append((span+alpha*delay+noise*rng.random(),delay,depth,span,ins))
                if choices:live.append((rng.random(),t,min(choices)))
            if not live:raise RuntimeError('unreachable supposedly feasible dictionary')
            _,t,(_,delay,depth,span,ins)=min(live)
            todo.remove(t);rows.append(ins);deps[t]=delay;steps[t]=depth;total+=span
        graph=tuple(sorted(rows,key=lambda r:(steps[r[0]],r[0])))
        validate(T,graph);graphs[graph]=(total,max(deps[x] for x in T),max(steps[x] for x in T))
    return graphs
def make_pool(name,r,base):
    T=set(r['targets']);opt=r['minimum'];cap=(1<<(max(T).bit_length()+1))-1
    seeds={tuple(sorted(row[0] for row in r['gates'] if row[0] not in T))}
    for item in base['designs'].values():
        if len(item['gates'])==opt:seeds.add(tuple(sorted(row[0] for row in item['gates'] if row[0] not in T)))
    ready=list(sorted(seeds));found={h:options(T,h) for h in ready};seen=set(seeds)
    rng=random.Random(20261125)
    for start in ready:
        for removed in start:
            for new in replacement(T,start,removed,cap):
                H=tuple(sorted((set(start)-{removed})|{new}))
                if H in seen:continue
                seen.add(H);opts=options(T,H)
                if realization(opts):found[H]=opts
    allg={}
    for H in sorted(found):allg.update(sample(T,found[H],rng,80))
    chosen=portfolio(allg,len(base['reference']))
    return dict(source_helpers=len(seeds),legal_helper_sets=len(found),examined_helper_sets=len(seen),acyclic_graphs=len(allg),mapped_designs=len(chosen)),chosen
def main():
    p=argparse.ArgumentParser();p.add_argument('abc',type=Path);p.add_argument('liberty',type=Path);a=p.parse_args()
    ledger=json.load(open('results/cp-census.json'));out=Path('results/exchange');out.mkdir(exist_ok=True)
    for n in ('VINOD03_26B','YEUNG04_40'):
        base=json.load(open('results/fir-mapping/'+n+'.json'))
        counts,chosen=make_pool(n,ledger[n],base);mapped={}
        for g in chosen:
            key=design_id(g);f=out/(key+'.json')
            if key in base['designs']:mapped[key]=base['designs'][key]
            elif f.exists():mapped[key]=json.load(open(f))
            else:
                v=map_one(g,ledger[n]['targets'],a.abc.resolve(),a.liberty.resolve());w=f.with_suffix('.part');w.write_text(json.dumps(v,separators=(',',':'))+'\n');w.replace(f);mapped[key]=v
        r=dict(name=n,counts=counts,designs=mapped)
        (out/(n+'.json')).write_text(json.dumps(r,separators=(',',':'))+'\n')
        print(n,counts,flush=True)
if __name__=='__main__':main()
