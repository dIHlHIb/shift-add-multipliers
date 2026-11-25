"""Return certified gate counts and exact-product RTL for one CMSIS-DSP Q15 table entry."""
import argparse,json,re,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
sys.path.insert(0,str(HERE/'src'))
from table import SIZES,normalize,tables
from graphs import validate

def show(raw,row,module):
    if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*',module):raise ValueError('invalid module name')
    T=normalize(raw);validate(T,row['gates'])
    width=lambda t:16+(t-1).bit_length()
    def name(t):return 'x' if t==1 else f'v{t}'
    o=[f'module {module}(input wire signed [15:0] x, output wire signed [31:0] y0, y1);']
    for n,(t,a,i,b,j,r) in enumerate(row['gates']):
        w=width(t)+r
        o += [f'  wire signed [{w-1}:0] a{n} = {name(abs(a))};',f'  wire signed [{w-1}:0] b{n} = {name(abs(b))};']
        sa=f'(a{n} <<< {i})';sb=f'(b{n} <<< {j})'
        expr=f'{sa} + {sb}' if a>0 and b>0 else (f'{sa} - {sb}' if a>0 else f'{sb} - {sa}')
        assert a>0 or b>0
        o += [f'  wire signed [{w-1}:0] sum{n} = {expr};',f'  wire signed [{width(t)-1}:0] v{t} = sum{n} >>> {r};']
    for k,c in enumerate(raw):
        if not c:o.append(f"  assign y{k} = 32'sd0;");continue
        shift=(abs(c)&-abs(c)).bit_length()-1
        o += [f'  wire signed [31:0] out{k} = {name(abs(c)>>shift)};',f"  assign y{k} = {'-' if c<0 else ''}(out{k} <<< {shift});"]
    o+=['endmodule'];return '\n'.join(o)+'\n'
def lookup(n,i,pick=None,flow='resyn2'):
    bank=tables(HERE/'data/arm_common_tables.c')
    if n not in bank or not 0<=i<len(bank[n]): raise ValueError('index outside the stored CMSIS table')
    raw=bank[n][i];target=normalize(raw)
    data=json.loads((HERE/'results/census.json').read_text())
    row=next(r for r in data['cases'] if tuple(r['targets'])==target)
    if pick is not None:
        file=HERE/'results'/'panel'/('-'.join(map(str,target))+'.json')
        if not file.is_file():raise ValueError('this coefficient pair is outside the measured panel')
        panel=json.loads(file.read_text())
        metric='area' if pick=='area' else 'delay_ps'
        key=min(panel['candidates'],key=lambda g:(panel['designs'][g]['maps'][flow][metric],g))
        design=panel['designs'][key];validate(target,design['gates'])
        assert len(design['gates'])==row['minimum']
        row={**row,'gates':design['gates'],'measurement':dict(id=key,flow=flow,**design['maps'][flow])}
    return raw,row
if __name__=='__main__':
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('size',type=int,choices=SIZES);p.add_argument('index',type=int);p.add_argument('--verilog',action='store_true');p.add_argument('--module',default='q15_products')
    p.add_argument('--pick',choices=('area','delay'),help='use the smallest or fastest measured minimum-gate circuit in the 29-pair panel')
    p.add_argument('--flow',choices=('standard','resyn2'),default='resyn2');a=p.parse_args()
    try:raw,row=lookup(a.size,a.index,a.pick,a.flow)
    except ValueError as e:p.error(str(e))
    if a.verilog:print(show(raw,row,a.module),end='')
    else:print(json.dumps(dict(size=a.size,index=a.index,signed_coefficients=raw,**row),indent=2))
