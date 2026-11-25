"""Exercise the public command-line interface on every stored filter witness."""
import argparse,json,subprocess,sys
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--bin-dir',type=Path,default=Path('build'));a=p.parse_args()
bank=json.load(open('results/cp-census.json'));rows={}
for name,w in sorted(bank.items()):
    command=[sys.executable,'-B','certify.py','--cp',name,'--bin-dir',str(a.bin_dir.resolve()),'--seconds','30']
    out=json.loads(subprocess.check_output(command,text=True));rows[name]=out
    if out['status']=='optimal':assert out['minimum']==w['minimum']
    print(name,out['status'],flush=True)
Path('results/cli-certificates.json').write_text(json.dumps(rows,indent=2)+'\n')
print('Certified',sum(v['status']=='optimal' for v in rows.values()),'of',len(rows),flush=True)
