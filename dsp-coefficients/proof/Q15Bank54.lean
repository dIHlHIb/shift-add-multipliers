import Q15Upper
namespace Q15Bank54
open Q15Upper
def entries : List Entry := [
  ⟨[13219, 19359], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨93,3,3,.second,.plus,5⟩,⟨13219,13,93,.first,.plus,10⟩,⟨605,1,93,.first,.reverseMinus,9⟩,⟨19359,1,605,.second,.plus,5⟩]⟩,
  ⟨[13233, 14989], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨13325,13,13,.second,.reverseMinus,10⟩,⟨14989,13,13325,.first,.reverseMinus,7⟩,⟨13229,3,13325,.first,.minus,5⟩,⟨13233,1,13229,.first,.reverseMinus,2⟩]⟩,
  ⟨[13233, 29977], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨30213,5,59,.second,.reverseMinus,9⟩,⟨29977,59,30213,.first,.minus,2⟩,⟨3747,1,29977,.output,.reverseMinus,3⟩,⟨13233,30213,3747,.output,.minus,1⟩]⟩,
  ⟨[13249, 19277], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨8129,1,63,.first,.plus,13⟩,⟨13249,5,8129,.first,.reverseMinus,10⟩,⟨19267,8129,13249,.first,.plus,2⟩,⟨19277,5,19267,.first,.reverseMinus,1⟩]⟩,
  ⟨[13279, 19195], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨415,3,31,.first,.reverseMinus,7⟩,⟨13279,1,415,.second,.plus,5⟩,⟨2399,31,415,.first,.reverseMinus,6⟩,⟨19195,3,2399,.second,.reverseMinus,3⟩]⟩,
  ⟨[13279, 29957], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨415,1,13,.second,.plus,5⟩,⟨13279,1,415,.second,.plus,5⟩,⟨3333,13,415,.second,.reverseMinus,3⟩,⟨29957,13,3333,.first,.reverseMinus,11⟩]⟩,
  ⟨[13293, 19155], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨19475,19,19,.second,.reverseMinus,10⟩,⟨13293,1,19475,.first,.plus,15⟩,⟨19155,5,19475,.first,.minus,6⟩]⟩,
  ⟨[13323, 19073], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨1665,1,13,.second,.reverseMinus,7⟩,⟨13323,3,1665,.second,.reverseMinus,3⟩,⟨2689,1,1665,.first,.reverseMinus,10⟩,⟨19073,1,2689,.first,.reverseMinus,14⟩]⟩,
  ⟨[13325, 29937], [⟨15,1,1,.second,.plus,4⟩,⟨13,1,15,.first,.minus,1⟩,⟨3313,15,13,.second,.plus,8⟩,⟨13325,13,13,.second,.reverseMinus,10⟩,⟨29937,13,3313,.first,.reverseMinus,11⟩]⟩,
  ⟨[13337, 19033], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨25,1,17,.first,.reverseMinus,3⟩,⟨17433,17,25,.first,.reverseMinus,10⟩,⟨13337,1,17433,.first,.minus,12⟩,⟨19033,25,17433,.first,.reverseMinus,6⟩]⟩,
  ⟨[13371, 29915], [⟨3,1,1,.second,.plus,2⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨965,193,193,.second,.reverseMinus,2⟩,⟨29915,965,965,.second,.plus,5⟩,⟨3013,1,965,.first,.reverseMinus,11⟩,⟨13371,1,3013,.first,.plus,14⟩]⟩,
  ⟨[13381, 18909], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨989,1,35,.first,.plus,10⟩,⟨18909,35,989,.first,.reverseMinus,9⟩,⟨8901,989,989,.second,.reverseMinus,3⟩,⟨13381,35,8901,.first,.reverseMinus,7⟩]⟩,
  ⟨[13395, 18869], [⟨3,1,1,.second,.plus,2⟩,⟨509,1,3,.first,.plus,9⟩,⟨893,3,509,.first,.reverseMinus,7⟩,⟨13395,893,893,.second,.plus,4⟩,⟨2295,509,893,.second,.reverseMinus,1⟩,⟨18869,509,2295,.second,.reverseMinus,3⟩]⟩,
  ⟨[13417, 29895], [⟨7,1,1,.second,.plus,3⟩,⟨57,1,7,.second,.reverseMinus,3⟩,⟨839,7,57,.first,.plus,7⟩,⟨13417,7,839,.second,.plus,4⟩,⟨30023,57,839,.first,.reverseMinus,9⟩,⟨29895,1,30023,.first,.minus,7⟩]⟩,
  ⟨[13439, 18745], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨2687,1,21,.second,.plus,7⟩,⟨13439,21,2687,.first,.reverseMinus,9⟩,⟨18809,2687,2687,.second,.plus,3⟩,⟨18745,1,18809,.first,.minus,6⟩]⟩,
  ⟨[13453, 18703], [⟨7,1,1,.second,.plus,3⟩,⟨105,7,7,.second,.plus,4⟩,⟨13439,1,105,.second,.plus,7⟩,⟨13453,7,13439,.first,.reverseMinus,1⟩,⟨15119,105,13439,.first,.reverseMinus,4⟩,⟨18703,7,15119,.first,.reverseMinus,9⟩]⟩,
  ⟨[13463, 14937], [⟨15,1,1,.second,.plus,4⟩,⟨239,1,15,.second,.plus,4⟩,⟨1897,15,239,.second,.plus,3⟩,⟨13463,15,1897,.first,.plus,10⟩,⟨14937,239,1897,.second,.plus,3⟩]⟩,
  ⟨[13463, 29875], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨1875,125,125,.second,.plus,4⟩,⟨29875,125,1875,.second,.plus,4⟩,⟨1683,3,1875,.first,.minus,6⟩,⟨13463,1,1683,.second,.plus,3⟩]⟩,
  ⟨[13467, 18663], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨1683,51,51,.second,.reverseMinus,5⟩,⟨13467,3,1683,.second,.reverseMinus,3⟩,⟨20199,1683,13467,.first,.reverseMinus,2⟩,⟨18663,3,20199,.first,.minus,9⟩]⟩,
  ⟨[13509, 14927], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨465,1,47,.first,.plus,9⟩,⟨14927,47,465,.second,.reverseMinus,5⟩,⟨1501,3,47,.second,.plus,5⟩,⟨13509,1501,1501,.second,.reverseMinus,3⟩]⟩,
  ⟨[13509, 29855], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨45,5,5,.second,.reverseMinus,3⟩,⟨211,1,45,.first,.plus,8⟩,⟨13509,5,211,.second,.reverseMinus,6⟩,⟨5971,45,211,.first,.reverseMinus,7⟩,⟨29855,5971,5971,.second,.reverseMinus,2⟩]⟩,
  ⟨[13553, 18413], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨19,1,9,.second,.reverseMinus,1⟩,⟨1215,1,19,.second,.plus,6⟩,⟨18413,9,19,.first,.plus,11⟩,⟨13553,1215,18413,.first,.minus,2⟩]⟩,
  ⟨[13555, 14917], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨243,1,13,.first,.plus,8⟩,⟨13555,13,243,.first,.reverseMinus,10⟩,⟨233,5,243,.first,.minus,1⟩,⟨14917,5,233,.second,.reverseMinus,6⟩]⟩,
  ⟨[13555, 29833], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨53,1,13,.second,.reverseMinus,2⟩,⟨13555,13,53,.second,.plus,8⟩,⟨13449,53,13555,.first,.minus,1⟩,⟨29833,1,13449,.first,.reverseMinus,14⟩]⟩,
  ⟨[13567, 18371], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨61,1,3,.first,.plus,6⟩,⟨18371,9,61,.first,.plus,11⟩,⟨53,1,61,.first,.minus,3⟩,⟨13567,1,53,.second,.plus,8⟩]⟩,
  ⟨[13581, 18331], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨243,27,27,.second,.reverseMinus,3⟩,⟨13581,27,243,.first,.plus,9⟩,⟨1947,3,243,.second,.reverseMinus,3⟩,⟨18331,1,1947,.first,.reverseMinus,14⟩]⟩,
  ⟨[13595, 18289], [⟨3,1,1,.second,.plus,2⟩,⟨381,3,3,.second,.plus,7⟩,⟨6095,1,381,.second,.plus,4⟩,⟨18289,381,6095,.first,.plus,6⟩,⟨12571,381,6095,.second,.reverseMinus,1⟩,⟨13595,1,12571,.first,.reverseMinus,10⟩]⟩,
  ⟨[13599, 29813], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨7453,29,29,.second,.reverseMinus,8⟩,⟨29813,1,7453,.second,.reverseMinus,2⟩,⟨13597,3,7453,.first,.reverseMinus,11⟩,⟨13599,1,13597,.first,.reverseMinus,1⟩]⟩,
  ⟨[13609, 18247], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨71,3,23,.first,.reverseMinus,4⟩,⟨18247,71,71,.second,.reverseMinus,8⟩,⟨213,71,71,.second,.plus,2⟩,⟨13609,23,213,.second,.plus,6⟩]⟩,
  ⟨[13623, 18205], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨35,5,5,.second,.plus,3⟩,⟨2275,35,35,.second,.reverseMinus,6⟩,⟨18205,5,2275,.second,.reverseMinus,3⟩,⟨13655,2275,18205,.first,.minus,1⟩,⟨13623,1,13655,.first,.minus,5⟩]⟩,
  ⟨[13637, 18163], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨53,1,69,.first,.minus,4⟩,⟨13637,69,53,.second,.reverseMinus,8⟩,⟨499,69,53,.first,.plus,3⟩,⟨18163,69,499,.first,.reverseMinus,8⟩]⟩,
  ⟨[13645, 29791], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨1953,31,31,.second,.plus,6⟩,⟨29791,31,1953,.first,.plus,10⟩,⟨1705,31,1953,.first,.minus,3⟩,⟨13645,5,1705,.second,.reverseMinus,3⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank54
