import Q15Upper
namespace Q15Bank11
open Q15Upper
def entries : List Entry := [
  ⟨[1171, 3925], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨19,1,9,.second,.reverseMinus,1⟩,⟨493,1,19,.first,.plus,9⟩,⟨1171,9,19,.first,.reverseMinus,7⟩,⟨3925,19,493,.second,.plus,3⟩]⟩,
  ⟨[1171, 31401], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨2111,1,33,.second,.plus,6⟩,⟨2375,33,2111,.first,.reverseMinus,3⟩,⟨1171,33,2375,.output,.reverseMinus,1⟩,⟨31401,2111,2375,.first,.plus,4⟩]⟩,
  ⟨[1177, 8107], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨165,5,5,.second,.reverseMinus,5⟩,⟨1177,517,165,.second,.reverseMinus,2⟩,⟨8107,517,165,.first,.plus,4⟩]⟩,
  ⟨[1177, 15693], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨147,49,49,.second,.plus,2⟩,⟨1177,1,147,.second,.reverseMinus,3⟩,⟨981,49,1177,.first,.minus,2⟩,⟨15693,3,981,.second,.plus,4⟩]⟩,
  ⟨[1177, 31387], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨785,1,49,.second,.reverseMinus,4⟩,⟨1177,49,785,.first,.reverseMinus,3⟩,⟨3923,785,1177,.second,.plus,2⟩,⟨31387,3,3923,.second,.reverseMinus,3⟩]⟩,
  ⟨[1177, 32427], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨145,1,129,.first,.reverseMinus,4⟩,⟨1177,129,145,.first,.reverseMinus,3⟩,⟨8401,129,145,.first,.reverseMinus,6⟩,⟨32427,1177,8401,.second,.plus,2⟩]⟩,
  ⟨[1183, 7843], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨3937,31,31,.second,.plus,7⟩,⟨1183,5,3937,.first,.plus,10⟩,⟨7843,31,3937,.second,.plus,1⟩]⟩,
  ⟨[1183, 31371], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨37,3,11,.first,.plus,4⟩,⟨1183,1,37,.second,.plus,5⟩,⟨1397,11,11,.second,.plus,7⟩,⟨31371,1,1397,.first,.plus,15⟩]⟩,
  ⟨[1187, 1669], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨1571,3,49,.second,.reverseMinus,5⟩,⟨1187,3,1571,.first,.minus,7⟩,⟨1669,49,1571,.first,.reverseMinus,1⟩]⟩,
  ⟨[1187, 26703], [⟨15,1,1,.second,.plus,4⟩,⟨481,1,15,.second,.reverseMinus,5⟩,⟨417,1,481,.first,.minus,6⟩,⟨26703,15,417,.second,.reverseMinus,6⟩,⟨1187,481,417,.second,.plus,2⟩]⟩,
  ⟨[1189, 15679], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨5119,1,5,.second,.plus,10⟩,⟨165,5,5,.second,.reverseMinus,5⟩,⟨1189,1,165,.first,.reverseMinus,10⟩,⟨15679,5119,165,.second,.reverseMinus,6⟩]⟩,
  ⟨[1189, 31357], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨91,3,5,.first,.plus,5⟩,⟨1189,5,91,.first,.plus,8⟩,⟨9603,91,1189,.second,.reverseMinus,3⟩,⟨31357,5,9603,.first,.plus,13⟩]⟩,
  ⟨[1195, 15671], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨239,1,17,.first,.plus,8⟩,⟨1929,17,239,.second,.reverseMinus,3⟩,⟨1195,239,239,.second,.reverseMinus,2⟩,⟨15671,239,1929,.second,.reverseMinus,3⟩]⟩,
  ⟨[1195, 31343], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨239,1,17,.first,.plus,8⟩,⟨243,1,239,.first,.reverseMinus,2⟩,⟨1195,239,239,.second,.reverseMinus,2⟩,⟨31343,239,243,.second,.reverseMinus,7⟩]⟩,
  ⟨[1201, 31327], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1281,1,5,.second,.reverseMinus,8⟩,⟨1019,1,5,.first,.plus,10⟩,⟨1201,5,1281,.first,.minus,4⟩,⟨31327,1281,1019,.second,.plus,5⟩]⟩,
  ⟨[1205, 4085], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨1013,3,127,.second,.plus,3⟩,⟨1205,3,1013,.first,.reverseMinus,6⟩,⟨4085,3,1013,.first,.reverseMinus,10⟩]⟩,
  ⟨[1205, 32679], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨89,3,7,.first,.plus,5⟩,⟨32679,1,89,.first,.plus,15⟩,⟨181,3,89,.second,.reverseMinus,1⟩,⟨1205,1,181,.first,.reverseMinus,10⟩]⟩,
  ⟨[1207, 1957], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨155,5,5,.second,.plus,5⟩,⟨1207,33,155,.second,.plus,3⟩,⟨1957,33,155,.first,.plus,6⟩]⟩,
  ⟨[1207, 16373], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨19,1,9,.second,.reverseMinus,1⟩,⟨1207,9,19,.second,.plus,6⟩,⟨16373,2049,19,.first,.plus,3⟩]⟩,
  ⟨[1207, 31313], [⟨31,1,1,.second,.plus,5⟩,⟨97,1,31,.first,.plus,7⟩,⟨1455,97,97,.second,.plus,4⟩,⟨31313,1,1455,.first,.plus,15⟩,⟨1207,31,1455,.first,.minus,3⟩]⟩,
  ⟨[1207, 32745], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨23,1,3,.second,.plus,3⟩,⟨32745,1,23,.first,.plus,15⟩,⟨1207,1023,23,.second,.reverseMinus,3⟩]⟩,
  ⟨[1213, 15649], [⟨15,1,1,.second,.plus,4⟩,⟨127,1,1,.second,.plus,7⟩,⟨607,15,127,.first,.reverseMinus,5⟩,⟨1213,1,607,.second,.plus,1⟩,⟨15649,127,607,.first,.plus,7⟩]⟩,
  ⟨[1213, 31299], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨1213,3,19,.second,.plus,6⟩,⟨31299,127,1213,.first,.plus,8⟩]⟩,
  ⟨[1215, 6595], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨1215,1,191,.first,.reverseMinus,10⟩,⟨3905,1,191,.first,.plus,12⟩,⟨6595,1215,3905,.second,.plus,1⟩]⟩,
  ⟨[1215, 26379], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨1215,1,191,.first,.reverseMinus,10⟩,⟨103,11,191,.first,.minus,3⟩,⟨26379,11,103,.second,.reverseMinus,8⟩]⟩,
  ⟨[1219, 7821], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨237,1,19,.first,.plus,8⟩,⟨1219,3,19,.second,.reverseMinus,6⟩,⟨7821,237,237,.second,.reverseMinus,5⟩]⟩,
  ⟨[1219, 31283], [⟨3,1,1,.second,.plus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨1949,1,99,.first,.plus,11⟩,⟨31283,99,1949,.second,.reverseMinus,4⟩,⟨1219,99,1949,.first,.plus,5⟩]⟩,
  ⟨[1225, 6565], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨19,1,9,.second,.reverseMinus,1⟩,⟨4115,1,19,.first,.reverseMinus,12⟩,⟨1225,9,19,.second,.reverseMinus,6⟩,⟨6565,4115,1225,.second,.reverseMinus,1⟩]⟩,
  ⟨[1225, 7817], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨375,25,25,.second,.plus,4⟩,⟨7817,1,375,.first,.plus,13⟩,⟨1225,25,375,.first,.plus,6⟩]⟩,
  ⟨[1225, 26259], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨307,3,19,.second,.reverseMinus,4⟩,⟨1225,3,307,.second,.plus,2⟩,⟨39277,19,307,.second,.plus,7⟩,⟨26259,1,39277,.first,.plus,16⟩]⟩,
  ⟨[1225, 31269], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨137,1,17,.second,.reverseMinus,3⟩,⟨16247,1,137,.first,.plus,14⟩,⟨1225,17,137,.first,.reverseMinus,6⟩,⟨31269,16247,1225,.first,.plus,1⟩]⟩,
  ⟨[1227, 16199], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1089,1,17,.second,.reverseMinus,6⟩,⟨1225,17,1089,.first,.reverseMinus,3⟩,⟨1227,1,1225,.first,.reverseMinus,1⟩,⟨16199,1089,1225,.first,.plus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank11
