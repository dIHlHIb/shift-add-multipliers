# Sources

The Lean modules contain the proofs, their constructed examples and the finite tables used in the width proof. Their only external imports are `Std` and `Std.Tactic` from the Lean 4.19.0 toolchain.

The papers report selected numerical examples and results from published sources:

- Arm’s Q15 rotation coefficients come from CMSIS-DSP, revision `9f64ba31591e527c505951943b4b95b0eb2f834b` (Apache-2.0). [Coefficient table](https://github.com/ARM-software/CMSIS-DSP/blob/9f64ba31591e527c505951943b4b95b0eb2f834b/Source/CommonTables/arm_common_tables.c)
- The CP example and benchmark comparisons refer to Cantaloube et al. The upstream solver and benchmark repository is GPLv3. [CP paper](https://doi.org/10.4230/LIPIcs.CP.2026.11) · [Upstream repository](https://gitlab.inria.fr/emeraude/mcm-cp)
- The filter examples use the FIR tap rows in L. M. S. R. Lopes do Rosário’s thesis (Table B.1) and image filters from Kumm et al. (Table 5). The historical RAG-N figures refer to Al-Hasani’s thesis (Table 3.5). The papers report measurements on these examples. [FIR taps](https://scholar.tecnico.ulisboa.pt/api/records/PHZ7edXHGHVGsd-JwC_JYhGUSWnm_3TCIbrB/file/aa583a015f0f44c47317f9d3e29421df92042c79cfa5bf23371ac54ccc359d7f.pdf#page=108) · [Image filters](https://doi.org/10.1186/1687-6180-2013-111) · [RAG-N comparison](https://ir.canterbury.ac.nz/server/api/core/bitstreams/f5197943-efd5-40ed-aa85-5952cbc189b3/content#page=80)

The project's original material is distributed under [GPL-3.0-only](LICENSE).
