"""Verify every new five-gate exclusion with the preexisting, forward-only verifier."""
from pathlib import Path
import argparse, json, subprocess, time

p=argparse.ArgumentParser();p.add_argument('binary',type=Path);args=p.parse_args()
pairs=[tuple(map(int,l.split())) for l in Path('data/pending.tsv').read_text().splitlines()]
tables={}
for f in sorted(Path('results').glob('mod-*.tsv')):
    tables[int(f.stem.split('-')[1])]={tuple(z[:2]):z[2] for l in f.read_text().splitlines() if(z:=list(map(int,l.split())))}
with Path('results/independent-lower.jsonl').open('w',buffering=1) as out:
    for idx,t in enumerate(pairs):
        period=next(p for p in sorted(tables) if tables[p][t]==0)
        start=time.monotonic()
        run=subprocess.check_output([str(args.binary.resolve()),'--three',str(period),*map(str,t)],text=True).split()
        assert run[0]=='IMPOSSIBLE', (t,period,run)
        print(json.dumps(dict(targets=t,period=period,complete_birth_counts=list(map(int,run[1:])),sec=round(time.monotonic()-start,4))),file=out)
        if (idx+1)%100==0: print(idx+1,flush=True)
