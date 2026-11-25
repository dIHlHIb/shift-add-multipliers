import Q15Upper
namespace Q15Bank63
open Q15Upper
def entries : List Entry := [
  ⟨[22229, 24075], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨321,1,5,.second,.reverseMinus,6⟩,⟨1605,321,321,.second,.reverseMinus,2⟩,⟨24075,1605,1605,.second,.plus,4⟩,⟨22149,321,1605,.first,.reverseMinus,6⟩,⟨22229,5,22149,.first,.reverseMinus,4⟩]⟩,
  ⟨[22265, 24041], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨47,1,3,.second,.plus,4⟩,⟨24041,23,47,.second,.plus,9⟩,⟨23289,47,24041,.first,.minus,4⟩,⟨22265,1,23289,.first,.minus,10⟩]⟩,
  ⟨[22301, 24007], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨2275,35,35,.second,.reverseMinus,6⟩,⟨22301,3,2275,.first,.plus,13⟩,⟨569,1,2275,.output,.plus,2⟩,⟨24007,3,569,.first,.plus,13⟩]⟩,
  ⟨[22339, 23973], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨24067,3,47,.second,.reverseMinus,9⟩,⟨23973,47,24067,.first,.minus,1⟩,⟨22531,3,24067,.first,.minus,9⟩,⟨22339,3,22531,.first,.minus,6⟩]⟩,
  ⟨[22375, 23939], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨187,3,23,.second,.reverseMinus,3⟩,⟨23939,3,187,.second,.reverseMinus,7⟩,⟨22467,23,23939,.first,.minus,6⟩,⟨22375,23,22467,.first,.minus,2⟩]⟩,
  ⟨[22413, 23905], [⟨3,1,1,.second,.plus,2⟩,⟨93,3,3,.second,.plus,5⟩,⟨23901,93,93,.second,.reverseMinus,8⟩,⟨23905,1,23901,.first,.reverseMinus,2⟩,⟨22413,93,23901,.first,.minus,4⟩]⟩,
  ⟨[22449, 23871], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨705,1,11,.second,.reverseMinus,6⟩,⟨23871,3,705,.first,.plus,13⟩,⟨22461,705,23871,.first,.minus,1⟩,⟨22449,3,22461,.first,.minus,2⟩]⟩,
  ⟨[22485, 23835], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨93,3,3,.second,.plus,5⟩,⟨23835,27,93,.second,.reverseMinus,8⟩,⟨24021,93,23835,.first,.reverseMinus,1⟩,⟨22485,3,24021,.first,.minus,9⟩]⟩,
  ⟨[22521, 23801], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨24569,3,7,.first,.plus,13⟩,⟨22521,1,24569,.first,.minus,11⟩,⟨23801,3,24569,.first,.minus,8⟩]⟩,
  ⟨[22559, 23767], [⟨31,1,1,.second,.plus,5⟩,⟨23,1,31,.first,.minus,3⟩,⟨23583,31,23,.second,.reverseMinus,10⟩,⟨22559,1,23583,.first,.minus,10⟩,⟨23767,23,23583,.first,.reverseMinus,3⟩]⟩,
  ⟨[22595, 23733], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨353,1,11,.second,.reverseMinus,5⟩,⟨22595,3,353,.second,.reverseMinus,6⟩,⟨25419,353,22595,.first,.reverseMinus,3⟩,⟨23733,3,25419,.first,.plus,14⟩]⟩,
  ⟨[22631, 23697], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨21,1,17,.first,.reverseMinus,2⟩,⟨185,17,21,.second,.reverseMinus,3⟩,⟨23697,17,185,.second,.reverseMinus,7⟩,⟨23655,21,23697,.first,.minus,1⟩,⟨22631,1,23655,.first,.minus,10⟩]⟩,
  ⟨[22667, 23663], [⟨7,1,1,.second,.plus,3⟩,⟨11,1,7,.first,.reverseMinus,2⟩,⟨139,1,11,.first,.reverseMinus,7⟩,⟨22667,11,139,.first,.reverseMinus,11⟩,⟨22639,7,22667,.first,.minus,2⟩,⟨23663,1,22639,.first,.reverseMinus,10⟩]⟩,
  ⟨[22703, 23627], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨11,1,5,.second,.reverseMinus,1⟩,⟨1419,11,11,.second,.reverseMinus,7⟩,⟨22703,1,1419,.second,.plus,4⟩,⟨23947,11,1419,.first,.reverseMinus,11⟩,⟨23627,5,23947,.first,.minus,6⟩]⟩,
  ⟨[22741, 23593], [⟨7,1,1,.second,.plus,3⟩,⟨11,1,7,.first,.reverseMinus,2⟩,⟨213,7,11,.first,.plus,5⟩,⟨22741,11,213,.first,.reverseMinus,11⟩,⟨23593,213,22741,.first,.reverseMinus,2⟩]⟩,
  ⟨[22777, 23559], [⟨7,1,1,.second,.plus,3⟩,⟨23,1,7,.first,.reverseMinus,4⟩,⟨28665,7,7,.second,.plus,12⟩,⟨23559,7,23,.second,.reverseMinus,10⟩,⟨22777,23,28665,.first,.minus,8⟩]⟩,
  ⟨[22813, 23523], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨29,1,3,.first,.plus,5⟩,⟨23523,23,29,.first,.plus,10⟩,⟨713,23,23,.second,.plus,5⟩,⟨22813,3,713,.second,.plus,5⟩]⟩,
  ⟨[22849, 23489], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨23,5,63,.first,.minus,3⟩,⟨23489,63,23,.second,.plus,10⟩,⟨22849,5,23489,.first,.minus,7⟩]⟩,
  ⟨[22885, 23453], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨23453,23,99,.first,.plus,10⟩,⟨23269,23,23453,.first,.minus,3⟩,⟨22885,3,23269,.first,.minus,7⟩]⟩,
  ⟨[22921, 23417], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨1527,1,191,.second,.plus,3⟩,⟨22921,191,1527,.first,.plus,7⟩,⟨22905,1,22921,.first,.minus,4⟩,⟨23417,1,22905,.first,.reverseMinus,9⟩]⟩,
  ⟨[22957, 23383], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨365,3,23,.second,.plus,4⟩,⟨23383,23,365,.second,.reverseMinus,6⟩,⟨23725,365,365,.second,.reverseMinus,6⟩,⟨22957,3,23725,.first,.minus,8⟩]⟩,
  ⟨[22993, 23347], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨47,1,3,.second,.plus,4⟩,⟨22993,45,47,.first,.plus,9⟩,⟨1459,45,47,.second,.plus,5⟩,⟨23347,3,1459,.second,.reverseMinus,4⟩]⟩,
  ⟨[23027, 23313], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨23043,3,45,.second,.reverseMinus,9⟩,⟨23027,1,23043,.first,.minus,4⟩,⟨22953,45,23043,.first,.minus,1⟩,⟨23313,45,22953,.first,.reverseMinus,3⟩]⟩,
  ⟨[23063, 23277], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨45,1,23,.second,.plus,1⟩,⟨23063,23,45,.second,.reverseMinus,9⟩,⟨23085,45,45,.second,.reverseMinus,9⟩,⟨23277,3,23085,.first,.reverseMinus,6⟩]⟩,
  ⟨[23099, 23241], [⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨183,7,71,.first,.reverseMinus,4⟩,⟨23241,183,183,.second,.plus,7⟩,⟨23099,71,23241,.first,.minus,1⟩]⟩,
  ⟨[23135, 23205], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨45,5,5,.second,.reverseMinus,3⟩,⟨23045,5,45,.second,.reverseMinus,9⟩,⟨23205,5,23045,.first,.reverseMinus,5⟩,⟨23135,45,23045,.first,.reverseMinus,1⟩]⟩,
  ⟨[23171], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨181,3,11,.first,.plus,6⟩,⟨23171,3,181,.second,.reverseMinus,7⟩]⟩,
  ⟨[32767], [⟨32767,1,1,.second,.plus,15⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank63
