import Q15Upper
namespace Q15Bank47
open Q15Upper
def entries : List Entry := [
  ⟨[9981, 12993], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨3327,3,255,.first,.reverseMinus,10⟩,⟨12993,255,3327,.first,.plus,6⟩,⟨9981,3327,3327,.second,.plus,2⟩]⟩,
  ⟨[9981, 25987], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨9981,3,39,.second,.plus,8⟩,⟨14973,39,9981,.first,.reverseMinus,7⟩,⟨25987,5,14973,.first,.plus,13⟩]⟩,
  ⟨[9991, 31207], [⟨7,1,1,.second,.plus,3⟩,⟨39,1,7,.first,.reverseMinus,5⟩,⟨9991,7,39,.second,.reverseMinus,8⟩,⟨487,7,39,.first,.reverseMinus,6⟩,⟨31207,39,487,.second,.reverseMinus,6⟩]⟩,
  ⟨[10001, 25955], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨3741,29,29,.second,.reverseMinus,7⟩,⟨25955,29,3741,.first,.plus,10⟩,⟨3857,29,3741,.first,.reverseMinus,2⟩,⟨10001,3,3857,.first,.reverseMinus,11⟩]⟩,
  ⟨[10039, 31193], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨487,1,25,.first,.plus,9⟩,⟨31193,25,487,.second,.reverseMinus,6⟩,⟨1255,3,487,.first,.reverseMinus,8⟩,⟨10039,1,1255,.second,.plus,3⟩]⟩,
  ⟨[10087, 31177], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨153,9,9,.second,.reverseMinus,4⟩,⟨10087,5,153,.first,.plus,11⟩,⟨9783,9,153,.second,.plus,6⟩,⟨31177,5,9783,.first,.plus,13⟩]⟩,
  ⟨[10135, 15581], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨16381,1,3,.first,.plus,14⟩,⟨15581,25,16381,.first,.minus,5⟩,⟨3889,25,15581,.output,.reverseMinus,2⟩,⟨10135,16381,3889,.output,.plus,1⟩]⟩,
  ⟨[10135, 31161], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨10247,5,7,.first,.reverseMinus,11⟩,⟨10135,7,10247,.first,.minus,4⟩,⟨9799,7,10247,.first,.minus,6⟩,⟨31161,5,9799,.first,.plus,13⟩]⟩,
  ⟨[10139, 25739], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨101,3,5,.first,.reverseMinus,5⟩,⟨10139,5,101,.first,.plus,11⟩,⟨25755,101,101,.second,.plus,8⟩,⟨25739,1,25755,.first,.minus,4⟩]⟩,
  ⟨[10159, 25709], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨6063,47,47,.second,.reverseMinus,7⟩,⟨10159,1,6063,.first,.reverseMinus,12⟩,⟨6439,47,6063,.first,.reverseMinus,3⟩,⟨25709,47,6439,.second,.plus,2⟩]⟩,
  ⟨[10179, 12839], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨39,1,25,.first,.plus,6⟩,⟨12839,25,39,.first,.reverseMinus,9⟩,⟨159,3,39,.second,.reverseMinus,2⟩,⟨10179,3,159,.second,.reverseMinus,6⟩]⟩,
  ⟨[10179, 25677], [⟨2049,1,1,.second,.reverseMinus,11⟩,⟨1985,1,2049,.first,.minus,6⟩,⟨6083,2049,1985,.first,.reverseMinus,1⟩,⟨10179,1,6083,.first,.reverseMinus,12⟩,⟨25677,1985,6083,.first,.plus,4⟩]⟩,
  ⟨[10183, 15573], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨10221,5,19,.first,.plus,11⟩,⟨10183,19,10221,.first,.minus,1⟩,⟨7789,19,10221,.first,.minus,7⟩,⟨15573,5,7789,.second,.plus,1⟩]⟩,
  ⟨[10183, 31145], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨10215,5,25,.first,.plus,11⟩,⟨10183,1,10215,.first,.minus,5⟩,⟨9815,25,10215,.first,.minus,4⟩,⟨31145,5,9815,.first,.plus,13⟩]⟩,
  ⟨[10231, 15565], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨16397,1,13,.first,.reverseMinus,14⟩,⟨15565,13,16397,.first,.minus,6⟩,⟨10227,13,16397,.first,.plus,11⟩,⟨10231,1,10227,.first,.reverseMinus,2⟩]⟩,
  ⟨[10231, 31129], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨25,1,9,.first,.reverseMinus,4⟩,⟨10231,5,9,.first,.plus,11⟩,⟨9831,25,10231,.first,.minus,4⟩,⟨31129,5,9831,.first,.plus,13⟩]⟩,
  ⟨[10257, 25551], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨8721,17,17,.second,.reverseMinus,9⟩,⟨10257,3,8721,.first,.reverseMinus,9⟩,⟨9265,17,8721,.first,.reverseMinus,5⟩,⟨25551,17,9265,.first,.plus,11⟩]⟩,
  ⟨[10277, 25521], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨37,1,5,.first,.reverseMinus,5⟩,⟨10277,5,37,.first,.reverseMinus,11⟩,⟨1595,5,25,.second,.plus,6⟩,⟨25521,1,1595,.second,.reverseMinus,4⟩]⟩,
  ⟨[10279, 15557], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1285,5,5,.second,.reverseMinus,8⟩,⟨10279,1,1285,.second,.plus,3⟩,⟨15621,7,1285,.first,.reverseMinus,11⟩,⟨15557,1,15621,.first,.minus,6⟩]⟩,
  ⟨[10279, 31115], [⟨127,1,1,.second,.plus,7⟩,⟨253,1,127,.second,.plus,1⟩,⟨1269,127,253,.first,.reverseMinus,3⟩,⟨10279,127,1269,.second,.reverseMinus,3⟩,⟨31115,253,1269,.first,.plus,7⟩]⟩,
  ⟨[10327, 15549], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨10327,41,81,.second,.plus,7⟩,⟨5183,1,81,.second,.plus,6⟩,⟨15549,5183,5183,.second,.plus,2⟩]⟩,
  ⟨[10327, 31099], [⟨3,1,1,.second,.plus,2⟩,⟨6143,1,3,.second,.plus,11⟩,⟨6239,3,6143,.first,.reverseMinus,5⟩,⟨31099,6143,6239,.second,.reverseMinus,2⟩,⟨6231,1,6239,.first,.minus,3⟩,⟨10327,1,6231,.first,.reverseMinus,12⟩]⟩,
  ⟨[10355, 12697], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨377,1,385,.first,.minus,3⟩,⟨12697,385,377,.first,.reverseMinus,5⟩,⟨6029,3,377,.second,.plus,4⟩,⟨10355,1,6029,.first,.plus,14⟩]⟩,
  ⟨[10355, 25393], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨115,5,15,.second,.plus,3⟩,⟨10355,5,115,.first,.reverseMinus,11⟩,⟨7375,15,115,.second,.reverseMinus,6⟩,⟨25393,1,7375,.first,.plus,15⟩]⟩,
  ⟨[10375, 15541], [⟨3,1,1,.second,.plus,2⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨1035,1,259,.second,.plus,2⟩,⟨15541,259,1035,.first,.plus,6⟩,⟨2075,3,259,.second,.reverseMinus,3⟩,⟨10375,2075,2075,.second,.reverseMinus,2⟩]⟩,
  ⟨[10375, 31083], [⟨3,1,1,.second,.plus,2⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨2069,3,259,.second,.plus,3⟩,⟨31083,259,2069,.first,.plus,7⟩,⟨2075,3,259,.second,.reverseMinus,3⟩,⟨10375,2075,2075,.second,.reverseMinus,2⟩]⟩,
  ⟨[10413, 12649], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨1581,3,45,.first,.reverseMinus,9⟩,⟨12649,1,1581,.second,.reverseMinus,3⟩,⟨7341,45,1581,.first,.reverseMinus,7⟩,⟨10413,3,7341,.first,.reverseMinus,10⟩]⟩,
  ⟨[10413, 25299], [⟨3,1,1,.second,.plus,2⟩,⟨93,3,3,.second,.plus,5⟩,⟨1491,3,93,.second,.reverseMinus,4⟩,⟨10413,93,1491,.first,.plus,7⟩,⟨25299,93,1491,.first,.reverseMinus,8⟩]⟩,
  ⟨[10421, 15533], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨11,1,5,.second,.reverseMinus,1⟩,⟨181,5,11,.second,.reverseMinus,4⟩,⟨10421,5,181,.first,.reverseMinus,11⟩,⟨15541,5,10421,.first,.reverseMinus,10⟩,⟨15533,1,15541,.first,.minus,3⟩]⟩,
  ⟨[10421, 31067], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨485,1,27,.first,.plus,9⟩,⟨31067,27,485,.second,.reverseMinus,6⟩,⟨613,1,485,.first,.reverseMinus,7⟩,⟨10421,613,613,.second,.reverseMinus,4⟩]⟩,
  ⟨[10433, 12633], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨167,3,25,.first,.plus,6⟩,⟨12633,25,167,.first,.plus,9⟩,⟨163,1,167,.first,.minus,2⟩,⟨10433,1,163,.second,.reverseMinus,6⟩]⟩,
  ⟨[10433, 25267], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨81,1,65,.first,.reverseMinus,4⟩,⟨16465,1,81,.first,.reverseMinus,14⟩,⟨10433,65,81,.second,.reverseMinus,7⟩,⟨25267,16465,10433,.second,.plus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank47
