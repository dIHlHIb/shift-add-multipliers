"""Replay independent fixed slices of the finite helper search with a checked inventory."""
import argparse,json,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('name');p.add_argument('period',type=int);p.add_argument('r',type=int);p.add_argument('shards',type=int);p.add_argument('--limit',type=int);a=p.parse_args()
T=json.load(open('data/filters.json'))[a.name]
dest=Path('results')/f'{a.name}-p{a.period}-r{a.r}-s{a.shards}'
dest.mkdir(exist_ok=True)
for i in range(min(a.shards,a.limit or a.shards)):
    f=dest/f'{i:03d}.json'
    if f.exists():
        if json.loads(f.read_text())['outcome']=='POSSIBLE':break
        continue
    start=time.monotonic();cmd=['build/two_remaining',str(a.period),str(a.r),str(i),str(a.shards),*map(str,T)]
    text=subprocess.check_output(cmd,text=True).strip();out=text.split()[0]
    assert out in ('POSSIBLE','IMPOSSIBLE')
    f.write_text(json.dumps(dict(outcome=out,line=text,seconds=round(time.monotonic()-start,3),targets=T))+'\n')
    print(i,text,round(time.monotonic()-start,3),flush=True)
    if out=='POSSIBLE':break
