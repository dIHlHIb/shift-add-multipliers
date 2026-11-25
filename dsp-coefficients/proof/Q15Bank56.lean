import Q15Upper
namespace Q15Bank56
open Q15Upper
def entries : List Entry := [
  ⟨[14143, 16543], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨16383,1,1,.second,.plus,14⟩,⟨35,5,5,.second,.plus,3⟩,⟨16543,5,16383,.first,.reverseMinus,5⟩,⟨14143,16383,35,.second,.minus,6⟩]⟩,
  ⟨[14147, 14779], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨221,3,7,.second,.plus,5⟩,⟨14147,3,221,.second,.reverseMinus,6⟩,⟨7389,7,221,.first,.reverseMinus,10⟩,⟨14779,1,7389,.second,.reverseMinus,1⟩]⟩,
  ⟨[14147, 29557], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨221,3,7,.second,.plus,5⟩,⟨14147,3,221,.second,.reverseMinus,6⟩,⟨7389,7,221,.first,.reverseMinus,10⟩,⟨29557,1,7389,.second,.reverseMinus,2⟩]⟩,
  ⟨[14155, 16499], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨4119,1,23,.first,.reverseMinus,12⟩,⟨16499,23,4119,.second,.reverseMinus,2⟩,⟨1769,23,4119,.first,.plus,8⟩,⟨14155,3,1769,.second,.reverseMinus,3⟩]⟩,
  ⟨[14181, 16413], [⟨31,1,1,.second,.plus,5⟩,⟨8191,1,1,.second,.plus,13⟩,⟨279,31,31,.second,.reverseMinus,3⟩,⟨16413,31,8191,.second,.reverseMinus,1⟩,⟨14181,279,16413,.first,.minus,3⟩]⟩,
  ⟨[14191, 29535], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨895,1,129,.first,.plus,10⟩,⟨14191,129,895,.second,.plus,4⟩,⟨29535,895,895,.second,.reverseMinus,5⟩]⟩,
  ⟨[14193, 16369], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨15,1,1,.second,.plus,4⟩,⟨16369,1,15,.first,.plus,14⟩,⟨14193,17,16369,.first,.minus,7⟩]⟩,
  ⟨[14231, 16239], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨127,1,1,.second,.plus,7⟩,⟨2033,1,127,.second,.reverseMinus,4⟩,⟨16239,17,127,.second,.plus,7⟩,⟨14231,2033,2033,.second,.plus,3⟩]⟩,
  ⟨[14237, 14757], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨8191,1,1,.second,.plus,13⟩,⟨2145,65,65,.second,.reverseMinus,5⟩,⟨14237,8191,2145,.first,.plus,1⟩,⟨14757,65,14237,.first,.reverseMinus,3⟩]⟩,
  ⟨[14237, 29513], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨445,3,61,.first,.reverseMinus,7⟩,⟨14237,3,445,.second,.plus,5⟩,⟨1719,61,445,.second,.plus,2⟩,⟨29513,61,1719,.first,.plus,9⟩]⟩,
  ⟨[14243, 16195], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨61,1,3,.first,.plus,6⟩,⟨16195,127,61,.first,.plus,7⟩,⟨14243,61,16195,.first,.minus,5⟩]⟩,
  ⟨[14283, 29491], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨459,27,27,.second,.reverseMinus,4⟩,⟨14283,27,459,.first,.reverseMinus,9⟩,⟨115,1,459,.output,.plus,2⟩,⟨29491,459,115,.first,.reverseMinus,6⟩]⟩,
  ⟨[14293, 16019], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨1001,1,23,.first,.plus,10⟩,⟨16019,3,1001,.second,.reverseMinus,4⟩,⟨2005,3,1001,.second,.reverseMinus,1⟩,⟨14293,3,2005,.first,.reverseMinus,12⟩]⟩,
  ⟨[14305, 15977], [⟨7,1,1,.second,.plus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨105,7,7,.second,.plus,4⟩,⟨14305,7,31,.first,.plus,11⟩,⟨15977,31,105,.first,.reverseMinus,9⟩]⟩,
  ⟨[14317, 15933], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨14317,7,19,.first,.plus,11⟩,⟨451,3,7,.second,.reverseMinus,6⟩,⟨15933,1,451,.first,.plus,14⟩]⟩,
  ⟨[14327, 14735], [⟨7,1,1,.second,.plus,3⟩,⟨14335,1,7,.second,.plus,11⟩,⟨25,1,7,.first,.plus,5⟩,⟨14327,1,14335,.first,.minus,3⟩,⟨14735,14335,25,.second,.reverseMinus,4⟩]⟩,
  ⟨[14327, 29469], [⟨7,1,1,.second,.plus,3⟩,⟨895,1,7,.second,.plus,7⟩,⟨893,1,895,.first,.minus,1⟩,⟨14327,7,895,.second,.reverseMinus,4⟩,⟨29469,893,893,.second,.reverseMinus,5⟩]⟩,
  ⟨[14329, 15889], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨14329,7,7,.second,.plus,11⟩,⟨15889,195,14329,.first,.reverseMinus,3⟩]⟩,
  ⟨[14341, 15845], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨14341,5,7,.second,.reverseMinus,11⟩,⟨47,5,7,.first,.reverseMinus,3⟩,⟨15845,14341,47,.second,.reverseMinus,5⟩]⟩,
  ⟨[14373, 29447], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨28679,7,7,.second,.reverseMinus,12⟩,⟨29447,3,28679,.first,.reverseMinus,8⟩,⟨14341,3,28679,.output,.plus,1⟩,⟨14373,1,14341,.first,.reverseMinus,5⟩]⟩,
  ⟨[14417, 14713], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨14329,7,7,.second,.plus,11⟩,⟨14713,3,14329,.first,.reverseMinus,7⟩,⟨14353,3,14329,.first,.reverseMinus,3⟩,⟨14417,1,14353,.first,.reverseMinus,6⟩]⟩,
  ⟨[14417, 29425], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨1967,5,2047,.first,.minus,4⟩,⟨14417,1,1967,.first,.plus,14⟩,⟨29425,2047,1967,.second,.plus,4⟩]⟩,
  ⟨[14449, 15447], [⟨15,1,1,.second,.plus,4⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨1935,15,15,.second,.reverseMinus,7⟩,⟨14449,1,1935,.first,.plus,14⟩,⟨15447,33,1935,.second,.plus,3⟩]⟩,
  ⟨[14461, 15403], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨1923,3,15,.second,.reverseMinus,7⟩,⟨14461,1,1923,.first,.plus,14⟩,⟨15387,3,1923,.second,.reverseMinus,3⟩,⟨15403,1,15387,.first,.reverseMinus,4⟩]⟩,
  ⟨[14463, 29403], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨113,1,15,.first,.plus,7⟩,⟨14463,1,113,.second,.plus,7⟩,⟨14703,15,14463,.first,.reverseMinus,4⟩,⟨29403,3,14703,.second,.plus,1⟩]⟩,
  ⟨[14473, 15357], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨15357,3,15,.second,.plus,10⟩,⟨14461,7,15357,.first,.minus,7⟩,⟨14473,3,14461,.first,.reverseMinus,2⟩]⟩,
  ⟨[14485, 15313], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨239,1,17,.first,.plus,8⟩,⟨207,1,239,.first,.minus,5⟩,⟨15313,17,239,.second,.reverseMinus,6⟩,⟨14485,207,15313,.first,.minus,2⟩]⟩,
  ⟨[14497, 15269], [⟨31,1,1,.second,.plus,5⟩,⟨225,1,31,.first,.plus,8⟩,⟨14369,31,225,.second,.plus,6⟩,⟨14497,1,14369,.first,.reverseMinus,7⟩,⟨15269,225,14369,.first,.reverseMinus,2⟩]⟩,
  ⟨[14507, 14691], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨459,27,27,.second,.reverseMinus,4⟩,⟨14691,3,459,.second,.reverseMinus,5⟩,⟨14475,27,14691,.first,.minus,3⟩,⟨14507,1,14475,.first,.reverseMinus,5⟩]⟩,
  ⟨[14507, 29381], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨27,1,5,.first,.plus,5⟩,⟨459,27,27,.second,.reverseMinus,4⟩,⟨29381,5,459,.second,.reverseMinus,6⟩,⟨15147,459,459,.second,.reverseMinus,5⟩,⟨14507,5,15147,.first,.minus,7⟩]⟩,
  ⟨[14531, 15135], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨14339,3,7,.second,.reverseMinus,11⟩,⟨14531,3,14339,.first,.reverseMinus,6⟩,⟨14367,7,14339,.first,.reverseMinus,2⟩,⟨15135,3,14367,.first,.reverseMinus,8⟩]⟩,
  ⟨[14543, 15091], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨15099,5,59,.second,.plus,8⟩,⟨15091,1,15099,.first,.minus,3⟩,⟨14863,59,15099,.first,.minus,2⟩,⟨14543,5,14863,.first,.minus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank56
