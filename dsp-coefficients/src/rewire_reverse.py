"""Independently check label-pool rewiring by expanding the two outputs backwards."""
import collections
import itertools
import json
from pathlib import Path


def dependencies(nodes):
    opts={n:[] for n in nodes}
    cap=max(nodes)
    for a,b in itertools.combinations_with_replacement(sorted(nodes),2):
        products=set()
        for total in (a+b,abs(a-b)):
            if total:products.add(total//(total & -total))
        for u,v in ((a,b),(b,a)):
            scaled=2*u
            while scaled<=cap+v:
                products.update((scaled+v,abs(scaled-v)))
                scaled*=2
        for n in (products & nodes)-{a,b,1}:opts[n].append((a,b))
    return opts


def reachable(T,pool,all_deps):
    U=frozenset((1,*T));allowed=U|pool;parents={}
    deps={t:[(a,b) for a,b in all_deps[t] if a in allowed and b in allowed] for t in allowed}
    def expand(need):
        todo=need-parents.keys()-{1}
        if not todo:
            available={1}
            while True:
                new={t for t,(a,b) in parents.items() if a in available and b in available}
                if new<=available:return T<=available
                available.update(new)
        t=min(todo,key=lambda x:len(deps[x]))
        for a,b in deps[t]:
            wanted=need|{a,b}
            if len(wanted-U)>4:continue
            parents[t]=(a,b)
            if expand(wanted):return True
            del parents[t]
        return False
    return expand(T)


def main():
    previous=json.load(open('results/hcub-rewiring.json'));pool=collections.defaultdict(set)
    for l in open('results/fft-hcub32.jsonl'):
        r=json.loads(l);T=tuple(map(int,r['name'].split(',')))
        pool[T].add(tuple(sorted(z[0] for z in r['gates'] if z[0] not in T)))
    records=[]
    for row in previous['rows']:
        T=frozenset(row['targets']);seeds=pool[tuple(sorted(T))]
        union=frozenset().union(*seeds);deps=dependencies(set(union|T|{1}))
        single=any(reachable(T,frozenset(h),deps) for h in sorted(seeds))
        joined=reachable(T,union,deps)
        assert single==(row['within_one'] is not None) and joined==(row['within_union'] is not None)
        records.append(dict(targets=sorted(T),one=single,union=joined))
    assert len(records)==59
    Path('results/rewiring-independent.json').write_text(json.dumps(records,indent=2)+'\n')
    print('Reverse parent expansion agrees on all',len(records),'pooled and single-seed questions.')


if __name__=='__main__':
    main()
