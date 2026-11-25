import Q15Upper
namespace Q15Bank34
open Q15Upper
def entries : List Entry := [
  ⟨[5667, 11831], [⟨513,1,1,.second,.reverseMinus,9⟩,⟨515,1,513,.first,.reverseMinus,1⟩,⟨7727,513,515,.second,.plus,4⟩,⟨11831,513,7727,.first,.reverseMinus,3⟩,⟨5667,515,7727,.first,.minus,2⟩]⟩,
  ⟨[5667, 23663], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨1571,3,49,.second,.reverseMinus,5⟩,⟨5667,1,1571,.first,.reverseMinus,12⟩,⟨23565,1571,1571,.second,.plus,4⟩,⟨23663,49,23565,.first,.reverseMinus,1⟩]⟩,
  ⟨[5685, 7683], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨7683,3,15,.second,.reverseMinus,9⟩,⟨379,3,5,.first,.plus,7⟩,⟨5685,379,379,.second,.plus,4⟩]⟩,
  ⟨[5685, 11797], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨379,3,191,.second,.plus,1⟩,⟨5685,379,379,.second,.plus,4⟩,⟨11797,191,5685,.first,.reverseMinus,5⟩]⟩,
  ⟨[5685, 23593], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨369,1,23,.second,.reverseMinus,4⟩,⟨23593,23,369,.second,.plus,6⟩,⟨1137,3,369,.first,.reverseMinus,8⟩,⟨5685,1137,1137,.second,.reverseMinus,2⟩]⟩,
  ⟨[5685, 30733], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨6093,3,51,.first,.plus,11⟩,⟨5685,51,6093,.first,.minus,3⟩,⟨30669,3,6093,.first,.reverseMinus,13⟩,⟨30733,1,30669,.first,.reverseMinus,6⟩]⟩,
  ⟨[5701, 8067], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨8067,3,63,.second,.reverseMinus,7⟩,⟨5695,11,63,.first,.reverseMinus,9⟩,⟨5701,3,5695,.first,.reverseMinus,1⟩]⟩,
  ⟨[5701, 32269], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨63,1,1,.second,.plus,6⟩,⟨32269,13,63,.second,.reverseMinus,9⟩,⟨89,13,63,.first,.reverseMinus,1⟩,⟨5701,5,89,.second,.reverseMinus,6⟩]⟩,
  ⟨[5703, 5881], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨89,3,7,.first,.plus,5⟩,⟨5703,7,89,.second,.reverseMinus,6⟩,⟨5881,89,5703,.first,.reverseMinus,1⟩]⟩,
  ⟨[5703, 23523], [⟨15,1,1,.second,.plus,4⟩,⟨79,1,15,.first,.reverseMinus,6⟩,⟨711,79,79,.second,.reverseMinus,3⟩,⟨5703,15,711,.second,.reverseMinus,3⟩,⟨23523,711,5703,.second,.reverseMinus,2⟩]⟩,
  ⟨[5721, 11727], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨95,1,33,.first,.plus,7⟩,⟨727,33,95,.second,.plus,3⟩,⟨5721,95,727,.second,.plus,3⟩,⟨11727,95,727,.second,.reverseMinus,4⟩]⟩,
  ⟨[5721, 23453], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨733,3,35,.first,.plus,8⟩,⟨23453,3,733,.second,.plus,5⟩,⟨1431,35,733,.second,.plus,1⟩,⟨5721,3,1431,.second,.plus,2⟩]⟩,
  ⟨[5739, 11691], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨107,3,11,.first,.reverseMinus,5⟩,⟨5739,11,107,.first,.reverseMinus,9⟩,⟨2923,11,107,.first,.reverseMinus,8⟩,⟨11691,1,2923,.second,.plus,2⟩]⟩,
  ⟨[5739, 23383], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨107,3,11,.first,.reverseMinus,5⟩,⟨5739,11,107,.first,.reverseMinus,9⟩,⟨2923,11,107,.first,.reverseMinus,8⟩,⟨23383,1,2923,.second,.plus,3⟩]⟩,
  ⟨[5751, 8065], [⟨127,1,1,.second,.plus,7⟩,⟨639,1,127,.first,.reverseMinus,9⟩,⟨8065,1,127,.first,.plus,13⟩,⟨5751,639,639,.second,.reverseMinus,3⟩]⟩,
  ⟨[5751, 32259], [⟨127,1,1,.second,.plus,7⟩,⟨32767,1,1,.second,.plus,15⟩,⟨639,1,127,.first,.reverseMinus,9⟩,⟨32259,127,32767,.first,.minus,2⟩,⟨5751,639,639,.second,.reverseMinus,3⟩]⟩,
  ⟨[5757, 23313], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨45,3,3,.second,.plus,4⟩,⟨5757,3,45,.second,.plus,7⟩,⟨5829,9,5757,.first,.reverseMinus,3⟩,⟨23313,3,5829,.second,.plus,2⟩]⟩,
  ⟨[5775, 11621], [⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨825,7,71,.first,.plus,7⟩,⟨5775,825,825,.second,.plus,3⟩,⟨11621,71,5775,.second,.reverseMinus,1⟩]⟩,
  ⟨[5775, 23241], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨183,3,9,.first,.plus,6⟩,⟨23241,183,183,.second,.plus,7⟩,⟨369,3,183,.second,.reverseMinus,1⟩,⟨5775,3,369,.first,.plus,11⟩]⟩,
  ⟨[5779, 15331], [⟨15,1,1,.second,.plus,4⟩,⟨7665,15,15,.second,.plus,9⟩,⟨15331,1,7665,.second,.reverseMinus,1⟩,⟨7785,15,7665,.first,.reverseMinus,3⟩,⟨5779,15331,7785,.output,.plus,2⟩]⟩,
  ⟨[5779, 30661], [⟨15,1,1,.second,.plus,4⟩,⟨7665,15,15,.second,.plus,9⟩,⟨30661,1,7665,.second,.reverseMinus,2⟩,⟨7545,15,7665,.first,.minus,3⟩,⟨5779,30661,7545,.output,.minus,2⟩]⟩,
  ⟨[5801, 16125], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨645,5,5,.second,.reverseMinus,7⟩,⟨5805,645,645,.second,.reverseMinus,3⟩,⟨5801,1,5805,.first,.minus,2⟩,⟨16125,645,5805,.first,.reverseMinus,4⟩]⟩,
  ⟨[5801, 32251], [⟨3,1,1,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨517,1,129,.second,.reverseMinus,2⟩,⟨32251,1,517,.first,.plus,15⟩,⟨4265,129,517,.second,.reverseMinus,3⟩,⟨5801,3,4265,.first,.reverseMinus,9⟩]⟩,
  ⟨[5803, 7661], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨645,5,5,.second,.reverseMinus,7⟩,⟨2579,1,645,.second,.plus,2⟩,⟨7661,5,2579,.first,.plus,11⟩,⟨5803,645,2579,.second,.reverseMinus,1⟩]⟩,
  ⟨[5803, 30645], [⟨3,1,1,.second,.plus,2⟩,⟨1021,1,3,.first,.plus,10⟩,⟨829,3,1021,.first,.minus,6⟩,⟨5803,829,829,.second,.plus,3⟩,⟨2043,1,1021,.second,.reverseMinus,1⟩,⟨30645,2043,2043,.second,.plus,4⟩]⟩,
  ⟨[5819, 23063], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨45,1,23,.second,.plus,1⟩,⟨23063,23,45,.second,.reverseMinus,9⟩,⟨5843,23,45,.first,.plus,8⟩,⟨5819,3,5843,.first,.minus,3⟩]⟩,
  ⟨[5837, 22993], [⟨3,1,1,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨355,1,387,.first,.minus,5⟩,⟨5837,387,355,.first,.plus,4⟩,⟨22993,355,5837,.second,.plus,2⟩]⟩,
  ⟨[5849, 16121], [⟨7,1,1,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨1785,7,7,.second,.plus,8⟩,⟨16121,7,1785,.first,.reverseMinus,11⟩,⟨5849,127,1785,.first,.reverseMinus,5⟩]⟩,
  ⟨[5849, 32241], [⟨3,1,1,.second,.plus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨391,1,195,.second,.reverseMinus,1⟩,⟨5849,195,391,.first,.plus,5⟩,⟨977,195,391,.second,.reverseMinus,1⟩,⟨32241,977,977,.second,.reverseMinus,5⟩]⟩,
  ⟨[5873, 15295], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨239,3,191,.first,.reverseMinus,4⟩,⟨15295,1,239,.second,.plus,6⟩,⟨5873,191,239,.first,.plus,5⟩]⟩,
  ⟨[5873, 30591], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨239,3,191,.first,.reverseMinus,4⟩,⟨30591,1,239,.second,.plus,7⟩,⟨5873,191,239,.first,.plus,5⟩]⟩,
  ⟨[5881, 22813], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨23,1,3,.second,.plus,3⟩,⟨5881,7,23,.second,.plus,8⟩,⟨713,23,23,.second,.plus,5⟩,⟨22813,3,713,.second,.plus,5⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank34
