import Q15Upper
namespace Q15Bank19
open Q15Upper
def entries : List Entry := [
  ⟨[2059, 32703], [⟨15,1,1,.second,.plus,4⟩,⟨511,1,1,.second,.plus,9⟩,⟨32703,1,511,.second,.plus,6⟩,⟨2059,15,511,.second,.reverseMinus,2⟩]⟩,
  ⟨[2095, 14079], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨47,1,3,.second,.plus,4⟩,⟨2095,1,47,.first,.reverseMinus,11⟩,⟨14079,2047,47,.second,.reverseMinus,8⟩]⟩,
  ⟨[2095, 28157], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨4093,1,3,.first,.plus,12⟩,⟨2095,1,47,.first,.reverseMinus,11⟩,⟨28157,47,4093,.first,.reverseMinus,9⟩]⟩,
  ⟨[2105, 32497], [⟨7,1,1,.second,.plus,3⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨32761,1,7,.first,.plus,15⟩,⟨2105,7,33,.second,.plus,6⟩,⟨32497,33,32761,.first,.minus,3⟩]⟩,
  ⟨[2109, 8175], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨67,1,17,.second,.plus,2⟩,⟨8175,1,17,.first,.plus,13⟩,⟨2109,17,67,.first,.plus,7⟩]⟩,
  ⟨[2109, 32701], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨67,1,17,.second,.plus,2⟩,⟨32701,1,67,.first,.plus,15⟩,⟨2109,17,67,.first,.plus,7⟩]⟩,
  ⟨[2155, 8121], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨507,1,5,.first,.plus,9⟩,⟨8113,1,507,.second,.reverseMinus,4⟩,⟨8121,1,8113,.first,.reverseMinus,3⟩,⟨2155,507,8113,.output,.plus,2⟩]⟩,
  ⟨[2155, 32483], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨285,3,9,.second,.plus,5⟩,⟨32483,1,285,.first,.plus,15⟩,⟨1131,9,285,.second,.plus,2⟩,⟨2155,1,1131,.first,.reverseMinus,10⟩]⟩,
  ⟨[2159, 4087], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨4087,1,9,.first,.plus,12⟩,⟨2159,17,17,.second,.plus,7⟩]⟩,
  ⟨[2159, 32697], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨32765,1,3,.first,.plus,15⟩,⟨2159,17,17,.second,.plus,7⟩,⟨32697,17,32765,.first,.minus,2⟩]⟩,
  ⟨[2173, 15797], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1087,1,17,.second,.plus,6⟩,⟨2173,1,1087,.second,.plus,1⟩,⟨7105,1,1087,.first,.plus,13⟩,⟨15797,2173,7105,.first,.reverseMinus,2⟩]⟩,
  ⟨[2173, 31595], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨2173,3,17,.second,.plus,7⟩,⟨4221,1,2173,.first,.reverseMinus,11⟩,⟨31595,2173,4221,.second,.plus,3⟩]⟩,
  ⟨[2185, 15791], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨247,1,9,.first,.plus,8⟩,⟨2185,9,17,.second,.reverseMinus,7⟩,⟨15791,17,247,.second,.plus,6⟩]⟩,
  ⟨[2185, 31581], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨271,1,17,.second,.plus,4⟩,⟨2185,17,271,.second,.reverseMinus,3⟩,⟨957,271,2185,.output,.reverseMinus,1⟩,⟨31581,957,957,.second,.reverseMinus,5⟩]⟩,
  ⟨[2197, 31567], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨2069,1,21,.first,.reverseMinus,11⟩,⟨2197,1,2069,.first,.reverseMinus,7⟩,⟨1973,3,2069,.first,.minus,5⟩,⟨31567,1,1973,.second,.plus,4⟩]⟩,
  ⟨[2205, 16235], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨315,5,5,.second,.plus,6⟩,⟨955,5,315,.first,.reverseMinus,7⟩,⟨2205,315,315,.second,.plus,3⟩,⟨16235,955,955,.second,.reverseMinus,4⟩]⟩,
  ⟨[2205, 32469], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨315,5,5,.second,.plus,6⟩,⟨32469,2049,315,.first,.plus,4⟩,⟨2205,315,315,.second,.plus,3⟩]⟩,
  ⟨[2209, 15777], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨2209,1,69,.second,.reverseMinus,5⟩,⟨53,1,69,.first,.minus,4⟩,⟨15777,2209,53,.second,.reverseMinus,8⟩]⟩,
  ⟨[2209, 31555], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨493,1,19,.first,.plus,9⟩,⟨31555,3,493,.second,.reverseMinus,6⟩,⟨1953,19,493,.second,.plus,2⟩,⟨2209,1,1953,.first,.reverseMinus,8⟩]⟩,
  ⟨[2211, 16347], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨37,1,9,.second,.reverseMinus,2⟩,⟨16347,1,37,.first,.plus,14⟩,⟨157,9,37,.second,.reverseMinus,2⟩,⟨2211,37,157,.first,.plus,6⟩]⟩,
  ⟨[2211, 32693], [⟨3,1,1,.second,.plus,2⟩,⟨4095,1,1,.second,.plus,12⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨32693,4095,67,.first,.plus,3⟩,⟨2211,67,67,.second,.reverseMinus,5⟩]⟩,
  ⟨[2221, 7885], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨139,1,11,.first,.reverseMinus,7⟩,⟨2221,3,139,.second,.plus,4⟩,⟨7853,11,2221,.first,.reverseMinus,9⟩,⟨7885,1,7853,.first,.reverseMinus,5⟩]⟩,
  ⟨[2221, 31541], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨139,3,17,.second,.reverseMinus,3⟩,⟨2221,3,139,.second,.plus,4⟩,⟨1227,17,139,.first,.reverseMinus,6⟩,⟨31541,1,1227,.first,.plus,15⟩]⟩,
  ⟨[2223, 13761], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨63,1,1,.second,.plus,6⟩,⟨2367,9,63,.first,.reverseMinus,8⟩,⟨2223,9,2367,.first,.minus,4⟩,⟨13761,63,2367,.first,.plus,8⟩]⟩,
  ⟨[2223, 27521], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨4095,1,1,.second,.plus,12⟩,⟨247,1,9,.first,.plus,8⟩,⟨27521,4095,247,.second,.plus,7⟩,⟨2223,247,247,.second,.reverseMinus,3⟩]⟩,
  ⟨[2239, 27439], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨2239,9,65,.first,.plus,8⟩,⟨8385,65,65,.second,.reverseMinus,7⟩,⟨27439,2239,8385,.first,.plus,4⟩]⟩,
  ⟨[2255, 4057], [⟨7,1,1,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨223,1,7,.second,.plus,5⟩,⟨4057,7,127,.second,.plus,5⟩,⟨2255,127,223,.first,.reverseMinus,4⟩]⟩,
  ⟨[2255, 32457], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨207,1,13,.second,.plus,4⟩,⟨2255,1,207,.first,.reverseMinus,11⟩,⟨311,13,207,.first,.reverseMinus,3⟩,⟨32457,1,311,.first,.plus,15⟩]⟩,
  ⟨[2261, 16345], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨133,1,5,.first,.reverseMinus,7⟩,⟨16345,1,39,.first,.plus,14⟩,⟨2261,133,133,.second,.reverseMinus,4⟩]⟩,
  ⟨[2261, 32689], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨79,1,5,.second,.plus,4⟩,⟨133,1,5,.first,.reverseMinus,7⟩,⟨32689,1,79,.first,.plus,15⟩,⟨2261,133,133,.second,.reverseMinus,4⟩]⟩,
  ⟨[2305, 16221], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨35,1,9,.second,.plus,2⟩,⟨2305,1,9,.second,.reverseMinus,8⟩,⟨16221,127,35,.first,.plus,7⟩]⟩,
  ⟨[2305, 32443], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨507,1,5,.first,.plus,9⟩,⟨2305,1,9,.second,.reverseMinus,8⟩,⟨32443,5,507,.second,.plus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank19
