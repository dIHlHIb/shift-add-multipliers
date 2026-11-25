import Q15Upper
namespace Q15Bank29
open Q15Upper
def entries : List Entry := [
  ⟨[4041, 5355], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨1347,3,21,.second,.reverseMinus,6⟩,⟨5355,21,21,.second,.plus,8⟩,⟨4041,1347,1347,.second,.plus,2⟩]⟩,
  ⟨[4043, 5255], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨41,3,7,.first,.plus,4⟩,⟨5255,7,41,.second,.reverseMinus,7⟩,⟨53,3,7,.second,.plus,3⟩,⟨4043,1,53,.first,.plus,12⟩]⟩,
  ⟨[4045, 5155], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨35,5,5,.second,.plus,3⟩,⟨5155,5,35,.first,.reverseMinus,10⟩,⟨4045,255,35,.first,.plus,4⟩]⟩,
  ⟨[4047, 5057], [⟨7,1,1,.second,.plus,3⟩,⟨505,1,7,.first,.plus,9⟩,⟨4047,7,505,.second,.reverseMinus,3⟩,⟨5057,505,4047,.first,.reverseMinus,1⟩]⟩,
  ⟨[4049, 14243], [⟨3,1,1,.second,.plus,2⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨6145,1,3,.second,.reverseMinus,11⟩,⟨4049,3,4097,.first,.minus,4⟩,⟨14243,6145,4049,.second,.reverseMinus,1⟩]⟩,
  ⟨[4049, 28487], [⟨3,1,1,.second,.plus,2⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨12291,3,3,.second,.reverseMinus,12⟩,⟨4049,3,4097,.first,.minus,4⟩,⟨28487,12291,4049,.second,.reverseMinus,2⟩]⟩,
  ⟨[4057, 4509], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨4037,1,59,.first,.plus,12⟩,⟨4057,5,4037,.first,.reverseMinus,2⟩,⟨4509,59,4037,.first,.reverseMinus,3⟩]⟩,
  ⟨[4061, 8129], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨8129,1,127,.second,.reverseMinus,6⟩,⟨4061,3,127,.second,.plus,5⟩]⟩,
  ⟨[4061, 32515], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨4061,3,127,.second,.plus,5⟩,⟨32515,3,127,.second,.reverseMinus,8⟩]⟩,
  ⟨[4103, 7931], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨2047,1,1,.second,.plus,11⟩,⟨7931,257,2047,.second,.plus,2⟩,⟨4103,257,2047,.first,.reverseMinus,3⟩]⟩,
  ⟨[4103, 31723], [⟨7,1,1,.second,.plus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨4103,1,7,.first,.reverseMinus,12⟩,⟨21,7,7,.second,.plus,2⟩,⟨31723,31,21,.first,.plus,10⟩]⟩,
  ⟨[4111, 16255], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨16255,1,129,.first,.plus,14⟩,⟨4111,17,129,.second,.plus,5⟩]⟩,
  ⟨[4111, 32509], [⟨63,1,1,.second,.plus,6⟩,⟨253,1,63,.second,.reverseMinus,2⟩,⟨4111,63,253,.second,.reverseMinus,4⟩,⟨32509,63,253,.first,.reverseMinus,9⟩]⟩,
  ⟨[4125, 14155], [⟨15,1,1,.second,.plus,4⟩,⟨2063,1,15,.first,.reverseMinus,11⟩,⟨4125,1,2063,.second,.plus,1⟩,⟨3023,15,2063,.first,.reverseMinus,6⟩,⟨14155,2063,3023,.second,.reverseMinus,2⟩]⟩,
  ⟨[4125, 28311], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨4125,3,129,.second,.plus,5⟩,⟨33129,129,4125,.second,.reverseMinus,3⟩,⟨28311,15,33129,.first,.plus,12⟩]⟩,
  ⟨[4127, 31711], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨31,1,1,.second,.plus,5⟩,⟨4127,1,31,.first,.reverseMinus,12⟩,⟨31711,33,31,.second,.plus,10⟩]⟩,
  ⟨[4151, 15849], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨55,1,9,.first,.plus,6⟩,⟨1761,1,55,.second,.reverseMinus,5⟩,⟨4151,1,55,.first,.reverseMinus,12⟩,⟨15849,1761,1761,.second,.reverseMinus,3⟩]⟩,
  ⟨[4151, 31699], [⟨63,1,1,.second,.plus,6⟩,⟨503,1,63,.second,.plus,3⟩,⟨32705,1,63,.first,.plus,15⟩,⟨4151,503,32705,.output,.plus,3⟩,⟨31699,503,32705,.first,.minus,1⟩]⟩,
  ⟨[4161, 16251], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨4095,1,1,.second,.plus,12⟩,⟨16251,129,4095,.second,.plus,2⟩,⟨4161,129,4095,.first,.plus,6⟩]⟩,
  ⟨[4161, 32503], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨32763,1,5,.first,.plus,15⟩,⟨4161,1,65,.second,.reverseMinus,6⟩,⟨32503,65,32763,.first,.minus,2⟩]⟩,
  ⟨[4179, 28183], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨3715,3,29,.second,.reverseMinus,7⟩,⟨4179,29,3715,.first,.reverseMinus,4⟩,⟨3523,3,3715,.first,.minus,6⟩,⟨28183,1,3523,.second,.plus,3⟩]⟩,
  ⟨[4211, 32497], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨545,1,17,.second,.reverseMinus,5⟩,⟨2031,1,17,.first,.plus,11⟩,⟨32497,1,2031,.second,.reverseMinus,4⟩,⟨4211,545,2031,.first,.reverseMinus,2⟩]⟩,
  ⟨[4233, 14027], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨55,3,67,.first,.minus,2⟩,⟨4233,67,55,.first,.plus,6⟩,⟨14025,55,55,.second,.plus,8⟩,⟨14027,1,14025,.first,.reverseMinus,1⟩]⟩,
  ⟨[4233, 28055], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨119,17,17,.second,.plus,3⟩,⟨905,1,119,.first,.plus,10⟩,⟨4233,17,119,.first,.plus,8⟩,⟨28055,905,905,.second,.plus,5⟩]⟩,
  ⟨[4249, 31647], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨137,1,17,.second,.reverseMinus,3⟩,⟨4521,137,137,.second,.reverseMinus,5⟩,⟨4249,17,4521,.first,.minus,4⟩,⟨31647,4521,4521,.second,.plus,3⟩]⟩,
  ⟨[4261, 16245], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨159,1,5,.second,.plus,5⟩,⟨4101,1,5,.first,.reverseMinus,12⟩,⟨4261,5,4101,.first,.reverseMinus,5⟩,⟨16245,159,4101,.second,.plus,2⟩]⟩,
  ⟨[4261, 32489], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨319,1,5,.second,.plus,6⟩,⟨4101,1,5,.first,.reverseMinus,12⟩,⟨4261,5,4101,.first,.reverseMinus,5⟩,⟨32489,319,4101,.second,.plus,3⟩]⟩,
  ⟨[4273, 15817], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨4017,1,251,.second,.reverseMinus,4⟩,⟨4273,1,4017,.first,.reverseMinus,8⟩,⟨15817,251,4017,.second,.plus,2⟩]⟩,
  ⟨[4273, 31635], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨49,1,33,.first,.reverseMinus,4⟩,⟨4273,33,49,.first,.reverseMinus,7⟩,⟨10545,49,4273,.first,.reverseMinus,7⟩,⟨31635,10545,10545,.second,.plus,2⟩]⟩,
  ⟨[4297, 7905], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨2313,9,9,.second,.reverseMinus,8⟩,⟨7905,31,31,.second,.plus,8⟩,⟨4297,31,2313,.first,.reverseMinus,6⟩]⟩,
  ⟨[4297, 31621], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨2147,3,67,.second,.reverseMinus,5⟩,⟨4297,3,2147,.second,.reverseMinus,1⟩,⟨2683,67,2147,.first,.reverseMinus,3⟩,⟨31621,67,2683,.first,.plus,9⟩]⟩,
  ⟨[4311, 8121], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨135,9,9,.second,.plus,4⟩,⟨4311,9,135,.second,.plus,5⟩,⟨8121,129,135,.first,.plus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank29
