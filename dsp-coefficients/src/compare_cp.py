"""Compare the two-second CP solver measurements with the unrestricted optima."""
import argparse
import collections
import json
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='verify the stored comparison without writing files')
    args = parser.parse_args()
    cp = json.loads(Path('results/cp-census.json').read_text())
    rows = json.loads(Path('data/cp-bounded-baseline.json').read_text())
    counts = collections.Counter()
    assert len(rows)==len(cp) and set(r['name'] for r in rows)==cp.keys()
    for rec in rows:
        expected=cp[rec['name']]
        assert rec['targets']==expected['targets'],rec['name']
        if rec['status']=='opt':
            assert rec['opt']>=expected['minimum']
            counts['matched' if rec['opt']==expected['minimum'] else 'missed_better_graph']+=1
        else:counts[rec['status']]+=1
    summary=dict(time_limit_s=2,bounded_cp=dict(sorted(counts.items())),unrestricted_exact=len(cp))
    dest = Path('results/cp-bounded-comparison.json')
    content = json.dumps(summary, indent=2) + '\n'
    if args.check:
        if dest.read_text() != content:
            raise SystemExit(f'{dest} differs from the comparison computed from the two input tables')
    else:
        dest.write_text(content)
    print(summary)


if __name__=='__main__':
    main()
