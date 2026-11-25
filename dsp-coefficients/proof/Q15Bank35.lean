import Q15Upper
namespace Q15Bank35
open Q15Upper
def entries : List Entry := [
  ⟨[5897, 7643], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨8201,1,9,.first,.reverseMinus,13⟩,⟨279,9,9,.second,.plus,5⟩,⟨5897,9,8201,.first,.minus,8⟩,⟨7643,8201,279,.second,.minus,1⟩]⟩,
  ⟨[5897, 30573], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨2295,9,9,.second,.plus,8⟩,⟨5897,1,2295,.first,.plus,13⟩,⟨1911,3,2295,.first,.minus,7⟩,⟨30573,3,1911,.second,.plus,4⟩]⟩,
  ⟨[5899, 32233], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨5899,11,23,.second,.reverseMinus,8⟩,⟨535,1,23,.first,.reverseMinus,9⟩,⟨32233,1,535,.first,.plus,15⟩]⟩,
  ⟨[5907, 22703], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨175,1,11,.second,.plus,4⟩,⟨22703,11,175,.first,.reverseMinus,11⟩,⟨179,1,175,.first,.reverseMinus,2⟩,⟨5907,179,179,.second,.reverseMinus,5⟩]⟩,
  ⟨[5933, 11297], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨11297,11,33,.first,.reverseMinus,10⟩,⟨349,3,11,.second,.plus,5⟩,⟨5933,349,349,.second,.reverseMinus,4⟩]⟩,
  ⟨[5933, 22595], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨22595,11,67,.first,.reverseMinus,11⟩,⟨349,3,11,.second,.plus,5⟩,⟨5933,349,349,.second,.reverseMinus,4⟩]⟩,
  ⟨[5943, 30535], [⟨15,1,1,.second,.plus,4⟩,⟨23,1,15,.first,.reverseMinus,3⟩,⟨185,1,23,.second,.reverseMinus,3⟩,⟨30535,15,185,.first,.plus,11⟩,⟨5943,23,185,.second,.reverseMinus,5⟩]⟩,
  ⟨[5949, 32223], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨63,1,1,.second,.plus,6⟩,⟨1983,33,63,.second,.plus,5⟩,⟨32223,33,63,.second,.plus,9⟩,⟨5949,1983,1983,.second,.plus,2⟩]⟩,
  ⟨[5959, 11243], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨93,3,3,.second,.plus,5⟩,⟨5959,7,93,.second,.reverseMinus,6⟩,⟨12011,93,5959,.second,.reverseMinus,1⟩,⟨11243,3,12011,.first,.minus,8⟩]⟩,
  ⟨[5959, 22485], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨8191,1,1,.second,.plus,13⟩,⟨8263,9,8191,.first,.reverseMinus,3⟩,⟨5959,9,8263,.first,.minus,8⟩,⟨22485,8263,5959,.first,.reverseMinus,1⟩]⟩,
  ⟨[5967, 15259], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨93,3,3,.second,.plus,5⟩,⟨5967,15,93,.second,.reverseMinus,6⟩,⟨15267,15,93,.first,.plus,10⟩,⟨15259,1,15267,.first,.minus,3⟩]⟩,
  ⟨[5967, 30517], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨6143,1,3,.second,.plus,11⟩,⟨5967,11,6143,.first,.minus,4⟩,⟨30539,6143,5967,.first,.reverseMinus,2⟩,⟨30517,11,30539,.first,.minus,1⟩]⟩,
  ⟨[5985, 22375], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨8195,1,3,.first,.reverseMinus,13⟩,⟨5985,95,95,.second,.plus,6⟩,⟨22375,8195,5985,.first,.reverseMinus,1⟩]⟩,
  ⟨[5997, 16107], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨147,3,9,.second,.reverseMinus,4⟩,⟨5997,3,147,.first,.plus,11⟩,⟨2301,3,9,.second,.plus,8⟩,⟨16107,2301,2301,.second,.plus,3⟩]⟩,
  ⟨[5997, 32215], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨403,3,25,.second,.reverseMinus,4⟩,⟨5997,25,403,.first,.plus,8⟩,⟨2015,403,403,.second,.reverseMinus,2⟩,⟨32215,25,2015,.second,.plus,4⟩]⟩,
  ⟨[6019, 22229], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨6019,11,387,.first,.reverseMinus,9⟩,⟨299,11,387,.first,.minus,3⟩,⟨22229,11,299,.first,.plus,11⟩]⟩,
  ⟨[6037, 15231], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨119,7,7,.second,.reverseMinus,4⟩,⟨15231,1,119,.second,.plus,7⟩,⟨107,3,119,.first,.minus,2⟩,⟨6037,3,107,.first,.plus,11⟩]⟩,
  ⟨[6037, 30463], [⟨127,1,1,.second,.plus,7⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨2159,127,127,.second,.reverseMinus,4⟩,⟨30463,127,2049,.first,.plus,8⟩,⟨6037,2049,2159,.first,.plus,2⟩]⟩,
  ⟨[6047, 16103], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨63,1,1,.second,.plus,6⟩,⟨2015,1,63,.second,.plus,5⟩,⟨16103,17,2015,.second,.plus,3⟩,⟨6047,63,2015,.first,.reverseMinus,6⟩]⟩,
  ⟨[6047, 32205], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨2145,33,33,.second,.reverseMinus,6⟩,⟨2147,1,2145,.first,.reverseMinus,1⟩,⟨6047,1,2145,.first,.plus,13⟩,⟨32205,2147,2147,.second,.plus,4⟩]⟩,
  ⟨[6053, 22081], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨755,3,13,.first,.plus,8⟩,⟨6053,13,755,.second,.reverseMinus,3⟩,⟨4543,755,6053,.first,.minus,1⟩,⟨22081,13,4543,.first,.plus,11⟩]⟩,
  ⟨[6095, 10947], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨1219,3,19,.second,.reverseMinus,6⟩,⟨10947,19,1219,.first,.reverseMinus,9⟩,⟨6095,1219,1219,.second,.reverseMinus,2⟩]⟩,
  ⟨[6095, 21893], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨1219,3,19,.second,.reverseMinus,6⟩,⟨6095,1219,1219,.second,.reverseMinus,2⟩,⟨10947,19,1219,.first,.reverseMinus,9⟩,⟨21893,1,10947,.second,.plus,1⟩]⟩,
  ⟨[6097, 8049], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨6129,3,15,.first,.plus,11⟩,⟨6097,1,6129,.first,.minus,5⟩,⟨8049,15,6129,.first,.reverseMinus,7⟩]⟩,
  ⟨[6097, 32195], [⟨3,1,1,.second,.plus,2⟩,⟨509,1,3,.first,.plus,9⟩,⟨381,1,509,.first,.minus,7⟩,⟨6097,1,381,.second,.reverseMinus,4⟩,⟨32195,509,381,.first,.plus,6⟩]⟩,
  ⟨[6107, 15203], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨37,1,5,.first,.reverseMinus,5⟩,⟨6107,3,37,.first,.plus,11⟩,⟨1181,3,37,.second,.plus,5⟩,⟨15203,1,1181,.first,.plus,14⟩]⟩,
  ⟨[6107, 30407], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨37,1,5,.first,.reverseMinus,5⟩,⟨6107,3,37,.first,.plus,11⟩,⟨30535,6107,6107,.second,.reverseMinus,2⟩,⟨30407,1,30535,.first,.minus,7⟩]⟩,
  ⟨[6137, 10853], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨27,1,7,.second,.plus,2⟩,⟨6137,3,7,.first,.plus,11⟩,⟨3483,27,27,.second,.reverseMinus,7⟩,⟨10853,7,3483,.first,.plus,11⟩]⟩,
  ⟨[6137, 21707], [⟨3,1,1,.second,.plus,2⟩,⟨3069,3,3,.second,.plus,10⟩,⟨6137,1,3069,.second,.plus,1⟩,⟨3101,1,3069,.first,.reverseMinus,5⟩,⟨21707,3101,3101,.second,.plus,3⟩]⟩,
  ⟨[6145, 21669], [⟨3,1,1,.second,.plus,2⟩,⟨6145,1,3,.second,.reverseMinus,11⟩,⟨21,3,3,.second,.plus,3⟩,⟨165,3,21,.second,.plus,3⟩,⟨21669,21,165,.first,.reverseMinus,10⟩]⟩,
  ⟨[6147, 16093], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨16381,1,3,.first,.plus,14⟩,⟨6147,3,3,.second,.reverseMinus,11⟩,⟨16093,9,16381,.first,.minus,5⟩]⟩,
  ⟨[6147, 32187], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨6147,3,3,.second,.reverseMinus,11⟩,⟨16125,3,63,.second,.plus,8⟩,⟨32187,63,16125,.second,.plus,1⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank35
