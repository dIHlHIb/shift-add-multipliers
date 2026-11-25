"""Join two pinned public jMCM tables to our ledger by exact normalized coefficients."""
import argparse
import collections
import csv
import hashlib
import json
from pathlib import Path
from benchmark_sources import jmcm_targets


def read(name,digest):
    file=Path('data')/name
    assert hashlib.sha256(file.read_bytes()).hexdigest()==digest,name
    with file.open() as f:return list(csv.DictReader(f,skipinitialspace=True))


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check',action='store_true',help='compare the stored result without rewriting it')
    args=parser.parse_args()
    defs=jmcm_targets()
    results=read('jmcm-results_all.csv','c5f718557860928d977814b1aed995c6dbd3c0faf7fff814701dbc456889a6c9')
    ledger=json.load(open('results/cp-census.json'));targets=collections.defaultdict(list)
    for n,r in ledger.items():targets[tuple(r['targets'])].append(n)
    by=collections.defaultdict(list)
    for r in results:
        if int(r['epsilon_max']) or r['method'] not in ('mcm','mcmb'):continue
        assert float(r['wl_out'])==float(r['wl_out_full'])
        T=defs[r['name']]
        if T in targets:by[T].append(r)
    matched=[]
    for T,rs in sorted(by.items()):
        costs={ledger[n]['minimum'] for n in targets[T]};assert len(costs)==1
        ours=costs.pop();plain=[r for r in rs if r['method']=='mcm' and r['min_ad']=='false']
        assert plain
        prev=min(int(r['NA']) for r in rs)
        assert min(int(r['NA']) for r in plain)==prev>=ours
        if prev>ours:assert all('*' in r['time'] for r in plain)
        matched.append(dict(targets=T,cp_names=sorted(targets[T]),published_names=sorted({r['name'] for r in rs}),
                            prior_full_precision_adders=prev,unrestricted_minimum=ours,
                            difference=prev-ours,plain_time_fields=[r['time'] for r in plain]))
    _sum=lambda k:sum(r[k] for r in matched)
    out=dict(cp_rows=len(ledger),distinct_cp_vectors=len(targets),matched_vectors=len(matched),
             represented_cp_rows=sum(len(r['cp_names']) for r in matched),prior_total=_sum('prior_full_precision_adders'),
             exact_total=_sum('unrestricted_minimum'),smaller=sum(r['difference']>0 for r in matched),
             excluded_cp_names=sorted(n for t,ns in targets.items() if t not in by for n in ns),
             rows=matched)
    assert (out['matched_vectors'],out['smaller'],out['prior_total'],out['exact_total'])==(79,23,956,899)
    dest=Path('results/jmcm-comparison.json')
    content=json.dumps(out,indent=2)+'\n'
    if args.check:
        assert dest.read_text()==content
    else:
        dest.write_text(content)
    print({k:v for k,v in out.items() if k!='rows'})


if __name__=='__main__':
    main()
