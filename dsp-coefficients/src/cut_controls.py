"""Compare the cut search to independent exhaustive state search at small periods."""
import functools,json,random,subprocess
from pathlib import Path
from filter_cuts import Field
def brute(T,p,r):
    q=Field(p);T={q.rep(t%q.mod) for t in T}-{0,1}
    @functools.lru_cache(None)
    def walk(available,left):
        s=q.close(set(available),T)
        if T<=s:return True
        return left>0 and any(walk(frozenset(s|{h}),left-1) for h in q.pool(s)-s)
    return walk(frozenset((0,1)),r)
def one(T,p,r):
    out=subprocess.check_output(['build/two_remaining',str(p),str(r),'0','1',*map(str,T)],text=True).strip()
    fit=out.startswith('POSSIBLE')
    if fit:
        q=Field(p);t={q.rep(v%q.mod) for v in T}-{0,1};s=q.close({0,1},t)
        for h in map(int,out.split(' helpers')[1].split()):
            assert h in q.pool(s)-s,(T,out,h);s=q.close(s|{h},t)
        assert t<=s,(T,out)
    return fit,out
def main():
    rnd=random.Random(2241);positive=negative=0
    for p,num in ((7,30),(11,10),(13,6)):
        for i in range(num):
            T=rnd.sample(range(3,2**p-1,2),rnd.randint(3,8));r=(2+i%3 if p==7 else (2+i%2))
            fit,_=one(T,p,r);assert fit==brute(T,p,r),(T,p,r,fit)
            positive+=fit;negative+=not fit
    filters=json.load(open('data/filters.json'));checks=[]
    ledger=json.load(open('data/prior-cp.json'))
    for name in ('DEMPSTER04_E3','DEMPSTER04_F3','DEMPSTER04_G4','DEMPSTER04_K5','DEMPSTER04_I5','CHANG06_3'):
        case=ledger[name];r,p,_=case['modular'];t=case['targets']
        computed,_=one(t,p,r)
        base=['build/independent_forward']+(['--three'] if r==3 else [])+[str(p),*map(str,t)]
        direct=subprocess.check_output(base,text=True).split()[0]
        assert not computed and direct=='IMPOSSIBLE',(name,r,p,computed,direct)
        negative+=1
    for n,p,r in (('YEUNG04_40',31,2),('VINOD03_26B',23,3)):
        ok,out=one(filters[n],p,r);assert not ok
        checks.append(out)
    result=dict(small_positive=positive,small_negative=negative,full_control_checks=checks)
    Path('results/cut-controls.json').write_text(json.dumps(result,indent=2)+'\n');print(result,flush=True)
if __name__=='__main__':main()
