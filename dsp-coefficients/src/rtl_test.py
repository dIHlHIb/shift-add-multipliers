"""Exhaust every 16-bit input on a fixed RTL panel, including degenerate signed outputs."""
import argparse,json,subprocess,sys,tempfile
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
from twiddle import show
from table import tables,normalize
def run():
    p=argparse.ArgumentParser();p.add_argument('iverilog',type=Path);p.add_argument('vvp',type=Path);p.add_argument('--base',type=Path);p.add_argument('--exported',action='store_true');a=p.parse_args()
    table=tables('data/arm_common_tables.c');rows={tuple(x['targets']):x for x in json.load(open('results/census.json'))['cases']}
    panel={tuple(map(int,s.split())) for s in Path('data/panel.tsv').read_text().splitlines()}
    cases={}
    for n,arr in table.items():
        for idx,raw in enumerate(arr):
            T=normalize(raw);row=rows[T];show(raw,row,'unit')
            if n==128 and T in panel:cases.setdefault(('panel',T),(n,idx,raw))
            if 0 in raw:cases.setdefault(('zero',tuple(c<0 for c in raw)),(n,idx,raw))
            if len(T)<2:cases.setdefault(('degenerate',len(T),tuple(c<0 for c in raw)),(n,idx,raw))
    if a.exported:
        import csv
        selected=list(csv.DictReader(open('rtl/index.csv')))
        assert len(selected)==29 and len({normalize((int(s['coefficient0']),int(s['coefficient1']))) for s in selected})==len(panel)
        cases={s['verilog']:(128,int(s['index']),table[128][int(s['index'])]) for s in selected}
    out=Path('results', 'rtl-exported-tests.jsonl' if a.exported else 'rtl-tests.jsonl')
    with tempfile.TemporaryDirectory() as tmp,out.open('w',buffering=1) as log:
        temp=Path(tmp)
        for key,(n,idx,raw) in cases.items():
            if a.exported:
                text=(Path('rtl')/key).read_text()
                module=Path(key).stem
            else:
                text=show(raw,rows[normalize(raw)],'unit')
                module='unit'
            text+=f"""
module tb;
reg signed [15:0] x;
wire signed [31:0] y0,y1;
localparam signed [31:0] A={raw[0]}, B={raw[1]};
{module} u(x,y0,y1);
integer i;
initial begin
 for(i=0;i<65536;i=i+1) begin
   x=i; #1;
   if(y0 !== $signed(x)*A || y1 !== $signed(x)*B) $fatal(1,"mismatch %d",i);
 end
 $display("PASS 65536"); $finish;
end
endmodule
"""
            f=temp/'case.v';exe=temp/'case.vvp';f.write_text(text)
            cmd=[str(a.iverilog.resolve())]
            if a.base:cmd+=['-B',str(a.base.resolve())]
            subprocess.run(cmd+['-g2012','-s','tb','-o',str(exe),str(f)],check=True)
            msg=subprocess.run([str(a.vvp.resolve()),str(exe)],capture_output=True,text=True,check=True)
            assert 'PASS 65536' in msg.stdout
            print(json.dumps(dict(size=n,index=idx,coefficients=raw,verified_words=65536)),file=log)
    print('source positions',sum(map(len,table.values())),'exhaustive RTL cases',len(cases))
if __name__=='__main__':run()
