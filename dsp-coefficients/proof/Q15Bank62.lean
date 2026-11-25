import Q15Upper
namespace Q15Bank62
open Q15Upper
def entries : List Entry := [
  ⟨[21021, 25137], [⟨513,1,1,.second,.reverseMinus,9⟩,⟨1023,1,1,.second,.plus,10⟩,⟨16929,513,513,.second,.reverseMinus,5⟩,⟨25137,513,16929,.first,.reverseMinus,4⟩,⟨21021,1023,16929,.first,.reverseMinus,2⟩]⟩,
  ⟨[21059, 25105], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨329,47,47,.second,.plus,3⟩,⟨21059,3,329,.second,.reverseMinus,6⟩,⟨21009,47,329,.second,.plus,6⟩,⟨25105,1,21009,.first,.reverseMinus,12⟩]⟩,
  ⟨[21097, 25073], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨497,1,15,.first,.plus,9⟩,⟨25073,3,497,.first,.reverseMinus,13⟩,⟨21097,497,25073,.first,.minus,3⟩]⟩,
  ⟨[21135, 25041], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨1409,1,11,.second,.reverseMinus,7⟩,⟨21135,1409,1409,.second,.plus,4⟩,⟨1473,1,1409,.first,.reverseMinus,6⟩,⟨25041,1473,1473,.second,.reverseMinus,4⟩]⟩,
  ⟨[21173, 25009], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨433,3,385,.first,.reverseMinus,4⟩,⟨25009,3,433,.first,.reverseMinus,13⟩,⟨2647,385,433,.first,.plus,3⟩,⟨21173,3,2647,.second,.plus,3⟩]⟩,
  ⟨[21213, 24975], [⟨3,1,1,.second,.plus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨24579,3,3,.second,.reverseMinus,13⟩,⟨24975,99,24579,.first,.reverseMinus,2⟩,⟨21411,99,24579,.first,.minus,5⟩,⟨21213,99,21411,.first,.minus,1⟩]⟩,
  ⟨[21251, 24943], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨24579,3,3,.second,.reverseMinus,13⟩,⟨21251,13,24579,.first,.minus,8⟩,⟨24527,13,24579,.first,.minus,2⟩,⟨24943,13,24527,.first,.reverseMinus,5⟩]⟩,
  ⟨[21289, 24911], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨177,1,49,.first,.reverseMinus,7⟩,⟨24911,49,177,.first,.plus,9⟩,⟨2655,177,177,.second,.plus,4⟩,⟨21289,49,2655,.second,.reverseMinus,3⟩]⟩,
  ⟨[21327, 24877], [⟨15,1,1,.second,.plus,4⟩,⟨49,1,15,.first,.plus,6⟩,⟨6223,49,49,.second,.plus,7⟩,⟨24877,15,6223,.second,.plus,2⟩,⟨21583,15,6223,.first,.reverseMinus,10⟩,⟨21327,1,21583,.first,.minus,8⟩]⟩,
  ⟨[21365, 24845], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨24589,3,13,.first,.reverseMinus,13⟩,⟨24845,1,24589,.first,.reverseMinus,8⟩,⟨21261,13,24589,.first,.minus,8⟩,⟨21365,13,21261,.first,.reverseMinus,3⟩]⟩,
  ⟨[21403, 24813], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨21,1,5,.second,.reverseMinus,2⟩,⟨1339,5,21,.second,.plus,6⟩,⟨21403,21,1339,.second,.plus,4⟩,⟨2757,1,1339,.first,.plus,12⟩,⟨24813,2757,2757,.second,.reverseMinus,3⟩]⟩,
  ⟨[21441, 24779], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨3135,1,49,.second,.plus,6⟩,⟨21441,3,3135,.first,.plus,13⟩,⟨12491,49,3135,.second,.plus,2⟩,⟨24779,3,12491,.first,.reverseMinus,12⟩]⟩,
  ⟨[21479, 24747], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨3091,3,19,.first,.reverseMinus,10⟩,⟨24747,19,3091,.second,.reverseMinus,3⟩,⟨3097,3,3091,.first,.reverseMinus,1⟩,⟨21479,3,3097,.first,.plus,13⟩]⟩,
  ⟨[21517, 24713], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨24713,9,193,.second,.reverseMinus,7⟩,⟨1345,9,193,.first,.reverseMinus,7⟩,⟨21517,3,1345,.second,.plus,4⟩]⟩,
  ⟨[21555, 24681], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨105,3,9,.first,.reverseMinus,5⟩,⟨24681,3,105,.first,.reverseMinus,13⟩,⟨43113,9,24681,.first,.reverseMinus,11⟩,⟨21555,3,43113,.output,.reverseMinus,1⟩]⟩,
  ⟨[21593, 24647], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨71,1,9,.second,.plus,3⟩,⟨24647,3,71,.first,.reverseMinus,13⟩,⟨24665,9,24647,.first,.reverseMinus,1⟩,⟨21593,3,24665,.first,.minus,10⟩]⟩,
  ⟨[21631, 24615], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨24575,1,3,.second,.plus,13⟩,⟨24615,5,24575,.first,.reverseMinus,3⟩,⟨21503,3,24575,.first,.minus,10⟩,⟨21631,1,21503,.first,.reverseMinus,7⟩]⟩,
  ⟨[21669, 24581], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨91,3,5,.first,.plus,5⟩,⟨24581,3,5,.first,.reverseMinus,13⟩,⟨21669,91,24581,.first,.minus,5⟩]⟩,
  ⟨[21707, 24547], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨355,3,29,.first,.plus,7⟩,⟨24547,3,29,.first,.plus,13⟩,⟨21707,355,24547,.first,.minus,3⟩]⟩,
  ⟨[21743, 24515], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨24515,3,61,.first,.plus,13⟩,⟨1279,1,5,.second,.plus,8⟩,⟨21743,1279,1279,.second,.reverseMinus,4⟩]⟩,
  ⟨[21781, 24481], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨85,5,5,.second,.reverseMinus,4⟩,⟨21761,1,85,.second,.reverseMinus,8⟩,⟨21781,5,21761,.first,.reverseMinus,2⟩,⟨24481,85,21761,.first,.reverseMinus,5⟩]⟩,
  ⟨[21819, 24447], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨24447,3,129,.first,.plus,13⟩,⟨315,21,21,.second,.plus,4⟩,⟨21819,21,315,.first,.reverseMinus,10⟩]⟩,
  ⟨[21857, 24415], [⟨31,1,1,.second,.plus,5⟩,⟨95,1,31,.first,.reverseMinus,6⟩,⟨343,31,95,.first,.reverseMinus,3⟩,⟨24415,95,95,.second,.reverseMinus,8⟩,⟨21857,95,343,.second,.plus,6⟩]⟩,
  ⟨[21893, 24381], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨24381,3,195,.first,.plus,13⟩,⟨24965,5,195,.second,.reverseMinus,7⟩,⟨21893,3,24965,.first,.minus,10⟩]⟩,
  ⟨[21931, 24347], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨85,5,5,.second,.reverseMinus,4⟩,⟨171,1,85,.second,.reverseMinus,1⟩,⟨21931,85,171,.first,.reverseMinus,8⟩,⟨24667,171,21931,.first,.reverseMinus,4⟩,⟨24347,5,24667,.first,.minus,6⟩]⟩,
  ⟨[21969, 24313], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨49,1,17,.first,.reverseMinus,5⟩,⟨25105,17,49,.second,.reverseMinus,9⟩,⟨21969,49,25105,.first,.minus,6⟩,⟨24321,49,25105,.first,.minus,4⟩,⟨24313,1,24321,.first,.minus,3⟩]⟩,
  ⟨[22005, 24279], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨3083,3,385,.second,.reverseMinus,3⟩,⟨24279,385,3083,.second,.plus,3⟩,⟨21493,3,3083,.first,.plus,13⟩,⟨22005,1,21493,.first,.reverseMinus,9⟩]⟩,
  ⟨[22043, 24245], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨13851,27,27,.second,.reverseMinus,9⟩,⟨22043,1,13851,.first,.reverseMinus,13⟩,⟨12123,27,13851,.first,.minus,6⟩,⟨24245,1,12123,.second,.plus,1⟩]⟩,
  ⟨[22081, 24211], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨345,23,23,.second,.plus,4⟩,⟨22081,1,345,.second,.reverseMinus,6⟩,⟨365,3,23,.second,.plus,4⟩,⟨24211,3,365,.first,.plus,13⟩]⟩,
  ⟨[22117, 24177], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨189,3,3,.second,.plus,6⟩,⟨24177,15,189,.second,.plus,7⟩,⟨24165,3,24177,.first,.minus,2⟩,⟨22117,1,24165,.first,.minus,11⟩]⟩,
  ⟨[22155, 24145], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨1509,3,27,.first,.plus,9⟩,⟨24145,1,1509,.second,.reverseMinus,4⟩,⟨1477,1,1509,.first,.minus,5⟩,⟨22155,1477,1477,.second,.plus,4⟩]⟩,
  ⟨[22191, 24109], [⟨15,1,1,.second,.plus,4⟩,⟨47,1,15,.first,.reverseMinus,5⟩,⟨24111,47,47,.second,.reverseMinus,9⟩,⟨24109,1,24111,.first,.minus,1⟩,⟨22191,15,24111,.first,.minus,7⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank62
