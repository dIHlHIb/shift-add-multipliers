"""Compare full integer target sets and cost fields in the authors' archived SAT benchmark."""
import argparse
import hashlib
import json
import tarfile
from pathlib import Path
from table import normalize


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('archive',type=Path,help='sat_mcm.tar from DOI 10.48662/daks-21')
    args=parser.parse_args()
    digest=hashlib.sha256(args.archive.read_bytes()).hexdigest()
    if digest!='6f674461a73bfba28f577bac161ebfde574aebdf0d43e3195f922aa5e26a8bca':
        raise ValueError('This archive differs from the 2023 research deposit.')
    root=Path(__file__).resolve().parents[1]
    led=json.loads((root/'results/cp-census.json').read_text())
    rows={}
    with tarfile.open(args.archive) as tar:
        text=tar.extractfile('sat_mcm/benchmark/inputs/mcm/mcm.csv').read().decode()
    for line in text.splitlines():
        taps,cost=line.split(';')
        target=normalize(map(int,taps.split(':')))
        found=[(n,r) for n,r in led.items() if tuple(r['targets'])==target]
        assert found and all(r['minimum']==int(cost) for n,r in found)
        for n,_ in found:rows[n]=int(cost)
    assert len(rows)==11 and all(n not in rows for n in ('VINOD03_26B','YEUNG04_40'))
    print(json.dumps(dict(sorted(rows.items())),indent=2))


if __name__=='__main__':main()
