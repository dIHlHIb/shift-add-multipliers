import Q15Upper
namespace Q15Bank06
open Q15Upper
def entries : List Entry := [
  ⟨[603, 32745], [⟨3,1,1,.second,.plus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨23,1,3,.second,.plus,3⟩,⟨32745,1,23,.first,.plus,15⟩,⟨603,511,23,.second,.reverseMinus,2⟩]⟩,
  ⟨[603, 32763], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨32763,1,5,.first,.plus,15⟩,⟨603,5,19,.second,.plus,5⟩]⟩,
  ⟨[615, 8169], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨41,1,23,.first,.plus,6⟩,⟨8169,1,23,.first,.plus,13⟩,⟨615,41,41,.second,.plus,4⟩]⟩,
  ⟨[615, 32675], [⟨3,1,1,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨93,3,3,.second,.plus,5⟩,⟨32675,1,93,.first,.plus,15⟩,⟨615,129,93,.second,.plus,3⟩]⟩,
  ⟨[653, 4083], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨4083,1,13,.first,.plus,12⟩,⟨653,5,13,.first,.reverseMinus,7⟩]⟩,
  ⟨[653, 16371], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨16371,1,13,.first,.plus,14⟩,⟨653,5,13,.first,.reverseMinus,7⟩]⟩,
  ⟨[653, 16381], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨131,1,129,.first,.reverseMinus,1⟩,⟨653,129,131,.second,.reverseMinus,2⟩,⟨16381,129,131,.first,.plus,7⟩]⟩,
  ⟨[653, 32663], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨32767,1,1,.second,.plus,15⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨653,5,13,.first,.reverseMinus,7⟩,⟨32663,32767,13,.second,.minus,3⟩]⟩,
  ⟨[653, 32741], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨32741,5,1023,.second,.reverseMinus,5⟩,⟨653,5,81,.second,.reverseMinus,3⟩]⟩,
  ⟨[653, 32761], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨765,3,3,.second,.plus,8⟩,⟨32761,1,7,.first,.plus,15⟩,⟨653,7,765,.first,.minus,4⟩]⟩,
  ⟨[657, 4043], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨145,1,17,.first,.reverseMinus,7⟩,⟨657,1,145,.first,.reverseMinus,9⟩,⟨597,17,145,.second,.reverseMinus,2⟩,⟨4043,145,597,.first,.plus,5⟩]⟩,
  ⟨[657, 32343], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨657,1,41,.second,.reverseMinus,4⟩,⟨425,3,41,.first,.reverseMinus,7⟩,⟨32343,1,425,.first,.plus,15⟩]⟩,
  ⟨[663, 2021], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨671,3,97,.first,.plus,8⟩,⟨663,1,671,.first,.minus,3⟩,⟨2021,671,663,.first,.plus,2⟩]⟩,
  ⟨[663, 32335], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨527,17,17,.second,.plus,5⟩,⟨497,1,527,.first,.plus,10⟩,⟨663,17,527,.first,.reverseMinus,3⟩,⟨32335,527,497,.second,.reverseMinus,6⟩]⟩,
  ⟨[683, 12207], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨763,3,5,.first,.plus,8⟩,⟨12207,1,763,.second,.plus,4⟩,⟨683,5,763,.first,.minus,4⟩]⟩,
  ⟨[683, 24415], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨763,3,5,.first,.plus,8⟩,⟨24415,1,763,.second,.plus,5⟩,⟨683,5,763,.first,.minus,4⟩]⟩,
  ⟨[687, 15435], [⟨15,1,1,.second,.plus,4⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨75,15,15,.second,.reverseMinus,2⟩,⟨15435,15,75,.first,.reverseMinus,10⟩,⟨687,513,75,.second,.plus,4⟩]⟩,
  ⟨[687, 30869], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨693,11,11,.second,.plus,6⟩,⟨687,3,693,.first,.minus,1⟩,⟨22677,693,687,.second,.reverseMinus,5⟩,⟨30869,1,22677,.first,.reverseMinus,13⟩]⟩,
  ⟨[703, 4081], [⟨7,1,1,.second,.plus,3⟩,⟨255,1,1,.second,.plus,8⟩,⟨4081,1,255,.second,.reverseMinus,4⟩,⟨703,7,255,.first,.reverseMinus,6⟩]⟩,
  ⟨[703, 4095], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨4095,1,1,.second,.plus,12⟩,⟨703,3,65,.first,.plus,8⟩]⟩,
  ⟨[703, 32647], [⟨7,1,1,.second,.plus,3⟩,⟨255,1,1,.second,.plus,8⟩,⟨32647,7,255,.second,.reverseMinus,7⟩,⟨703,7,255,.first,.reverseMinus,6⟩]⟩,
  ⟨[703, 32761], [⟨7,1,1,.second,.plus,3⟩,⟨255,1,1,.second,.plus,8⟩,⟨32761,1,7,.first,.plus,15⟩,⟨703,7,255,.first,.reverseMinus,6⟩]⟩,
  ⟨[725, 16125], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨45,5,5,.second,.reverseMinus,3⟩,⟨725,5,45,.second,.reverseMinus,4⟩,⟨125,5,45,.first,.reverseMinus,4⟩,⟨16125,125,125,.second,.reverseMinus,7⟩]⟩,
  ⟨[725, 32251], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨45,5,5,.second,.reverseMinus,3⟩,⟨32251,5,63,.second,.plus,9⟩,⟨725,5,45,.second,.reverseMinus,4⟩]⟩,
  ⟨[729, 1023], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨729,81,81,.second,.reverseMinus,3⟩]⟩,
  ⟨[729, 32735], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨381,3,3,.second,.plus,7⟩,⟨32735,1,33,.first,.plus,15⟩,⟨729,33,381,.second,.plus,1⟩]⟩,
  ⟨[747, 5603], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨373,3,11,.first,.plus,7⟩,⟨747,1,373,.second,.reverseMinus,1⟩,⟨5603,373,747,.second,.plus,3⟩]⟩,
  ⟨[747, 22413], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨747,3,21,.first,.plus,8⟩,⟨1491,3,747,.second,.plus,1⟩,⟨22413,747,1491,.first,.plus,5⟩]⟩,
  ⟨[753, 4095], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨4095,1,1,.second,.plus,12⟩,⟨753,3,15,.first,.plus,8⟩]⟩,
  ⟨[753, 16315], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨753,251,251,.second,.plus,2⟩,⟨16315,251,251,.second,.reverseMinus,6⟩]⟩,
  ⟨[753, 32629], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨501,1,251,.second,.plus,1⟩,⟨753,251,251,.second,.plus,2⟩,⟨32629,251,501,.first,.reverseMinus,7⟩]⟩,
  ⟨[753, 32759], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨32759,1,9,.first,.plus,15⟩,⟨753,3,15,.first,.plus,8⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank06
