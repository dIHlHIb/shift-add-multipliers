"""Bind the two new bounds and the earlier 81 cases to the original CP input vectors."""
import collections,json
from benchmark_sources import cp_targets
from pathlib import Path
from graphs import instruction,validate
from proof_data import literal
def new_graph(name,T):
    if name=='VINOD03_26B':
        record=json.loads(Path('results/VINOD03_26B-p23-r5-s24/000.json').read_text())
        assert record['outcome']=='POSSIBLE'
        helpers=list(map(int,record['line'].split(' helpers ')[1].split()))
        available={1};g=[]
        from itertools import combinations_with_replacement
        while True:
            for t in sorted((set(T)|set(helpers))-available):
                ins=next((r for a,b in combinations_with_replacement(sorted(available),2) if (r:=instruction(a,b,t))),None)
                if ins:
                    g.append(ins);available.add(t);break
            else:break
        return g,'integer lift of the five modular helper classes'
    candidates=[json.loads(l) for l in open('results/fir-hcub.jsonl')]
    run=min((x for x in candidates if x['name']==name),key=lambda r:(r['cost'],r['seed']))
    return run['gates'],'SPIRAL Hcub seed '+str(run['seed'])
def main():
    old=json.load(open('data/prior-cp.json'));rows={}
    for name,T in cp_targets().items():
        if name in old:
            o=old[name];assert list(T)==o['targets'];lo=o['lower'];kind=o['evidence'];g=[instruction(a,b,t) for t,a,b in o['parents']];via='archived integer graph'
        else:
            r,parts=(4,8) if name=='VINOD03_26B' else (3,64)
            for i in range(parts):
                j=json.load(open(f'results/{name}-p23-r{r}-s{parts}/{i:03d}.json'))
                fields=j['line'].split();assert j['outcome']=='IMPOSSIBLE' and fields[1:4]==['23',str(r),f'{i}/{parts}'] and tuple(j['targets'])==T
            rev=json.load(open(f'results/reverse-{name}-{r}.json'));assert rev['line'].startswith('IMPOSSIBLE ') and rev['helpers']==r and rev['period']==23 and tuple(rev['targets'])==T
            lo=len(T)+r+1;g,via=new_graph(name,T);kind='two independent modular searches, period 23'
        validate(T,g);assert len(g)==lo
        rows[name]=dict(targets=T,minimum=lo,gates=g,lower_evidence=kind,upper_source=via)
    assert len(rows)==83
    Path('results/cp-census.json').write_text(json.dumps(rows,separators=(',',':'))+'\n')
    text='import Q15Upper\nnamespace CPBench\nopen Q15Upper\n'
    text+='def entries : List Entry := [\n'
    vals=[]
    for name,row in sorted(rows.items()):
        gs=[literal(t,abs(a),abs(b)) for t,a,i,b,j,r in row['gates']]
        vals.append('  ⟨'+str(list(row['targets']))+', ['+','.join(gs)+']⟩')
    text+=',\n'.join(vals)+']\nset_option maxRecDepth 100000\nset_option maxHeartbeats 0\n'
    text+='theorem checked : entries.all accepts = true := by decide +kernel\ntheorem all_upper : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked\n'
    text+='theorem entry_count : entries.length=83 := by decide +kernel\n#print axioms all_upper\nend CPBench\n'
    Path('proof/CPBench.lean').write_text(text)
    print('CP exact',len(rows),'lower evidence',dict(collections.Counter(r['lower_evidence'] for r in rows.values())))
if __name__=='__main__':main()
