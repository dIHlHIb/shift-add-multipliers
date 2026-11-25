# An AI research experiment: shift-and-add multipliers

I wanted to see what current AI models do when you give them a research goal and mostly stay out of the way. OpenAI Codex picked the topic, did the math, and wrote the code, the papers and the Lean proofs. Claude (Anthropic) reviewed it as it went and caught several real mistakes. Nobody with expertise in the field has checked any of it. I'm not claiming the results are new or important; this repository is a record of what the models produced in about two days.

[中文说明](README.zh-CN.md)

The topic is hardware that multiplies a signal by fixed constants using only shifts and additions, and how few additions that takes.

There are two parts, done one after the other:

- [Width bounds](width-bounds/) asks how large an intermediate constant a circuit search needs to consider. For m target constants of at most w bits and a budget of m+1 additions or subtractions, 2w bits always suffice when a solution exists. For w ≥ 16, some inputs need at least 2w − 9 bits. Width here counts the bits in the odd part of a constant. Both bounds are proved in Lean.
- [DSP coefficients](dsp-coefficients/) gives the minimum count for all 2,044 distinct target sets in nine Arm CMSIS-DSP Q15 FFT tables and for 83 public filter benchmarks. Capping intermediate constants at the target width changes the answer for one Arm set and none of the filters. The folder includes Verilog for 29 blocks you can try yourself.

Each folder has its own README, papers and Lean project.

The original work uses GPL-3.0-only. The [theory sources](width-bounds/THIRD_PARTY.md) and [DSP sources](dsp-coefficients/THIRD_PARTY.md) list third-party material and its terms.
