import Q15Upper
namespace Q15Bank08
open Q15Upper
def entries : List Entry := [
  ⟨[879, 32005], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨125,1,251,.output,.reverseMinus,1⟩,⟨32005,5,125,.second,.reverseMinus,8⟩,⟨879,251,125,.first,.plus,2⟩]⟩,
  ⟨[879, 32721], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨47,1,3,.second,.plus,4⟩,⟨32721,1,47,.first,.plus,15⟩,⟨879,127,47,.second,.reverseMinus,4⟩]⟩,
  ⟨[887, 923], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨7,1,1,.second,.plus,3⟩,⟨887,9,7,.second,.plus,7⟩,⟨923,9,887,.first,.reverseMinus,2⟩]⟩,
  ⟨[887, 29535], [⟨7,1,1,.second,.plus,3⟩,⟨895,1,7,.second,.plus,7⟩,⟨887,1,895,.first,.minus,3⟩,⟨29535,895,895,.second,.reverseMinus,5⟩]⟩,
  ⟨[891, 2019], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨2019,15,99,.first,.reverseMinus,7⟩,⟨891,99,99,.second,.reverseMinus,3⟩]⟩,
  ⟨[891, 16151], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨297,5,257,.first,.reverseMinus,3⟩,⟨16151,257,297,.first,.plus,6⟩,⟨891,297,297,.second,.plus,2⟩]⟩,
  ⟨[903, 4071], [⟨7,1,1,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨903,7,7,.second,.reverseMinus,7⟩,⟨4071,7,127,.second,.reverseMinus,5⟩]⟩,
  ⟨[903, 32569], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨509,1,3,.first,.plus,9⟩,⟨903,7,7,.second,.reverseMinus,7⟩,⟨32569,7,509,.second,.plus,6⟩]⟩,
  ⟨[905, 8189], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨7,1,1,.second,.plus,3⟩,⟨8189,1,3,.first,.plus,13⟩,⟨905,9,7,.second,.reverseMinus,7⟩]⟩,
  ⟨[905, 32755], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨7,1,1,.second,.plus,3⟩,⟨8191,1,1,.second,.plus,13⟩,⟨905,9,7,.second,.reverseMinus,7⟩,⟨32755,9,8191,.second,.plus,2⟩]⟩,
  ⟨[923, 14191], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨7,1,1,.second,.plus,3⟩,⟨887,9,7,.second,.plus,7⟩,⟨14191,1,887,.second,.plus,4⟩,⟨923,9,887,.first,.reverseMinus,2⟩]⟩,
  ⟨[925, 1757], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨989,3,31,.second,.plus,5⟩,⟨925,1,989,.first,.minus,6⟩,⟨1757,3,989,.first,.reverseMinus,8⟩]⟩,
  ⟨[925, 14055], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨925,3,29,.second,.plus,5⟩,⟨937,3,925,.first,.reverseMinus,2⟩,⟨14055,937,937,.second,.plus,4⟩]⟩,
  ⟨[927, 13919], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨929,1,29,.second,.reverseMinus,5⟩,⟨927,1,29,.second,.plus,5⟩,⟨13919,29,929,.first,.plus,9⟩]⟩,
  ⟨[929, 6891], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨929,1,29,.second,.reverseMinus,5⟩,⟨541,1,29,.first,.reverseMinus,9⟩,⟨6891,929,541,.first,.plus,3⟩]⟩,
  ⟨[929, 8179], [⟨3,1,1,.second,.plus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨8179,1,13,.first,.plus,13⟩,⟨929,513,13,.second,.reverseMinus,5⟩]⟩,
  ⟨[929, 13783], [⟨15,1,1,.second,.plus,4⟩,⟨31,1,1,.second,.plus,5⟩,⟨1969,15,31,.second,.plus,6⟩,⟨929,15,31,.first,.plus,6⟩,⟨13783,1969,1969,.second,.plus,3⟩]⟩,
  ⟨[929, 32715], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨4093,1,3,.first,.plus,12⟩,⟨929,1,29,.second,.reverseMinus,5⟩,⟨32715,29,4093,.second,.plus,3⟩]⟩,
  ⟨[931, 6823], [⟨7,1,1,.second,.plus,3⟩,⟨231,7,7,.second,.reverseMinus,5⟩,⟨103,1,231,.first,.minus,7⟩,⟨931,7,231,.second,.reverseMinus,2⟩,⟨6823,231,103,.second,.reverseMinus,6⟩]⟩,
  ⟨[931, 13645], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨133,1,5,.first,.reverseMinus,7⟩,⟨931,133,133,.second,.plus,3⟩,⟨911,5,931,.first,.minus,2⟩,⟨13645,931,911,.second,.plus,4⟩]⟩,
  ⟨[943, 3193], [⟨3,1,1,.second,.plus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨895,3,511,.first,.reverseMinus,7⟩,⟨943,3,895,.first,.reverseMinus,4⟩,⟨3193,511,895,.first,.plus,3⟩]⟩,
  ⟨[943, 12771], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨943,1,59,.second,.plus,4⟩,⟨99,5,59,.first,.reverseMinus,3⟩,⟨12771,99,99,.second,.reverseMinus,7⟩]⟩,
  ⟨[949, 3077], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1029,1,5,.first,.reverseMinus,10⟩,⟨3077,1,1029,.first,.reverseMinus,11⟩,⟨949,5,1029,.first,.minus,4⟩]⟩,
  ⟨[949, 12307], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨12307,3,19,.first,.reverseMinus,12⟩,⟨949,1025,19,.second,.minus,2⟩]⟩,
  ⟨[953, 16273], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨953,9,1025,.first,.minus,3⟩,⟨16273,1025,953,.second,.reverseMinus,4⟩]⟩,
  ⟨[953, 32545], [⟨7,1,1,.second,.plus,3⟩,⟨1017,1,7,.first,.plus,10⟩,⟨32545,1,1017,.second,.reverseMinus,5⟩,⟨953,1,1017,.first,.minus,6⟩]⟩,
  ⟨[955, 4089], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨191,1,3,.second,.plus,6⟩,⟨4089,1,7,.first,.plus,12⟩,⟨955,191,191,.second,.reverseMinus,2⟩]⟩,
  ⟨[955, 16377], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨191,1,3,.second,.plus,6⟩,⟨16377,1,7,.first,.plus,14⟩,⟨955,191,191,.second,.reverseMinus,2⟩]⟩,
  ⟨[955, 32713], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨4091,1,5,.first,.plus,12⟩,⟨955,5,15,.second,.plus,6⟩,⟨32713,15,4091,.second,.plus,3⟩]⟩,
  ⟨[955, 32755], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨191,1,3,.second,.plus,6⟩,⟨32755,3,2047,.second,.reverseMinus,4⟩,⟨955,191,191,.second,.reverseMinus,2⟩]⟩,
  ⟨[971, 7213], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨971,1023,13,.second,.minus,2⟩,⟨7213,1023,971,.first,.plus,3⟩]⟩,
  ⟨[971, 28851], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1027,1,3,.first,.reverseMinus,10⟩,⟨971,7,1027,.first,.minus,3⟩,⟨16563,1027,971,.second,.reverseMinus,4⟩,⟨28851,3,16563,.first,.reverseMinus,12⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank08
