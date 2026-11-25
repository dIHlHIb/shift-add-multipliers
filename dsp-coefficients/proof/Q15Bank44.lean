import Q15Upper
namespace Q15Bank44
open Q15Upper
def entries : List Entry := [
  ⟨[8595, 27897], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨109,3,7,.second,.plus,4⟩,⟨27897,7,109,.second,.plus,8⟩,⟨403,1,109,.first,.plus,9⟩,⟨8595,1,403,.first,.reverseMinus,13⟩]⟩,
  ⟨[8595, 31621], [⟨255,1,1,.second,.plus,8⟩,⟨1019,1,255,.second,.plus,2⟩,⟨955,1,1019,.first,.minus,6⟩,⟨31621,255,1019,.first,.plus,7⟩,⟨8595,955,955,.second,.reverseMinus,3⟩]⟩,
  ⟨[8643, 31607], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨4225,1,129,.first,.reverseMinus,12⟩,⟨2193,129,129,.second,.reverseMinus,4⟩,⟨8643,129,2193,.second,.plus,2⟩,⟨31607,4225,2193,.first,.plus,3⟩]⟩,
  ⟨[8659, 13909], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨8147,1,45,.first,.plus,13⟩,⟨8659,1,8147,.first,.reverseMinus,9⟩,⟨13907,45,8147,.first,.reverseMinus,7⟩,⟨13909,1,13907,.first,.reverseMinus,1⟩]⟩,
  ⟨[8659, 27817], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨8147,1,45,.first,.plus,13⟩,⟨8659,1,8147,.first,.reverseMinus,9⟩,⟨13907,45,8147,.first,.reverseMinus,7⟩,⟨27817,3,13907,.second,.reverseMinus,1⟩]⟩,
  ⟨[8691, 15797], [⟨1023,1,1,.second,.plus,10⟩,⟨1019,1,1023,.first,.minus,2⟩,⟨507,1,1019,.first,.minus,9⟩,⟨8691,1023,507,.first,.reverseMinus,3⟩,⟨15797,1019,507,.first,.plus,4⟩]⟩,
  ⟨[8691, 31595], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨2173,3,17,.second,.plus,7⟩,⟨8691,1,2173,.second,.plus,2⟩,⟨15211,2173,2173,.second,.plus,3⟩,⟨31595,1,15211,.first,.reverseMinus,14⟩]⟩,
  ⟨[8723, 13869], [⟨513,1,1,.second,.reverseMinus,9⟩,⟨515,1,513,.first,.reverseMinus,1⟩,⟨2573,513,515,.second,.reverseMinus,2⟩,⟨8723,513,515,.first,.reverseMinus,4⟩,⟨13869,2573,8723,.first,.reverseMinus,1⟩]⟩,
  ⟨[8723, 27737], [⟨3,1,1,.second,.plus,2⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨8755,515,515,.second,.reverseMinus,4⟩,⟨8723,1,8755,.first,.minus,5⟩,⟨26201,8755,8723,.second,.reverseMinus,1⟩,⟨27737,3,26201,.first,.reverseMinus,9⟩]⟩,
  ⟨[8739, 15791], [⟨3,1,1,.second,.plus,2⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨273,1,257,.first,.reverseMinus,4⟩,⟨8739,3,273,.second,.reverseMinus,5⟩,⟨16175,257,273,.first,.plus,6⟩,⟨15791,3,16175,.first,.minus,7⟩]⟩,
  ⟨[8739, 31581], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨35,1,17,.second,.reverseMinus,1⟩,⟨8739,17,35,.first,.reverseMinus,9⟩,⟨315,35,35,.second,.reverseMinus,3⟩,⟨31581,8739,315,.second,.plus,7⟩]⟩,
  ⟨[8765, 27685], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨37,1,27,.first,.plus,6⟩,⟨27685,27,37,.first,.reverseMinus,10⟩,⟨8741,37,27685,.first,.minus,9⟩,⟨8765,3,8741,.first,.reverseMinus,3⟩]⟩,
  ⟨[8787, 13829], [⟨3,1,1,.second,.plus,2⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨517,1,515,.first,.reverseMinus,1⟩,⟨8787,515,517,.second,.reverseMinus,4⟩,⟨2555,3,517,.first,.plus,10⟩,⟨13829,1,2555,.first,.plus,14⟩]⟩,
  ⟨[8787, 27657], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨27657,9,27,.second,.reverseMinus,10⟩,⟨549,9,27,.first,.plus,6⟩,⟨8787,3,549,.second,.reverseMinus,4⟩]⟩,
  ⟨[8789, 31567], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨8789,517,517,.second,.reverseMinus,4⟩,⟨34639,517,8789,.second,.plus,2⟩,⟨31567,3,34639,.first,.minus,10⟩]⟩,
  ⟨[8829, 27603], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨8829,3,69,.second,.plus,7⟩,⟨3459,3,8829,.first,.plus,12⟩,⟨27603,69,3459,.second,.plus,3⟩]⟩,
  ⟨[8837, 15777], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨493,1,19,.first,.plus,9⟩,⟨15777,1,493,.second,.reverseMinus,5⟩,⟨645,19,493,.first,.reverseMinus,3⟩,⟨8837,1,645,.first,.reverseMinus,13⟩]⟩,
  ⟨[8837, 31555], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨493,1,19,.first,.plus,9⟩,⟨31555,3,493,.second,.reverseMinus,6⟩,⟨645,19,493,.first,.reverseMinus,3⟩,⟨8837,1,645,.first,.reverseMinus,13⟩]⟩,
  ⟨[8871, 27549], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨861,3,27,.second,.plus,5⟩,⟨27549,3,861,.second,.plus,5⟩,⟨3417,27,861,.second,.plus,2⟩,⟨8871,3,3417,.first,.plus,12⟩]⟩,
  ⟨[8885, 31541], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨139,1,11,.first,.reverseMinus,7⟩,⟨8885,11,139,.second,.plus,6⟩,⟨31413,11,8885,.first,.reverseMinus,11⟩,⟨31541,1,31413,.first,.reverseMinus,7⟩]⟩,
  ⟨[8933, 15763], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨2021,1,27,.first,.plus,11⟩,⟨8933,27,2021,.first,.reverseMinus,8⟩,⟨1967,27,2021,.first,.minus,1⟩,⟨15763,27,1967,.second,.reverseMinus,3⟩]⟩,
  ⟨[8933, 31527], [⟨3,1,1,.second,.plus,2⟩,⟨765,3,3,.second,.plus,8⟩,⟨1021,1,3,.first,.plus,10⟩,⟨8933,765,1021,.second,.reverseMinus,3⟩,⟨1017,1,1021,.first,.minus,2⟩,⟨31527,1017,1017,.second,.plus,5⟩]⟩,
  ⟨[8935, 13733], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨443,5,7,.second,.plus,6⟩,⟨13733,443,443,.second,.plus,5⟩,⟨2235,7,443,.first,.reverseMinus,8⟩,⟨8935,5,2235,.second,.plus,2⟩]⟩,
  ⟨[8935, 27467], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨8167,1,25,.first,.plus,13⟩,⟨8935,3,8167,.first,.reverseMinus,8⟩,⟨23733,8167,8935,.first,.plus,2⟩,⟨27467,25,23733,.first,.plus,11⟩]⟩,
  ⟨[8977, 27411], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨9217,1,9,.second,.reverseMinus,10⟩,⟨8977,15,9217,.first,.minus,4⟩,⟨27411,9217,8977,.first,.reverseMinus,1⟩]⟩,
  ⟨[8981, 15757], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨8981,21,35,.second,.reverseMinus,8⟩,⟨7861,35,8981,.first,.minus,5⟩,⟨15757,35,7861,.second,.reverseMinus,1⟩]⟩,
  ⟨[8981, 31513], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨21,1,5,.second,.reverseMinus,2⟩,⟨1259,5,21,.first,.plus,8⟩,⟨8981,5,1259,.first,.plus,11⟩,⟨1255,1,1259,.first,.minus,2⟩,⟨31513,1,1255,.first,.plus,15⟩]⟩,
  ⟨[9019, 27357], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨829,3,13,.second,.plus,6⟩,⟨27357,829,829,.second,.reverseMinus,5⟩,⟨827,1,829,.first,.minus,1⟩,⟨9019,1,827,.first,.reverseMinus,13⟩]⟩,
  ⟨[9029, 31499], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨837,27,27,.second,.plus,5⟩,⟨9029,1,837,.first,.reverseMinus,13⟩,⟨1269,27,837,.first,.reverseMinus,4⟩,⟨31499,1,1269,.first,.plus,15⟩]⟩,
  ⟨[9061, 13651], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨119,1,9,.first,.plus,7⟩,⟨2295,9,9,.second,.plus,8⟩,⟨9061,119,2295,.second,.plus,2⟩,⟨13651,2295,9061,.first,.reverseMinus,1⟩]⟩,
  ⟨[9061, 27301], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨283,5,9,.second,.plus,5⟩,⟨9061,5,283,.second,.reverseMinus,5⟩,⟨27173,283,9061,.first,.reverseMinus,6⟩,⟨27301,1,27173,.first,.reverseMinus,7⟩]⟩,
  ⟨[9079, 15743], [⟨127,1,1,.second,.plus,7⟩,⟨8127,1,127,.second,.plus,6⟩,⟨119,1,127,.first,.minus,3⟩,⟨9079,8127,119,.second,.reverseMinus,3⟩,⟨15743,8127,119,.second,.reverseMinus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank44
