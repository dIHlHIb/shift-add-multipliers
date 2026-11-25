import Q15Upper
namespace Q15Bank23
open Q15Upper
def entries : List Entry := [
  ⟨[2925, 32241], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1007,1,17,.first,.plus,10⟩,⟨975,1,1007,.first,.minus,5⟩,⟨32241,17,1007,.second,.reverseMinus,5⟩,⟨2925,975,975,.second,.plus,2⟩]⟩,
  ⟨[2949, 4029], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨3069,3,3,.second,.plus,10⟩,⟨2949,15,3069,.first,.minus,3⟩,⟨4029,15,3069,.first,.reverseMinus,6⟩]⟩,
  ⟨[2949, 32233], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨23,5,63,.first,.minus,3⟩,⟨2949,5,23,.second,.reverseMinus,7⟩,⟨32233,63,23,.first,.plus,9⟩]⟩,
  ⟨[2961, 16317], [⟨63,1,1,.second,.plus,6⟩,⟨189,63,63,.second,.plus,2⟩,⟨2961,63,189,.second,.plus,4⟩,⟨16317,63,189,.first,.reverseMinus,8⟩]⟩,
  ⟨[2961, 32633], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨135,9,9,.second,.plus,4⟩,⟨32633,1,135,.first,.plus,15⟩,⟨423,9,135,.first,.reverseMinus,5⟩,⟨2961,423,423,.second,.plus,3⟩]⟩,
  ⟨[2995, 7625], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨567,9,9,.second,.plus,6⟩,⟨599,1,567,.first,.reverseMinus,5⟩,⟨7625,1,567,.first,.plus,13⟩,⟨2995,599,599,.second,.reverseMinus,2⟩]⟩,
  ⟨[2995, 30499], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨191,1,3,.second,.plus,6⟩,⟨2995,61,191,.second,.plus,4⟩,⟨955,191,191,.second,.reverseMinus,2⟩,⟨30499,61,955,.second,.plus,5⟩]⟩,
  ⟨[2999, 16107], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨47,1,3,.second,.plus,4⟩,⟨2999,9,47,.second,.plus,6⟩,⟨2301,3,9,.second,.plus,8⟩,⟨16107,2301,2301,.second,.plus,3⟩]⟩,
  ⟨[2999, 32215], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨999,1,125,.second,.plus,3⟩,⟨2999,125,999,.first,.reverseMinus,4⟩,⟨16109,125,999,.second,.reverseMinus,4⟩,⟨32215,3,16109,.second,.plus,1⟩]⟩,
  ⟨[3001, 11151], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨41,1,9,.first,.reverseMinus,5⟩,⟨697,41,41,.second,.reverseMinus,4⟩,⟨11151,1,697,.second,.plus,4⟩,⟨3001,9,697,.first,.reverseMinus,8⟩]⟩,
  ⟨[3001, 22301], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨3001,3,71,.first,.plus,10⟩,⟨697,3,71,.first,.plus,8⟩,⟨22301,3,697,.second,.plus,5⟩]⟩,
  ⟨[3007, 30481], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨4095,1,1,.second,.plus,12⟩,⟨119,17,17,.second,.plus,3⟩,⟨3007,17,4095,.first,.minus,6⟩,⟨30481,17,119,.second,.reverseMinus,8⟩]⟩,
  ⟨[3011, 16315], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨61,1,3,.first,.plus,6⟩,⟨3011,3,61,.first,.plus,10⟩,⟨16315,2047,61,.first,.plus,3⟩]⟩,
  ⟨[3011, 32629], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨3011,3,47,.second,.reverseMinus,6⟩,⟨139,1,11,.first,.reverseMinus,7⟩,⟨32629,1,139,.first,.plus,15⟩]⟩,
  ⟨[3035, 11003], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨37,1,5,.first,.reverseMinus,5⟩,⟨3035,3,37,.first,.plus,10⟩,⟨1285,5,5,.second,.reverseMinus,8⟩,⟨11003,3,1285,.first,.plus,12⟩]⟩,
  ⟨[3035, 22005], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨3035,5,95,.second,.plus,5⟩,⟨1375,5,95,.first,.reverseMinus,8⟩,⟨22005,5,1375,.second,.reverseMinus,4⟩]⟩,
  ⟨[3061, 32625], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨2039,5,511,.second,.plus,2⟩,⟨32625,1,2039,.second,.reverseMinus,4⟩,⟨3061,511,2039,.first,.reverseMinus,1⟩]⟩,
  ⟨[3065, 7597], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨4087,1,9,.first,.plus,12⟩,⟨8173,1,4087,.second,.plus,1⟩,⟨7597,9,8173,.first,.minus,6⟩,⟨3065,4087,8173,.output,.plus,2⟩]⟩,
  ⟨[3065, 30387], [⟨255,1,1,.second,.plus,8⟩,⟨383,1,255,.first,.reverseMinus,7⟩,⟨3065,1,383,.second,.reverseMinus,3⟩,⟨24257,255,383,.second,.plus,6⟩,⟨30387,3065,24257,.first,.reverseMinus,1⟩]⟩,
  ⟨[3073, 16093], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨3073,1,3,.second,.reverseMinus,10⟩,⟨16381,1,3,.first,.plus,14⟩,⟨16093,9,16381,.first,.minus,5⟩]⟩,
  ⟨[3073, 32187], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨3073,1,3,.second,.reverseMinus,10⟩,⟨16125,3,63,.second,.plus,8⟩,⟨32187,63,16125,.second,.plus,1⟩]⟩,
  ⟨[3077, 30369], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2559,1,5,.second,.plus,9⟩,⟨1029,1,5,.first,.reverseMinus,10⟩,⟨3077,1,1029,.first,.reverseMinus,11⟩,⟨30369,2559,1029,.second,.plus,5⟩]⟩,
  ⟨[3081, 21593], [⟨3,1,1,.second,.plus,2⟩,⟨3071,1,3,.second,.plus,10⟩,⟨3083,3,3071,.first,.reverseMinus,2⟩,⟨3081,1,3083,.first,.minus,1⟩,⟨21593,3071,3083,.second,.plus,3⟩]⟩,
  ⟨[3085, 5389], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨3085,3,13,.first,.reverseMinus,10⟩,⟨5389,9,3085,.first,.reverseMinus,8⟩]⟩,
  ⟨[3085, 21555], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨3085,5,385,.second,.reverseMinus,3⟩,⟨21555,385,3085,.first,.plus,6⟩]⟩,
  ⟨[3111, 8155], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨1061,9,1025,.first,.reverseMinus,2⟩,⟨8155,9,1061,.first,.plus,10⟩,⟨3111,1025,1061,.first,.reverseMinus,1⟩]⟩,
  ⟨[3111, 32619], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨133,1,5,.first,.reverseMinus,7⟩,⟨3111,2047,133,.second,.reverseMinus,3⟩,⟨32619,2047,133,.first,.plus,4⟩]⟩,
  ⟨[3135, 15137], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨119,3,95,.first,.reverseMinus,3⟩,⟨3135,95,95,.second,.reverseMinus,5⟩,⟨15137,95,119,.second,.plus,7⟩]⟩,
  ⟨[3135, 30273], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨3007,3,65,.first,.plus,10⟩,⟨3135,1,3007,.first,.reverseMinus,7⟩,⟨30273,65,3007,.first,.plus,9⟩]⟩,
  ⟨[3147, 16079], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨1039,1,65,.second,.plus,4⟩,⟨1009,1,1039,.first,.plus,11⟩,⟨16079,65,1009,.second,.plus,4⟩,⟨3147,1039,1009,.first,.plus,2⟩]⟩,
  ⟨[3147, 32157], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨75,1,11,.first,.reverseMinus,6⟩,⟨3147,3,75,.first,.reverseMinus,10⟩,⟨611,11,75,.second,.reverseMinus,3⟩,⟨32157,1,611,.first,.plus,15⟩]⟩,
  ⟨[3161, 4077], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨55,1,9,.first,.plus,6⟩,⟨4041,1,55,.first,.plus,12⟩,⟨4077,9,4041,.first,.reverseMinus,2⟩,⟨3161,55,4041,.first,.minus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank23
