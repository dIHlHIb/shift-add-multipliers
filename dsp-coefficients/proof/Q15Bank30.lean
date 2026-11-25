import Q15Upper
namespace Q15Bank30
open Q15Upper
def entries : List Entry := [
  ⟨[4311, 32483], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨4599,9,9,.second,.plus,9⟩,⟨18397,1,4599,.second,.reverseMinus,2⟩,⟨4311,9,4599,.first,.minus,5⟩,⟨32483,18397,4311,.first,.plus,1⟩]⟩,
  ⟨[4319, 6961], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨289,1,9,.second,.reverseMinus,5⟩,⟨417,1,289,.first,.reverseMinus,7⟩,⟨4319,9,289,.first,.plus,9⟩,⟨6961,289,417,.second,.reverseMinus,4⟩]⟩,
  ⟨[4319, 27845], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨863,1,27,.second,.plus,5⟩,⟨4319,27,863,.first,.reverseMinus,7⟩,⟨27589,27,863,.second,.plus,5⟩,⟨27845,1,27589,.first,.reverseMinus,8⟩]⟩,
  ⟨[4321, 31607], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨287,1,9,.second,.plus,5⟩,⟨247,1,9,.first,.plus,8⟩,⟨4321,9,287,.first,.plus,9⟩,⟨31607,9,247,.second,.plus,7⟩]⟩,
  ⟨[4351, 6941], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨2303,1,9,.second,.plus,8⟩,⟨2311,1,2303,.first,.reverseMinus,3⟩,⟨4351,1,2303,.first,.reverseMinus,11⟩,⟨6941,2303,2311,.second,.plus,2⟩]⟩,
  ⟨[4351, 27765], [⟨255,1,1,.second,.plus,8⟩,⟨259,1,255,.first,.reverseMinus,2⟩,⟨4351,1,255,.first,.reverseMinus,12⟩,⟨8029,259,259,.second,.plus,5⟩,⟨27765,4351,8029,.second,.plus,2⟩]⟩,
  ⟨[4361, 8119], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨4093,1,3,.first,.plus,12⟩,⟨8119,67,4093,.second,.plus,1⟩,⟨4361,67,4093,.first,.reverseMinus,2⟩]⟩,
  ⟨[4361, 32477], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨4361,9,17,.second,.reverseMinus,8⟩,⟨291,3,9,.second,.reverseMinus,5⟩,⟨32477,1,291,.first,.plus,15⟩]⟩,
  ⟨[4409, 16235], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨575,3,191,.first,.reverseMinus,7⟩,⟨4409,191,575,.second,.plus,3⟩,⟨3247,191,191,.second,.reverseMinus,4⟩,⟨16235,3247,3247,.second,.reverseMinus,2⟩]⟩,
  ⟨[4409, 32469], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨2205,35,35,.second,.plus,6⟩,⟨4409,1,2205,.second,.plus,1⟩,⟨33067,2205,4409,.second,.plus,3⟩,⟨32469,1,33067,.first,.plus,16⟩]⟩,
  ⟨[4425, 27577], [⟨3,1,1,.second,.plus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨3065,1,383,.second,.reverseMinus,3⟩,⟨27577,383,3065,.first,.reverseMinus,6⟩,⟨28343,383,27577,.first,.reverseMinus,1⟩,⟨4425,1,28343,.first,.plus,15⟩]⟩,
  ⟨[4457, 13747], [⟨15,1,1,.second,.plus,4⟩,⟨47,1,15,.first,.reverseMinus,5⟩,⟨4081,1,15,.first,.plus,12⟩,⟨4457,47,4081,.first,.reverseMinus,3⟩,⟨13747,4081,4457,.second,.plus,2⟩]⟩,
  ⟨[4457, 27495], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨361,3,23,.first,.plus,7⟩,⟨4457,1,361,.first,.reverseMinus,12⟩,⟨1833,23,361,.first,.reverseMinus,6⟩,⟨27495,1833,1833,.second,.plus,4⟩]⟩,
  ⟨[4459, 32463], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨2029,1,19,.first,.plus,11⟩,⟨32463,1,2029,.second,.plus,4⟩,⟨4461,19,2029,.first,.reverseMinus,7⟩,⟨4459,1,4461,.first,.minus,1⟩]⟩,
  ⟨[4467, 15763], [⟨31,1,1,.second,.plus,5⟩,⟨1055,1,31,.first,.reverseMinus,10⟩,⟨1117,31,1055,.first,.reverseMinus,1⟩,⟨4467,1,1117,.second,.plus,2⟩,⟨15763,1055,1117,.first,.plus,4⟩]⟩,
  ⟨[4467, 31527], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨255,1,1,.second,.plus,8⟩,⟨4209,129,255,.second,.reverseMinus,4⟩,⟨4467,129,4209,.first,.reverseMinus,1⟩,⟨31527,4209,4467,.second,.plus,3⟩]⟩,
  ⟨[4491, 15757], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨499,9,127,.second,.plus,2⟩,⟨15757,127,499,.first,.plus,7⟩,⟨4491,499,499,.second,.reverseMinus,3⟩]⟩,
  ⟨[4491, 31513], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨4491,11,35,.second,.reverseMinus,7⟩,⟨15755,11,4491,.first,.reverseMinus,10⟩,⟨31513,3,15755,.second,.reverseMinus,1⟩]⟩,
  ⟨[4499, 27385], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨403,3,19,.first,.reverseMinus,7⟩,⟨4499,1,403,.first,.reverseMinus,12⟩,⟨6851,403,403,.second,.reverseMinus,4⟩,⟨27385,19,6851,.second,.plus,2⟩]⟩,
  ⟨[4509, 32457], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨1503,3,33,.first,.plus,9⟩,⟨4509,1503,1503,.second,.plus,2⟩,⟨34569,1503,4509,.second,.plus,3⟩,⟨32457,33,34569,.first,.minus,6⟩]⟩,
  ⟨[4515, 7875], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨125,1,3,.first,.plus,7⟩,⟨4515,35,35,.second,.reverseMinus,7⟩,⟨7875,125,125,.second,.plus,6⟩]⟩,
  ⟨[4515, 31499], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨35,1,33,.first,.reverseMinus,1⟩,⟨4515,35,35,.second,.reverseMinus,7⟩,⟨3933,33,4515,.first,.plus,8⟩,⟨31499,35,3933,.second,.reverseMinus,3⟩]⟩,
  ⟨[4539, 15743], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨123,1,5,.first,.plus,7⟩,⟨15743,1,123,.second,.plus,7⟩,⟨4539,69,123,.first,.reverseMinus,6⟩]⟩,
  ⟨[4539, 31485], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨123,1,5,.first,.plus,7⟩,⟨31485,3,123,.second,.plus,8⟩,⟨443,5,123,.first,.reverseMinus,6⟩,⟨4539,1,443,.first,.reverseMinus,12⟩]⟩,
  ⟨[4541, 13637], [⟨7,1,1,.second,.plus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨1137,7,1025,.first,.reverseMinus,4⟩,⟨4541,7,1137,.second,.plus,2⟩,⟨13637,1137,4541,.first,.reverseMinus,3⟩]⟩,
  ⟨[4541, 27273], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨4541,3,71,.second,.plus,6⟩,⟨13635,71,4541,.first,.plus,8⟩,⟨27273,3,13635,.second,.reverseMinus,1⟩]⟩,
  ⟨[4551, 13623], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨567,9,9,.second,.plus,6⟩,⟨4551,15,567,.second,.reverseMinus,3⟩,⟨13623,567,4551,.first,.reverseMinus,4⟩]⟩,
  ⟨[4551, 27245], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨4551,7,71,.second,.reverseMinus,6⟩,⟨13625,71,4551,.first,.plus,8⟩,⟨27245,5,13625,.second,.plus,1⟩]⟩,
  ⟨[4559, 16225], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨507,1,5,.first,.plus,9⟩,⟨1013,1,507,.second,.plus,1⟩,⟨16225,1,507,.second,.reverseMinus,5⟩,⟨4559,507,1013,.second,.reverseMinus,2⟩]⟩,
  ⟨[4559, 32449], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨507,1,5,.first,.plus,9⟩,⟨1013,1,507,.second,.plus,1⟩,⟨32449,1,507,.second,.reverseMinus,6⟩,⟨4559,507,1013,.second,.reverseMinus,2⟩]⟩,
  ⟨[4563, 31471], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨285,1,253,.first,.reverseMinus,5⟩,⟨4563,3,285,.second,.reverseMinus,4⟩,⟨1297,253,285,.first,.reverseMinus,2⟩,⟨31471,1,1297,.first,.plus,15⟩]⟩,
  ⟨[4587, 15729], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨5243,5,41,.second,.plus,7⟩,⟨4587,41,5243,.first,.minus,4⟩,⟨15729,5243,5243,.second,.plus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank30
