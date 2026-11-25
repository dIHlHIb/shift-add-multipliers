"""Export the smallest resyn2-measured minimum-gate circuit at each panel pair's first 128-point occurrence."""
import csv
import json
import sys
from pathlib import Path
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root))
from twiddle import lookup,show
from table import normalize,tables


def main():
    pending={tuple(map(int,line.split())) for line in (root/'data/panel.tsv').read_text().splitlines()}
    file=root/'rtl';file.mkdir(exist_ok=True)
    index=[]
    for i,raw in enumerate(tables(root/'data/arm_common_tables.c')[128]):
        T=normalize(raw)
        if T not in pending:continue
        pending.remove(T);coeff,row=lookup(128,i,'area','resyn2')
        assert coeff==raw
        module='arm_q15_128_'+str(i)
        (file/(module+'.v')).write_text(show(raw,row,module))
        index.append([128,i,*raw,*T,row['minimum'],row['measurement']['area'],row['measurement']['delay_ps'],row['measurement']['id'],module+'.v'])
    assert not pending and len(index)==29
    with (file/'index.csv').open('w',newline='') as f:
        w=csv.writer(f);w.writerow(['table','index','coefficient0','coefficient1','odd0','odd1','adders','mapped_area','mapped_delay_ps','design_sha256','verilog']);w.writerows(index)
    print('Exported',len(index),'area-selected minimum-gate RTL modules')


if __name__=='__main__':
    main()
