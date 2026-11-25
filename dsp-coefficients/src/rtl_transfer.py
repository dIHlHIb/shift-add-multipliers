"""Re-map the frozen area winners from real, signed Verilog using the Icarus BLIF frontend."""
import argparse
import hashlib
import json
import re
import statistics
import subprocess
import sys
import tempfile
from pathlib import Path
import netlist
from blif import evaluate
from check_products import MASK,expected
from panel import FLOWS
from table import tables,normalize
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from twiddle import show


def verify(path,raw):
    bits={f'x[{i}]':MASK//((1<<(2*(1<<i)))-1)*(((1<<(1<<i))-1)<<(1<<i)) for i in range(16)}
    evaluate(path,bits,MASK)
    for k,c in enumerate(raw):
        for j,value in enumerate(expected(c,32)):
            assert bits[f'y{k}[{j}]']==value,(k,c,j)


def mapped(wd,raw,design,tools):
    text=show(raw,design,'unit')
    v=wd/'unit.v';v.write_text(text)
    source=wd/'front.blif';cell=wd/'cells.blif';back=wd/'back.blif'
    flags=['-B',str(tools.base.resolve())] if tools.base else []
    subprocess.run([str(tools.iverilog.resolve()),*flags,'-g2012','-s','unit','-t','blif','-o',source,v],check=True,capture_output=True)
    netlist.abc=tools.abc.resolve()
    library=wd/'nangate.lib'
    if not library.exists():library.symlink_to(tools.lib.resolve())
    log=netlist.run(f'read_lib -w {library}; read_blif {source}; strash; {FLOWS["resyn2"]}; map; write_blif {cell}; read_blif {cell}; topo; stime',wd/'summary.log',120)
    area=float(re.findall(r'Area\s*=\s*([\d.]+)',log)[-1]);delay=float(re.findall(r'Delay\s*=\s*([\d.]+)',log)[-1])
    netlist.run(f'read_lib -w {library}; read_blif {cell}; strash; write_blif {back}',wd/'expand.log',120)
    verify(back,raw)
    return dict(id=design['id'],verilog_sha256=hashlib.sha256(text.encode()).hexdigest(),area=area,delay_ps=delay,checked_signed_inputs=65536)


def main():
    p=argparse.ArgumentParser(description=__doc__)
    for arg in ('iverilog','abc','lib'):p.add_argument(arg,type=Path)
    p.add_argument('--base',type=Path);a=p.parse_args()
    root=Path.cwd()
    cases=tables(root/'data/arm_common_tables.c')[128]
    rows=[]
    for f in sorted((root/'results/matched-panel').glob('*.json')):
        r=json.loads(f.read_text());T=tuple(r['targets']);idx=next(i for i,c in enumerate(cases) if normalize(c)==T)
        raw=cases[idx];out={};cache={}
        with tempfile.TemporaryDirectory(prefix='mcm-rtl-') as td:
            for side in ('hcub','exact'):
                selected=min(r['groups']['matched'][side],key=lambda h:(r['designs'][h]['maps']['resyn2']['area'],h))
                if selected not in cache:cache[selected]=mapped(Path(td),raw,r['designs'][selected],a)
                out[side]=cache[selected]
        rows.append(dict(targets=T,index=idx,signed_coefficients=raw,designs=out))
        print(idx,round(out['hcub']['area']-out['exact']['area'],2),flush=True)
    assert len(rows)==29
    stats={}
    for metric in ('area','delay_ps'):
        values=[(r['designs']['hcub'][metric],r['designs']['exact'][metric]) for r in rows]
        before,after=map(sum,zip(*values))
        pct=[100*(x-y)/x for x,y in values]
        stats[metric]=dict(hcub=round(before,2),exact=round(after,2),sum_saving_pct=round(100*(before-after)/before,4),
            median_saving_pct=round(statistics.median(pct),4),smaller=sum(x>0 for x in pct),equal=pct.count(0),larger=sum(x<0 for x in pct))
    file=root/'results/rtl-transfer.json'
    file.write_text(json.dumps(dict(cases=len(rows),stats=stats,rows=rows),indent=2)+'\n')
    print(json.dumps(stats),flush=True)


if __name__=='__main__':main()
