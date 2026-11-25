import Q15Upper
namespace Q15Bank27
open Q15Upper
def entries : List Entry := [
  ⟨[3761, 32551], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨289,1,9,.second,.reverseMinus,5⟩,⟨217,9,289,.first,.minus,3⟩,⟨32551,1,217,.first,.plus,15⟩,⟨3761,289,217,.second,.reverseMinus,4⟩]⟩,
  ⟨[3777, 6339], [⟨3,1,1,.second,.plus,2⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨2241,3,2049,.first,.reverseMinus,6⟩,⟨3777,3,2241,.first,.reverseMinus,9⟩,⟨6339,2049,2241,.first,.reverseMinus,1⟩]⟩,
  ⟨[3777, 12679], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨5125,5,5,.second,.reverseMinus,10⟩,⟨3777,5,4097,.first,.minus,6⟩,⟨12679,5125,3777,.second,.reverseMinus,1⟩]⟩,
  ⟨[3789, 6223], [⟨15,1,1,.second,.plus,4⟩,⟨1919,1,15,.second,.plus,7⟩,⟨49,1,15,.first,.plus,6⟩,⟨3789,1919,49,.first,.plus,1⟩,⟨6223,49,49,.second,.plus,7⟩]⟩,
  ⟨[3789, 12447], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨135,9,9,.second,.plus,4⟩,⟨4329,9,135,.second,.reverseMinus,5⟩,⟨3789,135,4329,.first,.minus,2⟩,⟨12447,4329,3789,.first,.reverseMinus,1⟩]⟩,
  ⟨[3795, 29039], [⟨15,1,1,.second,.plus,4⟩,⟨945,15,15,.second,.plus,6⟩,⟨937,1,945,.first,.minus,3⟩,⟨3795,15,945,.second,.reverseMinus,2⟩,⟨29039,945,937,.second,.plus,5⟩]⟩,
  ⟨[3811, 16273], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨953,9,1025,.first,.minus,3⟩,⟨3811,1,953,.second,.plus,2⟩,⟨16273,1025,953,.second,.reverseMinus,4⟩]⟩,
  ⟨[3811, 32545], [⟨7,1,1,.second,.plus,3⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨1017,1,7,.first,.plus,10⟩,⟨32545,1,1017,.second,.reverseMinus,5⟩,⟨3811,257,1017,.second,.plus,2⟩]⟩,
  ⟨[3817, 5943], [⟨15,1,1,.second,.plus,4⟩,⟨23,1,15,.first,.reverseMinus,3⟩,⟨185,1,23,.second,.reverseMinus,3⟩,⟨3817,15,23,.first,.plus,8⟩,⟨5943,23,185,.second,.reverseMinus,5⟩]⟩,
  ⟨[3817, 11887], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨23,1,3,.second,.plus,3⟩,⟨3817,15,23,.first,.plus,8⟩,⟨11791,15,23,.second,.reverseMinus,9⟩,⟨11887,3,11791,.first,.reverseMinus,5⟩]⟩,
  ⟨[3835, 11511], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨1919,1,15,.second,.plus,7⟩,⟨3835,3,1919,.second,.plus,1⟩,⟨11511,1919,3835,.first,.reverseMinus,2⟩]⟩,
  ⟨[3835, 15929], [⟨7,1,1,.second,.plus,3⟩,⟨2047,1,1,.second,.plus,11⟩,⟨447,1,7,.second,.plus,6⟩,⟨3835,2047,447,.second,.reverseMinus,2⟩,⟨15929,2047,447,.first,.plus,3⟩]⟩,
  ⟨[3835, 31857], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨975,65,65,.second,.plus,4⟩,⟨3835,65,975,.second,.plus,2⟩,⟨31857,513,975,.first,.plus,6⟩]⟩,
  ⟨[3859, 15923], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨495,1,17,.first,.plus,9⟩,⟨3857,17,495,.first,.plus,8⟩,⟨3859,1,3857,.first,.reverseMinus,1⟩,⟨15923,495,3857,.second,.reverseMinus,2⟩]⟩,
  ⟨[3859, 31847], [⟨15,1,1,.second,.plus,4⟩,⟨961,1,15,.second,.reverseMinus,6⟩,⟨975,15,15,.second,.reverseMinus,6⟩,⟨3859,15,961,.second,.reverseMinus,2⟩,⟨31847,975,3859,.second,.reverseMinus,3⟩]⟩,
  ⟨[3861, 8135], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨59,1,5,.first,.plus,6⟩,⟨3861,4097,59,.second,.minus,2⟩,⟨8135,4097,59,.first,.plus,1⟩]⟩,
  ⟨[3861, 32539], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨117,13,13,.second,.reverseMinus,3⟩,⟨3861,117,117,.second,.reverseMinus,5⟩,⟨4069,13,3861,.first,.reverseMinus,4⟩,⟨32539,13,4069,.second,.plus,3⟩]⟩,
  ⟨[3865, 5425], [⟨7,1,1,.second,.plus,3⟩,⟨121,1,7,.first,.plus,7⟩,⟨3865,7,121,.second,.plus,5⟩,⟨775,7,121,.first,.plus,7⟩,⟨5425,775,775,.second,.plus,3⟩]⟩,
  ⟨[3865, 10849], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨231,33,33,.second,.plus,3⟩,⟨3865,1,231,.first,.plus,12⟩,⟨169,231,3865,.first,.minus,4⟩,⟨10849,33,169,.second,.reverseMinus,6⟩]⟩,
  ⟨[3867, 5401], [⟨3,1,1,.second,.plus,2⟩,⟨767,1,3,.second,.plus,8⟩,⟨771,1,767,.first,.reverseMinus,2⟩,⟨5401,767,771,.second,.plus,3⟩,⟨3867,767,5401,.first,.minus,1⟩]⟩,
  ⟨[3867, 10803], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨3867,15,27,.first,.reverseMinus,8⟩,⟨5403,3,3867,.first,.reverseMinus,9⟩,⟨10803,3,5403,.second,.plus,1⟩]⟩,
  ⟨[3869, 5377], [⟨3,1,1,.second,.plus,2⟩,⟨769,1,3,.second,.reverseMinus,8⟩,⟨775,3,769,.first,.reverseMinus,1⟩,⟨3869,769,775,.second,.reverseMinus,2⟩,⟨5377,769,775,.first,.plus,3⟩]⟩,
  ⟨[3869, 10755], [⟨7,1,1,.second,.plus,3⟩,⟨3585,1,7,.second,.reverseMinus,9⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨10755,3585,3585,.second,.plus,2⟩,⟨3869,3585,71,.second,.reverseMinus,2⟩]⟩,
  ⟨[3873, 7219], [⟨7,1,1,.second,.plus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨3601,7,17,.first,.reverseMinus,9⟩,⟨7219,17,3601,.second,.reverseMinus,1⟩,⟨3873,17,3601,.first,.reverseMinus,4⟩]⟩,
  ⟨[3873, 28875], [⟨7,1,1,.second,.plus,3⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨8187,7,4097,.second,.plus,1⟩,⟨3873,7,4097,.first,.minus,5⟩,⟨28875,8187,3873,.first,.plus,2⟩]⟩,
  ⟨[3883, 15917], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨261,1,257,.first,.reverseMinus,2⟩,⟨3915,261,261,.second,.plus,4⟩,⟨3883,1,3915,.first,.minus,5⟩,⟨15917,257,3915,.second,.reverseMinus,2⟩]⟩,
  ⟨[3883, 31835], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨1027,1,257,.second,.plus,2⟩,⟨3851,257,1027,.second,.plus,2⟩,⟨3883,1,3851,.first,.reverseMinus,5⟩,⟨31835,1027,3851,.second,.reverseMinus,3⟩]⟩,
  ⟨[3895, 7207], [⟨7,1,1,.second,.plus,3⟩,⟨3583,1,7,.second,.plus,9⟩,⟨39,1,7,.first,.reverseMinus,5⟩,⟨7207,7,39,.first,.reverseMinus,10⟩,⟨3895,3583,39,.second,.reverseMinus,3⟩]⟩,
  ⟨[3895, 28827], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨779,3,11,.first,.reverseMinus,8⟩,⟨3895,779,779,.second,.reverseMinus,2⟩,⟨28823,779,3895,.first,.reverseMinus,5⟩,⟨28827,1,28823,.first,.reverseMinus,2⟩]⟩,
  ⟨[3897, 10087], [⟨7,1,1,.second,.plus,3⟩,⟨441,7,7,.second,.plus,6⟩,⟨4025,7,441,.first,.reverseMinus,9⟩,⟨3897,1,4025,.first,.minus,7⟩,⟨10087,441,4025,.first,.plus,5⟩]⟩,
  ⟨[3899, 10039], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨3899,5,61,.second,.plus,6⟩,⟨10043,3,3899,.first,.reverseMinus,11⟩,⟨10039,1,10043,.first,.minus,2⟩]⟩,
  ⟨[3901, 9991], [⟨7,1,1,.second,.plus,3⟩,⟨39,1,7,.first,.reverseMinus,5⟩,⟨985,1,39,.first,.plus,10⟩,⟨9991,7,39,.second,.reverseMinus,8⟩,⟨3901,39,985,.second,.plus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank27
