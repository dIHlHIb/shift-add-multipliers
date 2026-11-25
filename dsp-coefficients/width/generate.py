"""Regenerate the self-contained Lean supplement from the 29 bounded repairs."""
import argparse,json,sys
from pathlib import Path
root=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(root/'src'))
from proof_data import literal
p=argparse.ArgumentParser();p.add_argument('--check',action='store_true');a=p.parse_args()
rows=json.loads((root/'results/width-census.json').read_text())['replacements'];assert len(rows)==29
lines=[]
for row in rows:
    ops=','.join(literal(t,abs(x),abs(y)) for t,x,i,y,j,r in row['gates'])
    lines.append('  ⟨'+str(row['targets'])+', ['+ops+']⟩')
src=(root/'width/WidthInventory.template').read_text().replace('-- WITNESSES',',\n'.join(lines))
out=root/'proof/WidthInventory.lean'
if a.check:assert out.read_text()==src
else:out.write_text(src)
