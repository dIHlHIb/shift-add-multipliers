"""Compile locally from sources in one thread with only the pinned core/Std package."""
import argparse,hashlib,json,os,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('lean',type=Path);p.add_argument('--force',action='store_true');args=p.parse_args()
root=Path.cwd().resolve();out=root/'build/olean';out.mkdir(parents=True,exist_ok=True);proof=root/'proof'
logdir=root/'results/kernel';logdir.mkdir(exist_ok=True)
mods=['McmAudit','R06Graph','Q15Upper',*(x.stem for x in sorted(proof.glob('Q15Bank*.lean'))),'Q15Atlas']
if (proof/'ModularTransfer.lean').exists():mods+=['ModularTransfer']
if (proof/'CPBench.lean').exists():mods+=['CPBench']
if (proof/'OrbitProjection.lean').exists():mods+=['OrbitProjection']
if (proof/'CutNecessity.lean').exists():mods+=['CutNecessity']
if (proof/'WidthInventory.lean').exists():mods+=['WidthInventory']
env=dict(os.environ,LEAN_PATH=str(out))
version=subprocess.check_output([str(args.lean.resolve()),'--version'],text=True);assert 'version 4.19.0' in version
rerun=args.force
for mod in mods:
    src=proof/(mod+'.lean');dest=out/(mod+'.olean');log=logdir/(mod+'.log')
    digest=hashlib.sha256(src.read_bytes()).hexdigest();stamp=out/(mod+'.sha')
    changed=not dest.exists() or not stamp.exists() or stamp.read_text()!=digest
    if mod in ('McmAudit','Q15Upper') and changed:rerun=True
    if not changed and not rerun and mod not in ('Q15Atlas','ModularTransfer'):continue
    start=time.monotonic()
    with log.open('w') as f:
        cp=subprocess.run([str(args.lean.resolve()),'-j1','-DElab.async=false','-s65536','-o',str(dest),src.name],cwd=proof,env=env,stdout=f,stderr=subprocess.STDOUT)
    if cp.returncode:raise SystemExit(log.read_text()[-3500:])
    stamp.write_text(digest)
    if mod in ('McmAudit','Q15Upper','Q15Atlas','ModularTransfer') or mod.endswith('0'):print(mod,round(time.monotonic()-start,2),flush=True)
print(version.strip(),len(mods),'modules',flush=True)
