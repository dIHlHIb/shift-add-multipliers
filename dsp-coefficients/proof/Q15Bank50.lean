import Q15Upper
namespace Q15Bank50
open Q15Upper
def entries : List Entry := [
  ⟨[11261, 23801], [⟨3,1,1,.second,.plus,2⟩,⟨769,1,3,.second,.reverseMinus,8⟩,⟨12285,3,3,.second,.plus,12⟩,⟨11261,1,12285,.first,.minus,10⟩,⟨23801,769,12285,.second,.plus,1⟩]⟩,
  ⟨[11275, 15383], [⟨1025,1,1,.second,.reverseMinus,10⟩,⟨15375,1025,1025,.second,.plus,4⟩,⟨15383,1,15375,.first,.reverseMinus,3⟩,⟨11275,1025,15375,.first,.minus,2⟩]⟩,
  ⟨[11275, 30767], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨15375,1025,1025,.second,.plus,4⟩,⟨30767,17,15375,.second,.reverseMinus,1⟩,⟨11275,1025,15375,.first,.minus,2⟩]⟩,
  ⟨[11279, 11883], [⟨15,1,1,.second,.plus,4⟩,⟨23,1,15,.first,.reverseMinus,3⟩,⟨11791,15,23,.second,.reverseMinus,9⟩,⟨11279,1,11791,.first,.minus,9⟩,⟨11883,23,11791,.first,.reverseMinus,2⟩]⟩,
  ⟨[11279, 23767], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨23575,23,23,.second,.reverseMinus,10⟩,⟨23767,3,23575,.first,.reverseMinus,6⟩,⟨11287,3,23575,.first,.minus,12⟩,⟨11279,1,11287,.first,.minus,3⟩]⟩,
  ⟨[11297, 23733], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨11253,11,11,.second,.plus,10⟩,⟨11297,11,11253,.first,.reverseMinus,2⟩,⟨11445,3,11253,.first,.reverseMinus,6⟩,⟨23733,3,11445,.first,.reverseMinus,12⟩]⟩,
  ⟨[11323, 15375], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨1013,3,1025,.first,.minus,2⟩,⟨15375,1025,1025,.second,.plus,4⟩,⟨11323,1013,15375,.first,.minus,2⟩]⟩,
  ⟨[11323, 30749], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨961,1,15,.second,.reverseMinus,6⟩,⟨30749,3,961,.second,.plus,5⟩,⟨11327,3,961,.first,.plus,12⟩,⟨11323,1,11327,.first,.minus,2⟩]⟩,
  ⟨[11369, 30733], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨407,3,23,.first,.reverseMinus,7⟩,⟨11369,23,407,.first,.plus,9⟩,⟨2035,407,407,.second,.reverseMinus,2⟩,⟨30733,1,2035,.first,.plus,15⟩]⟩,
  ⟨[11417, 15357], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨12285,3,3,.second,.plus,12⟩,⟨15357,3,12285,.first,.reverseMinus,10⟩,⟨11389,7,12285,.first,.minus,7⟩,⟨11417,7,11389,.first,.reverseMinus,2⟩]⟩,
  ⟨[11417, 30715], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨89,1,25,.first,.reverseMinus,6⟩,⟨11417,25,89,.second,.reverseMinus,7⟩,⟨6143,1,3,.second,.plus,11⟩,⟨30715,6143,6143,.second,.reverseMinus,2⟩]⟩,
  ⟨[11465, 15349], [⟨15,1,1,.second,.plus,4⟩,⟨11,1,15,.first,.minus,2⟩,⟨971,15,11,.first,.reverseMinus,6⟩,⟨15349,15,11,.first,.plus,10⟩,⟨11465,971,15349,.first,.minus,2⟩]⟩,
  ⟨[11465, 30697], [⟨3,1,1,.second,.plus,2⟩,⟨765,3,3,.second,.plus,8⟩,⟨6121,1,765,.second,.reverseMinus,3⟩,⟨30697,3,6121,.first,.reverseMinus,13⟩,⟨11477,765,6121,.second,.plus,1⟩,⟨11465,3,11477,.first,.minus,2⟩]⟩,
  ⟨[11511, 30679], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨10199,5,41,.first,.plus,11⟩,⟨30679,5,10199,.first,.reverseMinus,12⟩,⟨11511,41,10199,.first,.reverseMinus,5⟩]⟩,
  ⟨[11559, 15331], [⟨15,1,1,.second,.plus,4⟩,⟨29,1,15,.second,.plus,1⟩,⟨943,15,29,.second,.reverseMinus,5⟩,⟨15331,15,29,.first,.plus,10⟩,⟨11559,943,15331,.first,.minus,2⟩]⟩,
  ⟨[11559, 30661], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨2107,5,33,.second,.plus,6⟩,⟨30661,1,2107,.first,.plus,15⟩,⟨10535,2107,2107,.second,.reverseMinus,2⟩,⟨11559,1,10535,.first,.reverseMinus,10⟩]⟩,
  ⟨[11567, 11603], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨45,9,9,.second,.reverseMinus,2⟩,⟨91,1,45,.second,.reverseMinus,1⟩,⟨11603,45,91,.second,.plus,7⟩,⟨11567,9,11603,.first,.minus,2⟩]⟩,
  ⟨[11567, 23205], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨91,5,81,.first,.reverseMinus,1⟩,⟨11567,81,91,.second,.plus,7⟩,⟨23205,91,91,.second,.plus,8⟩]⟩,
  ⟨[11585], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨181,3,11,.first,.plus,6⟩,⟨11585,1,181,.second,.reverseMinus,6⟩]⟩,
  ⟨[11585, 23171], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨45,3,3,.second,.plus,4⟩,⟨11585,65,45,.second,.reverseMinus,8⟩,⟨23171,1,11585,.second,.reverseMinus,1⟩]⟩,
  ⟨[11603, 23135], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨83,1,45,.first,.plus,7⟩,⟨11603,45,83,.first,.reverseMinus,8⟩,⟨723,3,45,.second,.reverseMinus,4⟩,⟨23135,1,723,.second,.plus,5⟩]⟩,
  ⟨[11605, 30645], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨645,5,5,.second,.reverseMinus,7⟩,⟨10315,5,645,.second,.plus,4⟩,⟨30645,5,10315,.first,.plus,13⟩,⟨11605,645,10315,.first,.reverseMinus,1⟩]⟩,
  ⟨[11621, 23099], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨11,1,5,.second,.reverseMinus,1⟩,⟨357,5,11,.second,.reverseMinus,5⟩,⟨11621,11,357,.first,.reverseMinus,10⟩,⟨22843,5,357,.second,.plus,6⟩,⟨23099,1,22843,.first,.reverseMinus,8⟩]⟩,
  ⟨[11653, 15313], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨47,1,3,.second,.plus,4⟩,⟨15313,15,47,.first,.plus,10⟩,⟨1457,47,47,.second,.plus,5⟩,⟨11653,3,1457,.second,.plus,3⟩]⟩,
  ⟨[11653, 30627], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨11,1,5,.second,.reverseMinus,1⟩,⟨10245,5,5,.second,.reverseMinus,11⟩,⟨11653,11,10245,.first,.reverseMinus,7⟩,⟨10333,11,10245,.first,.reverseMinus,3⟩,⟨30627,5,10333,.first,.plus,13⟩]⟩,
  ⟨[11691, 22957], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨179,1,45,.second,.plus,2⟩,⟨22957,45,179,.second,.reverseMinus,7⟩,⟨11699,45,179,.first,.reverseMinus,8⟩,⟨11691,1,11699,.first,.minus,3⟩]⟩,
  ⟨[11699, 30609], [⟨7,1,1,.second,.plus,3⟩,⟨111,1,7,.second,.plus,4⟩,⟨16273,1,111,.first,.plus,14⟩,⟨30609,7,16273,.first,.reverseMinus,11⟩,⟨12143,111,16273,.first,.plus,8⟩,⟨11699,111,12143,.first,.minus,2⟩]⟩,
  ⟨[11709, 22921], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨183,3,9,.first,.plus,6⟩,⟨11709,3,183,.second,.plus,6⟩,⟨23433,9,183,.second,.reverseMinus,7⟩,⟨22921,1,23433,.first,.minus,9⟩]⟩,
  ⟨[11727, 22885], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨561,17,17,.second,.reverseMinus,5⟩,⟨11727,3,561,.first,.plus,12⟩,⟨22893,561,11727,.second,.plus,1⟩,⟨22885,1,22893,.first,.minus,3⟩]⟩,
  ⟨[11747, 15295], [⟨127,1,1,.second,.plus,7⟩,⟨95,1,127,.first,.minus,5⟩,⟨12255,95,95,.second,.reverseMinus,7⟩,⟨11747,127,12255,.first,.minus,2⟩,⟨15295,95,12255,.first,.reverseMinus,5⟩]⟩,
  ⟨[11747, 30591], [⟨127,1,1,.second,.plus,7⟩,⟨4063,1,127,.second,.plus,5⟩,⟨1921,1,127,.first,.plus,11⟩,⟨30591,127,1921,.first,.plus,8⟩,⟨11747,4063,1921,.second,.reverseMinus,2⟩]⟩,
  ⟨[11779, 22777], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨23,1,3,.second,.plus,3⟩,⟨11779,3,23,.second,.reverseMinus,9⟩,⟨1799,7,7,.second,.reverseMinus,8⟩,⟨22777,3,1799,.first,.plus,13⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank50
