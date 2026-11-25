# How wide should a shift-and-add multiplier search go?

This is an AI research experiment. I gave OpenAI Codex one instruction: find a useful problem and write a paper on it. After that I mostly stayed out of the way. Codex picked the problem, did the math and wrote the Lean proofs. Claude (Anthropic) reviewed the work as it went and caught several real mistakes. No human expert has checked any of this yet, so read it as a curiosity, not as a peer-reviewed result.

[中文说明](README.zh-CN.md)

## The problem

Hardware that multiplies a signal by a few fixed constants usually skips the multiplier. It builds the products from shifts and additions instead. Optimizers look for the circuit with the fewest additions. To keep that search finite, they cap how large the intermediate constants may get. The cap is usually the bit width of the largest target, sometimes one bit more.

Two questions follow. Does that cap ever throw away the best circuit? And if it does, how wide does the search really need to go?

## What came out of it

- **The cap can lose the optimum.** At the smallest width where two targets can lose a three-addition solution, one example is `385x` and `497x`. With every intermediate kept to 9 bits you need 4 additions. If you allow `513 = 2^9 + 1`, 3 are enough.
- **One spare bit is not always enough.** The 7-bit targets `43, 49, 65, 119` need a 9-bit intermediate to reach their optimum. One circuit uses `393`.
- **With one addition to spare, twice the width is enough, and that is close to tight.** Strip signs and powers of two from the targets, then count each odd value greater than one once. Call the largest bit length `w`. If one addition beyond that count is enough, searching up to `2w` bits suffices. A polynomial-time algorithm decides whether the budget can be met. You cannot get away with much less: for every `w ≥ 16` there are eight targets that need a `2w − 9`-bit intermediate at their nine-addition optimum.
- **With more spare additions there is still a finite bound.** For any fixed number of extra additions there is a bound linear in `w`. Its constant is astronomically large, so this part is theory only.
- **What about actual filters?** The capped solver finished 73 of the 83 public cases in our two-second runs. All 73 answers were already optimal. Across 12 filters, saving five adders in total changed the total mapped area by less than 1% in each of two synthesis flows, and timing usually got worse. So this is mostly a correctness result for people who build optimizers, not a hardware win.

## What is proved

Everything below is proved in Lean 4. There is no `sorry` and nothing beyond Lean's three standard axioms, and the proofs were rechecked by a second, independent kernel.

| Result | Lean theorem |
|---|---|
| `385, 497`: 3 additions unrestricted, 4 within 9 bits | [`MCM.r01_*`](lean/McmAudit.lean) |
| One spare addition: `2w` bits suffice, and the decision algorithm is correct and runs in polynomial time | [`R02Theorem.one_helper`](lean/R02Theorem.lean) |
| For every `w ≥ 16`: `2w − 9 ≤ W(w) ≤ 2w`, and some input needs exactly W(w) bits | [`MCMWidthEnvelope.sharp`](lean/Envelope.lean), `MCMWidthEnvelope.attained` |
| Fixed number of spare additions: a width bound independent of the number of targets | [`R06Width.fixed_surplus_width`](lean/R06Width.lean) |

Here `W(w)` is the smallest odd-coefficient width that works for every target set of exact width `w` feasible on the one-spare-addition budget. "Polynomial time" is measured in a step-counting model written in Lean, in which arithmetic is done bit by bit.

The two-target classification in the 8-page paper is only partly formalized. A separate Lean check covered its 1,861 case certificates, which are outside this collection. The step showing that every circuit falls into one of those cases is still a paper proof.

## What's in here

- `paper/` has two PDFs:
  - the [original 8-page paper](paper/paper.pdf), whose paragraph on proof status predates the Lean work above;
  - a [3-page note](paper/ONE_HELPER_NOTE.pdf) with the `2w − 9 ≤ W(w) ≤ 2w` result. Its commands and artifact links refer to the larger research archive.
- [`lean/`](lean/) is the Lean 4.19.0 project. To check it yourself, install [elan](https://github.com/leanprover/elan), then run `lake build` inside `lean/`. The build prints the axioms each main theorem depends on.

The three-page note describes the first stage of the experiment. The [DSP results](../dsp-coefficients/README.md) settle the two filters it left open out of 83 and give exact costs for the 851 FFT pairs for which it reported only lower bounds. Every one of those pairs needs six additions or subtractions.

## License

Original code, proofs and papers are GPL-3.0-only. Third-party data keep their own terms; see [THIRD_PARTY.md](THIRD_PARTY.md).

Found a mistake, or an earlier paper that already did this? Please open an issue.
