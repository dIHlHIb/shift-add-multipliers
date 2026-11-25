"""Map a fixed 29-pair panel with an equal ceiling on distinct designs per side."""
import argparse, collections, functools, hashlib, json, os, re, tempfile
from itertools import combinations_with_replacement
from pathlib import Path
import netlist as hw
from check_products import verify
from graphs import odd_part,validate,live_gates

FLOWS={'standard':'balance; rewrite; refactor; balance','resyn2':'balance; rewrite; refactor; balance; rewrite; rewrite -z; balance; refactor -z; rewrite -z; balance'}
@functools.lru_cache(maxsize=500000)
def operation(a,b,t):
    eligible=[]
    for u,v in ((a,b),(b,a)):
        for k in range(max(u,v,t).bit_length()+2):
            for sign in (-1,1):
                raw=(u<<k)+sign*v
                if odd_part(raw)!=t:continue
                s=1 if raw>0 else -1
                r=(abs(raw)&-abs(raw)).bit_length()-1
                span=16+max(u.bit_length()+k,v.bit_length())-k
                eligible.append((span,r,(t,s*u,k,s*sign*v,0,r)))
    return min(eligible) if eligible else None
def assemble(targets,labels,parents=None,key='span'):
    ready=[1]; depths={1:0}; delays={1:0}; total=0; rows=[]
    for n,t in enumerate(labels):
        opts=[]
        pairs=[parents[n]] if parents else combinations_with_replacement(ready,2)
        for a,b in pairs:
            o=operation(min(a,b),max(a,b),t)
            if o is None:continue
            span,_,inst=o; depth=1+max(depths[a],depths[b]); delay=span+max(delays[a],delays[b])
            rank=(span,delay,depth) if key=='span' else (delay,depth,span)
            opts.append((rank,inst,span,delay,depth))
        _,row,span,delay,depth=min(opts)
        rows.append(row);depths[t]=depth;delays[t]=delay;total+=span;ready.append(t)
    rows=tuple(sorted(rows,key=lambda row:(depths[row[0]],row[0])))
    validate(targets,rows)
    return rows,(total,max(delays[t] for t in targets),max(depths[t] for t in targets))
def portfolio(candidates,limit):
    # Alternate the two predefined physical proxies. Include no results from ABC at selection time.
    a=iter(sorted(candidates,key=lambda g:(candidates[g][0],candidates[g][1],g)))
    b=iter(sorted(candidates,key=lambda g:(candidates[g][1],candidates[g][0],g)))
    chosen={}
    while len(chosen)<min(len(candidates),limit):
        for it in (a,b):
            v=next((v for v in it if v not in chosen),None)
            if v is not None:chosen[v]=True
            if len(chosen)>=min(len(candidates),limit):break
    return list(chosen)
def design_id(g):
    return hashlib.sha256(json.dumps(g,separators=(',',':')).encode()).hexdigest()
def map_one(g,T,abc,lib):
    key=design_id(g);rows={};ops=[[t,a,i-r,b,j-r] for t,a,i,b,j,r in g]
    hw.check(ops,T)
    with tempfile.TemporaryDirectory() as tmp:
        wd=Path(tmp);hw.abc=abc;hw.out=wd;hw.lib=wd/'cells.lib';hw.lib.symlink_to(lib)
        inp=hw.graph_files('unit',ops,T,'products'); verify(inp,T)
        for flow,transforms in FLOWS.items():
            mapped=wd/'unit-cells.blif';expanded=wd/'expanded.blif'
            log=hw.run(f'read_lib -w {hw.lib}; read_blif {inp}; strash; {transforms}; map; write_blif {mapped}; read_blif {mapped}; topo; stime',wd/'map.log',120)
            area=float(re.findall(r'Area\s*=\s*([\d.]+)',log)[-1]);delay=float(re.findall(r'Delay\s*=\s*([\d.]+)',log)[-1])
            hw.run(f'read_lib -w {hw.lib}; read_blif {mapped}; strash; write_blif {expanded}',wd/'expand.log',120)
            verify(expanded,T);rows[flow]=dict(area=area,delay_ps=delay,checked_inputs=65536)
    return dict(id=key,gates=g,maps=rows)
def main():
    if not __debug__:raise RuntimeError('assertions must be enabled')
    ap=argparse.ArgumentParser();ap.add_argument('abc',type=Path);ap.add_argument('liberty',type=Path);args=ap.parse_args()
    pool={tuple(map(int,l.split())):dict(ref={},candidates={},seeds={}) for l in Path('data/panel.tsv').read_text().splitlines()}
    for line in Path('results/fft-hcub32.jsonl').open():
        r=json.loads(line);T=tuple(map(int,r['name'].split(',')))
        if T not in pool:continue
        live=live_gates(T,r['gates'])
        labels=[v[0] for v in live];parents=[(abs(v[1]),abs(v[3])) for v in live]
        graph,proxy=assemble(T,labels,parents);pool[T]['ref'][graph]=proxy;pool[T]['seeds'][r['seed']]=design_id(graph)
    assert all(len(v['seeds'])==32 for v in pool.values())
    for line in Path('results/panel-variants.tsv').open():
        a,b,*labels=map(int,line.split());T=(a,b)
        for mode in ('span','delay'):
            g,proxy=assemble(T,labels,key=mode);pool[T]['candidates'][g]=proxy
    out=Path('results/panel');out.mkdir(exist_ok=True)
    for T,rows in pool.items():
        dest=out/(str(T[0])+'-'+str(T[1])+'.json')
        if dest.exists():continue
        base=list(rows['ref']);cand=portfolio(rows['candidates'],len(base))
        assert cand,T
        mapped={design_id(g):map_one(g,T,args.abc.resolve(),args.liberty.resolve()) for g in dict.fromkeys([*base,*cand])}
        rec=dict(targets=T,reference=list(map(design_id,base)),candidates=list(map(design_id,cand)),seed_ids=rows['seeds'],candidate_population=len(rows['candidates']),designs=mapped)
        temp=dest.with_suffix('.part');temp.write_text(json.dumps(rec,separators=(',',':'))+'\n');temp.replace(dest)
        print(T,len(base),len(cand),len(mapped),flush=True)
if __name__=='__main__':main()
