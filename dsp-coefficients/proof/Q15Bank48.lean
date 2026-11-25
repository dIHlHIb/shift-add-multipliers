import Q15Upper
namespace Q15Bank48
open Q15Upper
def entries : List Entry := [
  ⟨[10469, 15525], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨165,5,5,.second,.reverseMinus,5⟩,⟨10405,5,165,.first,.reverseMinus,11⟩,⟨10469,1,10405,.first,.reverseMinus,6⟩,⟨15525,5,10405,.first,.reverseMinus,10⟩]⟩,
  ⟨[10469, 31051], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨325,1,69,.first,.reverseMinus,8⟩,⟨10469,69,325,.second,.reverseMinus,5⟩,⟨31131,325,10469,.first,.plus,7⟩,⟨31051,5,31131,.first,.minus,4⟩]⟩,
  ⟨[10471, 12601], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨41,1,25,.first,.reverseMinus,4⟩,⟨10471,25,41,.second,.plus,8⟩,⟨1575,25,25,.second,.plus,6⟩,⟨12601,1,1575,.second,.reverseMinus,3⟩]⟩,
  ⟨[10471, 25201], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨41,1,25,.first,.reverseMinus,4⟩,⟨10471,25,41,.second,.plus,8⟩,⟨1575,25,25,.second,.plus,6⟩,⟨25201,1,1575,.second,.reverseMinus,4⟩]⟩,
  ⟨[10491, 12585], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨49,1,41,.first,.reverseMinus,3⟩,⟨10491,5,41,.second,.plus,8⟩,⟨12585,41,49,.second,.reverseMinus,8⟩]⟩,
  ⟨[10491, 25169], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨8443,5,33,.second,.plus,8⟩,⟨10491,1,8443,.first,.reverseMinus,11⟩,⟨25329,8443,8443,.second,.plus,2⟩,⟨25169,5,25329,.first,.minus,5⟩]⟩,
  ⟨[10517, 15517], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨3101,3,97,.second,.plus,5⟩,⟨15517,97,3101,.first,.reverseMinus,7⟩,⟨2325,97,3101,.first,.minus,3⟩,⟨10517,1,2325,.first,.reverseMinus,13⟩]⟩,
  ⟨[10517, 31035], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨41,1,21,.second,.plus,1⟩,⟨10517,21,41,.second,.reverseMinus,8⟩,⟨2069,1,21,.first,.reverseMinus,11⟩,⟨31035,2069,2069,.second,.plus,4⟩]⟩,
  ⟨[10529, 12553], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨3075,3,3,.second,.reverseMinus,10⟩,⟨12553,253,3075,.second,.reverseMinus,2⟩,⟨10529,253,12553,.first,.minus,3⟩]⟩,
  ⟨[10529, 25105], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨49,1,17,.first,.reverseMinus,5⟩,⟨4047,1,49,.first,.plus,12⟩,⟨25105,17,49,.second,.reverseMinus,9⟩,⟨10529,4047,25105,.output,.reverseMinus,1⟩]⟩,
  ⟨[10549, 12537], [⟨7,1,1,.second,.plus,3⟩,⟨49,7,7,.second,.plus,3⟩,⟨12537,7,49,.second,.plus,8⟩,⟨497,7,49,.first,.reverseMinus,6⟩,⟨10549,12537,497,.second,.minus,2⟩]⟩,
  ⟨[10549, 25073], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨497,1,15,.first,.plus,9⟩,⟨25073,3,497,.first,.reverseMinus,13⟩,⟨21097,497,25073,.first,.minus,3⟩,⟨10549,1,21097,.output,.plus,1⟩]⟩,
  ⟨[10565, 15509], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨325,5,5,.second,.reverseMinus,6⟩,⟨309,1,325,.first,.minus,4⟩,⟨10565,5,325,.first,.reverseMinus,11⟩,⟨15509,309,10565,.first,.reverseMinus,4⟩]⟩,
  ⟨[10565, 31019], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨325,5,5,.second,.reverseMinus,6⟩,⟨2599,1,325,.second,.plus,3⟩,⟨10565,5,325,.first,.reverseMinus,11⟩,⟨31019,2599,10565,.first,.plus,4⟩]⟩,
  ⟨[10587, 25009], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨165,3,27,.first,.plus,6⟩,⟨10587,27,165,.second,.reverseMinus,6⟩,⟨1563,3,27,.first,.reverseMinus,9⟩,⟨25009,1,1563,.second,.reverseMinus,4⟩]⟩,
  ⟨[10613, 15501], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨243,3,51,.first,.reverseMinus,6⟩,⟨15501,51,243,.second,.plus,6⟩,⟨10611,51,15501,.first,.plus,9⟩,⟨10613,1,10611,.first,.reverseMinus,1⟩]⟩,
  ⟨[10613, 31001], [⟨31,1,1,.second,.plus,5⟩,⟨217,31,31,.second,.plus,3⟩,⟨3879,1,217,.first,.plus,12⟩,⟨31001,31,3879,.second,.plus,3⟩,⟨11637,3879,3879,.second,.plus,2⟩,⟨10613,1,11637,.first,.minus,10⟩]⟩,
  ⟨[10625, 24943], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨1663,1,13,.second,.plus,7⟩,⟨10625,3,1663,.first,.plus,12⟩,⟨1559,13,1663,.first,.minus,3⟩,⟨24943,1,1559,.second,.plus,4⟩]⟩,
  ⟨[10659, 15493], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨123,1,61,.second,.reverseMinus,1⟩,⟨15493,61,123,.first,.plus,8⟩,⟨323,3,61,.first,.plus,7⟩,⟨10659,323,323,.second,.reverseMinus,5⟩]⟩,
  ⟨[10659, 30985], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨247,3,61,.second,.reverseMinus,2⟩,⟨30985,61,247,.first,.plus,9⟩,⟨323,3,61,.first,.plus,7⟩,⟨10659,323,323,.second,.reverseMinus,5⟩]⟩,
  ⟨[10663, 12439], [⟨7,1,1,.second,.plus,3⟩,⟨111,1,7,.second,.plus,4⟩,⟨1777,1,111,.second,.reverseMinus,4⟩,⟨12439,1777,1777,.second,.plus,3⟩,⟨10663,111,12439,.first,.minus,4⟩]⟩,
  ⟨[10663, 24877], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨83,5,39,.second,.reverseMinus,1⟩,⟨10663,39,83,.second,.reverseMinus,7⟩,⟨4909,39,83,.first,.plus,7⟩,⟨24877,39,4909,.first,.reverseMinus,9⟩]⟩,
  ⟨[10683, 12423], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨12287,1,3,.second,.plus,12⟩,⟨12423,17,12287,.first,.reverseMinus,3⟩,⟨12219,17,12287,.first,.minus,2⟩,⟨10683,3,12219,.first,.minus,9⟩]⟩,
  ⟨[10683, 24845], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨1537,1,3,.second,.reverseMinus,9⟩,⟨24845,253,1537,.second,.reverseMinus,4⟩,⟨3561,253,1537,.first,.reverseMinus,3⟩,⟨10683,3561,3561,.second,.plus,2⟩]⟩,
  ⟨[10707, 15485], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨83,1,19,.first,.reverseMinus,6⟩,⟨10707,83,83,.second,.reverseMinus,7⟩,⟨121,19,83,.first,.reverseMinus,1⟩,⟨15485,3,121,.second,.plus,7⟩]⟩,
  ⟨[10707, 30969], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨83,3,5,.second,.reverseMinus,4⟩,⟨10707,83,83,.second,.reverseMinus,7⟩,⟨10323,3,10707,.first,.minus,7⟩,⟨30969,10323,10323,.second,.plus,2⟩]⟩,
  ⟨[10721, 24779], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨417,1,161,.first,.reverseMinus,8⟩,⟨10721,161,417,.first,.reverseMinus,6⟩,⟨12389,417,10721,.first,.reverseMinus,2⟩,⟨24779,1,12389,.second,.reverseMinus,1⟩]⟩,
  ⟨[10755, 30953], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨12291,3,3,.second,.reverseMinus,12⟩,⟨10755,3,12291,.first,.minus,9⟩,⟨30729,12291,10755,.second,.plus,2⟩,⟨30953,7,30729,.first,.reverseMinus,5⟩]⟩,
  ⟨[10759, 12357], [⟨3,1,1,.second,.plus,2⟩,⟨1537,1,3,.second,.reverseMinus,9⟩,⟨61,1,3,.first,.plus,6⟩,⟨10759,1537,1537,.second,.plus,3⟩,⟨12357,1537,61,.first,.reverseMinus,3⟩]⟩,
  ⟨[10759, 24713], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1529,3,7,.first,.plus,9⟩,⟨10759,3,1529,.first,.plus,12⟩,⟨24457,7,1529,.second,.plus,4⟩,⟨24713,1,24457,.first,.reverseMinus,8⟩]⟩,
  ⟨[10803, 30937], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨12243,3,45,.first,.plus,12⟩,⟨10803,45,12243,.first,.minus,5⟩,⟨30969,12243,10803,.second,.plus,2⟩,⟨30937,1,30969,.first,.minus,5⟩]⟩,
  ⟨[10815, 12307], [⟨3,1,1,.second,.plus,2⟩,⟨769,1,3,.second,.reverseMinus,8⟩,⟨12307,3,769,.second,.reverseMinus,4⟩,⟨721,3,769,.first,.minus,4⟩,⟨10815,721,721,.second,.plus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank48
