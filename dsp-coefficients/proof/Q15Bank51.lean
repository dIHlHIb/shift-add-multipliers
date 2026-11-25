import Q15Upper
namespace Q15Bank51
open Q15Upper
def entries : List Entry := [
  ⟨[11793, 30573], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨237,3,15,.second,.plus,4⟩,⟨30573,237,237,.second,.reverseMinus,7⟩,⟨495,15,15,.second,.reverseMinus,5⟩,⟨11793,3,495,.first,.plus,12⟩]⟩,
  ⟨[11797, 22741], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨23,1,3,.second,.plus,3⟩,⟨11797,21,23,.second,.reverseMinus,9⟩,⟨10453,21,11797,.first,.minus,6⟩,⟨22741,3,10453,.first,.reverseMinus,12⟩]⟩,
  ⟨[11831, 22667], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨139,1,11,.first,.reverseMinus,7⟩,⟨22667,11,139,.first,.reverseMinus,11⟩,⟨567,11,139,.second,.reverseMinus,2⟩,⟨11831,11,567,.first,.reverseMinus,10⟩]⟩,
  ⟨[11839, 15277], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨12221,3,191,.second,.plus,6⟩,⟨11839,191,12221,.first,.minus,1⟩,⟨15277,191,12221,.first,.reverseMinus,4⟩]⟩,
  ⟨[11839, 30555], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨6111,3,33,.first,.plus,11⟩,⟨30555,6111,6111,.second,.reverseMinus,2⟩,⟨5919,3,6111,.first,.minus,6⟩,⟨11839,1,5919,.second,.reverseMinus,1⟩]⟩,
  ⟨[11849, 22631], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨371,3,23,.second,.reverseMinus,4⟩,⟨11849,23,371,.second,.plus,5⟩,⟨1113,371,371,.second,.plus,2⟩,⟨22631,371,1113,.first,.plus,6⟩]⟩,
  ⟨[11883, 22559], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨191,1,65,.first,.plus,8⟩,⟨699,65,191,.second,.plus,2⟩,⟨22559,191,699,.second,.reverseMinus,5⟩,⟨11883,699,699,.second,.reverseMinus,4⟩]⟩,
  ⟨[11887, 30535], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨185,3,47,.second,.plus,2⟩,⟨11887,47,185,.second,.reverseMinus,6⟩,⟨2233,1,185,.first,.reverseMinus,11⟩,⟨30535,1,2233,.first,.plus,15⟩]⟩,
  ⟨[11901, 22521], [⟨3,1,1,.second,.plus,2⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨12285,3,3,.second,.plus,12⟩,⟨11901,3,12285,.first,.minus,7⟩,⟨22521,2049,12285,.second,.plus,1⟩]⟩,
  ⟨[11933, 15259], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨373,3,47,.second,.plus,3⟩,⟨11933,3,373,.second,.plus,5⟩,⟨1125,47,373,.first,.reverseMinus,4⟩,⟨15259,1,1125,.first,.plus,14⟩]⟩,
  ⟨[11933, 30517], [⟨15,1,1,.second,.plus,4⟩,⟨29,1,15,.second,.plus,1⟩,⟨93,1,29,.first,.reverseMinus,6⟩,⟨11933,29,93,.second,.reverseMinus,7⟩,⟨203,29,29,.second,.plus,3⟩,⟨30517,15,203,.first,.plus,11⟩]⟩,
  ⟨[11935, 22449], [⟨127,1,1,.second,.plus,7⟩,⟨385,1,127,.first,.plus,9⟩,⟨3207,127,385,.second,.reverseMinus,3⟩,⟨11935,385,385,.second,.plus,5⟩,⟨22449,3207,3207,.second,.plus,3⟩]⟩,
  ⟨[11981, 30499], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨4351,1,17,.second,.plus,8⟩,⟨17425,17,17,.second,.reverseMinus,10⟩,⟨30499,4351,17425,.second,.plus,1⟩,⟨11981,17425,30499,.output,.plus,2⟩]⟩,
  ⟨[11987, 22339], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨349,3,11,.second,.plus,5⟩,⟨22339,3,349,.second,.reverseMinus,6⟩,⟨301,3,349,.first,.minus,4⟩,⟨11987,3,301,.first,.plus,12⟩]⟩,
  ⟨[12021, 22265], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨267,1,11,.first,.reverseMinus,8⟩,⟨12021,3,267,.first,.plus,12⟩,⟨22261,11,267,.first,.plus,11⟩,⟨22265,1,22261,.first,.reverseMinus,2⟩]⟩,
  ⟨[12027, 30481], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨6109,3,191,.second,.plus,5⟩,⟨12027,191,6109,.second,.plus,1⟩,⟨30545,6109,6109,.second,.reverseMinus,2⟩,⟨30481,1,30545,.first,.minus,6⟩]⟩,
  ⟨[12055, 22191], [⟨15,1,1,.second,.plus,4⟩,⟨47,1,15,.first,.reverseMinus,5⟩,⟨24111,47,47,.second,.reverseMinus,9⟩,⟨12055,1,24111,.output,.reverseMinus,1⟩,⟨22191,15,24111,.first,.minus,7⟩]⟩,
  ⟨[12073, 15231], [⟨127,1,1,.second,.plus,7⟩,⟨119,1,127,.first,.minus,3⟩,⟨381,127,127,.second,.plus,2⟩,⟨15231,1,119,.second,.plus,7⟩,⟨12073,119,381,.second,.plus,5⟩]⟩,
  ⟨[12073, 30463], [⟨127,1,1,.second,.plus,7⟩,⟨119,1,127,.first,.minus,3⟩,⟨381,127,127,.second,.plus,2⟩,⟨30463,1,119,.second,.plus,8⟩,⟨12073,119,381,.second,.plus,5⟩]⟩,
  ⟨[12089, 22117], [⟨7,1,1,.second,.plus,3⟩,⟨27,1,7,.second,.plus,2⟩,⟨189,27,27,.second,.plus,3⟩,⟨12089,7,189,.second,.plus,6⟩,⟨24165,27,189,.second,.plus,7⟩,⟨22117,1,24165,.first,.minus,11⟩]⟩,
  ⟨[12121, 30443], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨167,1,21,.second,.plus,3⟩,⟨12121,3,167,.first,.plus,12⟩,⟨42731,21,167,.second,.plus,8⟩,⟨30443,3,42731,.first,.minus,12⟩]⟩,
  ⟨[12123, 22043], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨13851,27,27,.second,.reverseMinus,9⟩,⟨22043,1,13851,.first,.reverseMinus,13⟩,⟨12123,27,13851,.first,.minus,6⟩]⟩,
  ⟨[12157, 21969], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨2429,3,19,.second,.plus,7⟩,⟨12157,19,2429,.first,.reverseMinus,9⟩,⟨21873,2429,12157,.first,.reverseMinus,2⟩,⟨21969,3,21873,.first,.reverseMinus,5⟩]⟩,
  ⟨[12167, 15213], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨95,1,3,.second,.plus,5⟩,⟨12167,7,95,.second,.reverseMinus,7⟩,⟨15207,95,12167,.first,.reverseMinus,5⟩,⟨15213,3,15207,.first,.reverseMinus,1⟩]⟩,
  ⟨[12167, 30425], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨95,1,3,.second,.plus,5⟩,⟨12167,7,95,.second,.reverseMinus,7⟩,⟨6085,3,12167,.output,.plus,1⟩,⟨30425,6085,6085,.second,.reverseMinus,2⟩]⟩,
  ⟨[12173, 21931], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1275,5,5,.second,.plus,8⟩,⟨1531,1,1275,.first,.reverseMinus,8⟩,⟨21931,1275,1531,.first,.reverseMinus,4⟩,⟨1521,5,1531,.first,.minus,1⟩,⟨12173,5,1521,.second,.reverseMinus,3⟩]⟩,
  ⟨[12207, 21857], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨20561,5,81,.first,.reverseMinus,12⟩,⟨12207,1,20561,.first,.plus,15⟩,⟨21857,81,20561,.first,.reverseMinus,4⟩]⟩,
  ⟨[12213, 15203], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨1527,3,9,.first,.plus,9⟩,⟨12213,3,1527,.second,.plus,3⟩,⟨15267,1527,12213,.first,.reverseMinus,1⟩,⟨15203,1,15267,.first,.minus,6⟩]⟩,
  ⟨[12213, 30407], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨123,1,5,.first,.plus,7⟩,⟨763,5,123,.first,.reverseMinus,7⟩,⟨12213,5,763,.second,.reverseMinus,4⟩,⟨15265,763,12213,.first,.reverseMinus,2⟩,⟨30407,123,15265,.second,.plus,1⟩]⟩,
  ⟨[12257, 21743], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨51,17,17,.second,.plus,2⟩,⟨13073,17,51,.second,.reverseMinus,8⟩,⟨21743,17,13073,.first,.plus,11⟩,⟨12257,51,13073,.first,.minus,4⟩]⟩,
  ⟨[12261, 30387], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨6135,3,9,.first,.plus,11⟩,⟨12261,9,6135,.second,.plus,1⟩,⟨30675,6135,6135,.second,.reverseMinus,2⟩,⟨30387,9,30675,.first,.minus,5⟩]⟩,
  ⟨[12307, 21631], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨12289,1,3,.second,.reverseMinus,12⟩,⟨12307,9,12289,.first,.reverseMinus,1⟩,⟨11137,9,12289,.first,.minus,7⟩,⟨21631,1,11137,.first,.plus,15⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank51
