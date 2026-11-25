"""Lightweight arithmetic, provenance, scope and benchmark checks; no trusted research solver required."""
import collections,hashlib,json
from benchmark_sources import cp_targets
from pathlib import Path
from graphs import live_gates,validate
from table import normalize,tables
ARM='d04c183249c7977353d9bd6422a54b862bb144c21eb05ee0ad4a9ca34dcaa901'
def main():
    if not __debug__:raise RuntimeError('run with Python assertions enabled')
    assert hashlib.sha256(Path('data/arm_common_tables.c').read_bytes()).hexdigest()==ARM
    arm=json.load(open('results/census.json'));bank=tables('data/arm_common_tables.c')
    pos=[normalize(raw) for vs in bank.values() for raw in vs]
    rows={tuple(r['targets']):r for r in arm['cases']}
    assert len(pos)==arm['table_positions']==6132 and len(rows)==len(arm['cases'])==2044 and set(pos)==rows.keys()
    for T,r in rows.items():validate(T,r['gates']);assert r['minimum']==len(r['gates'])
    assert collections.Counter(r['minimum'] for r in rows.values())=={0:1,1:2,2:6,3:27,4:174,5:983,6:851}
    def pair_file(name):
        pairs=[tuple(map(int,line.split())) for line in Path('data',name).read_text().splitlines()]
        assert len(pairs)==len(set(pairs)),name
        return set(pairs)
    pending={T for T,r in rows.items() if r['minimum']==6}
    assert pair_file('pending.tsv')==pending
    assert pair_file('feasible5.tsv')=={T for T,r in rows.items() if r['minimum']==5}
    assert pair_file('panel.tsv')==pending & {normalize(pair) for pair in bank[128]}
    cp=json.load(open('results/cp-census.json'))
    inputs=cp_targets()
    assert len(cp)==83 and cp.keys()==inputs.keys()
    for name,row in cp.items():
        T=inputs[name];assert list(T)==row['targets'] and len(row['gates'])==row['minimum']
        validate(T,row['gates'])
    fir=collections.defaultdict(dict)
    for line in Path('results/fir-hcub.jsonl').read_text().splitlines():
        r=json.loads(line);n=r['name']
        assert r['seed'] not in fir[n] and r['cost']==len(r['gates'])
        validate(inputs[n],r['gates']);fir[n][r['seed']]=r['cost']
    assert set(fir)=={'VINOD03_26B','YEUNG04_40'} and all(set(v)==set(range(1,33)) for v in fir.values())
    assert min(fir['VINOD03_26B'].values())==19 and min(fir['YEUNG04_40'].values())==24
    fft=collections.defaultdict(dict);raw_costs=collections.defaultdict(list);dead=0
    for l in open('results/fft-hcub32.jsonl'):
        r=json.loads(l);T=tuple(map(int,r['name'].split(',')))
        assert r['seed'] not in fft[T] and r['cost']==len(r['gates']);validate(T,r['gates'])
        g=live_gates(T,r['gates']);validate(T,g)
        fft[T][r['seed']]=len(g);raw_costs[T].append(r['cost']);dead+=len(g)!=r['cost']
    assert set(fft)==pending
    assert all(set(g)==set(range(1,33)) for g in fft.values())
    strict={T for T,g in fft.items() if min(g.values())>6};assert len(strict)==59
    assert dead==76 and sum(min(x) for x in raw_costs.values())==5170
    assert sum(min(g.values()) for g in fft.values())==5165 and sum(T in strict for T in pos)==172
    out=dict(positions=len(pos),unique=len(rows),maximum=max(r['minimum'] for r in rows.values()),cp_rows=len(cp),
             hcub_pairs=len(fft),seeds_per_pair=32,trials_with_dead_gates=dead,strict_improvements=len(strict),strict_positions=sum(T in strict for T in pos))
    print(json.dumps(out,indent=2))
if __name__=='__main__':main()
