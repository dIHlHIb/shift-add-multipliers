import Q15Upper
namespace Q15Bank32
open Q15Upper
def entries : List Entry := [
  ⟨[5099, 25645], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨5121,1,5,.second,.reverseMinus,10⟩,⟨5131,5,5121,.first,.reverseMinus,1⟩,⟨5099,1,5131,.first,.minus,5⟩,⟨25645,5121,5131,.second,.reverseMinus,2⟩]⟩,
  ⟨[5107, 32367], [⟨15,1,1,.second,.plus,4⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨1011,15,513,.second,.plus,1⟩,⟨5107,1,1011,.first,.reverseMinus,12⟩,⟨32367,15,1011,.second,.reverseMinus,5⟩]⟩,
  ⟨[5109, 12807], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨5119,1,5,.second,.plus,10⟩,⟨5109,5,5119,.first,.minus,1⟩,⟨4479,5,5119,.first,.minus,7⟩,⟨12807,5109,4479,.second,.plus,2⟩]⟩,
  ⟨[5109, 25615], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨5105,5,15,.first,.plus,10⟩,⟨5109,1,5105,.first,.reverseMinus,2⟩,⟨25615,15,5105,.first,.plus,11⟩]⟩,
  ⟨[5115, 15565], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨5115,5,5,.second,.plus,10⟩,⟨243,1,13,.first,.plus,8⟩,⟨15565,13,243,.second,.reverseMinus,6⟩]⟩,
  ⟨[5115, 31129], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨5115,5,5,.second,.plus,10⟩,⟨999,5,251,.second,.plus,2⟩,⟨31129,251,999,.first,.plus,7⟩]⟩,
  ⟨[5119, 25583], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1279,1,5,.second,.plus,8⟩,⟨5119,1,5,.second,.plus,10⟩,⟨25583,1279,5119,.first,.reverseMinus,4⟩]⟩,
  ⟨[5139, 15557], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨5179,5,81,.second,.plus,6⟩,⟨5139,5,5179,.first,.minus,3⟩,⟨15557,81,5179,.first,.plus,8⟩]⟩,
  ⟨[5139, 31115], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨245,1,11,.first,.plus,8⟩,⟨31115,245,245,.second,.plus,7⟩,⟨2571,11,245,.first,.plus,8⟩,⟨5139,3,2571,.second,.plus,1⟩]⟩,
  ⟨[5155, 32359], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨161,3,31,.first,.plus,6⟩,⟨5155,3,161,.second,.reverseMinus,5⟩,⟨409,31,161,.first,.reverseMinus,3⟩,⟨32359,1,409,.first,.plus,15⟩]⟩,
  ⟨[5163, 15549], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨5183,5,63,.first,.reverseMinus,10⟩,⟨5163,5,5183,.first,.minus,2⟩,⟨15549,5183,5183,.second,.plus,2⟩]⟩,
  ⟨[5163, 31099], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨323,3,5,.second,.reverseMinus,6⟩,⟨5163,5,323,.second,.plus,4⟩,⟨243,5,323,.first,.minus,4⟩,⟨31099,5,243,.second,.plus,7⟩]⟩,
  ⟨[5187, 12681], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨81,9,9,.second,.reverseMinus,3⟩,⟨5187,3,81,.second,.reverseMinus,6⟩,⟨393,3,9,.first,.reverseMinus,7⟩,⟨12681,3,393,.first,.reverseMinus,12⟩]⟩,
  ⟨[5187, 15541], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨2591,5,31,.first,.reverseMinus,9⟩,⟨5187,5,2591,.second,.reverseMinus,1⟩,⟨15541,2591,5187,.first,.plus,3⟩]⟩,
  ⟨[5187, 25361], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨4611,3,9,.second,.reverseMinus,9⟩,⟨5187,9,4611,.first,.reverseMinus,6⟩,⟨25359,4611,5187,.second,.reverseMinus,2⟩,⟨25361,1,25359,.first,.reverseMinus,1⟩]⟩,
  ⟨[5187, 31083], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨81,3,15,.first,.plus,5⟩,⟨5187,3,81,.second,.reverseMinus,6⟩,⟨15549,81,5187,.first,.plus,8⟩,⟨31083,15,15549,.second,.plus,1⟩]⟩,
  ⟨[5197, 12665], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨745,3,23,.first,.plus,8⟩,⟨12665,745,745,.second,.reverseMinus,4⟩,⟨3725,745,745,.second,.reverseMinus,2⟩,⟨5197,23,3725,.first,.reverseMinus,6⟩]⟩,
  ⟨[5197, 25331], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨77,3,5,.second,.plus,4⟩,⟨5197,5,77,.first,.reverseMinus,10⟩,⟨4851,77,77,.second,.plus,6⟩,⟨25331,5,4851,.first,.reverseMinus,12⟩]⟩,
  ⟨[5205, 32351], [⟨63,1,1,.second,.plus,6⟩,⟨1009,1,63,.second,.reverseMinus,4⟩,⟨1041,1,1009,.first,.reverseMinus,5⟩,⟨32351,63,1009,.second,.reverseMinus,5⟩,⟨5205,1041,1041,.second,.reverseMinus,2⟩]⟩,
  ⟨[5211, 15533], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨5115,5,5,.second,.plus,10⟩,⟨5211,3,5115,.first,.reverseMinus,5⟩,⟨15537,5115,5211,.second,.reverseMinus,1⟩,⟨15533,1,15537,.first,.minus,2⟩]⟩,
  ⟨[5211, 31067], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨1701,27,27,.second,.plus,6⟩,⟨31067,1,1701,.first,.plus,15⟩,⟨5211,27,1701,.first,.plus,8⟩]⟩,
  ⟨[5235, 15525], [⟨15,1,1,.second,.plus,4⟩,⟨45,15,15,.second,.plus,2⟩,⟨165,15,45,.second,.plus,2⟩,⟨15525,15,165,.first,.reverseMinus,10⟩,⟨5235,45,165,.second,.plus,5⟩]⟩,
  ⟨[5235, 31051], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨123,1,5,.first,.plus,7⟩,⟨115,1,123,.first,.minus,3⟩,⟨5235,5,115,.first,.reverseMinus,10⟩,⟨1717,123,115,.second,.plus,4⟩,⟨31051,1,1717,.first,.plus,15⟩]⟩,
  ⟨[5255, 12569], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨12825,25,25,.second,.reverseMinus,9⟩,⟨12569,1,12825,.first,.minus,8⟩,⟨3207,3,12825,.output,.plus,2⟩,⟨5255,1,3207,.first,.reverseMinus,11⟩]⟩,
  ⟨[5255, 25137], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨3591,7,7,.second,.reverseMinus,9⟩,⟨5255,13,3591,.first,.reverseMinus,7⟩,⟨25137,3591,3591,.second,.plus,3⟩]⟩,
  ⟨[5255, 32343], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨41,3,7,.first,.plus,4⟩,⟨5255,7,41,.second,.reverseMinus,7⟩,⟨425,3,41,.first,.reverseMinus,7⟩,⟨32343,1,425,.first,.plus,15⟩]⟩,
  ⟨[5259, 15517], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨5119,1,5,.second,.plus,10⟩,⟨5279,5,5119,.first,.reverseMinus,5⟩,⟨5259,5,5279,.first,.minus,2⟩,⟨15517,5119,5279,.first,.reverseMinus,1⟩]⟩,
  ⟨[5259, 31035], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨117,3,21,.first,.reverseMinus,5⟩,⟨5259,21,117,.first,.plus,8⟩,⟨2069,1,21,.first,.reverseMinus,11⟩,⟨31035,2069,2069,.second,.plus,4⟩]⟩,
  ⟨[5303, 24975], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨4991,1,39,.second,.plus,7⟩,⟨5303,39,4991,.first,.reverseMinus,3⟩,⟨24959,39,4991,.first,.reverseMinus,9⟩,⟨24975,1,24959,.first,.reverseMinus,4⟩]⟩,
  ⟨[5305, 32335], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨433,1,27,.second,.reverseMinus,4⟩,⟨32335,1,433,.first,.plus,15⟩,⟨839,27,433,.second,.plus,1⟩,⟨5305,3,839,.first,.plus,11⟩]⟩,
  ⟨[5351, 6203], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1019,1,5,.first,.plus,10⟩,⟨1083,1,1019,.first,.reverseMinus,6⟩,⟨6203,5,1083,.first,.reverseMinus,10⟩,⟨5351,1019,1083,.second,.reverseMinus,2⟩]⟩,
  ⟨[5351, 24813], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨24813,19,97,.second,.plus,8⟩,⟨5357,19,24813,.first,.minus,10⟩,⟨5351,3,5357,.first,.minus,1⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank32
