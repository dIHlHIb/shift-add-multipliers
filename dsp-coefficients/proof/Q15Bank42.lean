import Q15Upper
namespace Q15Bank42
open Q15Upper
def entries : List Entry := [
  ⟨[7713, 11039], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨479,1,33,.first,.plus,9⟩,⟨165,33,33,.second,.reverseMinus,2⟩,⟨7713,1,479,.first,.plus,13⟩,⟨11039,479,165,.second,.reverseMinus,6⟩]⟩,
  ⟨[7717, 15923], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨1953,1,95,.first,.plus,11⟩,⟨7717,95,1953,.second,.plus,2⟩,⟨63689,1953,7717,.second,.reverseMinus,3⟩,⟨15923,3,63689,.output,.plus,2⟩]⟩,
  ⟨[7717, 31847], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨475,95,95,.second,.reverseMinus,2⟩,⟨7717,1,475,.first,.plus,13⟩,⟨7527,95,7717,.first,.minus,1⟩,⟨31847,95,7527,.first,.reverseMinus,8⟩]⟩,
  ⟨[7723, 14449], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨15,1,1,.second,.plus,4⟩,⟨1935,15,15,.second,.reverseMinus,7⟩,⟨14449,1,1935,.first,.plus,14⟩,⟨7723,17,1935,.second,.plus,2⟩]⟩,
  ⟨[7723, 28899], [⟨7,1,1,.second,.plus,3⟩,⟨249,1,7,.first,.plus,8⟩,⟨1993,1,249,.second,.reverseMinus,3⟩,⟨7723,249,1993,.second,.plus,2⟩,⟨28899,1993,7723,.second,.plus,2⟩]⟩,
  ⟨[7767, 15917], [⟨7,1,1,.second,.plus,3⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨8215,7,513,.second,.reverseMinus,4⟩,⟨7767,7,8215,.first,.minus,6⟩,⟨15917,513,8215,.second,.plus,1⟩]⟩,
  ⟨[7767, 31835], [⟨3,1,1,.second,.plus,2⟩,⟨767,1,3,.second,.plus,8⟩,⟨863,3,767,.first,.reverseMinus,5⟩,⟨7767,863,863,.second,.reverseMinus,3⟩,⟨31835,767,7767,.second,.reverseMinus,2⟩]⟩,
  ⟨[7815, 15911], [⟨7,1,1,.second,.plus,3⟩,⟨249,1,7,.first,.plus,8⟩,⟨7943,1,249,.first,.plus,13⟩,⟨7815,1,7943,.first,.minus,7⟩,⟨15911,249,7943,.first,.reverseMinus,5⟩]⟩,
  ⟨[7815, 31823], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨977,3,1025,.first,.minus,4⟩,⟨7815,1,977,.second,.plus,3⟩,⟨31823,1025,977,.first,.plus,5⟩]⟩,
  ⟨[7817, 9801], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨119,5,31,.second,.plus,2⟩,⟨7817,31,119,.first,.plus,8⟩,⟨9801,31,7817,.first,.reverseMinus,6⟩]⟩,
  ⟨[7821, 9753], [⟨513,1,1,.second,.reverseMinus,9⟩,⟨515,1,513,.first,.reverseMinus,1⟩,⟨7693,513,515,.first,.plus,4⟩,⟨7821,1,7693,.first,.reverseMinus,7⟩,⟨9753,515,7693,.first,.reverseMinus,2⟩]⟩,
  ⟨[7843, 9463], [⟨7,1,1,.second,.plus,3⟩,⟨135,1,7,.first,.reverseMinus,7⟩,⟨7303,7,135,.first,.reverseMinus,10⟩,⟨7843,135,7303,.first,.reverseMinus,2⟩,⟨9463,135,7303,.first,.reverseMinus,4⟩]⟩,
  ⟨[7861, 9223], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨1031,1,129,.second,.plus,3⟩,⟨387,129,129,.second,.plus,2⟩,⟨9223,1,1031,.first,.reverseMinus,13⟩,⟨7861,1031,387,.first,.plus,3⟩]⟩,
  ⟨[7865, 15905], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨7937,1,31,.second,.reverseMinus,8⟩,⟨7865,9,7937,.first,.minus,3⟩,⟨15905,31,7937,.second,.reverseMinus,1⟩]⟩,
  ⟨[7865, 31811], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨319,1,5,.second,.plus,6⟩,⟨7873,1,319,.first,.plus,13⟩,⟨7865,1,7873,.first,.minus,3⟩,⟨31811,319,7873,.second,.reverseMinus,2⟩]⟩,
  ⟨[7875, 9029], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨577,1,9,.second,.reverseMinus,6⟩,⟨2625,1,577,.first,.reverseMinus,11⟩,⟨7875,2625,2625,.second,.plus,2⟩,⟨9029,577,7875,.first,.reverseMinus,1⟩]⟩,
  ⟨[7885, 8885], [⟨63,1,1,.second,.plus,6⟩,⟨1985,1,63,.first,.plus,11⟩,⟨7877,63,1985,.second,.plus,2⟩,⟨7885,1,7877,.first,.reverseMinus,3⟩,⟨8885,63,7877,.first,.reverseMinus,4⟩]⟩,
  ⟨[7905, 8595], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨287,1,9,.second,.plus,5⟩,⟨573,1,287,.second,.plus,1⟩,⟨7905,1,287,.first,.plus,13⟩,⟨8595,573,573,.second,.plus,4⟩]⟩,
  ⟨[7913, 15899], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨7945,9,31,.second,.reverseMinus,8⟩,⟨7913,1,7945,.first,.minus,5⟩,⟨15899,9,7945,.second,.reverseMinus,1⟩]⟩,
  ⟨[7913, 31799], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨247,1,9,.first,.plus,8⟩,⟨493,1,247,.second,.plus,1⟩,⟨7913,9,247,.second,.reverseMinus,5⟩,⟨31799,247,493,.second,.reverseMinus,6⟩]⟩,
  ⟨[7915, 8449], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨8449,1,33,.second,.reverseMinus,8⟩,⟨267,3,33,.second,.reverseMinus,3⟩,⟨7915,8449,267,.second,.minus,1⟩]⟩,
  ⟨[7931, 8205], [⟨3,1,1,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨8189,1,3,.first,.plus,13⟩,⟨8205,1,8189,.first,.reverseMinus,4⟩,⟨7931,129,8189,.first,.minus,1⟩]⟩,
  ⟨[7961, 15893], [⟨3,1,1,.second,.plus,2⟩,⟨8193,1,1,.second,.reverseMinus,13⟩,⟨29,1,3,.first,.plus,5⟩,⟨7961,8193,29,.second,.minus,3⟩,⟨15893,29,7961,.second,.plus,1⟩]⟩,
  ⟨[7961, 31785], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨8197,1,5,.first,.reverseMinus,13⟩,⟨7961,59,8197,.first,.minus,2⟩,⟨31785,59,7961,.second,.plus,2⟩]⟩,
  ⟨[8011, 15887], [⟨15,1,1,.second,.plus,4⟩,⟨31,1,1,.second,.plus,5⟩,⟨75,15,15,.second,.reverseMinus,2⟩,⟨15887,15,31,.second,.reverseMinus,9⟩,⟨8011,31,75,.first,.reverseMinus,8⟩]⟩,
  ⟨[8011, 31773], [⟨15,1,1,.second,.plus,4⟩,⟨31,1,1,.second,.plus,5⟩,⟨7951,15,31,.second,.reverseMinus,8⟩,⟨8011,15,7951,.first,.reverseMinus,2⟩,⟨31773,31,7951,.second,.plus,2⟩]⟩,
  ⟨[8059, 15881], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨503,1,63,.second,.plus,3⟩,⟨8059,5,63,.second,.plus,7⟩,⟨15881,1,503,.first,.plus,14⟩]⟩,
  ⟨[8059, 31761], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨1007,1,17,.first,.plus,10⟩,⟨31761,1,1007,.first,.plus,15⟩,⟨8059,3,1007,.second,.reverseMinus,3⟩]⟩,
  ⟨[8109, 15875], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨509,1,3,.first,.plus,9⟩,⟨15875,1,509,.first,.plus,14⟩,⟨8109,35,509,.second,.plus,4⟩]⟩,
  ⟨[8109, 31749], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨507,3,63,.second,.reverseMinus,3⟩,⟨8109,3,507,.second,.plus,4⟩,⟨31749,63,507,.first,.plus,9⟩]⟩,
  ⟨[8119, 14231], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨2033,1,127,.second,.reverseMinus,4⟩,⟨8119,9,127,.second,.plus,6⟩,⟨14231,2033,2033,.second,.plus,3⟩]⟩,
  ⟨[8119, 28461], [⟨15,1,1,.second,.plus,4⟩,⟨2033,1,15,.first,.plus,11⟩,⟨4067,1,2033,.second,.reverseMinus,1⟩,⟨8119,15,4067,.second,.plus,1⟩,⟨28461,2033,4067,.first,.plus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank42
