import Q15Upper
namespace Q15Bank53
open Q15Upper
def entries : List Entry := [
  ⟨[12807, 20437], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨2555,5,5,.second,.plus,9⟩,⟨20437,3,2555,.second,.plus,3⟩,⟨12775,2555,2555,.second,.reverseMinus,2⟩,⟨12807,1,12775,.first,.reverseMinus,5⟩]⟩,
  ⟨[12817, 30157], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨67,1,17,.second,.plus,2⟩,⟨4335,17,17,.second,.plus,8⟩,⟨12817,67,4335,.first,.plus,8⟩,⟨30157,4335,12817,.first,.reverseMinus,2⟩]⟩,
  ⟨[12823, 20397], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨10199,5,41,.first,.plus,11⟩,⟨20397,1,10199,.second,.plus,1⟩,⟨12823,41,10199,.first,.reverseMinus,6⟩]⟩,
  ⟨[12839, 20357], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨12839,25,39,.first,.reverseMinus,9⟩,⟨20485,5,5,.second,.reverseMinus,12⟩,⟨20357,1,20485,.first,.minus,7⟩]⟩,
  ⟨[12865, 15069], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨59,3,35,.first,.reverseMinus,3⟩,⟨15069,35,59,.second,.plus,8⟩,⟨201,35,59,.second,.plus,2⟩,⟨12865,1,201,.second,.reverseMinus,6⟩]⟩,
  ⟨[12865, 30137], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨201,3,9,.first,.reverseMinus,6⟩,⟨12865,1,201,.second,.reverseMinus,6⟩,⟨25529,201,12865,.second,.plus,1⟩,⟨30137,9,25529,.first,.reverseMinus,9⟩]⟩,
  ⟨[12885, 20239], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨241,5,161,.first,.reverseMinus,4⟩,⟨20239,5,241,.first,.plus,12⟩,⟨805,161,161,.second,.reverseMinus,2⟩,⟨12885,5,805,.second,.reverseMinus,4⟩]⟩,
  ⟨[12901, 20199], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨79,1,5,.second,.plus,4⟩,⟨20199,25,79,.second,.plus,8⟩,⟨3225,25,25,.second,.reverseMinus,7⟩,⟨12901,1,3225,.second,.reverseMinus,2⟩]⟩,
  ⟨[12911, 15059], [⟨511,1,1,.second,.plus,9⟩,⟨519,1,511,.first,.reverseMinus,3⟩,⟨1549,511,519,.second,.reverseMinus,1⟩,⟨12911,519,1549,.second,.reverseMinus,3⟩,⟨15059,519,1549,.first,.plus,5⟩]⟩,
  ⟨[12911, 30117], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨943,1,59,.second,.plus,4⟩,⟨30117,59,943,.second,.plus,5⟩,⟨4719,59,943,.first,.reverseMinus,6⟩,⟨12911,1,4719,.first,.reverseMinus,13⟩]⟩,
  ⟨[12947, 20081], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨79,1,5,.second,.plus,4⟩,⟨315,1,79,.second,.plus,2⟩,⟨20081,79,315,.second,.plus,6⟩,⟨2835,315,315,.second,.reverseMinus,3⟩,⟨12947,79,2835,.first,.reverseMinus,7⟩]⟩,
  ⟨[12957, 15049], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨669,3,21,.second,.plus,5⟩,⟨12957,3,669,.first,.reverseMinus,12⟩,⟨1335,3,669,.second,.plus,1⟩,⟨15049,1,1335,.first,.plus,14⟩]⟩,
  ⟨[12957, 30097], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨13821,3,27,.second,.plus,9⟩,⟨12957,27,13821,.first,.minus,5⟩,⟨13713,27,13821,.first,.minus,2⟩,⟨30097,1,13713,.first,.reverseMinus,14⟩]⟩,
  ⟨[12963, 20041], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨25,1,9,.first,.reverseMinus,4⟩,⟨1609,9,25,.second,.reverseMinus,6⟩,⟨20041,9,1609,.first,.reverseMinus,11⟩,⟨3243,25,1609,.second,.reverseMinus,1⟩,⟨12963,9,3243,.second,.plus,2⟩]⟩,
  ⟨[12993, 19961], [⟨7,1,1,.second,.plus,3⟩,⟨25,1,7,.first,.plus,5⟩,⟨12793,7,25,.second,.plus,9⟩,⟨19961,7,12793,.first,.reverseMinus,10⟩,⟨12993,25,12793,.first,.reverseMinus,3⟩]⟩,
  ⟨[13003, 15039], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨203,3,11,.first,.reverseMinus,6⟩,⟨13003,11,203,.second,.reverseMinus,6⟩,⟨235,1,203,.first,.reverseMinus,5⟩,⟨15039,1,235,.second,.plus,6⟩]⟩,
  ⟨[13003, 30077], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨203,3,11,.first,.reverseMinus,6⟩,⟨13003,11,203,.second,.reverseMinus,6⟩,⟨25981,3,203,.second,.plus,7⟩,⟨30077,1,25981,.first,.reverseMinus,12⟩]⟩,
  ⟨[13039, 19841], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨639,1,5,.second,.plus,7⟩,⟨767,1,639,.first,.reverseMinus,7⟩,⟨19841,5,639,.first,.plus,12⟩,⟨13039,767,767,.second,.reverseMinus,4⟩]⟩,
  ⟨[13049, 15029], [⟨3,1,1,.second,.plus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨2147,1,99,.first,.reverseMinus,11⟩,⟨15029,2147,2147,.second,.plus,3⟩,⟨13445,99,15029,.first,.minus,4⟩,⟨13049,99,13445,.first,.minus,2⟩]⟩,
  ⟨[13049, 30057], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨233,1,23,.first,.plus,8⟩,⟨30057,233,233,.second,.reverseMinus,7⟩,⟨1631,233,233,.second,.plus,3⟩,⟨13049,1,1631,.second,.reverseMinus,3⟩]⟩,
  ⟨[13069, 19761], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨305,1,19,.second,.reverseMinus,4⟩,⟨19761,19,305,.first,.reverseMinus,10⟩,⟨4877,3,305,.second,.plus,4⟩,⟨13069,1,4877,.first,.reverseMinus,13⟩]⟩,
  ⟨[13085, 19721], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨13053,3,51,.second,.plus,8⟩,⟨13085,1,13053,.first,.reverseMinus,5⟩,⟨13047,3,13053,.first,.minus,1⟩,⟨19721,1,13047,.first,.plus,15⟩]⟩,
  ⟨[13095, 15019], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨679,97,97,.second,.plus,3⟩,⟨13095,97,679,.first,.reverseMinus,7⟩,⟨13483,97,13095,.first,.reverseMinus,2⟩,⟨15019,3,13483,.first,.reverseMinus,9⟩]⟩,
  ⟨[13095, 30037], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨12319,97,97,.second,.plus,7⟩,⟨13095,97,12319,.first,.reverseMinus,3⟩,⟨36181,12319,13095,.first,.plus,2⟩,⟨30037,3,36181,.first,.minus,11⟩]⟩,
  ⟨[13115, 19641], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨59,1,51,.first,.reverseMinus,3⟩,⟨13115,51,59,.first,.reverseMinus,8⟩,⟨13127,3,13115,.first,.reverseMinus,2⟩,⟨19641,1,13127,.first,.plus,15⟩]⟩,
  ⟨[13141, 15009], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨469,67,67,.second,.plus,3⟩,⟨15009,1,469,.second,.reverseMinus,5⟩,⟨9045,67,469,.first,.reverseMinus,7⟩,⟨13141,1,9045,.first,.reverseMinus,12⟩]⟩,
  ⟨[13141, 30017], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨469,67,67,.second,.plus,3⟩,⟨30017,1,469,.second,.reverseMinus,6⟩,⟨9045,67,469,.first,.reverseMinus,7⟩,⟨13141,1,9045,.first,.reverseMinus,12⟩]⟩,
  ⟨[13145, 19561], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨205,5,25,.second,.reverseMinus,3⟩,⟨13145,25,205,.second,.reverseMinus,6⟩,⟨19545,25,13145,.first,.reverseMinus,8⟩,⟨19561,1,19545,.first,.reverseMinus,4⟩]⟩,
  ⟨[13175, 19479], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨151,1,19,.second,.plus,3⟩,⟨19479,151,151,.second,.reverseMinus,7⟩,⟨4983,151,151,.second,.reverseMinus,5⟩,⟨13175,1,4983,.first,.reverseMinus,13⟩]⟩,
  ⟨[13187, 14999], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨899,3,7,.second,.reverseMinus,7⟩,⟨13187,3,899,.first,.reverseMinus,12⟩,⟨14985,899,13187,.first,.reverseMinus,1⟩,⟨14999,7,14985,.first,.reverseMinus,1⟩]⟩,
  ⟨[13187, 29997], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨13187,13,125,.first,.plus,10⟩,⟨1875,125,125,.second,.plus,4⟩,⟨29997,3,1875,.second,.plus,4⟩]⟩,
  ⟨[13205, 19399], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨825,25,25,.second,.reverseMinus,5⟩,⟨13205,5,825,.second,.reverseMinus,4⟩,⟨2425,25,825,.first,.reverseMinus,6⟩,⟨19399,1,2425,.second,.plus,3⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank53
