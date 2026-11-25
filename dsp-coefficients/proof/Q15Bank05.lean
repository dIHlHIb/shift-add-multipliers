import Q15Upper
namespace Q15Bank05
open Q15Upper
def entries : List Entry := [
  ⟨[481, 11229], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨481,3,97,.first,.reverseMinus,7⟩,⟨12191,3,97,.first,.plus,12⟩,⟨11229,481,12191,.first,.minus,1⟩]⟩,
  ⟨[489, 16267], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨117,3,21,.first,.reverseMinus,5⟩,⟨16267,1,117,.first,.plus,14⟩,⟨489,21,117,.second,.reverseMinus,2⟩]⟩,
  ⟨[489, 32533], [⟨63,1,1,.second,.plus,6⟩,⟨505,1,63,.second,.reverseMinus,3⟩,⟨489,1,505,.first,.minus,4⟩,⟨213,63,489,.output,.reverseMinus,1⟩,⟨32533,505,213,.first,.reverseMinus,6⟩]⟩,
  ⟨[491, 7189], [⟨7,1,1,.second,.plus,3⟩,⟨21,7,7,.second,.plus,2⟩,⟨491,1,21,.first,.plus,9⟩,⟨7189,7,21,.first,.reverseMinus,10⟩]⟩,
  ⟨[491, 28755], [⟨7,1,1,.second,.plus,3⟩,⟨28671,1,7,.second,.plus,12⟩,⟨21,7,7,.second,.plus,2⟩,⟨491,1,21,.first,.plus,9⟩,⟨28755,28671,21,.second,.reverseMinus,2⟩]⟩,
  ⟨[503, 2047], [⟨2047,1,1,.second,.plus,11⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨503,1,9,.first,.plus,9⟩]⟩,
  ⟨[503, 8191], [⟨8191,1,1,.second,.plus,13⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨503,1,9,.first,.plus,9⟩]⟩,
  ⟨[503, 32753], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨503,1,9,.first,.plus,9⟩,⟨32753,1,15,.first,.plus,15⟩]⟩,
  ⟨[503, 32765], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨32765,1,3,.first,.plus,15⟩,⟨503,1,9,.first,.plus,9⟩]⟩,
  ⟨[505, 1351], [⟨7,1,1,.second,.plus,3⟩,⟨29,1,7,.second,.reverseMinus,2⟩,⟨505,1,7,.first,.plus,9⟩,⟨1351,29,505,.first,.plus,6⟩]⟩,
  ⟨[505, 5403], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨21,1,5,.second,.reverseMinus,2⟩,⟨169,1,21,.second,.reverseMinus,3⟩,⟨5403,5,169,.second,.plus,5⟩,⟨505,21,169,.first,.reverseMinus,4⟩]⟩,
  ⟨[511, 515], [⟨511,1,1,.second,.plus,9⟩,⟨515,1,511,.first,.reverseMinus,2⟩]⟩,
  ⟨[511, 2059], [⟨511,1,1,.second,.plus,9⟩,⟨15,1,1,.second,.plus,4⟩,⟨2059,15,511,.second,.reverseMinus,2⟩]⟩,
  ⟨[515, 32703], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨515,1,257,.second,.reverseMinus,1⟩,⟨32703,257,515,.second,.plus,6⟩]⟩,
  ⟨[517, 14143], [⟨3,1,1,.second,.plus,2⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨225,1,257,.first,.minus,5⟩,⟨517,3,257,.second,.reverseMinus,1⟩,⟨14143,257,225,.second,.plus,6⟩]⟩,
  ⟨[517, 28285], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨1285,5,5,.second,.reverseMinus,8⟩,⟨5657,517,1285,.second,.reverseMinus,2⟩,⟨28285,5657,5657,.second,.reverseMinus,2⟩]⟩,
  ⟨[525, 15837], [⟨31,1,1,.second,.plus,5⟩,⟨35,1,31,.first,.reverseMinus,2⟩,⟨15837,31,35,.first,.plus,9⟩,⟨525,35,35,.second,.plus,4⟩]⟩,
  ⟨[525, 31673], [⟨7,1,1,.second,.plus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨495,15,15,.second,.reverseMinus,5⟩,⟨31673,7,495,.second,.plus,6⟩,⟨525,15,495,.first,.reverseMinus,1⟩]⟩,
  ⟨[545, 8119], [⟨3,1,1,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨137,1,129,.first,.reverseMinus,3⟩,⟨545,3,137,.second,.plus,2⟩,⟨8119,129,137,.first,.plus,6⟩]⟩,
  ⟨[545, 32477], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨37,1,5,.first,.reverseMinus,5⟩,⟨291,5,37,.second,.plus,3⟩,⟨32477,1,291,.first,.plus,15⟩,⟨545,37,291,.second,.plus,1⟩]⟩,
  ⟨[553, 8191], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨8191,1,1,.second,.plus,13⟩,⟨553,5,513,.first,.reverseMinus,3⟩]⟩,
  ⟨[553, 16375], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨16375,1,9,.first,.plus,14⟩,⟨553,9,17,.second,.reverseMinus,5⟩]⟩,
  ⟨[553, 32749], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨32749,1,19,.first,.plus,15⟩,⟨553,19,515,.first,.reverseMinus,1⟩]⟩,
  ⟨[553, 32763], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨32763,1,5,.first,.plus,15⟩,⟨553,5,513,.first,.reverseMinus,3⟩]⟩,
  ⟨[565, 13665], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨35,5,5,.second,.plus,3⟩,⟨565,5,35,.second,.reverseMinus,4⟩,⟨4555,5,565,.first,.plus,10⟩,⟨13665,4555,4555,.second,.plus,2⟩]⟩,
  ⟨[565, 16345], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨4095,1,1,.second,.plus,12⟩,⟨35,5,5,.second,.plus,3⟩,⟨565,5,35,.second,.reverseMinus,4⟩,⟨16345,4095,35,.first,.plus,2⟩]⟩,
  ⟨[565, 27329], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨287,1,9,.second,.plus,5⟩,⟨565,9,287,.second,.plus,1⟩,⟨863,9,287,.first,.reverseMinus,6⟩,⟨27329,287,863,.second,.plus,5⟩]⟩,
  ⟨[565, 32689], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨79,3,67,.first,.reverseMinus,2⟩,⟨32689,1,79,.first,.plus,15⟩,⟨565,67,79,.second,.plus,3⟩]⟩,
  ⟨[601, 16207], [⟨15,1,1,.second,.plus,4⟩,⟨121,1,15,.second,.reverseMinus,3⟩,⟨601,15,121,.first,.reverseMinus,5⟩,⟨2041,15,121,.first,.reverseMinus,7⟩,⟨16207,121,2041,.second,.plus,3⟩]⟩,
  ⟨[601, 32413], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨89,3,7,.first,.plus,5⟩,⟨601,1,89,.first,.reverseMinus,9⟩,⟨355,1,89,.second,.plus,2⟩,⟨32413,1,355,.first,.plus,15⟩]⟩,
  ⟨[603, 16373], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨16373,3,2047,.second,.plus,3⟩,⟨603,67,67,.second,.reverseMinus,3⟩]⟩,
  ⟨[603, 16381], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨16381,1,3,.first,.plus,14⟩,⟨603,67,67,.second,.reverseMinus,3⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank05
