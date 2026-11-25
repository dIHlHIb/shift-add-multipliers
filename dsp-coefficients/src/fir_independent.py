import argparse,json,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('name');p.add_argument('period',type=int);p.add_argument('r',type=int);a=p.parse_args()
T=json.load(open('data/filters.json'))[a.name];start=time.monotonic()
text=subprocess.check_output(['build/reverse_verify',str(a.period),str(a.r),*map(str,T)],text=True).strip()
res=dict(targets=T,period=a.period,helpers=a.r,line=text,seconds=round(time.monotonic()-start,3))
Path('results',f'reverse-{a.name}-{a.r}.json').write_text(json.dumps(res,indent=2)+'\n');print(text,flush=True)
