"""Check an integer MCM witness and try to rule out every circuit with one fewer gate."""
import argparse,itertools,json,os,shutil,subprocess,sys,tempfile
from pathlib import Path
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE/'src'))
from table import normalize
from graphs import instruction,validate

def check(raw,g,periods,limit,tool_dir,compiler):
    T=normalize(raw);validate(T,g);upper=len(g);r=upper-len(T)-1
    result=dict(targets=T,upper=upper,status='inconclusive',trials=[])
    def exact(method):
        result.update(status='optimal',minimum=upper,method=method);return result
    if r<0:return exact('one distinct gate per nontrivial odd target')
    if r==0:
        live={1}
        while True:
            new={t for t in set(T)-live if any(instruction(a,b,t) for a,b in itertools.combinations_with_replacement(live,2))}
            if not new:break
            live.update(new)
        if not set(T)<=live:return exact('integer target-only closure')
        result.update(status='shorter_budget_feasible',known_upper=upper-1);return result
    if r>4 or len(T)>(30 if r==4 else 63):
        result['reason']='outside the implemented exclusion budgets';return result
    # Larger target sets benefit from the disjoint-cut search for the last two births.
    use_cuts=r==4 or (2<=r<=3 and 6<=len(T)<=30)
    name='two_remaining' if use_cuts else 'independent_forward'
    with tempfile.TemporaryDirectory() as tmp:
        binary=(tool_dir/name if tool_dir else Path(tmp)/name)
        if not tool_dir:subprocess.run([compiler,'-O2','-std=c++17',str(HERE/'src'/(name+'.cpp')),'-o',binary],check=True)
        for p in periods:
            # Reduce arbitrary-size Python integers before calling the fixed-size verifier.
            # Keep the original target count in the integer lower bound.
            residues=[t%(2**p-1) for t in T]
            args=([str(p),str(r),'0','1'] if use_cuts else ['--budget',str(r),str(p)])+list(map(str,residues))
            try:o=subprocess.run([binary,*args],capture_output=True,text=True,timeout=limit,check=True).stdout.strip()
            except subprocess.TimeoutExpired:
                result['trials'].append(dict(period=p,outcome='timeout'));continue
            outcome=o.split()[0]
            if outcome not in ('POSSIBLE','IMPOSSIBLE'):raise RuntimeError(o)
            result['trials'].append(dict(period=p,outcome=outcome.lower(),replay=o))
            if outcome=='IMPOSSIBLE':return exact('signed shift-orbit exclusion')
    return result

def main():
    if not __debug__:raise RuntimeError('enable Python assertions')
    p=argparse.ArgumentParser(description=__doc__)
    s=p.add_mutually_exclusive_group(required=True)
    s.add_argument('--cp',metavar='NAME',help='use the stored integer witness for a CP instance')
    s.add_argument('--witness',type=Path,help='JSON with coefficients or targets, and gates [t,a,i,b,j,r]')
    p.add_argument('--period',type=int,action='append',choices=[5,7,11,13,17,19,23,29,31])
    p.add_argument('--seconds',type=float,default=60,help='wall-clock time per finite trial')
    p.add_argument('--bin-dir',type=lambda s:Path(s).resolve(),help='reuse the compiled verifiers in this directory');p.add_argument('--cxx',default=os.environ.get('CXX','c++'));a=p.parse_args()
    if a.cp:
        bank=json.loads((HERE/'results/cp-census.json').read_text())
        if a.cp not in bank:p.error('unknown CP instance')
        rec=bank[a.cp]
    else:rec=json.loads(a.witness.read_text())
    raw=rec['coefficients'] if 'coefficients' in rec else rec['targets']
    if not all(type(x) is int for x in raw):p.error('coefficients must be integers')
    if a.seconds<=0:p.error('time limit must be positive')
    try:result=check(raw,rec['gates'],a.period or [23,19,29,31],a.seconds,a.bin_dir,a.cxx)
    except (AssertionError,TypeError,KeyError,ValueError) as exc:p.error(f'invalid integer witness: {exc}')
    print(json.dumps(result,indent=2))
if __name__=='__main__':main()
