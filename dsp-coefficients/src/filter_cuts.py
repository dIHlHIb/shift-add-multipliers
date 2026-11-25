"""Necessary cut conditions for two or three unrestricted helper gates.
A failed result has exhausted all possible helper births modulo 2^p-1.
At the final helper, only necessary cut conditions are tested; a hit is inconclusive.
"""
import argparse, functools, itertools, json, time
from pathlib import Path
pairs=itertools.combinations_with_replacement

class Field:
    def __init__(self,p):
        if p<3 or any(p%d==0 for d in range(2,int(p**.5)+1)): raise ValueError("odd prime exponent required")
        self.p=p;self.mod=(1<<p)-1
        self.rep=functools.lru_cache(150000)(self._rep)
        self.children=functools.lru_cache(14000)(self._children)
        self.repeat=functools.lru_cache(None)(self._repeat)
    def _rep(self,x):
        m,p=self.mod,self.p; minimum=x
        for _ in range(p):
            minimum=min(minimum,x,m-x); x=(x>>1)|((x&1)<<(p-1))
        return minimum
    def _children(self,a,b):
        out=set()
        for k in range(self.p):
            v=b<<k
            out.add(self.rep((a+v)%self.mod));out.add(self.rep((a-v)%self.mod))
        return frozenset(out)
    def _repeat(self,t):
        ds={(2**k+sign)%self.mod for k in range(self.p) for sign in (1,-1)}-{0}
        return frozenset(self.rep(t*pow(d,-1,self.mod)%self.mod) for d in ds)
    def pool(self,live):
        return set().union(*(self.children(a,b) for a,b in pairs(sorted(live),2)))
    def close(self,live,T):
        while True:
            extra=(self.pool(live)&T)-live
            if not extra:return live
            live=live|extra

class Problem:
    def __init__(self,targets,p):
        self.q=q=Field(p);self.T=T={q.rep(t%q.mod) for t in targets}-{0,1}
        self.anchors=[]
        for n in (1,2,3):
            for group in itertools.combinations(sorted(T),n):
                C=frozenset(group)
                if any(old<=C for old,s in self.anchors):continue
                outside=(T-C)|{1,0}
                if any(q.children(t,a)&outside for t in C for a in outside):continue
                unary=set().union(*(q.repeat(t) for t in C),*(q.children(t,a) for t in C for a in outside))
                self.anchors.append((C,unary))
        self.anchors.sort(key=lambda cu:len(cu[1]))
        self.states=[0,0,0];self.last_survivors=0
    def necessary(self,H):
        # If all prior helpers are granted, a last helper must break every remaining cut.
        q=self.q; candidates=None; anchor_count=0
        for C,unary in self.anchors:
            if any(h in unary for h in H):continue
            if any(q.children(t,h).__contains__(k) for t in C for h,k in itertools.combinations(H,2)):continue
            mixed=[q.children(t,h) for h in H for t in C]
            if candidates is None:candidates=set(unary).union(*mixed)
            else:candidates={x for x in candidates if x in unary or any(x in m for m in mixed)}
            if not candidates:return set()
            anchor_count+=1
        return candidates  # None means all cuts already have a possible crossing
    def run(self,budget):
        q,T=self.q,self.T
        def dfs(live,H):
            live=q.close(live,T);self.states[len(H)]+=1
            if T<=live:return {'helpers':H,'full_modular_witness':True}
            if len(H)==budget-1:
                cand=self.necessary(H)
                if cand==set():return
                born=q.pool(live)-live
                if cand is not None:born.intersection_update(cand)
                self.last_survivors+=len(born)
                for v in sorted(born):
                    if T<=q.close(live|{v},T):return {'helpers':H+(v,),'full_modular_witness':True}
                return
            for h in sorted(q.pool(live)-live):
                hit=dfs(live|{h},H+(h,))
                if hit:return hit
        witness=dfs({0,1},())
        return dict(period=q.p,helpers=budget,possible=bool(witness),witness=witness,anchors=[sorted(c) for c,_ in self.anchors],
                    examined=self.states,final_checked=self.last_survivors)
if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('name');ap.add_argument('period',type=int);ap.add_argument('budget',type=int,choices=[2,3]);ap.add_argument('out',type=Path);a=ap.parse_args()
    T=json.loads(Path('data/filters.json').read_text())[a.name]
    start=time.monotonic();result=Problem(T,a.period).run(a.budget);result['seconds']=round(time.monotonic()-start,4)
    a.out.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result),flush=True)
