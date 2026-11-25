"""Independent exhaustive check on finite signed rotation orbits, including collapsed goals."""
import itertools,json,subprocess,tempfile
from pathlib import Path

def oracle(p):
    M=2**p-1
    def orbit(a):return min(min((a*pow(2,k,M))%M,(-a*pow(2,k,M))%M) for k in range(p))
    # Compute directly on all signed, rotated representatives, without inverse or pair symmetry rules.
    classes={x:orbit(x) for x in range(M)}
    canonical=sorted(set(classes.values()))
    members={u:[x for x in classes if classes[x]==u] for u in canonical}
    ops={(a,b):{classes[(x+y)%M] for x in members[a] for y in members[b]} for a in canonical for b in canonical}
    states={frozenset((0,1))};levels=[]
    for budget in range(6):
        levels.append({(a,b) for s in states for a in s for b in s})
        if budget==5:break
        newer=set(states)
        for s in states:
            for a,b in itertools.combinations_with_replacement(s,2):
                for x in ops[a,b]-s:newer.add(s|{x})
        states=newer
    return classes,levels
def main():
    total=0;positive=0
    with tempfile.TemporaryDirectory() as tmp:
        path=Path(tmp)/'q.txt'
        for p in (3,5,7):
            cls,levels=oracle(p);m=2**p-1
            # All raw residue pairs include zero, equal targets and all sign/scale collisions.
            path.write_text(''.join(f'{a} {b}\n' for a in range(m) for b in range(a,m)))
            for k,reachable in enumerate(levels):
                out=subprocess.check_output(['build/batch_five',str(p),str(path),str(k)],text=True,stderr=subprocess.DEVNULL)
                for line in out.splitlines():
                    a,b,ans=map(int,line.split());want=(cls[a],cls[b]) in reachable
                    assert ans==want,(p,k,a,b,ans,want);total+=1;positive+=want
    report=json.dumps(dict(total_comparisons=total,positive=positive,negative=total-positive,periods=[3,5,7],budgets=list(range(6))))
    Path('results/small-oracle.json').write_text(report+'\n')
    print(report)
if __name__=='__main__':main()
