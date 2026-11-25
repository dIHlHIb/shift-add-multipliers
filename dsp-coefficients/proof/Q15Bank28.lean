import Q15Upper
namespace Q15Bank28
open Q15Upper
def entries : List Entry := [
  ⟨[3911, 16267], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨495,1,17,.first,.plus,9⟩,⟨3943,17,495,.second,.plus,3⟩,⟨3911,1,3943,.first,.minus,5⟩,⟨16267,495,3943,.second,.reverseMinus,2⟩]⟩,
  ⟨[3911, 32533], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨235,1,21,.first,.plus,8⟩,⟨32533,1,235,.first,.plus,15⟩,⟨3995,235,235,.second,.reverseMinus,4⟩,⟨3911,21,3995,.first,.minus,2⟩]⟩,
  ⟨[3917, 7195], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨4093,1,3,.first,.plus,12⟩,⟨3917,11,4093,.first,.minus,4⟩,⟨7171,11,4093,.first,.plus,10⟩,⟨7195,3,7171,.first,.reverseMinus,3⟩]⟩,
  ⟨[3917, 28779], [⟨3,1,1,.second,.plus,2⟩,⟨4093,1,3,.first,.plus,12⟩,⟨4109,1,4093,.first,.reverseMinus,4⟩,⟨3917,3,4109,.first,.minus,6⟩,⟨28779,4093,4109,.second,.plus,3⟩]⟩,
  ⟨[3925, 9367], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨171,19,19,.second,.reverseMinus,3⟩,⟨3925,1,171,.first,.plus,12⟩,⟨7831,19,3925,.second,.plus,1⟩,⟨9367,3,7831,.first,.reverseMinus,9⟩]⟩,
  ⟨[3939, 7183], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨2033,1,127,.second,.reverseMinus,4⟩,⟨7183,9,2033,.first,.plus,10⟩,⟨3939,127,2033,.second,.plus,1⟩]⟩,
  ⟨[3939, 28731], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨59,3,7,.second,.reverseMinus,3⟩,⟨28731,7,59,.first,.reverseMinus,12⟩,⟨1891,3,59,.second,.reverseMinus,5⟩,⟨3939,1,1891,.first,.reverseMinus,11⟩]⟩,
  ⟨[3951, 4321], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨31,1,1,.second,.plus,5⟩,⟨3951,17,31,.second,.plus,7⟩,⟨4321,17,31,.first,.plus,8⟩]⟩,
  ⟨[3951, 8643], [⟨3,1,1,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨2193,129,129,.second,.reverseMinus,4⟩,⟨3951,3,2193,.first,.plus,11⟩,⟨8643,129,2193,.second,.plus,2⟩]⟩,
  ⟨[3957, 15899], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨3967,1,31,.second,.plus,7⟩,⟨3957,5,3967,.first,.minus,1⟩,⟨15899,31,3967,.second,.reverseMinus,2⟩]⟩,
  ⟨[3957, 31799], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨143,1,9,.second,.plus,4⟩,⟨3957,1025,143,.first,.plus,2⟩,⟨31799,143,3957,.second,.reverseMinus,3⟩]⟩,
  ⟨[3961, 14341], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨14341,5,7,.second,.reverseMinus,11⟩,⟨3961,7,31,.second,.plus,7⟩]⟩,
  ⟨[3961, 28683], [⟨7,1,1,.second,.plus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨7169,1,7,.second,.reverseMinus,10⟩,⟨3961,7,31,.second,.plus,7⟩,⟨28683,7,7169,.second,.reverseMinus,2⟩]⟩,
  ⟨[3961, 32527], [⟨7,1,1,.second,.plus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨4065,1,31,.first,.plus,12⟩,⟨3961,7,31,.second,.plus,7⟩,⟨32527,7,4065,.second,.reverseMinus,3⟩]⟩,
  ⟨[3967, 8157], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨4095,1,1,.second,.plus,12⟩,⟨3967,1,4095,.first,.minus,7⟩,⟨8157,33,4095,.second,.plus,1⟩]⟩,
  ⟨[3981, 15893], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨3981,31,13,.first,.reverseMinus,7⟩,⟨15893,31,3981,.second,.plus,2⟩]⟩,
  ⟨[3981, 31785], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨3981,63,51,.first,.plus,6⟩,⟨31785,63,3981,.second,.plus,3⟩]⟩,
  ⟨[3983, 14317], [⟨15,1,1,.second,.plus,4⟩,⟨4095,1,1,.second,.plus,12⟩,⟨2063,1,15,.first,.reverseMinus,11⟩,⟨3983,15,2063,.first,.reverseMinus,7⟩,⟨14317,4095,2063,.first,.plus,2⟩]⟩,
  ⟨[3983, 28635], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨4099,1,3,.first,.reverseMinus,12⟩,⟨3983,29,4099,.first,.minus,2⟩,⟨28693,4099,4099,.second,.plus,3⟩,⟨28635,29,28693,.first,.minus,1⟩]⟩,
  ⟨[3991, 7375], [⟨31,1,1,.second,.plus,5⟩,⟨497,1,31,.second,.reverseMinus,4⟩,⟨561,1,497,.first,.reverseMinus,6⟩,⟨7375,31,561,.first,.plus,8⟩,⟨3991,497,561,.second,.plus,3⟩]⟩,
  ⟨[3995, 7229], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨4093,1,3,.first,.plus,12⟩,⟨3995,49,4093,.first,.minus,1⟩,⟨7229,49,4093,.first,.reverseMinus,6⟩]⟩,
  ⟨[4005, 14293], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨91,3,5,.first,.plus,5⟩,⟨4005,1,91,.first,.plus,12⟩,⟨2005,5,4005,.output,.plus,1⟩,⟨14293,3,2005,.first,.reverseMinus,12⟩]⟩,
  ⟨[4005, 15887], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨4003,3,125,.second,.reverseMinus,5⟩,⟨4005,1,4003,.first,.reverseMinus,1⟩,⟨15887,125,4003,.second,.plus,2⟩]⟩,
  ⟨[4005, 28585], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨4095,1,1,.second,.plus,12⟩,⟨4085,5,4095,.first,.minus,1⟩,⟨4005,5,4085,.first,.minus,4⟩,⟨28585,4095,4085,.second,.plus,3⟩]⟩,
  ⟨[4005, 31773], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨267,3,33,.second,.reverseMinus,3⟩,⟨4005,267,267,.second,.plus,4⟩,⟨31773,267,4005,.second,.plus,3⟩]⟩,
  ⟨[4011, 6639], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨4079,1,17,.first,.plus,12⟩,⟨6639,5,4079,.first,.reverseMinus,9⟩,⟨4011,17,4079,.first,.minus,2⟩]⟩,
  ⟨[4011, 16261], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨251,1,5,.first,.plus,8⟩,⟨4011,5,251,.second,.plus,4⟩,⟨16261,129,251,.first,.plus,7⟩]⟩,
  ⟨[4011, 32521], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨8193,1,1,.second,.reverseMinus,13⟩,⟨251,1,5,.first,.plus,8⟩,⟨4011,5,251,.second,.plus,4⟩,⟨32521,8193,251,.first,.plus,2⟩]⟩,
  ⟨[4021, 6245], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨1797,1,251,.first,.plus,11⟩,⟨4021,5,251,.second,.reverseMinus,4⟩,⟨6245,1797,4021,.second,.plus,1⟩]⟩,
  ⟨[4027, 28535], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨20481,1,5,.second,.reverseMinus,12⟩,⟨4027,5,63,.second,.plus,6⟩,⟨28535,20481,4027,.second,.reverseMinus,1⟩]⟩,
  ⟨[4029, 5899], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1151,1,9,.second,.plus,7⟩,⟨1295,9,1151,.first,.reverseMinus,4⟩,⟨4029,1151,1295,.second,.plus,2⟩,⟨5899,1151,1295,.first,.reverseMinus,2⟩]⟩,
  ⟨[4039, 5453], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨577,1,9,.second,.reverseMinus,6⟩,⟨2625,1,577,.first,.reverseMinus,11⟩,⟨4039,577,577,.second,.plus,3⟩,⟨5453,2625,4039,.second,.plus,1⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank28
