"""Aggregate matched hardware designs; an area winner and a delay winner can be different circuits."""
import json
import statistics
from pathlib import Path

ROOT = Path("results")
FLOWS = ("standard", "resyn2")
METRICS = ("area", "delay_ps")


def read(file):
    return json.loads(file.read_text())


def minimum(designs, selection, flow, metric):
    assert selection and all(designs[k]["maps"][flow]["checked_inputs"] == 65536 for k in selection)
    return min(designs[k]["maps"][flow][metric] for k in selection)


def main():
    expected = {tuple(map(int, row.split())) for row in Path("data/panel.tsv").read_text().splitlines()}
    trials = sorted((read(f) for f in (ROOT / "panel").glob("*.json")), key=lambda r: r["targets"])
    assert len(trials) == len(expected) == 29 and {tuple(r["targets"]) for r in trials} == expected
    observed = set()
    for row in trials:
        assert len(row["seed_ids"]) == 32 and set(row["seed_ids"].values()) == set(row["reference"])
        assert 1 <= len(row["candidates"]) <= len(row["reference"])
        assert set(row["reference"] + row["candidates"]) == row["designs"].keys()
        for key, design in row["designs"].items():
            assert key == design["id"] and all(x["checked_inputs"] == 65536 for x in design["maps"].values())
            observed.add((tuple(row["targets"]), key))
    panel = {}
    paired = []
    for flow in FLOWS:
        panel[flow] = {}
        for metric in METRICS:
            baseline, candidate = [], []
            for row in trials:
                vals = [minimum(row["designs"],row[group],flow,metric) for group in ("reference","candidates")]
                baseline.append(vals[0]); candidate.append(vals[1])
                paired.append(dict(targets=row["targets"], flow=flow, metric=metric, reference=vals[0], candidate=vals[1]))
            ratios = [100*(b-a)/b for b,a in zip(baseline,candidate)]
            panel[flow][metric] = dict(reference_sum=round(sum(baseline),3),candidate_sum=round(sum(candidate),3),
                sum_reduction_pct=round(100*(1-sum(candidate)/sum(baseline)),4),
                median_paired_reduction_pct=round(statistics.median(ratios),4),
                smaller=sum(d>0 for d in ratios),equal=sum(d==0 for d in ratios),larger=sum(d<0 for d in ratios))
    filters = {}
    for n in ("VINOD03_26B","YEUNG04_40"):
        base = read(ROOT/"fir-mapping"/(n+".json"))
        exchange = read(ROOT/"exchange"/(n+".json"))
        filters[n] = {"search":exchange["counts"], "flows":{}}
        assert len(base["seeds"]) == 32 and len(exchange["designs"]) <= len(base["reference"])
        for f in FLOWS:
            filters[n]["flows"][f] = {}
            for metric in METRICS:
                groups = {"reference":(base["designs"],base["reference"]),"first":(base["designs"],[base["certified"]]),
                          "exchange":(exchange["designs"],list(exchange["designs"]))}
                filters[n]["flows"][f][metric] = {g:minimum(d,s,f,metric) for g,(d,s) in groups.items()}
    result = dict(cases=len(trials),distinct_panel_designs=len(observed),mapped_netlists=2*len(observed),
                  panel=panel,filters=filters)
    (ROOT/"hardware-summary.json").write_text(json.dumps(result,indent=2)+"\n")
    (ROOT/"hardware-pairs.json").write_text(json.dumps(paired,indent=2)+"\n")
    print(json.dumps(result,indent=2))


if __name__ == "__main__":
    main()
