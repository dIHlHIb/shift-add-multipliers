import Q15Upper
namespace Q15Bank38
open Q15Upper
def entries : List Entry := [
  ⟨[6737, 32067], [⟨63,1,1,.second,.plus,6⟩,⟨79,1,63,.first,.reverseMinus,4⟩,⟨8001,63,63,.second,.plus,7⟩,⟨32067,63,8001,.second,.reverseMinus,2⟩,⟨6737,79,8001,.first,.minus,4⟩]⟩,
  ⟨[6741, 18621], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨189,3,3,.second,.plus,6⟩,⟨18621,9,189,.first,.reverseMinus,11⟩,⟨963,9,189,.first,.plus,7⟩,⟨6741,963,963,.second,.plus,3⟩]⟩,
  ⟨[6755, 9269], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨611,3,19,.second,.reverseMinus,5⟩,⟨6755,3,611,.first,.reverseMinus,11⟩,⟨459,19,611,.first,.minus,3⟩,⟨9269,19,459,.first,.plus,9⟩]⟩,
  ⟨[6755, 18537], [⟨3,1,1,.second,.plus,2⟩,⟨6147,3,3,.second,.reverseMinus,11⟩,⟨6243,3,6147,.first,.reverseMinus,5⟩,⟨6755,1,6243,.first,.reverseMinus,9⟩,⟨18537,6147,6243,.first,.reverseMinus,1⟩]⟩,
  ⟨[6769, 9227], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨4609,1,9,.second,.reverseMinus,9⟩,⟨135,9,9,.second,.plus,4⟩,⟨9227,9,4609,.second,.reverseMinus,1⟩,⟨6769,4609,135,.second,.reverseMinus,4⟩]⟩,
  ⟨[6769, 18455], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨577,1,9,.second,.reverseMinus,6⟩,⟨18455,9,577,.second,.plus,5⟩,⟨625,3,577,.first,.reverseMinus,4⟩,⟨6769,3,625,.first,.reverseMinus,11⟩]⟩,
  ⟨[6777, 14917], [⟨3,1,1,.second,.plus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨3713,1,383,.first,.plus,12⟩,⟨6777,383,3713,.first,.reverseMinus,3⟩,⟨3729,1,3713,.first,.reverseMinus,4⟩,⟨14917,1,3729,.second,.reverseMinus,2⟩]⟩,
  ⟨[6777, 29833], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨383,1,129,.first,.plus,9⟩,⟨3713,1,383,.first,.plus,12⟩,⟨29833,129,3713,.second,.reverseMinus,3⟩,⟨6777,383,3713,.first,.reverseMinus,3⟩]⟩,
  ⟨[6787, 16029], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨53,3,7,.second,.plus,3⟩,⟨6787,3,53,.second,.reverseMinus,7⟩,⟨501,7,53,.first,.reverseMinus,6⟩,⟨16029,3,501,.second,.plus,5⟩]⟩,
  ⟨[6787, 32057], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨53,3,7,.second,.plus,3⟩,⟨6787,3,53,.second,.reverseMinus,7⟩,⟨501,7,53,.first,.reverseMinus,6⟩,⟨32057,7,501,.second,.plus,6⟩]⟩,
  ⟨[6823, 29791], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨961,1,15,.second,.reverseMinus,6⟩,⟨29791,961,961,.second,.plus,5⟩,⟨6727,961,961,.second,.plus,3⟩,⟨6823,3,6727,.first,.reverseMinus,5⟩]⟩,
  ⟨[6835, 32047], [⟨7,1,1,.second,.plus,3⟩,⟨111,1,7,.second,.plus,4⟩,⟨3473,7,111,.first,.plus,9⟩,⟨6835,111,3473,.second,.plus,1⟩,⟨3631,111,3473,.first,.plus,6⟩,⟨32047,111,3631,.first,.reverseMinus,8⟩]⟩,
  ⟨[6839, 9019], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨141,5,17,.second,.reverseMinus,3⟩,⟨9019,5,141,.second,.plus,6⟩,⟨6843,17,9019,.first,.minus,7⟩,⟨6839,1,6843,.first,.minus,2⟩]⟩,
  ⟨[6839, 18037], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨1127,161,161,.second,.plus,3⟩,⟨18037,5,1127,.second,.reverseMinus,4⟩,⟨4791,1127,18037,.output,.plus,2⟩,⟨6839,1,4791,.first,.reverseMinus,11⟩]⟩,
  ⟨[6853, 8977], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨529,1,33,.second,.reverseMinus,4⟩,⟨531,1,529,.first,.reverseMinus,1⟩,⟨8977,33,529,.first,.reverseMinus,8⟩,⟨6853,531,8977,.first,.minus,2⟩]⟩,
  ⟨[6853, 17953], [⟨3,1,1,.second,.plus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨561,3,513,.first,.reverseMinus,4⟩,⟨17953,1,561,.second,.reverseMinus,5⟩,⟨2757,513,561,.second,.reverseMinus,2⟩,⟨6853,1,2757,.first,.reverseMinus,12⟩]⟩,
  ⟨[6885, 8009], [⟨63,1,1,.second,.plus,6⟩,⟨55,1,63,.first,.minus,3⟩,⟨27,1,55,.output,.reverseMinus,1⟩,⟨8009,63,55,.first,.plus,7⟩,⟨6885,27,27,.second,.plus,8⟩]⟩,
  ⟨[6885, 32037], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨6885,27,27,.second,.plus,8⟩,⟨7461,9,6885,.first,.reverseMinus,6⟩,⟨32037,3,7461,.first,.reverseMinus,13⟩]⟩,
  ⟨[6887, 8871], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨679,97,97,.second,.plus,3⟩,⟨8871,1,679,.first,.reverseMinus,13⟩,⟨6887,97,679,.first,.reverseMinus,6⟩]⟩,
  ⟨[6887, 17743], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨27,1,25,.first,.reverseMinus,1⟩,⟨6887,25,27,.second,.plus,8⟩,⟨6833,27,6887,.first,.minus,1⟩,⟨17743,3,6833,.first,.plus,13⟩]⟩,
  ⟨[6891, 29729], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨929,1,29,.second,.reverseMinus,5⟩,⟨29729,1,929,.second,.reverseMinus,5⟩,⟨7403,29,929,.second,.plus,3⟩,⟨6891,1,7403,.first,.minus,9⟩]⟩,
  ⟨[6901, 8829], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨8189,1,3,.first,.plus,13⟩,⟨8829,5,8189,.first,.reverseMinus,7⟩,⟨6909,5,8189,.first,.minus,8⟩,⟨6901,1,6909,.first,.minus,3⟩]⟩,
  ⟨[6901, 17659], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨1275,5,5,.second,.plus,8⟩,⟨17659,1,1275,.first,.reverseMinus,14⟩,⟨6901,511,1275,.first,.plus,4⟩]⟩,
  ⟨[6921, 8765], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨6921,9,27,.second,.reverseMinus,8⟩,⟨573,3,9,.second,.plus,6⟩,⟨8765,1,573,.first,.reverseMinus,13⟩]⟩,
  ⟨[6921, 17531], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨32767,1,1,.second,.plus,15⟩,⟨2295,9,9,.second,.plus,8⟩,⟨6921,9,2295,.first,.plus,10⟩,⟨17531,32767,2295,.output,.plus,1⟩]⟩,
  ⟨[6935, 16013], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨27,1,23,.first,.reverseMinus,2⟩,⟨6935,23,27,.second,.reverseMinus,8⟩,⟨371,3,23,.second,.reverseMinus,4⟩,⟨16013,1,371,.first,.plus,14⟩]⟩,
  ⟨[6935, 32025], [⟨31,1,1,.second,.plus,5⟩,⟨991,1,31,.second,.plus,5⟩,⟨743,31,991,.first,.minus,3⟩,⟨32025,1,743,.first,.plus,15⟩,⟨6935,991,743,.second,.reverseMinus,3⟩]⟩,
  ⟨[6937, 14843], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1541,3,5,.first,.reverseMinus,9⟩,⟨14843,1,1541,.first,.plus,14⟩,⟨6169,5,1541,.second,.reverseMinus,2⟩,⟨6937,3,6169,.first,.reverseMinus,8⟩]⟩,
  ⟨[6937, 29687], [⟨7,1,1,.second,.plus,3⟩,⟨119,7,7,.second,.reverseMinus,4⟩,⟨231,7,7,.second,.reverseMinus,5⟩,⟨6937,7,231,.first,.plus,10⟩,⟨29687,119,231,.second,.reverseMinus,7⟩]⟩,
  ⟨[6941, 17403], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1019,1,5,.first,.plus,10⟩,⟨17403,1,1019,.first,.reverseMinus,14⟩,⟨7133,1019,1019,.second,.plus,3⟩,⟨6941,3,7133,.first,.minus,6⟩]⟩,
  ⟨[6961, 17275], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨6961,27,49,.first,.reverseMinus,8⟩,⟨891,27,27,.second,.reverseMinus,5⟩,⟨17275,1,891,.first,.reverseMinus,14⟩]⟩,
  ⟨[6981, 8573], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨8573,3,67,.second,.plus,7⟩,⟨8517,7,8573,.first,.minus,3⟩,⟨6981,3,8517,.first,.minus,9⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank38
