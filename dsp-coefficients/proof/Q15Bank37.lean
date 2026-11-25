import Q15Upper
namespace Q15Bank37
open Q15Upper
def entries : List Entry := [
  ⟨[6491, 16059], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨16059,5,251,.second,.plus,6⟩,⟨347,3,251,.first,.reverseMinus,5⟩,⟨6491,3,347,.first,.reverseMinus,11⟩]⟩,
  ⟨[6491, 32119], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨119,3,125,.first,.minus,1⟩,⟨32119,125,119,.first,.reverseMinus,8⟩,⟨827,125,119,.second,.plus,3⟩,⟨6491,125,827,.second,.plus,3⟩]⟩,
  ⟨[6501, 15039], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨235,1,21,.first,.plus,8⟩,⟨15039,1,235,.second,.plus,6⟩,⟨357,21,21,.second,.reverseMinus,4⟩,⟨6501,3,357,.first,.reverseMinus,11⟩]⟩,
  ⟨[6501, 30077], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨235,1,21,.first,.plus,8⟩,⟨30077,3,235,.second,.plus,7⟩,⟨357,21,21,.second,.reverseMinus,4⟩,⟨6501,3,357,.first,.reverseMinus,11⟩]⟩,
  ⟨[6527, 9901], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨6527,1,51,.second,.plus,7⟩,⟨6483,11,6527,.first,.minus,2⟩,⟨9901,1,6483,.first,.plus,14⟩]⟩,
  ⟨[6527, 19801], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨383,1,3,.second,.plus,7⟩,⟨6527,3,383,.first,.reverseMinus,11⟩,⟨345,19,383,.first,.minus,1⟩,⟨19801,19,345,.first,.reverseMinus,10⟩]⟩,
  ⟨[6541, 8027], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨8027,5,251,.second,.plus,5⟩,⟨211,5,251,.first,.minus,3⟩,⟨6541,211,211,.second,.plus,5⟩]⟩,
  ⟨[6541, 32109], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨51,1,13,.second,.plus,2⟩,⟨6541,13,51,.second,.reverseMinus,7⟩,⟨973,1,51,.first,.plus,10⟩,⟨32109,973,973,.second,.reverseMinus,5⟩]⟩,
  ⟨[6547, 15019], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨235,1,21,.first,.plus,8⟩,⟨15019,21,235,.second,.plus,6⟩,⟨1645,235,235,.second,.plus,3⟩,⟨6547,1,1645,.first,.plus,13⟩]⟩,
  ⟨[6547, 30037], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨3081,1,385,.second,.reverseMinus,3⟩,⟨6547,385,3081,.second,.reverseMinus,1⟩,⟨29269,3081,6547,.second,.reverseMinus,2⟩,⟨30037,3,29269,.first,.reverseMinus,8⟩]⟩,
  ⟨[6565, 19601], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨91,13,13,.second,.plus,3⟩,⟨6565,13,91,.first,.plus,9⟩,⟨4901,13,6565,.first,.minus,7⟩,⟨19601,3,4901,.second,.plus,2⟩]⟩,
  ⟨[6589, 16049], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨6589,13,67,.first,.plus,9⟩,⟨335,67,67,.second,.reverseMinus,2⟩,⟨16049,1,335,.first,.plus,14⟩]⟩,
  ⟨[6589, 32099], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨445,3,7,.second,.plus,6⟩,⟨6589,3,445,.first,.reverseMinus,11⟩,⟨669,7,445,.first,.reverseMinus,5⟩,⟨32099,1,669,.first,.plus,15⟩]⟩,
  ⟨[6593, 14999], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨825,7,13,.second,.plus,6⟩,⟨6593,7,825,.second,.plus,3⟩,⟨937,7,825,.first,.reverseMinus,4⟩,⟨14999,7,937,.second,.reverseMinus,4⟩]⟩,
  ⟨[6593, 29997], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨1875,125,125,.second,.plus,4⟩,⟨29997,3,1875,.second,.plus,4⟩,⟨26247,1875,29997,.first,.minus,1⟩,⟨6593,125,26247,.output,.plus,2⟩]⟩,
  ⟨[6595, 19439], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨6207,1,97,.second,.plus,6⟩,⟨6595,97,6207,.first,.reverseMinus,2⟩,⟨3055,97,6207,.output,.reverseMinus,1⟩,⟨19439,1,3055,.first,.reverseMinus,14⟩]⟩,
  ⟨[6617, 9659], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1023,1,1,.second,.plus,10⟩,⟨955,17,1023,.first,.minus,2⟩,⟨9659,17,955,.first,.reverseMinus,9⟩,⟨6617,1023,955,.second,.plus,3⟩]⟩,
  ⟨[6617, 19317], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨3315,13,13,.second,.plus,8⟩,⟨6617,13,3315,.second,.plus,1⟩,⟨29835,3315,3315,.second,.reverseMinus,3⟩,⟨19317,3,29835,.first,.plus,14⟩]⟩,
  ⟨[6639, 7489], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨13,1,9,.first,.reverseMinus,2⟩,⟨6657,1,13,.second,.reverseMinus,9⟩,⟨6639,9,6657,.first,.minus,1⟩,⟨7489,13,6657,.first,.reverseMinus,6⟩]⟩,
  ⟨[6639, 29957], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨415,1,13,.second,.plus,5⟩,⟨6639,1,415,.second,.plus,4⟩,⟨3333,13,415,.second,.reverseMinus,3⟩,⟨29957,13,3333,.first,.reverseMinus,11⟩]⟩,
  ⟨[6639, 32089], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨415,1,97,.first,.plus,9⟩,⟨6639,1,415,.second,.plus,4⟩,⟨679,97,97,.second,.plus,3⟩,⟨32089,1,679,.first,.plus,15⟩]⟩,
  ⟨[6683, 9475], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨8195,1,3,.first,.reverseMinus,13⟩,⟨9475,5,8195,.first,.reverseMinus,8⟩,⟨6659,3,8195,.first,.minus,9⟩,⟨6683,3,6659,.first,.reverseMinus,3⟩]⟩,
  ⟨[6683, 18951], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨6657,1,13,.second,.reverseMinus,9⟩,⟨6683,13,6657,.first,.reverseMinus,1⟩,⟨6663,3,6657,.first,.reverseMinus,1⟩,⟨18951,3,6663,.first,.reverseMinus,12⟩]⟩,
  ⟨[6685, 7479], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨6685,13,29,.first,.reverseMinus,9⟩,⟨1869,13,29,.second,.reverseMinus,6⟩,⟨7479,3,1869,.second,.reverseMinus,2⟩]⟩,
  ⟨[6685, 29915], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨6685,13,29,.first,.reverseMinus,9⟩,⟨3741,29,29,.second,.reverseMinus,7⟩,⟨29915,13,3741,.second,.plus,3⟩]⟩,
  ⟨[6689, 16039], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨209,3,17,.first,.reverseMinus,6⟩,⟨6689,1,209,.second,.reverseMinus,5⟩,⟨345,17,209,.first,.reverseMinus,3⟩,⟨16039,1,345,.first,.plus,14⟩]⟩,
  ⟨[6689, 32079], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨1503,3,33,.first,.plus,9⟩,⟨6689,1,1503,.first,.plus,13⟩,⟨1887,3,1503,.first,.reverseMinus,7⟩,⟨32079,1887,1887,.second,.reverseMinus,4⟩]⟩,
  ⟨[6705, 9413], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨2063,1,129,.second,.plus,4⟩,⟨2321,129,2063,.first,.reverseMinus,1⟩,⟨9413,129,2321,.second,.reverseMinus,2⟩,⟨6705,2063,2321,.second,.reverseMinus,1⟩]⟩,
  ⟨[6705, 18827], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨209,3,17,.first,.reverseMinus,6⟩,⟨6705,17,209,.second,.reverseMinus,5⟩,⟨2353,17,6705,.first,.minus,8⟩,⟨18827,3,2353,.second,.reverseMinus,3⟩]⟩,
  ⟨[6731, 14937], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨53,3,7,.second,.plus,3⟩,⟨6731,53,53,.second,.plus,7⟩,⟨6745,7,6731,.first,.reverseMinus,1⟩,⟨14937,1,6745,.first,.reverseMinus,13⟩]⟩,
  ⟨[6731, 29875], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨53,3,29,.first,.reverseMinus,3⟩,⟨6731,53,53,.second,.plus,7⟩,⟨13491,29,6731,.second,.reverseMinus,1⟩,⟨29875,1,13491,.first,.reverseMinus,14⟩]⟩,
  ⟨[6737, 8017], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨5969,47,47,.second,.plus,7⟩,⟨8017,1,5969,.first,.reverseMinus,11⟩,⟨6737,3,5969,.first,.reverseMinus,8⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank37
