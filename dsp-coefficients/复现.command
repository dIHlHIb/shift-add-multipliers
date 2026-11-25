#!/bin/sh
set -eu
project_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
cd "$project_dir"
exec nice -n 10 python3 -B src/desktop_replay.py "$@"
