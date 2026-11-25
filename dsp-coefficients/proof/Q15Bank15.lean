import Q15Upper
namespace Q15Bank15
open Q15Upper
def entries : List Entry := [
  ⟨[1593, 20593], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨49,1,17,.first,.reverseMinus,5⟩,⟨3185,49,49,.second,.reverseMinus,6⟩,⟨1593,1,3185,.output,.plus,1⟩,⟨20593,17,3185,.first,.reverseMinus,10⟩]⟩,
  ⟨[1595, 10277], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨321,1,5,.second,.reverseMinus,6⟩,⟨319,1,5,.second,.plus,6⟩,⟨10277,5,321,.second,.reverseMinus,5⟩,⟨1595,319,319,.second,.reverseMinus,2⟩]⟩,
  ⟨[1595, 20553], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨1595,5,25,.second,.plus,6⟩,⟨20505,5,25,.first,.reverseMinus,12⟩,⟨20553,3,20505,.first,.reverseMinus,4⟩]⟩,
  ⟨[1597, 10257], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨641,1,5,.second,.reverseMinus,7⟩,⟨315,5,5,.second,.plus,6⟩,⟨10257,1,641,.second,.reverseMinus,4⟩,⟨1597,641,315,.first,.reverseMinus,1⟩]⟩,
  ⟨[1597, 20515], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨35,5,5,.second,.plus,3⟩,⟨51,1,35,.first,.reverseMinus,4⟩,⟨20515,5,35,.first,.reverseMinus,12⟩,⟨1597,35,51,.second,.plus,5⟩]⟩,
  ⟨[1599, 5119], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨319,1,5,.second,.plus,6⟩,⟨5119,1,5,.second,.plus,10⟩,⟨1599,5,319,.first,.reverseMinus,8⟩]⟩,
  ⟨[1599, 20475], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨319,1,5,.second,.plus,6⟩,⟨20475,5,5,.second,.plus,12⟩,⟨1599,5,319,.first,.reverseMinus,8⟩]⟩,
  ⟨[1607, 4091], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨4091,1,5,.first,.plus,12⟩,⟨25,1,7,.first,.plus,5⟩,⟨1607,7,25,.second,.reverseMinus,6⟩]⟩,
  ⟨[1607, 32729], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨32729,1,39,.first,.plus,15⟩,⟨49,5,39,.first,.reverseMinus,1⟩,⟨1607,39,49,.second,.reverseMinus,5⟩]⟩,
  ⟨[1623, 16059], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨325,5,5,.second,.reverseMinus,6⟩,⟨649,1,325,.second,.plus,1⟩,⟨16059,1,325,.first,.plus,14⟩,⟨1623,325,649,.second,.reverseMinus,1⟩]⟩,
  ⟨[1623, 32119], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨325,5,5,.second,.reverseMinus,6⟩,⟨649,1,325,.second,.plus,1⟩,⟨32119,1,649,.first,.plus,15⟩,⟨1623,325,649,.second,.reverseMinus,1⟩]⟩,
  ⟨[1631, 15029], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨233,1,23,.first,.plus,8⟩,⟨1631,233,233,.second,.plus,3⟩,⟨30057,233,233,.second,.reverseMinus,7⟩,⟨15029,1,30057,.output,.plus,1⟩]⟩,
  ⟨[1631, 16303], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨47,1,3,.second,.plus,4⟩,⟨1631,127,47,.second,.reverseMinus,5⟩,⟨16303,127,47,.first,.reverseMinus,7⟩]⟩,
  ⟨[1631, 30057], [⟨3,1,1,.second,.plus,2⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨233,3,257,.first,.minus,3⟩,⟨1631,233,233,.second,.plus,3⟩,⟨30057,233,233,.second,.reverseMinus,7⟩]⟩,
  ⟨[1631, 32605], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨1631,3,95,.first,.reverseMinus,9⟩,⟨6521,3,1631,.second,.plus,2⟩,⟨32605,6521,6521,.second,.reverseMinus,2⟩]⟩,
  ⟨[1635, 8027], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨165,5,5,.second,.reverseMinus,5⟩,⟨315,5,5,.second,.plus,6⟩,⟨8027,1,165,.first,.plus,13⟩,⟨1635,165,315,.first,.reverseMinus,3⟩]⟩,
  ⟨[1635, 32109], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨109,1,125,.first,.minus,4⟩,⟨32109,125,109,.first,.reverseMinus,8⟩,⟨1635,109,109,.second,.plus,4⟩]⟩,
  ⟨[1645, 19519], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨97,1,129,.first,.minus,5⟩,⟨613,129,97,.first,.reverseMinus,2⟩,⟨1645,129,613,.first,.reverseMinus,3⟩,⟨19519,97,613,.second,.plus,5⟩]⟩,
  ⟨[1659, 16363], [⟨3,1,1,.second,.plus,2⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨2045,1,3,.first,.plus,11⟩,⟨16363,3,2045,.second,.reverseMinus,3⟩,⟨1659,193,2045,.first,.minus,1⟩]⟩,
  ⟨[1659, 32727], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨32767,1,1,.second,.plus,15⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨32727,5,32767,.first,.minus,3⟩,⟨1659,5,13,.second,.plus,7⟩]⟩,
  ⟨[1669, 18991], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨645,5,5,.second,.reverseMinus,7⟩,⟨1669,1,645,.first,.reverseMinus,10⟩,⟨5165,5,645,.second,.reverseMinus,3⟩,⟨18991,1669,5165,.second,.plus,2⟩]⟩,
  ⟨[1677, 3737], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨1677,13,13,.second,.reverseMinus,7⟩,⟨3737,383,1677,.second,.reverseMinus,1⟩]⟩,
  ⟨[1677, 29895], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨115,3,7,.second,.reverseMinus,4⟩,⟨1677,7,115,.first,.plus,8⟩,⟨467,7,115,.second,.reverseMinus,2⟩,⟨29895,7,467,.second,.reverseMinus,6⟩]⟩,
  ⟨[1681, 8149], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨1617,49,49,.second,.reverseMinus,5⟩,⟨1681,1,1617,.first,.reverseMinus,6⟩,⟨8149,1617,1681,.first,.reverseMinus,2⟩]⟩,
  ⟨[1681, 32595], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨2037,1,11,.first,.plus,11⟩,⟨32595,3,2037,.second,.reverseMinus,4⟩,⟨1685,11,2037,.first,.minus,5⟩,⟨1681,1,1685,.first,.minus,2⟩]⟩,
  ⟨[1687, 4645], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨37,1,9,.second,.reverseMinus,2⟩,⟨503,1,9,.first,.plus,9⟩,⟨4645,9,37,.first,.reverseMinus,9⟩,⟨1687,37,503,.first,.reverseMinus,5⟩]⟩,
  ⟨[1687, 18579], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨561,17,17,.second,.reverseMinus,5⟩,⟨563,1,561,.first,.reverseMinus,1⟩,⟨1687,561,563,.second,.reverseMinus,1⟩,⟨18579,563,563,.second,.reverseMinus,5⟩]⟩,
  ⟨[1709, 2003], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨29,1,3,.first,.plus,5⟩,⟨2003,127,29,.first,.plus,4⟩,⟨1709,29,2003,.first,.plus,7⟩]⟩,
  ⟨[1709, 8181], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨1533,3,3,.second,.plus,9⟩,⟨8181,1,11,.first,.plus,13⟩,⟨1709,11,1533,.first,.reverseMinus,4⟩]⟩,
  ⟨[1709, 32047], [⟨15,1,1,.second,.plus,4⟩,⟨975,15,15,.second,.reverseMinus,6⟩,⟨847,1,975,.first,.minus,7⟩,⟨1709,15,847,.second,.reverseMinus,1⟩,⟨32047,975,847,.first,.reverseMinus,5⟩]⟩,
  ⟨[1709, 32723], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨45,1,13,.first,.reverseMinus,5⟩,⟨32723,1,45,.first,.plus,15⟩,⟨1709,13,45,.first,.reverseMinus,7⟩]⟩,
  ⟨[1715, 2239], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨131,1,3,.first,.reverseMinus,7⟩,⟨2239,3,2047,.first,.reverseMinus,6⟩,⟨1715,131,2239,.first,.minus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank15
