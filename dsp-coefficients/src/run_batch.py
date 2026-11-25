import argparse, subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('periods',nargs='+',type=int);args=p.parse_args()
combined=Path('data/combined.tsv')
combined.write_text(Path('data/pending.tsv').read_text()+Path('data/feasible5.tsv').read_text())
for period in args.periods:
    start=time.monotonic()
    file=Path(f'results/mod-{period}.tsv')
    with file.with_suffix('.part').open('w') as out, file.with_suffix('.log').open('w') as log:
        subprocess.run(['build/batch_five',str(period),str(combined)],stdout=out,stderr=log,check=True)
    file.with_suffix('.part').replace(file)
    rows=[tuple(map(int,line.split())) for line in file.read_text().splitlines()]
    assert len(rows)==1834 and all(hit for a,b,hit in rows[851:])
    print(period,'excluded',sum(not hit for a,b,hit in rows[:851]),'seconds',round(time.monotonic()-start,3),flush=True)
