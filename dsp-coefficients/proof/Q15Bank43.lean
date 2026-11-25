import Q15Upper
namespace Q15Bank43
open Q15Upper
def entries : List Entry := [
  ⟨[8141, 28437], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨4063,1,33,.first,.plus,12⟩,⟨8125,1,4063,.second,.plus,1⟩,⟨8141,1,8125,.first,.reverseMinus,4⟩,⟨28437,4063,8125,.second,.plus,2⟩]⟩,
  ⟨[8157, 31737], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1019,1,5,.first,.plus,10⟩,⟨891,1,1019,.first,.minus,7⟩,⟨8157,5,1019,.second,.reverseMinus,3⟩,⟨31737,891,8157,.second,.plus,2⟩]⟩,
  ⟨[8163, 28411], [⟨7,1,1,.second,.plus,3⟩,⟨29,1,7,.second,.reverseMinus,2⟩,⟨8163,1,29,.first,.plus,13⟩,⟨3555,7,29,.first,.plus,9⟩,⟨28411,29,3555,.second,.plus,3⟩]⟩,
  ⟨[8185, 14193], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨7,1,1,.second,.plus,3⟩,⟨143,1,9,.second,.plus,4⟩,⟨8185,1,7,.first,.plus,13⟩,⟨14193,7,143,.first,.plus,11⟩]⟩,
  ⟨[8185, 28387], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨4353,1,4097,.first,.reverseMinus,8⟩,⟨8185,9,4097,.second,.plus,1⟩,⟨28387,4353,8185,.second,.plus,2⟩]⟩,
  ⟨[8205, 31723], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨8187,1,5,.first,.plus,13⟩,⟨8205,5,1025,.second,.reverseMinus,3⟩,⟨31723,1025,8187,.second,.plus,2⟩]⟩,
  ⟨[8207, 14181], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨4101,1,5,.first,.reverseMinus,12⟩,⟨315,5,5,.second,.plus,6⟩,⟨8207,5,4101,.second,.reverseMinus,1⟩,⟨14181,4101,315,.second,.reverseMinus,5⟩]⟩,
  ⟨[8207, 28361], [⟨511,1,1,.second,.plus,9⟩,⟨8175,1,511,.second,.plus,4⟩,⟨8207,1,8175,.first,.reverseMinus,5⟩,⟨4343,511,8175,.output,.plus,1⟩,⟨28361,511,4343,.first,.plus,6⟩]⟩,
  ⟨[8255, 31711], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨32751,1,17,.first,.plus,15⟩,⟨8255,65,65,.second,.plus,7⟩,⟨31711,65,32751,.first,.minus,4⟩]⟩,
  ⟨[8293, 28259], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨3683,29,29,.second,.plus,7⟩,⟨28259,3,3683,.first,.reverseMinus,13⟩,⟨4147,29,3683,.first,.reverseMinus,4⟩,⟨8293,1,4147,.second,.plus,1⟩]⟩,
  ⟨[8303, 15849], [⟨7,1,1,.second,.plus,3⟩,⟨1023,1,1,.second,.plus,10⟩,⟨519,1,7,.first,.reverseMinus,9⟩,⟨8303,1,519,.second,.plus,4⟩,⟨15849,1023,519,.first,.plus,4⟩]⟩,
  ⟨[8303, 31699], [⟨7,1,1,.second,.plus,3⟩,⟨1023,1,1,.second,.plus,10⟩,⟨1037,7,1023,.first,.reverseMinus,1⟩,⟨8303,7,1037,.second,.reverseMinus,3⟩,⟨31699,1023,1037,.first,.plus,5⟩]⟩,
  ⟨[8315, 14117], [⟨31,1,1,.second,.plus,5⟩,⟨2017,1,31,.first,.plus,11⟩,⟨8067,1,2017,.second,.plus,2⟩,⟨8315,31,8067,.first,.reverseMinus,3⟩,⟨14117,2017,8067,.second,.plus,1⟩]⟩,
  ⟨[8315, 28235], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2565,5,5,.second,.reverseMinus,9⟩,⟨1925,5,2565,.first,.minus,7⟩,⟨8315,5,1925,.first,.plus,11⟩,⟨28235,2565,1925,.second,.plus,4⟩]⟩,
  ⟨[8337, 28209], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨131,1,3,.first,.reverseMinus,7⟩,⟨8337,47,131,.second,.plus,6⟩,⟨883,47,131,.first,.reverseMinus,4⟩,⟨28209,47,883,.second,.plus,5⟩]⟩,
  ⟨[8351, 15843], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨131,1,33,.second,.plus,2⟩,⟨491,33,131,.second,.plus,2⟩,⟨8351,33,131,.second,.plus,6⟩,⟨15843,131,491,.second,.reverseMinus,5⟩]⟩,
  ⟨[8351, 31685], [⟨31,1,1,.second,.plus,5⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨7905,31,31,.second,.plus,8⟩,⟨8351,31,65,.second,.reverseMinus,7⟩,⟨31685,65,7905,.second,.reverseMinus,2⟩]⟩,
  ⟨[8401, 15837], [⟨31,1,1,.second,.plus,5⟩,⟨1983,1,31,.second,.plus,6⟩,⟨7905,31,31,.second,.plus,8⟩,⟨8401,31,7905,.first,.reverseMinus,4⟩,⟨15837,1983,7905,.first,.reverseMinus,2⟩]⟩,
  ⟨[8401, 28131], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨209,3,17,.first,.reverseMinus,6⟩,⟨8401,1,209,.first,.reverseMinus,13⟩,⟨879,17,209,.first,.plus,6⟩,⟨28131,3,879,.second,.reverseMinus,5⟩]⟩,
  ⟨[8401, 31673], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨271,1,255,.first,.reverseMinus,4⟩,⟨8401,271,271,.second,.plus,5⟩,⟨7919,255,8401,.first,.plus,6⟩,⟨31673,3,7919,.second,.plus,2⟩]⟩,
  ⟨[8423, 14053], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨229,1,27,.first,.plus,8⟩,⟨14053,27,229,.first,.reverseMinus,9⟩,⟨231,1,229,.first,.reverseMinus,1⟩,⟨8423,1,231,.first,.reverseMinus,13⟩]⟩,
  ⟨[8423, 28107], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨459,27,27,.second,.reverseMinus,4⟩,⟨28107,27,459,.first,.reverseMinus,10⟩,⟨231,3,459,.output,.plus,1⟩,⟨8423,1,231,.first,.reverseMinus,13⟩]⟩,
  ⟨[8445, 28081], [⟨255,1,1,.second,.plus,8⟩,⟨253,1,255,.first,.minus,1⟩,⟨8445,1,253,.first,.reverseMinus,13⟩,⟨4303,255,253,.second,.reverseMinus,4⟩,⟨28081,253,4303,.first,.plus,7⟩]⟩,
  ⟨[8449, 31661], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨2111,1,33,.second,.plus,6⟩,⟨8449,1,33,.second,.reverseMinus,8⟩,⟨8443,1,2111,.second,.plus,2⟩,⟨31661,2111,8443,.second,.plus,2⟩]⟩,
  ⟨[8497, 31647], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨529,1,33,.second,.reverseMinus,4⟩,⟨495,1,529,.first,.plus,10⟩,⟨8497,33,529,.second,.reverseMinus,4⟩,⟨31647,33,495,.second,.plus,6⟩]⟩,
  ⟨[8509, 14001], [⟨63,1,1,.second,.plus,6⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨2127,63,129,.second,.reverseMinus,4⟩,⟨8509,1,2127,.second,.reverseMinus,2⟩,⟨14001,63,2127,.first,.plus,8⟩]⟩,
  ⟨[8509, 28003], [⟨127,1,1,.second,.plus,7⟩,⟨2159,127,127,.second,.reverseMinus,4⟩,⟨6033,1,2159,.first,.plus,13⟩,⟨8509,127,2159,.second,.plus,2⟩,⟨28003,6033,8509,.second,.plus,2⟩]⟩,
  ⟨[8531, 27977], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨133,19,19,.second,.plus,3⟩,⟨8531,19,133,.second,.reverseMinus,6⟩,⟨6995,3,8531,.first,.minus,9⟩,⟨27977,3,6995,.second,.plus,2⟩]⟩,
  ⟨[8545, 15817], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨55,3,31,.first,.reverseMinus,3⟩,⟨15817,31,55,.first,.plus,9⟩,⟨353,3,31,.first,.plus,7⟩,⟨8545,1,353,.first,.reverseMinus,13⟩]⟩,
  ⟨[8545, 31635], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨8545,33,97,.first,.reverseMinus,8⟩,⟨2109,3,33,.second,.plus,6⟩,⟨31635,2109,2109,.second,.plus,4⟩]⟩,
  ⟨[8573, 27923], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨8573,3,67,.second,.plus,7⟩,⟨4845,19,19,.second,.plus,8⟩,⟨27923,1,4845,.first,.plus,15⟩]⟩,
  ⟨[8595, 13949], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨109,3,7,.second,.plus,4⟩,⟨13949,3,109,.second,.plus,7⟩,⟨403,1,109,.first,.plus,9⟩,⟨8595,1,403,.first,.reverseMinus,13⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank43
