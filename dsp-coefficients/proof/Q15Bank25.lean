import Q15Upper
namespace Q15Bank25
open Q15Upper
def entries : List Entry := [
  ⟨[3411, 32589], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨567,9,9,.second,.plus,6⟩,⟨1125,9,567,.second,.plus,1⟩,⟨3411,567,1125,.first,.plus,3⟩,⟨32589,1125,3411,.first,.plus,5⟩]⟩,
  ⟨[3423, 4499], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨3423,13,95,.first,.reverseMinus,8⟩,⟨403,13,13,.second,.plus,5⟩,⟨4499,1,403,.first,.reverseMinus,12⟩]⟩,
  ⟨[3423, 14885], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨3423,13,95,.first,.reverseMinus,8⟩,⟨2977,3,95,.first,.plus,10⟩,⟨14885,2977,2977,.second,.reverseMinus,2⟩]⟩,
  ⟨[3423, 17995], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨107,3,11,.first,.reverseMinus,5⟩,⟨3423,1,107,.second,.plus,5⟩,⟨3599,11,3423,.first,.reverseMinus,4⟩,⟨17995,3599,3599,.second,.reverseMinus,2⟩]⟩,
  ⟨[3423, 29771], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨3429,27,27,.second,.plus,7⟩,⟨3423,3,3429,.first,.minus,1⟩,⟨2997,27,3429,.first,.minus,4⟩,⟨29771,1,2997,.first,.plus,15⟩]⟩,
  ⟨[3447, 4425], [⟨3,1,1,.second,.plus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨489,3,513,.first,.minus,3⟩,⟨4425,513,489,.second,.reverseMinus,3⟩,⟨3447,489,4425,.first,.minus,1⟩]⟩,
  ⟨[3447, 17701], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1143,9,9,.second,.plus,7⟩,⟨571,1,1143,.output,.reverseMinus,1⟩,⟨3447,9,1143,.first,.reverseMinus,8⟩,⟨17701,571,571,.second,.plus,5⟩]⟩,
  ⟨[3457, 7427], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨29,1,3,.first,.plus,5⟩,⟨7427,3,29,.second,.reverseMinus,8⟩,⟨3457,255,29,.second,.plus,7⟩]⟩,
  ⟨[3457, 29707], [⟨3,1,1,.second,.plus,2⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨3713,3,4097,.first,.minus,7⟩,⟨3457,1,3713,.first,.minus,8⟩,⟨29707,3,3713,.second,.reverseMinus,3⟩]⟩,
  ⟨[3461, 4073], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨27,1,5,.first,.plus,5⟩,⟨3461,5,27,.second,.reverseMinus,7⟩,⟨4073,1025,27,.first,.plus,2⟩]⟩,
  ⟨[3461, 32585], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨183,1,23,.second,.plus,3⟩,⟨32585,1,183,.first,.plus,15⟩,⟨389,23,183,.second,.reverseMinus,1⟩,⟨3461,3,389,.first,.reverseMinus,10⟩]⟩,
  ⟨[3467, 16013], [⟨3,1,1,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨371,1,387,.first,.minus,4⟩,⟨16013,1,371,.first,.plus,14⟩,⟨3467,387,371,.first,.reverseMinus,3⟩]⟩,
  ⟨[3467, 32025], [⟨31,1,1,.second,.plus,5⟩,⟨495,1,31,.second,.plus,4⟩,⟨743,31,495,.first,.reverseMinus,3⟩,⟨32025,1,743,.first,.plus,15⟩,⟨3467,495,743,.second,.reverseMinus,2⟩]⟩,
  ⟨[3491, 7411], [⟨31,1,1,.second,.plus,5⟩,⟨35,1,31,.first,.reverseMinus,2⟩,⟨7971,31,35,.first,.reverseMinus,8⟩,⟨7411,35,7971,.first,.minus,4⟩,⟨3491,35,7971,.first,.minus,7⟩]⟩,
  ⟨[3491, 29643], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨109,3,13,.first,.reverseMinus,5⟩,⟨3491,3,109,.second,.reverseMinus,5⟩,⟨59299,109,3491,.first,.reverseMinus,9⟩,⟨29643,13,59299,.output,.reverseMinus,1⟩]⟩,
  ⟨[3497, 8531], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨133,19,19,.second,.plus,3⟩,⟨8531,19,133,.second,.reverseMinus,6⟩,⟨437,19,133,.first,.reverseMinus,4⟩,⟨3497,1,437,.second,.reverseMinus,3⟩]⟩,
  ⟨[3497, 17061], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨639,1,5,.second,.plus,7⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨3497,639,517,.second,.plus,3⟩,⟨17061,517,517,.second,.reverseMinus,5⟩]⟩,
  ⟨[3511, 8145], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨8145,1,47,.first,.plus,13⟩,⟨1457,47,47,.second,.plus,5⟩,⟨3511,8145,1457,.second,.plus,3⟩]⟩,
  ⟨[3511, 32579], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨55,1,9,.first,.plus,6⟩,⟨3511,9,55,.second,.plus,6⟩,⟨189,3,3,.second,.plus,6⟩,⟨32579,1,189,.first,.plus,15⟩]⟩,
  ⟨[3523, 4179], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨3715,3,29,.second,.reverseMinus,7⟩,⟨3523,3,3715,.first,.minus,6⟩,⟨4179,29,3715,.first,.reverseMinus,4⟩]⟩,
  ⟨[3523, 16717], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨3523,27,67,.first,.reverseMinus,7⟩,⟨1045,27,67,.second,.plus,4⟩,⟨16717,3,1045,.second,.plus,4⟩]⟩,
  ⟨[3525, 14789], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨705,1,11,.second,.reverseMinus,6⟩,⟨3525,705,705,.second,.reverseMinus,2⟩,⟨14789,11,3525,.first,.reverseMinus,10⟩]⟩,
  ⟨[3525, 29579], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨705,1,11,.second,.reverseMinus,6⟩,⟨3525,705,705,.second,.reverseMinus,2⟩,⟨14789,11,3525,.first,.reverseMinus,10⟩,⟨29579,1,14789,.second,.reverseMinus,1⟩]⟩,
  ⟨[3541, 15997], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨515,1,129,.second,.plus,2⟩,⟨507,1,515,.first,.minus,3⟩,⟨15997,129,515,.first,.plus,7⟩,⟨3541,515,507,.second,.plus,3⟩]⟩,
  ⟨[3541, 31993], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨775,3,7,.first,.reverseMinus,8⟩,⟨31993,1,775,.first,.plus,15⟩,⟨887,7,775,.first,.reverseMinus,4⟩,⟨3541,7,887,.second,.plus,2⟩]⟩,
  ⟨[3559, 14757], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨255,1,1,.second,.plus,8⟩,⟨521,1,9,.first,.reverseMinus,9⟩,⟨3559,255,521,.first,.plus,4⟩,⟨14757,521,3559,.second,.reverseMinus,2⟩]⟩,
  ⟨[3559, 29513], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨889,7,7,.second,.plus,7⟩,⟨3559,3,889,.second,.reverseMinus,2⟩,⟨29561,7,889,.first,.reverseMinus,12⟩,⟨29513,3,29561,.first,.minus,4⟩]⟩,
  ⟨[3561, 16287], [⟨511,1,1,.second,.plus,9⟩,⟨509,1,511,.first,.minus,1⟩,⟨16287,1,509,.second,.plus,5⟩,⟨3561,511,509,.second,.plus,3⟩]⟩,
  ⟨[3561, 32573], [⟨3,1,1,.second,.plus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨509,1,3,.first,.plus,9⟩,⟨32573,3,509,.second,.plus,6⟩,⟨3561,511,509,.second,.plus,3⟩]⟩,
  ⟨[3565, 15991], [⟨7,1,1,.second,.plus,3⟩,⟨111,1,7,.second,.plus,4⟩,⟨1783,7,111,.second,.reverseMinus,4⟩,⟨3565,1,1783,.second,.plus,1⟩,⟨15991,111,1783,.first,.reverseMinus,7⟩]⟩,
  ⟨[3565, 31983], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨785,3,17,.first,.reverseMinus,8⟩,⟨31983,1,785,.first,.plus,15⟩,⟨3567,17,785,.first,.plus,8⟩,⟨3565,1,3567,.first,.minus,1⟩]⟩,
  ⟨[3567, 4027], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨1007,1,17,.first,.plus,10⟩,⟨4027,1,1007,.second,.plus,2⟩,⟨3567,5,1007,.first,.reverseMinus,9⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank25
