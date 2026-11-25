"""Try to replace three oversized optimum witnesses with witnesses inside the target width."""
import json,subprocess
from pathlib import Path
from graphs import recover,validate
src=Path('src/six.cpp').read_text()
assert src.count('constexpr W cap=65535;')==1
pairs=[(4759,32421),(10897,15451),(17445,27737)]
d=Path('build/width-probe');d.mkdir(parents=True,exist_ok=True);found={}
for w in sorted({max(t).bit_length() for t in pairs}):
    cpp=d/(str(w)+'.cpp');exe=d/(str(w)+'.exe');inputs=d/(str(w)+'.tsv');out=d/(str(w)+'.txt')
    cpp.write_text(src.replace('constexpr W cap=65535;',f'constexpr W cap={(1<<w)-1};'))
    subprocess.run(['c++','-std=c++17','-O2',cpp,'-o',exe],check=True)
    cases=[t for t in pairs if max(t).bit_length()==w]
    inputs.write_text(''.join('%d %d\n'%t for t in cases))
    subprocess.run([exe,inputs,out,'1','deep'],check=True)
    for l in out.read_text().splitlines():
        a,b,*nodes=map(int,l.split());g=recover((a,b),nodes);assert len(g)==6 and all(z[0].bit_length()<=w for z in g)
        found[f'{a},{b}']=g
Path('results/width-probes.json').write_text(json.dumps(found,indent=2)+'\n')
print('Width-bounded constructions:',sorted(found))
