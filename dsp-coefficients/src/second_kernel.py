"""Recheck every project object in lean4lean. The official compiler must already have finished."""
import argparse,json,os,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('checker',type=Path);p.add_argument('checker_objects',type=Path);p.add_argument('leanbin',type=Path);a=p.parse_args()
root=Path.cwd().resolve();src=root/'proof';objects=root/'build/olean';out=root/'results/second-kernel';out.mkdir(exist_ok=True)
env=dict(os.environ,LEAN_PATH=str(objects)+os.pathsep+str(a.checker_objects.resolve()),PATH=str(a.leanbin.resolve())+os.pathsep+os.environ['PATH'])
names=sorted(f.stem for f in src.glob('*.lean'));seen=[]
for n in names:
    assert (objects/(n+'.olean')).exists(),n
    log=out/(n+'.log');start=time.monotonic()
    with log.open('w') as f:proc=subprocess.run([str(a.checker.resolve()),'--verbose',n],cwd=objects,env=env,stdout=f,stderr=subprocess.STDOUT)
    text=log.read_text();assert proc.returncode==0 and ('replaying '+n) in text,(n,text[-500:]);seen.append(n)
res=dict(checker='lean4lean',modules=seen);(out/'result.json').write_text(json.dumps(res,indent=2)+'\n')
print('Second kernel replayed',len(seen),'modules')
