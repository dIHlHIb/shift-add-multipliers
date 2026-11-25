# Reproducing the measurements

Use Python 3.10 or later with assertions enabled, and a C++17 compiler. Start each example in `dsp-coefficients/`. The full run below creates `mcm-dsp-rerun` alongside the repository. Choose a fresh directory for each full run. The core experiments require no network access or third-party Python modules.

```sh
./reproduce --quick
./reproduce --work ../../mcm-dsp-rerun
```

On macOS, double-click `复现.command`. It runs the same full command in a temporary working directory at a lower CPU priority. It reads optional tool paths from the user's private `~/.config/mcm-dsp/tools.json` (or the equivalent beneath `XDG_CONFIG_HOME`). Fields are `lean`, `iverilog`, `vvp`, `ivl_base`, `abc` and `liberty`. The project has no machine-specific paths. Run `./复现.command --check` to see which stages will run. Without the profile, the double-click launcher runs the portable arithmetic experiments. The explicit command-line flags below work on any configured machine.

The quick check replays every stored integer circuit, the normalized filter inputs, the Arm source hash, the stored CP and jMCM comparisons and all 27,232 FFT heuristic trials. The full command uses a new directory, rebuilds the searches, regenerates both ledgers and compares them with the supplied results. Both work offline. To check the normalized filter inputs against the two original CSV files, run `python3 -B src/benchmark_sources.py`. This command fetches both originals and verifies their SHA-256 digests. For an offline source check, supply the two files under the names `cp-benchmarks.csv` and `jmcm-benchmarks.csv` with `--from-dir DIR`.

To rebuild the formal proof of circuit existence and the lossless projection of integer schedules into the finite model, give the path to the Lean 4.19.0 executable. The general projection is one-way: finite impossibility implies integer impossibility. A successful finite search requires a separately checked integer circuit. Per-instance finite search runs use C++ outside Lean.

```sh
python3 reproduce.py --lean /path/to/lean
(cd proof && lake build)
```

The first command reruns the arithmetic experiments and checks the proofs in a temporary directory. The second builds just the proof library. To check it with a second kernel, use the work directory created by the full run above. Both commands below write their objects and logs there. Use matching versions of the verifier, compiler and standard library.

```sh
(
  cd ../../mcm-dsp-rerun &&
  python3 -B src/lean_replay.py /path/to/lean &&
  python3 -B src/second_kernel.py /path/to/checker /path/to/checker-objects /path/to/lean-bin
)
```

For signed RTL simulation, add `--rtl /path/to/iverilog /path/to/vvp` to a full run. Icarus installations with a separate target directory accept `--iverilog-base /path/to/lib/ivl`. For the two mapping flows add `--mapping /path/to/yosys-abc /path/to/NangateOpenCellLibrary_typical.lib`. Matching ABC and Liberty versions matter for exact numerical comparisons. Both flows share the same logic generator and library. Area and critical-path minima may select different circuits.

To regenerate the heuristic inputs using the SPIRAL release, run the following after the full run. The binary also needs its cost tables at the location expected by that release. The stored raw circuit files allow testing the rest of the experiment independently of that installation.

```sh
(cd ../../mcm-dsp-rerun && python3 -B src/heuristic.py /path/to/synth fft 32 fft-trials.jsonl)
(cd ../../mcm-dsp-rerun && python3 -B src/heuristic.py /path/to/synth fir 32 fir-trials.jsonl)
```

For a new problem, prepare a JSON object with a list of signed integer `coefficients` and a list of `gates`. A gate entry `[t,a,i,b,j,r]` means `t*2^r = a*2^i + b*2^j`. The signs are carried by the parent labels. Absolute parents must be the original input 1 or an earlier odd output. The two parents may coincide. Zeros, output signs and powers of two need no gates. Here is a complete example.

```json
{"coefficients":[3,-6,5],"gates":[[3,1,1,1,0,0],[5,1,2,1,0,0]]}
```

```sh
python3 certify.py --witness example.json
python3 certify.py --cp VINOD03_26B --period 23
python3 twiddle.py 32 11 --verilog
```

The certifier gives an optimum only when its lower bound matches the supplied circuit. Larger budgets, timeouts and inconclusive moduli can return `inconclusive`. The RTL lookup exports the exact two integer products of a signed 16-bit input in signed 32-bit outputs. Any surrounding fixed-point accumulation, rounding and saturation belong to the caller. A pair in the 29-block mapping panel also accepts `--pick area` or `--pick delay` with `--flow standard` or `--flow resyn2` to export the corresponding measured minimum-gate graph.

The raw numbers are in `results/census.json`, `results/cp-census.json`, `results/fresh-cp-lower.json`, and `results/hardware-summary.json`. The per-flow, per-pair comparisons are in `results/hardware-pairs.json`; each mapped circuit has an ID, its arithmetic operations and its exhaustive equivalence result in `results/panel`. The initial FIR designs and the subsequent fixed-count helper-exchange experiment are separate in `results/fir-mapping` and `results/exchange`.

Run `python3 -B src/compare_cp.py --check` to verify the stored two-second CP comparison. For the archived public jMCM solver results, run `python3 -B src/compare_jmcm.py --check`. It checks the bundled jMCM solver-results CSV against its SHA-256 digest, matches the normalized target vectors, combines aliases, discards truncated outputs and conservatively takes the lowest reported adder count among the remaining methods. `results/jmcm-comparison.json` lists the exact comparison for each of the 79 matched vectors.

The full run exercises the command-line certifier on all 83 CP rows and checks the 59 pooled-label rewiring cases by expanding parents backwards from both target outputs. To repeat just these steps, use the binaries, inputs and outputs in the completed work directory. The scripts regenerate `results/cli-certificates.json` and `results/rewiring-independent.json` there.

```sh
(cd ../../mcm-dsp-rerun && python3 -B src/certify_bench.py --bin-dir build)
(cd ../../mcm-dsp-rerun && python3 -B src/rewire_reverse.py)
```

The width-incidence test rebuilds a bounded C++ solver, checks all 387 small controls against a forward Python implementation, tests the 13-bit exclusion and the 14-bit witness, and regenerates every bounded integer witness. See `results/width-census.json` and `proof/WidthInventory.lean`. The formal declarations cover the positive integer circuits. The 13-bit impossibility is a finite software result.

The mapping option also rebuilds the three matched controls, verifies the complete stored operations before reusing prior measurements, and compares the checked-in per-pair JSON to fresh results. `MATCHED_HARDWARE.md` records the design and `results/matched-hardware.json` contains aggregate area, delay and win/tie/loss counts. To rerun this stage, use `(cd ../../mcm-dsp-mapping && python3 -B src/matched_panel.py /path/to/yosys-abc /path/to/Nangate.lib)` after completing a full run with `--mapping` and `--work ../../mcm-dsp-mapping`. The mapping and byte-level comparisons were tested on Apple Silicon macOS. Area and delay refer to the products of one signed scalar input at a time.

Combining `--rtl` and `--mapping` also compiles both frozen matched-area winners per pair from signed Verilog via the Icarus BLIF frontend, runs ABC and compares all 32 output bits on both ports for all 65,536 inputs per design. This uses the first matching position in the 128-point table. It records the signed coefficients, gate IDs, emitted-Verilog hashes, area and delay in `results/rtl-transfer.json`. After a full run with both flags and `--work ../../mcm-dsp-mapping`, rerun this check with `(cd ../../mcm-dsp-mapping && python3 -B src/rtl_transfer.py IVERILOG ABC LIBERTY)`, adding `--base IVL_LIB` if your Icarus installation requires it.
