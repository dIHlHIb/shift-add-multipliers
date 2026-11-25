"""Run the released Hcub binary on a fixed seed schedule. Keep arithmetic witnesses."""
import argparse, json, re, subprocess, time
from pathlib import Path
from graphs import odd_part, validate

def solve(binary, seed, T):
    out=subprocess.run([str(binary),'-seed',str(seed),'-ga','-v','1',*map(str,T)],cwd=binary.parent,
                       stdout=subprocess.PIPE,stderr=subprocess.STDOUT,check=True,text=True).stdout
    circuit=[]
    for t,a,b,l,r in re.findall(r'(\d+)\s*=\s*adder\((\d+),\s*(\d+),\s*(-?\d+)/(-?\d+),\s*-?\d+\)',out):
        t,a,b,l,r=map(int,(t,a,b,l,r))
        assert l and r
        i,j=abs(l)-1,abs(r)-1
        a=a if l>0 else -a; b=b if r>0 else -b
        u=(a<<i)+(b<<j)
        assert odd_part(u)==t
        if u<0: a,b,u=-a,-b,-u
        circuit.append([t,a,i,b,j,(u&-u).bit_length()-1])
    validate(T,circuit)
    return circuit

if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('binary',type=Path);ap.add_argument('kind',choices=['fir','fft']);ap.add_argument('seed_end',type=int);ap.add_argument('output',type=Path);args=ap.parse_args()
    cases=(json.loads(Path('data/filters.json').read_text()) if args.kind=='fir' else {line.replace(' ', ','):list(map(int,line.split())) for line in Path('data/pending.tsv').read_text().splitlines()})
    start=time.monotonic()
    with args.output.open('w',buffering=1) as f:
        for seed in range(1,args.seed_end+1):
            for name,t in cases.items():
                g=solve(args.binary.resolve(),seed,t)
                print(json.dumps(dict(name=name,seed=seed,cost=len(g),gates=g),separators=(',',':')),file=f)
            print(seed,round(time.monotonic()-start,2),flush=True)
