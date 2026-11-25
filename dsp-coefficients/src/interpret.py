"""Post hoc breakdown of the fixed panel by whether Hcub found a minimum-gate graph."""
import json
from pathlib import Path
from summary import FLOWS,minimum


def main():
    rows=[json.loads(f.read_text()) for f in sorted(Path('results/panel').glob('*.json'))]
    assert len(rows)==29
    out={}
    for flow in FLOWS:
        by_count={}
        for count in (6,7):
            group=[r for r in rows if min(len(r['designs'][k]['gates']) for k in r['reference'])==count]
            assert all(len(r['designs'][k]['gates'])==6 for r in group for k in r['candidates'])
            base=sum(minimum(r['designs'],r['reference'],flow,'area') for r in group)
            exact=sum(minimum(r['designs'],r['candidates'],flow,'area') for r in group)
            by_count[count]=dict(blocks=len(group),reference_area=round(base,2),candidate_area=round(exact,2),
                                 area_saved=round(base-exact,2),reduction_pct=round(100*(1-exact/base),4))
        assert sum(x['blocks'] for x in by_count.values())==29
        out[flow]=by_count
    Path('results/hardware-by-hcub-cost.json').write_text(json.dumps(out,indent=2)+'\n')
    print(out)


if __name__=='__main__':
    main()
