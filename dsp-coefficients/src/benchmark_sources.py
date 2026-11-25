"""Check the published FIR target projections against the original benchmark files."""
import argparse
import csv
import hashlib
import io
import json
import sys
from pathlib import Path
from urllib.error import URLError
from urllib.request import urlopen

from table import normalize


DATA = Path(__file__).resolve().parents[1] / "data"
CP_CSV = "cp-benchmarks.csv"
JMCM_CSV = "jmcm-benchmarks.csv"
SOURCES = {
    CP_CSV: (
        "https://gitlab.inria.fr/emeraude/mcm-cp/-/raw/"
        "e09fdaa0b11461b861b3911479f11934ebc11cc5/test/benchmarks.csv",
        "7d83d3abc15e3efa6371b7db1388440a97dffebd5a11be260d5281ad9b0cda97",
    ),
    JMCM_CSV: (
        "https://raw.githubusercontent.com/remi-garcia/jMCM/"
        "d4a966a8f3ea4763ae50041ec8e03ea5369aad02/benchmarks/benchmarks.csv",
        "e2dbc00af9c3396a052f56a9d48a54c04c5e8bbc235f5b4fa4c2d991f70e2eec",
    ),
}


def cp_targets():
    rows = json.loads((DATA / "cp-bounded-baseline.json").read_text())
    # The published CP table lists instance names in case-insensitive order.
    rows.sort(key=lambda row: row["name"].casefold())
    return {row["name"]: tuple(row["targets"]) for row in rows}


def jmcm_targets():
    targets = json.loads((DATA / "jmcm-targets.json").read_text())
    return {name: tuple(values) for name, values in targets.items()}


def verify(directory):
    for name, (url, digest) in SOURCES.items():
        if directory is None:
            with urlopen(url, timeout=30) as response:
                data = response.read()
        else:
            data = (directory / name).read_bytes()
        if hashlib.sha256(data).hexdigest() != digest:
            raise ValueError(f"{name}: source SHA-256 mismatch")

        calculated = {}
        for row in csv.DictReader(io.StringIO(data.decode("utf-8")), skipinitialspace=True):
            key = row["name"]
            targets = normalize(map(int, row["unique_coefficients"].split()))
            if name == JMCM_CSV and normalize(map(int, row["coefficients"].split())) != targets:
                raise ValueError(f"{key}: signed taps and unique coefficients disagree")
            if key in calculated:
                raise ValueError(f"{name}: duplicate row {key}")
            calculated[key] = targets

        stored = cp_targets() if name == CP_CSV else jmcm_targets()
        if calculated != stored:
            raise ValueError(f"{name}: normalized benchmark targets differ")
        print(f"{name}: SHA-256 and all {len(stored)} normalized target sets match")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--from-dir", type=Path, help="read both original CSVs here, offline")
    args = parser.parse_args()
    try:
        verify(args.from_dir)
    except (OSError, URLError, ValueError, KeyError) as error:
        sys.exit(str(error))
