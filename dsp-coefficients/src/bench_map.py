"""Exploratory post-certification physical comparison for both large CP filters."""
import argparse,json
from pathlib import Path
from panel import assemble,design_id,map_one
def run():
    p=argparse.ArgumentParser();p.add_argument('abc',type=Path);p.add_argument('liberty',type=Path);a=p.parse_args()
    data=json.load(open('results/cp-census.json'));ref=[json.loads(l) for l in open('results/fir-hcub.jsonl')]
    dest=Path('results/fir-mapping');dest.mkdir(exist_ok=True)
    for name in ('VINOD03_26B','YEUNG04_40'):
        r=data[name];T=r['targets'];refg={};seeds={}
        def norm(g):
            return assemble(T,[row[0] for row in g],[(abs(row[1]),abs(row[3])) for row in g])[0]
        for e in ref:
            if e['name']==name:
                g=norm(e['gates']);refg[design_id(g)]=g;seeds[e['seed']]=design_id(g)
        assert len(seeds)==32
        chosen=norm(r['gates']);ident=design_id(chosen);graphs={**refg,ident:chosen};maps={}
        for key,g in graphs.items():
            file=dest/(key+'.json')
            if not file.exists():
                new=map_one(g,T,a.abc.resolve(),a.liberty.resolve())
                tmp=file.with_suffix('.part');tmp.write_text(json.dumps(new,separators=(',',':'))+'\n');tmp.replace(file)
            maps[key]=json.load(open(file));assert maps[key]['id']==key
        output=dict(name=name,targets=T,seeds=seeds,reference=list(refg),certified=ident,designs=maps)
        (dest/(name+'.json')).write_text(json.dumps(output,separators=(',',':'))+'\n');print(name,len(refg),flush=True)
if __name__=='__main__':run()
