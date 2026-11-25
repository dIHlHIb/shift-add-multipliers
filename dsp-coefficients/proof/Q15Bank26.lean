import Q15Upper
namespace Q15Bank26
open Q15Upper
def entries : List Entry := [
  ⟨[3567, 16107], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨1007,1,17,.first,.plus,10⟩,⟨16107,5,1007,.second,.plus,4⟩,⟨3567,5,1007,.first,.reverseMinus,9⟩]⟩,
  ⟨[3593, 3681], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨3585,1,7,.second,.reverseMinus,9⟩,⟨3593,1,3585,.first,.reverseMinus,3⟩,⟨3681,3,3585,.first,.reverseMinus,5⟩]⟩,
  ⟨[3593, 29447], [⟨7,1,1,.second,.plus,3⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨3577,7,7,.second,.plus,9⟩,⟨3593,1,3577,.first,.reverseMinus,4⟩,⟨29447,129,3577,.first,.plus,8⟩]⟩,
  ⟨[3611, 4071], [⟨3,1,1,.second,.plus,2⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨509,1,3,.first,.plus,9⟩,⟨4071,1,509,.second,.plus,3⟩,⟨3611,515,509,.first,.plus,3⟩]⟩,
  ⟨[3611, 32569], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨517,1,129,.second,.reverseMinus,2⟩,⟨16543,1,517,.second,.plus,5⟩,⟨3611,129,517,.first,.plus,5⟩,⟨32569,517,16543,.second,.plus,1⟩]⟩,
  ⟨[3627, 14691], [⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨3655,7,71,.first,.reverseMinus,9⟩,⟨3627,7,3655,.first,.minus,2⟩,⟨14691,71,3655,.second,.reverseMinus,2⟩]⟩,
  ⟨[3627, 15225], [⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨889,7,7,.second,.plus,7⟩,⟨15225,7,889,.first,.reverseMinus,11⟩,⟨3627,71,889,.second,.reverseMinus,2⟩]⟩,
  ⟨[3627, 29381], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨403,13,13,.second,.plus,5⟩,⟨3627,403,403,.second,.reverseMinus,3⟩,⟨28613,403,3627,.second,.plus,3⟩,⟨29381,3,28613,.first,.reverseMinus,8⟩]⟩,
  ⟨[3639, 15975], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨55,1,7,.second,.plus,3⟩,⟨3639,7,55,.first,.reverseMinus,9⟩,⟨3687,3,3639,.first,.reverseMinus,4⟩,⟨15975,3,3687,.first,.reverseMinus,12⟩]⟩,
  ⟨[3639, 31949], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨125,1,3,.first,.plus,7⟩,⟨31949,51,125,.second,.plus,8⟩,⟨375,125,125,.second,.plus,2⟩,⟨3639,51,375,.first,.reverseMinus,6⟩]⟩,
  ⟨[3653, 7411], [⟨15,1,1,.second,.plus,4⟩,⟨127,1,1,.second,.plus,7⟩,⟨3713,15,127,.first,.plus,8⟩,⟨7411,15,3713,.second,.plus,1⟩,⟨3653,15,3713,.first,.minus,2⟩]⟩,
  ⟨[3653, 14823], [⟨15,1,1,.second,.plus,4⟩,⟨29,1,15,.second,.plus,1⟩,⟨3713,1,29,.second,.reverseMinus,7⟩,⟨3653,15,3713,.first,.minus,2⟩,⟨14823,29,3713,.second,.plus,2⟩]⟩,
  ⟨[3661, 16281], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨509,1,3,.first,.plus,9⟩,⟨16281,7,509,.second,.plus,5⟩,⟨523,7,509,.first,.reverseMinus,1⟩,⟨3661,523,523,.second,.plus,3⟩]⟩,
  ⟨[3661, 32563], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨205,3,13,.second,.plus,4⟩,⟨32563,1,205,.first,.plus,15⟩,⟨3533,13,205,.first,.reverseMinus,8⟩,⟨3661,1,3533,.first,.reverseMinus,7⟩]⟩,
  ⟨[3663, 15969], [⟨15,1,1,.second,.plus,4⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨497,1,15,.first,.plus,9⟩,⟨15969,65,497,.second,.reverseMinus,5⟩,⟨3663,65,497,.first,.plus,6⟩]⟩,
  ⟨[3663, 31939], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨499,1,13,.first,.plus,9⟩,⟨31939,3,499,.second,.reverseMinus,6⟩,⟨915,13,499,.first,.reverseMinus,5⟩,⟨3663,3,915,.second,.reverseMinus,2⟩]⟩,
  ⟨[3667, 7299], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨57,19,19,.second,.plus,2⟩,⟨7299,3,57,.second,.reverseMinus,7⟩,⟨3667,19,57,.second,.reverseMinus,6⟩]⟩,
  ⟨[3667, 14599], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨57,1,7,.second,.reverseMinus,3⟩,⟨14599,7,57,.second,.reverseMinus,8⟩,⟨3651,3,57,.second,.reverseMinus,6⟩,⟨3667,1,3651,.first,.reverseMinus,4⟩]⟩,
  ⟨[3681, 14373], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨63,1,1,.second,.plus,6⟩,⟨351,9,63,.first,.reverseMinus,5⟩,⟨3681,63,351,.first,.plus,6⟩,⟨14373,351,3681,.second,.plus,2⟩]⟩,
  ⟨[3683, 14635], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨29,1,3,.first,.plus,5⟩,⟨3683,29,29,.second,.plus,7⟩,⟨14635,97,3683,.second,.plus,2⟩]⟩,
  ⟨[3683, 29269], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨3683,29,29,.second,.plus,7⟩,⟨29269,195,3683,.second,.plus,3⟩]⟩,
  ⟨[3711, 16279], [⟨7,1,1,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨23,1,7,.first,.reverseMinus,4⟩,⟨3711,7,127,.first,.reverseMinus,9⟩,⟨16279,127,23,.first,.reverseMinus,7⟩]⟩,
  ⟨[3711, 32557], [⟨15,1,1,.second,.plus,4⟩,⟨29,1,15,.second,.plus,1⟩,⟨2033,1,15,.first,.plus,11⟩,⟨3711,1,29,.second,.plus,7⟩,⟨32557,29,2033,.second,.reverseMinus,4⟩]⟩,
  ⟨[3717, 14601], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨471,1,59,.second,.plus,3⟩,⟨3717,59,59,.second,.plus,6⟩,⟨14601,471,471,.second,.plus,5⟩]⟩,
  ⟨[3717, 29201], [⟨63,1,1,.second,.plus,6⟩,⟨1007,1,63,.second,.plus,4⟩,⟨59,1,63,.first,.minus,2⟩,⟨29201,1007,59,.second,.plus,9⟩,⟨3717,59,59,.second,.plus,6⟩]⟩,
  ⟨[3737, 13417], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨1677,13,13,.second,.reverseMinus,7⟩,⟨13417,1,1677,.second,.reverseMinus,3⟩,⟨1689,3,1677,.first,.reverseMinus,2⟩,⟨3737,1,1689,.first,.reverseMinus,11⟩]⟩,
  ⟨[3737, 31905], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨287,1,9,.second,.plus,5⟩,⟨503,1,9,.first,.plus,9⟩,⟨3737,287,503,.second,.plus,3⟩,⟨31905,287,503,.second,.plus,6⟩]⟩,
  ⟨[3739, 7289], [⟨7,1,1,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨903,7,7,.second,.reverseMinus,7⟩,⟨7289,1,903,.first,.plus,13⟩,⟨3739,127,903,.second,.reverseMinus,2⟩]⟩,
  ⟨[3739, 29155], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨29,1,3,.first,.plus,5⟩,⟨3739,27,29,.second,.reverseMinus,7⟩,⟨29667,29,29,.second,.plus,10⟩,⟨29155,1,29667,.first,.minus,9⟩]⟩,
  ⟨[3761, 4069], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨4069,1,27,.first,.plus,12⟩,⟨3453,3,27,.second,.plus,7⟩,⟨3761,4069,3453,.output,.plus,1⟩]⟩,
  ⟨[3761, 7973], [⟨15,1,1,.second,.plus,4⟩,⟨59,1,15,.second,.plus,2⟩,⟨251,15,59,.second,.reverseMinus,2⟩,⟨3761,15,59,.second,.plus,6⟩,⟨7973,59,251,.second,.plus,5⟩]⟩,
  ⟨[3761, 31893], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨235,1,251,.first,.minus,4⟩,⟨3761,1,235,.second,.reverseMinus,4⟩,⟨31893,251,235,.first,.plus,7⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank26
