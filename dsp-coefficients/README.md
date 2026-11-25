# How many additions do fixed DSP coefficients really need?

This is the second part of the experiment. The first part, in [`../width-bounds`](../width-bounds), asked a theoretical question. This part asks a practical one: for real coefficients that ship in real code, what is the smallest number of shift-and-add operations, and can we prove nothing smaller works?

[中文说明](README.zh-CN.md) · [5-page note (PDF)](paper/exact-shift-add-for-dsp.pdf)

## Arm's FFT tables

Arm's CMSIS-DSP library stores Q15 twiddle factors for FFT lengths 16 to 4096. Each position is a pair of constants that one input gets multiplied by. Across all nine tables there are 6,132 positions. After removing signs, powers of two and duplicates, they reduce to 2,044 distinct jobs.

Every one of those 2,044 now has a working circuit plus evidence that one fewer addition is impossible:

| Minimum additions | 0 | 1 | 2 | 3 | 4 | 5 | 6 |
|---|---:|---:|---:|---:|---:|---:|---:|
| Number of sets | 1 | 2 | 6 | 27 | 174 | 983 | 851 |

SPIRAL's Hcub generator still needs one extra addition on 59 of the 851 hardest sets. That holds even with 32 random seeds per set and unused gates removed.

The width question from part one turns out to be rare in practice. If you cap intermediate constants at the width of the targets, exactly one of the 2,044 sets gets worse, from 5 additions to 6. None of the 83 filter benchmarks below does.

## 83 filter benchmarks

These are the public instances used by a 2026 constraint-programming solver. All 83 now have matching upper and lower bounds. The last two to be settled are `VINOD03_26B`, which needs 18 additions, and `YEUNG04_40`, which needs 24. A public result table from the jMCM solver lists 20 and 28 for them. Eleven of the 83 values were already published in a 2023 SAT-MCM data deposit, so those are not new.

## Does it save chip area?

A little, sometimes. We picked all 29 six-addition pairs from the 128-point table in advance and synthesized them with the Nangate45 library. The baseline was the best of 32 Hcub seeds, with both sides getting the same wiring rules and the same number of candidates. Total area came out 4.4% and 4.3% smaller in two synthesis flows. Median delay was about 1% worse. In 26 of the 29 blocks both sides used the same number of additions, and those blocks account for most of the saving. The experiment changes the intermediate constants and the wiring together, so it cannot say how much each contributes. These are pre-layout estimates for these blocks only, not a whole FFT.

## What is proved, and how

- **Checked in Lean 4:**
  - every upper-bound circuit;
  - the general lemma that the finite modular search used for lower bounds cannot miss an integer circuit, whatever the intermediate widths;
  - a pruning rule used in the filter search.
- Two C++ searches independently rule out five additions for all 851 six-addition FFT sets. Two searches also establish the lower bounds for VINOD03_26B and YEUNG04_40. The other entries use counting arguments, closure checks or smaller modular searches, as detailed in the ledgers.
- A third implementation checked 25 FFT cases, including one deliberately chosen edge case. It checked neither filter lower bound. The integer circuits for both filters were independently replayed.

[EVIDENCE.md](EVIDENCE.md) has the details.

## Using it

```sh
python3 twiddle.py 32 11 --verilog      # exact products for one Arm table position, as Verilog
python3 certify.py --cp VINOD03_26B --period 23
./reproduce --quick                     # recheck the stored circuits
```

Ready-made Verilog for the 29 benchmarked blocks is in [`rtl/`](rtl/). The Lean project is in [`proof/`](proof/). Run `lake build` there with Lean 4.19.0.

OpenAI Codex chose the methods, wrote the code and drafted the note. Nobody with expertise in the field has reviewed it.

The quick check and Lean build run offline with the tools installed. The optional [filter source check](REPRODUCE.md) downloads two pinned tables. To use local copies, put `cp-benchmarks.csv` and `jmcm-benchmarks.csv` together and run `python3 -B src/benchmark_sources.py --from-dir DIR`.
