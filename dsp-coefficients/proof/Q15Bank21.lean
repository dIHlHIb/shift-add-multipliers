import Q15Upper
namespace Q15Bank21
open Q15Upper
def entries : List Entry := [
  ⟨[2525, 12901], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨2565,5,5,.second,.reverseMinus,9⟩,⟨2525,5,2565,.first,.minus,3⟩,⟨12805,5,2565,.first,.reverseMinus,11⟩,⟨12901,3,12805,.first,.reverseMinus,5⟩]⟩,
  ⟨[2525, 25801], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨3225,25,25,.second,.reverseMinus,7⟩,⟨25801,1,3225,.second,.reverseMinus,3⟩,⟨2425,25,3225,.first,.minus,5⟩,⟨2525,25,2425,.first,.reverseMinus,2⟩]⟩,
  ⟨[2553, 32367], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨2039,1,9,.first,.plus,11⟩,⟨32367,257,2039,.second,.plus,4⟩,⟨2553,257,2039,.first,.reverseMinus,1⟩]⟩,
  ⟨[2561, 8167], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2561,1,5,.second,.reverseMinus,9⟩,⟨2043,1,5,.first,.plus,11⟩,⟨8167,5,2043,.second,.plus,2⟩]⟩,
  ⟨[2561, 32667], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1021,1,3,.first,.plus,10⟩,⟨2561,1,5,.second,.reverseMinus,9⟩,⟨32667,5,1021,.second,.plus,5⟩]⟩,
  ⟨[2579, 12729], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨2579,5,19,.first,.reverseMinus,9⟩,⟨2413,19,19,.second,.plus,7⟩,⟨12729,2579,2413,.first,.reverseMinus,2⟩]⟩,
  ⟨[2579, 25457], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨493,3,31,.second,.plus,4⟩,⟨2579,3,493,.first,.plus,10⟩,⟨1593,493,2579,.first,.minus,1⟩,⟨25457,31,1593,.second,.plus,4⟩]⟩,
  ⟨[2603, 32351], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨417,1,13,.second,.reverseMinus,5⟩,⟨32351,1,417,.first,.plus,15⟩,⟨469,13,417,.first,.reverseMinus,2⟩,⟨2603,3,469,.first,.plus,10⟩]⟩,
  ⟨[2611, 4083], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨23,1,3,.second,.plus,3⟩,⟨4083,3,255,.second,.reverseMinus,4⟩,⟨2611,23,4083,.first,.minus,6⟩]⟩,
  ⟨[2611, 32663], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨2611,5,51,.first,.reverseMinus,9⟩,⟨105,3,51,.second,.reverseMinus,1⟩,⟨32663,1,105,.first,.plus,15⟩]⟩,
  ⟨[2613, 12617], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨163,3,5,.second,.reverseMinus,5⟩,⟨2613,5,163,.second,.reverseMinus,4⟩,⟨329,3,163,.second,.reverseMinus,1⟩,⟨12617,3,329,.first,.reverseMinus,12⟩]⟩,
  ⟨[2613, 25235], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨41,3,11,.second,.plus,2⟩,⟨2613,11,41,.second,.plus,6⟩,⟨659,3,41,.second,.reverseMinus,4⟩,⟨25235,3,659,.first,.reverseMinus,13⟩]⟩,
  ⟨[2641, 15509], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨175,1,11,.second,.plus,4⟩,⟨2641,11,175,.first,.plus,8⟩,⟨875,175,175,.second,.reverseMinus,2⟩,⟨15509,1,875,.first,.plus,14⟩]⟩,
  ⟨[2641, 31019], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨529,1,33,.second,.reverseMinus,4⟩,⟨8415,33,33,.second,.plus,8⟩,⟨2641,33,529,.first,.reverseMinus,6⟩,⟨31019,8415,2641,.first,.plus,2⟩]⟩,
  ⟨[2653, 15501], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨419,3,13,.second,.reverseMinus,5⟩,⟨2653,3,419,.first,.plus,10⟩,⟨9357,419,2653,.first,.reverseMinus,4⟩,⟨15501,3,9357,.first,.reverseMinus,11⟩]⟩,
  ⟨[2653, 31001], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨121,3,25,.first,.reverseMinus,5⟩,⟨31001,25,121,.second,.reverseMinus,8⟩,⟨605,121,121,.second,.reverseMinus,2⟩,⟨2653,1,605,.first,.reverseMinus,11⟩]⟩,
  ⟨[2661, 8165], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨21,3,3,.second,.plus,3⟩,⟨8165,1,27,.first,.plus,13⟩,⟨2661,27,21,.second,.plus,7⟩]⟩,
  ⟨[2661, 12455], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨83,3,5,.second,.reverseMinus,4⟩,⟨2661,5,83,.second,.reverseMinus,5⟩,⟨6227,3,83,.first,.reverseMinus,11⟩,⟨12455,1,6227,.second,.reverseMinus,1⟩]⟩,
  ⟨[2661, 24911], [⟨513,1,1,.second,.reverseMinus,9⟩,⟨481,1,513,.first,.minus,5⟩,⟨3623,513,481,.first,.plus,3⟩,⟨2661,481,3623,.first,.minus,1⟩,⟨24911,3623,2661,.second,.reverseMinus,3⟩]⟩,
  ⟨[2661, 32659], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨83,3,5,.second,.reverseMinus,4⟩,⟨2661,5,83,.second,.reverseMinus,5⟩,⟨109,3,83,.first,.plus,6⟩,⟨32659,1,109,.first,.plus,15⟩]⟩,
  ⟨[2665, 15493], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨10245,5,5,.second,.reverseMinus,11⟩,⟨2665,41,41,.second,.reverseMinus,6⟩,⟨15493,41,10245,.first,.reverseMinus,7⟩]⟩,
  ⟨[2665, 30985], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨3073,1,3,.second,.reverseMinus,10⟩,⟨2665,51,3073,.first,.minus,3⟩,⟨6197,51,3073,.second,.reverseMinus,1⟩,⟨30985,6197,6197,.second,.reverseMinus,2⟩]⟩,
  ⟨[2677, 4041], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨4085,1,11,.first,.plus,12⟩,⟨4041,11,4085,.first,.minus,2⟩,⟨2677,11,4085,.first,.minus,7⟩]⟩,
  ⟨[2677, 15485], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨899,3,7,.second,.reverseMinus,7⟩,⟨15485,1,899,.first,.plus,14⟩,⟨2685,7,899,.first,.plus,9⟩,⟨2677,1,2685,.first,.minus,3⟩]⟩,
  ⟨[2677, 30969], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨533,3,67,.second,.plus,3⟩,⟨2677,67,533,.first,.reverseMinus,5⟩,⟨999,67,533,.second,.plus,1⟩,⟨30969,999,999,.second,.plus,5⟩]⟩,
  ⟨[2677, 32327], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨441,7,7,.second,.plus,6⟩,⟨32327,1,441,.first,.plus,15⟩,⟨1337,7,441,.first,.reverseMinus,7⟩,⟨2677,3,1337,.second,.reverseMinus,1⟩]⟩,
  ⟨[2685, 12373], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨2685,3,387,.first,.plus,10⟩,⟨12373,11,387,.second,.plus,5⟩]⟩,
  ⟨[2685, 24747], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨2685,3,21,.second,.plus,7⟩,⟨24747,21,387,.second,.plus,6⟩]⟩,
  ⟨[2699, 3081], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨191,1,3,.second,.plus,6⟩,⟨3081,3,9,.first,.reverseMinus,10⟩,⟨2699,191,3081,.first,.minus,1⟩]⟩,
  ⟨[2699, 24647], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨3075,3,3,.second,.reverseMinus,10⟩,⟨24647,47,3075,.second,.reverseMinus,3⟩,⟨2699,47,3075,.first,.minus,3⟩]⟩,
  ⟨[2711, 32655], [⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨903,1,113,.second,.plus,3⟩,⟨32655,1,113,.first,.plus,15⟩,⟨2711,113,903,.first,.reverseMinus,4⟩]⟩,
  ⟨[2727, 4039], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨4039,255,41,.first,.plus,4⟩,⟨2727,41,4039,.first,.minus,5⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank21
