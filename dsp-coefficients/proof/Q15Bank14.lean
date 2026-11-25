import Q15Upper
namespace Q15Bank14
open Q15Upper
def entries : List Entry := [
  ⟨[1457, 23027], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨13,1,17,.first,.minus,2⟩,⟨45,1,13,.first,.reverseMinus,5⟩,⟨1457,17,45,.second,.reverseMinus,5⟩,⟨23027,13,45,.second,.plus,9⟩]⟩,
  ⟨[1457, 32735], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨47,1,3,.second,.plus,4⟩,⟨32735,1,33,.first,.plus,15⟩,⟨1457,47,47,.second,.plus,5⟩]⟩,
  ⟨[1481, 16317], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨16317,1,67,.first,.plus,14⟩,⟨1481,67,387,.second,.plus,2⟩]⟩,
  ⟨[1481, 32633], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨23,1,9,.first,.plus,5⟩,⟨2039,1,9,.first,.plus,11⟩,⟨1481,9,23,.second,.reverseMinus,6⟩,⟨32633,9,2039,.second,.reverseMinus,4⟩]⟩,
  ⟨[1487, 32223], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨975,3,1023,.first,.minus,4⟩,⟨1487,1,975,.first,.reverseMinus,9⟩,⟨32223,1023,975,.second,.reverseMinus,5⟩]⟩,
  ⟨[1507, 16367], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨47,1,3,.second,.plus,4⟩,⟨16367,1,17,.first,.plus,14⟩,⟨1507,3,47,.second,.reverseMinus,5⟩]⟩,
  ⟨[1507, 32733], [⟨3,1,1,.second,.plus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨29,1,3,.first,.plus,5⟩,⟨1507,3,29,.first,.plus,9⟩,⟨32733,511,29,.first,.reverseMinus,6⟩]⟩,
  ⟨[1509, 11077], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨995,33,257,.second,.plus,2⟩,⟨1509,257,995,.first,.reverseMinus,1⟩,⟨11077,995,1509,.second,.plus,3⟩]⟩,
  ⟨[1509, 22155], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨1509,3,27,.first,.plus,9⟩,⟨1477,1,1509,.first,.minus,5⟩,⟨22155,1477,1477,.second,.plus,4⟩]⟩,
  ⟨[1515, 7611], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨381,3,3,.second,.plus,7⟩,⟨1515,9,381,.second,.plus,2⟩,⟨7611,381,1515,.first,.reverseMinus,4⟩]⟩,
  ⟨[1515, 30443], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨235,1,59,.second,.plus,2⟩,⟨1515,5,235,.first,.reverseMinus,8⟩,⟨30443,59,235,.first,.reverseMinus,9⟩]⟩,
  ⟨[1521, 15213], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨1521,3,15,.first,.plus,9⟩,⟨3045,3,1521,.second,.reverseMinus,1⟩,⟨15213,1521,3045,.first,.reverseMinus,3⟩]⟩,
  ⟨[1521, 30425], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨1521,3,15,.first,.plus,9⟩,⟨6085,1,1521,.second,.reverseMinus,2⟩,⟨30425,6085,6085,.second,.reverseMinus,2⟩]⟩,
  ⟨[1531, 2039], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1019,1,5,.first,.plus,10⟩,⟨2039,1,1019,.second,.reverseMinus,1⟩,⟨1531,1,1019,.first,.reverseMinus,9⟩]⟩,
  ⟨[1531, 32625], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨2051,1,3,.first,.reverseMinus,11⟩,⟨1531,3,191,.second,.reverseMinus,3⟩,⟨32625,191,2051,.second,.plus,4⟩]⟩,
  ⟨[1549, 2011], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨1549,3,13,.first,.reverseMinus,9⟩,⟨2011,13,253,.second,.plus,3⟩]⟩,
  ⟨[1549, 32177], [⟨511,1,1,.second,.plus,9⟩,⟨527,1,511,.first,.reverseMinus,4⟩,⟨1549,511,527,.first,.reverseMinus,1⟩,⟨32177,511,527,.first,.plus,6⟩]⟩,
  ⟨[1557, 16365], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨21,3,3,.second,.plus,3⟩,⟨16365,3,1023,.second,.plus,4⟩,⟨1557,3,21,.first,.reverseMinus,9⟩]⟩,
  ⟨[1557, 32731], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨21,3,3,.second,.plus,3⟩,⟨1557,3,21,.first,.reverseMinus,9⟩,⟨32731,2047,21,.first,.plus,4⟩]⟩,
  ⟨[1559, 10625], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨1663,1,13,.second,.plus,7⟩,⟨10625,3,1663,.first,.plus,12⟩,⟨1559,13,1663,.first,.minus,3⟩]⟩,
  ⟨[1559, 21251], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨1559,3,23,.first,.reverseMinus,9⟩,⟨83,3,5,.second,.reverseMinus,4⟩,⟨21251,3,83,.second,.reverseMinus,8⟩]⟩,
  ⟨[1561, 4021], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨999,1,25,.first,.plus,10⟩,⟨1561,3,25,.first,.reverseMinus,9⟩,⟨4021,25,999,.second,.reverseMinus,2⟩]⟩,
  ⟨[1561, 5303], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨1561,1,195,.second,.reverseMinus,3⟩,⟨5315,5,195,.first,.reverseMinus,10⟩,⟨5303,3,5315,.first,.minus,2⟩]⟩,
  ⟨[1561, 21213], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1785,7,7,.second,.plus,8⟩,⟨1561,7,1785,.first,.minus,5⟩,⟨8925,1785,1785,.second,.reverseMinus,2⟩,⟨21213,3,8925,.first,.reverseMinus,12⟩]⟩,
  ⟨[1561, 32167], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨261,1,5,.first,.reverseMinus,8⟩,⟨527,5,261,.second,.reverseMinus,1⟩,⟨1561,261,527,.first,.plus,3⟩,⟨32167,527,1561,.first,.plus,6⟩]⟩,
  ⟨[1563, 10587], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨165,3,27,.first,.plus,6⟩,⟨1563,3,27,.first,.reverseMinus,9⟩,⟨10587,27,165,.second,.reverseMinus,6⟩]⟩,
  ⟨[1563, 21173], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1275,5,5,.second,.plus,8⟩,⟨1403,1,1275,.first,.reverseMinus,7⟩,⟨1563,5,1403,.first,.reverseMinus,5⟩,⟨21173,1275,1403,.second,.plus,4⟩]⟩,
  ⟨[1565, 21135], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1537,1,3,.second,.reverseMinus,9⟩,⟨1565,7,1537,.first,.reverseMinus,2⟩,⟨1409,1,1537,.first,.minus,7⟩,⟨21135,1409,1409,.second,.plus,4⟩]⟩,
  ⟨[1579, 7559], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨521,1,9,.first,.reverseMinus,9⟩,⟨505,1,521,.first,.minus,4⟩,⟨7559,521,505,.second,.plus,4⟩,⟨1579,521,505,.first,.plus,2⟩]⟩,
  ⟨[1579, 30235], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1539,3,3,.second,.reverseMinus,9⟩,⟨1579,5,1539,.first,.reverseMinus,3⟩,⟨13851,1539,1539,.second,.reverseMinus,3⟩,⟨30235,1,13851,.first,.reverseMinus,14⟩]⟩,
  ⟨[1581, 4077], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨45,3,3,.second,.plus,4⟩,⟨1581,3,45,.first,.reverseMinus,9⟩,⟨4077,63,45,.first,.reverseMinus,6⟩]⟩,
  ⟨[1581, 32615], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨8141,1,51,.first,.plus,13⟩,⟨1581,51,51,.second,.plus,5⟩,⟨32615,51,8141,.second,.reverseMinus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank14
