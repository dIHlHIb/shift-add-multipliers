import Q15Upper
namespace Q15Bank07
open Q15Upper
def entries : List Entry := [
  ⟨[765, 10891], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨765,3,3,.second,.plus,8⟩,⟨85,3,11,.second,.plus,3⟩,⟨10891,11,85,.second,.reverseMinus,7⟩]⟩,
  ⟨[765, 21781], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨765,3,3,.second,.plus,8⟩,⟨85,1,21,.second,.reverseMinus,2⟩,⟨21781,21,85,.second,.reverseMinus,8⟩]⟩,
  ⟨[775, 7583], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨775,1,97,.second,.plus,3⟩,⟨7583,15,97,.first,.plus,9⟩]⟩,
  ⟨[775, 30331], [⟨255,1,1,.second,.plus,8⟩,⟨767,1,255,.first,.reverseMinus,9⟩,⟨775,1,767,.first,.reverseMinus,3⟩,⟨15553,255,767,.first,.plus,6⟩,⟨30331,775,15553,.second,.plus,1⟩]⟩,
  ⟨[779, 16365], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨11,1,3,.second,.plus,2⟩,⟨16365,3,1023,.second,.plus,4⟩,⟨779,3,11,.first,.reverseMinus,8⟩]⟩,
  ⟨[779, 32731], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨2045,1,3,.first,.plus,11⟩,⟨779,3,11,.first,.reverseMinus,8⟩,⟨32731,11,2045,.second,.reverseMinus,4⟩]⟩,
  ⟨[793, 8037], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨793,3,25,.first,.reverseMinus,8⟩,⟨893,25,793,.first,.reverseMinus,2⟩,⟨8037,893,893,.second,.reverseMinus,3⟩]⟩,
  ⟨[793, 32149], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1017,1,7,.first,.plus,10⟩,⟨793,7,1017,.first,.minus,5⟩,⟨64295,1017,793,.first,.plus,6⟩,⟨32149,3,64295,.output,.plus,1⟩]⟩,
  ⟨[799, 16069], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨159,1,5,.second,.plus,5⟩,⟨251,1,5,.first,.plus,8⟩,⟨799,5,159,.first,.reverseMinus,7⟩,⟨16069,5,251,.second,.reverseMinus,6⟩]⟩,
  ⟨[799, 32139], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨639,1,5,.second,.plus,7⟩,⟨16389,1,5,.first,.reverseMinus,14⟩,⟨799,5,639,.first,.reverseMinus,5⟩,⟨32139,639,16389,.second,.plus,1⟩]⟩,
  ⟨[803, 16305], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨79,1,5,.second,.plus,4⟩,⟨645,5,5,.second,.reverseMinus,7⟩,⟨16305,1,79,.first,.plus,14⟩,⟨803,79,645,.first,.reverseMinus,1⟩]⟩,
  ⟨[803, 32611], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨509,1,3,.first,.plus,9⟩,⟨803,3,35,.first,.reverseMinus,8⟩,⟨32611,35,509,.second,.reverseMinus,6⟩]⟩,
  ⟨[805, 16379], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨16379,1,5,.first,.plus,14⟩,⟨805,161,161,.second,.reverseMinus,2⟩]⟩,
  ⟨[805, 32759], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨769,1,3,.second,.reverseMinus,8⟩,⟨32759,1,9,.first,.plus,15⟩,⟨805,9,769,.first,.reverseMinus,2⟩]⟩,
  ⟨[813, 9961], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨247,1,9,.first,.plus,8⟩,⟨319,9,247,.first,.reverseMinus,3⟩,⟨9961,247,319,.second,.plus,5⟩,⟨813,247,319,.first,.reverseMinus,1⟩]⟩,
  ⟨[813, 19921], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨769,1,3,.second,.reverseMinus,8⟩,⟨813,11,769,.first,.reverseMinus,2⟩,⟨13777,769,813,.second,.reverseMinus,4⟩,⟨19921,3,13777,.first,.reverseMinus,11⟩]⟩,
  ⟨[827, 14989], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨467,1,45,.first,.plus,9⟩,⟨14989,45,467,.second,.reverseMinus,5⟩,⟨827,45,467,.first,.reverseMinus,3⟩]⟩,
  ⟨[827, 29977], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨827,3,59,.first,.reverseMinus,8⟩,⟨7493,59,59,.second,.plus,7⟩,⟨29977,5,7493,.second,.reverseMinus,2⟩]⟩,
  ⟨[829, 4809], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨25,1,9,.first,.reverseMinus,4⟩,⟨201,1,25,.second,.reverseMinus,3⟩,⟨4809,9,201,.first,.reverseMinus,9⟩,⟨829,25,201,.second,.reverseMinus,2⟩]⟩,
  ⟨[829, 16363], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨829,3,13,.second,.plus,6⟩,⟨16363,2047,13,.first,.plus,3⟩]⟩,
  ⟨[829, 19237], [⟨3,1,1,.second,.plus,2⟩,⟨765,3,3,.second,.plus,8⟩,⟨829,1,765,.first,.reverseMinus,6⟩,⟨2301,3,765,.first,.reverseMinus,9⟩,⟨19237,829,2301,.second,.reverseMinus,3⟩]⟩,
  ⟨[829, 32727], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨41,1,9,.first,.reverseMinus,5⟩,⟨32727,1,41,.first,.plus,15⟩,⟨173,9,41,.second,.reverseMinus,2⟩,⟨829,41,173,.first,.reverseMinus,4⟩]⟩,
  ⟨[839, 9393], [⟨7,1,1,.second,.plus,3⟩,⟨903,7,7,.second,.reverseMinus,7⟩,⟨839,1,903,.first,.minus,6⟩,⟨2681,7,903,.first,.plus,9⟩,⟨9393,839,2681,.first,.reverseMinus,3⟩]⟩,
  ⟨[839, 18785], [⟨7,1,1,.second,.plus,3⟩,⟨895,1,7,.second,.plus,7⟩,⟨839,7,895,.first,.minus,3⟩,⟨8063,7,895,.first,.reverseMinus,10⟩,⟨18785,839,8063,.first,.plus,5⟩]⟩,
  ⟨[853, 16295], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨85,5,5,.second,.reverseMinus,4⟩,⟨853,3,85,.first,.reverseMinus,8⟩,⟨89,1,85,.first,.reverseMinus,2⟩,⟨16295,1,89,.first,.plus,14⟩]⟩,
  ⟨[853, 32589], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨27,1,11,.first,.reverseMinus,4⟩,⟨853,11,27,.second,.plus,5⟩,⟨179,3,11,.second,.reverseMinus,4⟩,⟨32589,1,179,.first,.plus,15⟩]⟩,
  ⟨[855, 8189], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨8189,1,3,.first,.plus,13⟩,⟨855,95,95,.second,.reverseMinus,3⟩]⟩,
  ⟨[855, 32757], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨21,3,3,.second,.plus,3⟩,⟨855,1023,21,.second,.minus,3⟩,⟨32757,1023,21,.first,.reverseMinus,5⟩]⟩,
  ⟨[873, 2001], [⟨127,1,1,.second,.plus,7⟩,⟨125,1,127,.first,.minus,1⟩,⟨2001,1,125,.second,.reverseMinus,4⟩,⟨873,127,125,.second,.plus,3⟩]⟩,
  ⟨[873, 32015], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨753,3,15,.first,.plus,8⟩,⟨32015,1,753,.first,.plus,15⟩,⟨873,15,753,.first,.reverseMinus,3⟩]⟩,
  ⟨[879, 2045], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1023,1,1,.second,.plus,10⟩,⟨2045,1,1023,.second,.plus,1⟩,⟨879,9,1023,.first,.minus,4⟩]⟩,
  ⟨[879, 8001], [⟨63,1,1,.second,.plus,6⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨8001,63,63,.second,.plus,7⟩,⟨879,63,129,.first,.plus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank07
