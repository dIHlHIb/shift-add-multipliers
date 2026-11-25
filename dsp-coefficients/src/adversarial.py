"""Deliberately damage the search and a proof witness; record which controls detect the changes."""
import argparse,json,os,subprocess,tempfile
from pathlib import Path
from graphs import validate
def main():
    a=argparse.ArgumentParser();a.add_argument('lean',type=Path);ap=a.parse_args()
    source=Path('src/batch_five.cpp').read_text();results={}
    variants={'forbid_repeated_parents':('for(size_t j=0;j<=i;++j)','for(size_t j=0;j<i;++j)'),
              'omit_subtraction':('out.push_back(canonical(y>=mod?y-mod:y));','(void)y;'),
              'require_independent_last_outputs':('contains(q.bridges,t)||','false||')}
    with tempfile.TemporaryDirectory() as tmp:
        folder=Path(tmp)
        for name,(original,replaced) in variants.items():
            assert source.count(original)==1
            mutant=source.replace(original,replaced)
            if name=='require_independent_last_outputs':
                s='std::any_of(g.begin(),g.end(),[&](W z){return contains(q.bridges,z);})'
                assert mutant.count(s)==1;mutant=mutant.replace(s,'false')
            file=folder/(name+'.cpp');binary=folder/name;file.write_text(mutant)
            subprocess.run(['c++','-O2','-std=c++17',str(file),'-o',str(binary)],check=True)
            raw=subprocess.check_output([str(binary),'23','data/feasible5.tsv'],text=True,stderr=subprocess.DEVNULL)
            damaged=[list(map(int,l.split()[:2])) for l in raw.splitlines() if l.endswith(' 0')]
            assert damaged,(name,'mutation escaped the known positive graphs')
            results[name]=dict(false_negatives=len(damaged),example=damaged[0],positive_controls=983)
        proof=folder/'Altered.lean';proof.write_text('import Q15Upper\nopen Q15Upper\nexample : accepts ⟨[3],[⟨3,1,1,.second,.plus,3⟩]⟩ = true := by decide +kernel\n')
        env=dict(os.environ,LEAN_PATH=str(Path('build/olean').resolve()))
        r=subprocess.run([str(ap.lean.resolve()),'-j1',str(proof)],env=env,capture_output=True,text=True)
        assert r.returncode!=0 and 'false' in r.stdout.lower(),r.stdout+r.stderr
        results['wrong_shift_lean']=r.stdout.replace(str(folder),'[test]')
    r=json.load(open('results/cp-census.json'))['VINOD03_26B'];rows=[g.copy() for g in r['gates']]
    rows[0][2]+=1
    try:validate(r['targets'],rows)
    except AssertionError:results['wrong_shift_integer']='rejected'
    else:raise AssertionError('damaged gate accepted')
    Path('results/adversarial.json').write_text(json.dumps(results,indent=2)+'\n')
    print(results,flush=True)
if __name__=='__main__':main()
