import Q15Upper
namespace Q15Bank24
open Q15Upper
def entries : List Entry := [
  ⟨[3161, 32615], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨47,1,17,.first,.plus,6⟩,⟨153,17,17,.second,.reverseMinus,3⟩,⟨32615,1,153,.first,.plus,15⟩,⟨3161,47,153,.first,.reverseMinus,6⟩]⟩,
  ⟨[3193, 30177], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨639,1,5,.second,.plus,7⟩,⟨479,5,639,.first,.minus,5⟩,⟨3193,639,479,.second,.plus,3⟩,⟨30177,479,479,.second,.plus,6⟩]⟩,
  ⟨[3211, 16305], [⟨15,1,1,.second,.plus,4⟩,⟨1039,1,15,.first,.reverseMinus,10⟩,⟨945,15,15,.second,.plus,6⟩,⟨16305,15,945,.first,.reverseMinus,10⟩,⟨3211,1039,945,.first,.plus,2⟩]⟩,
  ⟨[3211, 32611], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨2827,11,11,.second,.reverseMinus,8⟩,⟨3211,3,2827,.first,.reverseMinus,7⟩,⟨28515,2827,3211,.second,.reverseMinus,3⟩,⟨32611,1,28515,.first,.reverseMinus,12⟩]⟩,
  ⟨[3221, 32129], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨125,1,129,.first,.minus,2⟩,⟨387,1,125,.first,.plus,9⟩,⟨32129,129,125,.second,.reverseMinus,8⟩,⟨3221,125,387,.second,.reverseMinus,3⟩]⟩,
  ⟨[3229, 20159], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨315,5,5,.second,.plus,6⟩,⟨20159,1,315,.second,.plus,6⟩,⟨443,1,315,.first,.reverseMinus,7⟩,⟨3229,315,443,.second,.plus,3⟩]⟩,
  ⟨[3233, 20121], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨2111,1,33,.second,.plus,6⟩,⟨25,1,33,.first,.minus,3⟩,⟨3233,33,25,.second,.reverseMinus,7⟩,⟨20121,2111,3233,.first,.reverseMinus,3⟩]⟩,
  ⟨[3239, 15049], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨2159,17,17,.second,.plus,7⟩,⟨2151,1,2159,.first,.minus,3⟩,⟨3239,17,2151,.first,.reverseMinus,6⟩,⟨15049,2159,2151,.second,.plus,3⟩]⟩,
  ⟨[3239, 30097], [⟨15,1,1,.second,.plus,4⟩,⟨465,15,15,.second,.plus,5⟩,⟨463,1,465,.first,.minus,1⟩,⟨3239,465,463,.second,.plus,3⟩,⟨30097,465,463,.second,.reverseMinus,6⟩]⟩,
  ⟨[3261, 16303], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨3261,3,51,.second,.plus,6⟩,⟨6521,1,3261,.second,.plus,1⟩,⟨16303,3261,6521,.second,.reverseMinus,1⟩]⟩,
  ⟨[3261, 32605], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨3261,3,51,.second,.plus,6⟩,⟨6521,1,3261,.second,.plus,1⟩,⟨32605,6521,6521,.second,.reverseMinus,2⟩]⟩,
  ⟨[3275, 9841], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨655,1,41,.second,.plus,4⟩,⟨9841,41,655,.first,.plus,8⟩,⟨3275,655,655,.second,.reverseMinus,2⟩]⟩,
  ⟨[3275, 19681], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨3275,11,51,.second,.reverseMinus,6⟩,⟨3297,11,3275,.first,.reverseMinus,1⟩,⟨19681,1,3297,.first,.reverseMinus,14⟩]⟩,
  ⟨[3285, 15009], [⟨15,1,1,.second,.plus,4⟩,⟨11,1,15,.first,.minus,2⟩,⟨469,15,11,.first,.plus,5⟩,⟨15009,1,469,.second,.reverseMinus,5⟩,⟨3285,11,469,.first,.reverseMinus,8⟩]⟩,
  ⟨[3285, 30017], [⟨15,1,1,.second,.plus,4⟩,⟨11,1,15,.first,.minus,2⟩,⟨469,15,11,.first,.plus,5⟩,⟨30017,1,469,.second,.reverseMinus,6⟩,⟨3285,11,469,.first,.reverseMinus,8⟩]⟩,
  ⟨[3295, 16049], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨223,1,7,.second,.plus,5⟩,⟨3295,3,223,.first,.reverseMinus,10⟩,⟨335,7,223,.first,.reverseMinus,4⟩,⟨16049,1,335,.first,.plus,14⟩]⟩,
  ⟨[3295, 32099], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨223,1,7,.second,.plus,5⟩,⟨3295,3,223,.first,.reverseMinus,10⟩,⟨669,223,223,.second,.plus,2⟩,⟨32099,1,669,.first,.plus,15⟩]⟩,
  ⟨[3311, 4075], [⟨255,1,1,.second,.plus,8⟩,⟨191,1,255,.first,.minus,6⟩,⟨3311,255,191,.second,.reverseMinus,4⟩,⟨4075,191,3311,.first,.reverseMinus,2⟩]⟩,
  ⟨[3311, 32601], [⟨255,1,1,.second,.plus,8⟩,⟨191,1,255,.first,.minus,6⟩,⟨6113,1,191,.second,.reverseMinus,5⟩,⟨3311,255,191,.second,.reverseMinus,4⟩,⟨32601,6113,3311,.second,.reverseMinus,3⟩]⟩,
  ⟨[3327, 9557], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨3327,3,255,.first,.reverseMinus,10⟩,⟨299,11,255,.first,.reverseMinus,2⟩,⟨9557,11,299,.second,.plus,5⟩]⟩,
  ⟨[3327, 19113], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨3327,1,13,.second,.plus,8⟩,⟨3415,11,3327,.first,.reverseMinus,3⟩,⟨19113,11,3415,.first,.plus,11⟩]⟩,
  ⟨[3331, 29937], [⟨255,1,1,.second,.plus,8⟩,⟨1793,1,255,.first,.plus,11⟩,⟨1761,1,1793,.first,.minus,5⟩,⟨3331,255,1793,.second,.plus,1⟩,⟨29937,1761,1761,.second,.reverseMinus,4⟩]⟩,
  ⟨[3361, 8149], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨479,1,15,.second,.plus,5⟩,⟨3361,15,479,.first,.plus,8⟩,⟨8143,479,479,.second,.reverseMinus,4⟩,⟨8149,3,8143,.first,.reverseMinus,1⟩]⟩,
  ⟨[3361, 32595], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨209,3,17,.first,.reverseMinus,6⟩,⟨3361,17,209,.second,.reverseMinus,4⟩,⟨2173,3,17,.second,.plus,7⟩,⟨32595,2173,2173,.second,.plus,4⟩]⟩,
  ⟨[3369, 8017], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨125,1,3,.first,.plus,7⟩,⟨8017,17,125,.second,.reverseMinus,6⟩,⟨419,17,125,.first,.plus,5⟩,⟨3369,17,419,.second,.reverseMinus,3⟩]⟩,
  ⟨[3369, 32067], [⟨127,1,1,.second,.plus,7⟩,⟨191,1,127,.first,.reverseMinus,6⟩,⟨445,127,191,.first,.reverseMinus,1⟩,⟨32067,127,445,.first,.plus,8⟩,⟨3369,191,445,.second,.plus,3⟩]⟩,
  ⟨[3377, 14927], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨143,1,9,.second,.plus,4⟩,⟨55,1,9,.first,.plus,6⟩,⟨3377,143,55,.second,.plus,6⟩,⟨14927,143,3377,.first,.plus,7⟩]⟩,
  ⟨[3377, 29855], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨3329,1,13,.second,.reverseMinus,8⟩,⟨3377,3,3329,.first,.reverseMinus,4⟩,⟨2913,13,3329,.first,.minus,5⟩,⟨29855,1,2913,.first,.plus,15⟩]⟩,
  ⟨[3381, 18497], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨845,13,13,.second,.reverseMinus,6⟩,⟨3381,1,845,.second,.reverseMinus,2⟩,⟨2113,845,3381,.output,.plus,1⟩,⟨18497,1,2113,.first,.reverseMinus,14⟩]⟩,
  ⟨[3393, 16029], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨53,3,7,.second,.plus,3⟩,⟨3393,1,53,.second,.reverseMinus,6⟩,⟨501,7,53,.first,.reverseMinus,6⟩,⟨16029,3,501,.second,.plus,5⟩]⟩,
  ⟨[3393, 32057], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨53,3,7,.second,.plus,3⟩,⟨3393,1,53,.second,.reverseMinus,6⟩,⟨32065,7,3393,.first,.reverseMinus,12⟩,⟨32057,1,32065,.first,.minus,3⟩]⟩,
  ⟨[3411, 16295], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨83,3,13,.first,.plus,5⟩,⟨3411,13,83,.first,.reverseMinus,8⟩,⟨89,3,83,.first,.reverseMinus,1⟩,⟨16295,1,89,.first,.plus,14⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank24
