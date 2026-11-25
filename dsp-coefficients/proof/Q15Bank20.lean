import Q15Upper
namespace Q15Bank20
open Q15Upper
def entries : List Entry := [
  ⟨[2311, 16343], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨2047,1,1,.second,.plus,11⟩,⟨16343,33,2047,.second,.plus,3⟩,⟨2311,33,2047,.first,.reverseMinus,3⟩]⟩,
  ⟨[2311, 32687], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨7,1,1,.second,.plus,3⟩,⟨4087,1,9,.first,.plus,12⟩,⟨2311,9,7,.first,.reverseMinus,8⟩,⟨32687,9,4087,.second,.plus,3⟩]⟩,
  ⟨[2329, 8109], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1143,9,9,.second,.plus,7⟩,⟨2313,9,9,.second,.reverseMinus,8⟩,⟨2329,1,2313,.first,.reverseMinus,4⟩,⟨8109,1143,2313,.second,.plus,2⟩]⟩,
  ⟨[2329, 32435], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨499,1,13,.first,.plus,9⟩,⟨32435,499,499,.second,.reverseMinus,6⟩,⟨291,13,499,.first,.minus,4⟩,⟨2329,1,291,.second,.reverseMinus,3⟩]⟩,
  ⟨[2343, 13439], [⟨7,1,1,.second,.plus,3⟩,⟨897,1,7,.second,.reverseMinus,7⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨13439,7,897,.first,.plus,11⟩,⟨2343,71,71,.second,.reverseMinus,5⟩]⟩,
  ⟨[2343, 26877], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨2343,71,71,.second,.reverseMinus,5⟩,⟨105,7,7,.second,.plus,4⟩,⟨26877,3,105,.second,.plus,8⟩]⟩,
  ⟨[2361, 16341], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1021,1,3,.first,.plus,10⟩,⟨16341,5,1021,.second,.reverseMinus,4⟩,⟨1181,5,1021,.first,.reverseMinus,5⟩,⟨2361,1,1181,.second,.plus,1⟩]⟩,
  ⟨[2361, 32683], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨159,1,5,.second,.plus,5⟩,⟨2043,1,5,.first,.plus,11⟩,⟨32683,5,2043,.second,.plus,4⟩,⟨2361,159,2043,.first,.reverseMinus,1⟩]⟩,
  ⟨[2379, 8105], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨75,3,9,.second,.reverseMinus,3⟩,⟨2379,9,75,.first,.reverseMinus,8⟩,⟨87,3,9,.first,.plus,5⟩,⟨8105,1,87,.first,.plus,13⟩]⟩,
  ⟨[2379, 13337], [⟨31,1,1,.second,.plus,5⟩,⟨39,1,31,.first,.reverseMinus,3⟩,⟨2535,39,39,.second,.reverseMinus,6⟩,⟨13337,31,2535,.first,.plus,9⟩,⟨2379,39,2535,.first,.minus,2⟩]⟩,
  ⟨[2379, 26675], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨2115,3,33,.second,.reverseMinus,6⟩,⟨2379,33,2115,.first,.reverseMinus,3⟩,⟨26691,3,2115,.first,.reverseMinus,13⟩,⟨26675,1,26691,.first,.minus,4⟩]⟩,
  ⟨[2379, 32421], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨2175,1,17,.second,.plus,7⟩,⟨51,17,17,.second,.plus,2⟩,⟨2379,2175,51,.second,.reverseMinus,2⟩,⟨32421,2175,2379,.first,.plus,4⟩]⟩,
  ⟨[2411, 4085], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨75,1,11,.first,.reverseMinus,6⟩,⟨4085,1,11,.first,.plus,12⟩,⟨2411,11,75,.second,.reverseMinus,5⟩]⟩,
  ⟨[2411, 32679], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨89,3,7,.first,.plus,5⟩,⟨32679,1,89,.first,.plus,15⟩,⟨363,7,89,.second,.reverseMinus,2⟩,⟨2411,1,363,.first,.reverseMinus,11⟩]⟩,
  ⟨[2429, 16203], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨25,1,9,.first,.reverseMinus,4⟩,⟨2329,9,25,.first,.reverseMinus,8⟩,⟨2429,25,2329,.first,.reverseMinus,2⟩,⟨16203,2329,2429,.first,.plus,3⟩]⟩,
  ⟨[2429, 32405], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨2045,1,3,.first,.plus,11⟩,⟨2429,3,2045,.first,.reverseMinus,7⟩,⟨2025,5,2045,.first,.minus,2⟩,⟨32405,5,2025,.second,.reverseMinus,4⟩]⟩,
  ⟨[2435, 13175], [⟨3,1,1,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨775,1,387,.second,.reverseMinus,1⟩,⟨2435,1,387,.first,.reverseMinus,11⟩,⟨13175,775,775,.second,.reverseMinus,4⟩]⟩,
  ⟨[2435, 26349], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨2435,3,19,.second,.reverseMinus,7⟩,⟨1773,7,19,.first,.plus,8⟩,⟨26349,3,1773,.first,.reverseMinus,13⟩]⟩,
  ⟨[2445, 13145], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨163,3,5,.second,.reverseMinus,5⟩,⟨2445,163,163,.second,.plus,4⟩,⟨7335,2445,2445,.second,.plus,2⟩,⟨13145,5,7335,.first,.plus,12⟩]⟩,
  ⟨[2445, 26289], [⟨127,1,1,.second,.plus,7⟩,⟨143,1,127,.first,.reverseMinus,4⟩,⟨413,127,143,.second,.reverseMinus,1⟩,⟨2445,127,413,.first,.reverseMinus,4⟩,⟨26289,143,413,.second,.plus,6⟩]⟩,
  ⟨[2455, 13115], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨2619,5,41,.second,.plus,6⟩,⟨2455,41,2619,.first,.minus,2⟩,⟨13115,41,2619,.first,.reverseMinus,8⟩]⟩,
  ⟨[2455, 26229], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨407,3,23,.first,.reverseMinus,7⟩,⟨2455,1,407,.first,.reverseMinus,11⟩,⟨3279,23,407,.second,.reverseMinus,3⟩,⟨26229,3,3279,.second,.plus,3⟩]⟩,
  ⟨[2461, 8169], [⟨3,1,1,.second,.plus,2⟩,⟨1021,1,3,.first,.plus,10⟩,⟨45,3,3,.second,.plus,4⟩,⟨8169,1,1021,.second,.reverseMinus,3⟩,⟨2461,1021,45,.second,.reverseMinus,5⟩]⟩,
  ⟨[2461, 32675], [⟨3,1,1,.second,.plus,2⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨93,3,3,.second,.plus,5⟩,⟨32675,1,93,.first,.plus,15⟩,⟨2461,515,93,.second,.plus,5⟩]⟩,
  ⟨[2479, 16195], [⟨7,1,1,.second,.plus,3⟩,⟨49,7,7,.second,.plus,3⟩,⟨4047,1,49,.first,.plus,12⟩,⟨16195,7,4047,.second,.reverseMinus,2⟩,⟨2479,49,4047,.first,.minus,5⟩]⟩,
  ⟨[2479, 32391], [⟨15,1,1,.second,.plus,4⟩,⟨49,1,15,.first,.plus,6⟩,⟨4047,1,49,.first,.plus,12⟩,⟨32391,15,4047,.second,.reverseMinus,3⟩,⟨2479,49,4047,.first,.minus,5⟩]⟩,
  ⟨[2503, 32383], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨32383,1,385,.first,.plus,15⟩,⟨361,3,385,.first,.minus,3⟩,⟨2503,385,361,.second,.plus,3⟩]⟩,
  ⟨[2505, 12963], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨201,3,9,.first,.reverseMinus,6⟩,⟨2505,9,201,.first,.reverseMinus,8⟩,⟨405,3,201,.second,.reverseMinus,1⟩,⟨12963,3,405,.second,.reverseMinus,5⟩]⟩,
  ⟨[2505, 25925], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨201,3,9,.first,.reverseMinus,6⟩,⟨2505,9,201,.first,.reverseMinus,8⟩,⟨25929,201,201,.second,.reverseMinus,7⟩,⟨25925,1,25929,.first,.minus,2⟩]⟩,
  ⟨[2511, 32671], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨81,1,97,.first,.minus,4⟩,⟨32671,1,97,.first,.plus,15⟩,⟨2511,81,81,.second,.plus,5⟩]⟩,
  ⟨[2515, 3233], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨45,5,5,.second,.reverseMinus,3⟩,⟨359,1,45,.second,.plus,3⟩,⟨2515,5,45,.first,.plus,9⟩,⟨3233,359,2515,.first,.reverseMinus,1⟩]⟩,
  ⟨[2515, 25863], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨39,1,19,.second,.reverseMinus,1⟩,⟨2515,19,39,.second,.reverseMinus,6⟩,⟨1287,39,39,.second,.reverseMinus,5⟩,⟨25863,3,1287,.first,.reverseMinus,13⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank20
