"""Challenge the Hcub comparison by allowing arbitrary acyclic rewiring of the labels it found."""
import collections
import functools
import itertools
import json
from pathlib import Path
from graphs import instruction,live_gates,odd_part,validate
from table import tables,normalize

@functools.lru_cache(maxsize=500000)
def can_make(a,b,t):
    return any(n>z and odd_part(n)==z
               for x,y,z in ((a,b,t),(a,t,b),(b,t,a)) for n in (x+y,abs(x-y)))

def find_graph(T,allowed,budget):
    labels=sorted({1,*T,*allowed});bit={t:1<<i for i,t in enumerate(labels)}
    need=sum(bit[t] for t in T);targets=set(T)
    ways={}
    for t in labels[1:]:
        ways[t]=[(bit[a]|bit[b],a,b) for a,b in itertools.combinations_with_replacement([x for x in labels if x!=t],2)
                 if can_make(a,b,t)]
    nodes=[(t,bit[t],ways[t]) for t in labels if t!=1 and t not in targets]
    def add_ready(s):
        while True:
            prev=s
            for t in T:
                if not s&bit[t] and any(mask&s==mask for mask,_,_ in ways[t]):s|=bit[t]
            if s==prev:return s
    @functools.lru_cache(None)
    def walk(s,k):
        s=add_ready(s)
        if s&need==need:return ()
        if not k:return None
        for t,f,opts in nodes:
            if s&f or not any(m&s==m for m,_,_ in opts):continue
            tail=walk(s|f,k-1)
            if tail is not None:return (t,)+tail
        return None
    H=walk(bit[1],budget)
    if H is None:return None
    s=bit[1];left=set(H)|targets;g=[]
    while left:
        for t in sorted(left):
            found=next(((a,b) for m,a,b in ways[t] if m&s==m),None)
            if found:
                row=instruction(*found,t);assert row
                g.append(row);s|=bit[t];left.remove(t);break
        else:raise AssertionError('failed to lift a fixed-label witness')
    g=live_gates(T,g);validate(T,g);assert len(g)<=len(T)+budget
    return g


def main():
    trials=collections.defaultdict(list)
    for l in open('results/fft-hcub32.jsonl'):
        r=json.loads(l);T=tuple(map(int,r['name'].split(',')));trials[T].append(r)
    rows=[]
    for T,rs in sorted(trials.items()):
        if min(len(live_gates(T,r['gates'])) for r in rs)==6:continue
        sets={tuple(sorted(g[0] for g in r['gates'] if g[0] not in T)) for r in rs}
        first=None
        for h in sorted(sets):
            first=find_graph(T,h,4)
            if first is not None:break
        pool=set().union(*sets)
        union=first if first is not None else find_graph(T,pool,4)
        rows.append(dict(targets=T,seed_label_sets=len(sets),union_labels=len(pool),within_one=first,within_union=union))
    assert len(rows)==59
    for r in rows:
        for k in ('within_one','within_union'):
            if r[k] is not None:assert len(r[k])==6
    pos=[normalize(x) for T in tables('data/arm_common_tables.c').values() for x in T]
    out={'rows':rows}
    for k in ('within_one','within_union'):
        remainder={tuple(r['targets']) for r in rows if r[k] is None}
        out[k]=dict(found=59-len(remainder),still_shorter_than_baseline=len(remainder),positions_still_shorter=sum(t in remainder for t in pos))
    (Path('results')/'hcub-rewiring.json').write_text(json.dumps(out,separators=(',',':'))+'\n')
    print({k:v for k,v in out.items() if k!='rows'})


if __name__=='__main__':
    main()
