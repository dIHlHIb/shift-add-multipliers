import Q15Upper
namespace Q15Bank10
open Q15Upper
def entries : List Entry := [
  ⟨[1061, 28029], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨1061,5,33,.second,.reverseMinus,5⟩,⟨219,5,1061,.first,.plus,8⟩,⟨28029,3,219,.second,.plus,7⟩]⟩,
  ⟨[1065, 16245], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨155,5,5,.second,.plus,5⟩,⟨1065,5,1025,.first,.reverseMinus,3⟩,⟨16245,1025,155,.first,.plus,4⟩]⟩,
  ⟨[1065, 32489], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨507,1,5,.first,.plus,9⟩,⟨1065,1,41,.first,.reverseMinus,10⟩,⟨32489,41,507,.second,.reverseMinus,6⟩]⟩,
  ⟨[1069, 13975], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1071,17,17,.second,.plus,6⟩,⟨1069,1,1071,.first,.minus,1⟩,⟨5423,17,1071,.first,.reverseMinus,8⟩,⟨13975,1069,5423,.first,.reverseMinus,3⟩]⟩,
  ⟨[1069, 27949], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨109,1,45,.first,.reverseMinus,6⟩,⟨1069,1,45,.first,.reverseMinus,10⟩,⟨27949,45,109,.second,.reverseMinus,8⟩]⟩,
  ⟨[1077, 13935], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨693,11,11,.second,.plus,6⟩,⟨1077,3,693,.first,.reverseMinus,7⟩,⟨2847,693,1077,.second,.reverseMinus,1⟩,⟨13935,693,2847,.first,.reverseMinus,4⟩]⟩,
  ⟨[1077, 27871], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨1013,1,11,.first,.plus,10⟩,⟨1077,1,1013,.first,.reverseMinus,6⟩,⟨3295,1013,1077,.second,.plus,2⟩,⟨27871,3,3295,.first,.reverseMinus,13⟩]⟩,
  ⟨[1085, 1737], [⟨7,1,1,.second,.plus,3⟩,⟨217,7,7,.second,.plus,5⟩,⟨1737,1,217,.second,.reverseMinus,3⟩,⟨1085,217,217,.second,.reverseMinus,2⟩]⟩,
  ⟨[1085, 27791], [⟨7,1,1,.second,.plus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨217,7,7,.second,.plus,5⟩,⟨27791,15,217,.second,.reverseMinus,7⟩,⟨1085,217,217,.second,.reverseMinus,2⟩]⟩,
  ⟨[1093, 27711], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨1093,5,17,.second,.reverseMinus,6⟩,⟨10223,5,17,.first,.plus,11⟩,⟨27711,1093,10223,.first,.reverseMinus,4⟩]⟩,
  ⟨[1101, 13815], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨1101,3,69,.second,.plus,4⟩,⟨1535,1,3,.second,.plus,9⟩,⟨13815,1535,1535,.second,.reverseMinus,3⟩]⟩,
  ⟨[1101, 27631], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨13,1,17,.first,.minus,2⟩,⟨1007,1,17,.first,.plus,10⟩,⟨1101,17,13,.first,.reverseMinus,6⟩,⟨27631,13,1007,.first,.reverseMinus,11⟩]⟩,
  ⟨[1105, 16347], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨16381,1,3,.first,.plus,14⟩,⟨1105,17,17,.second,.reverseMinus,6⟩,⟨16347,17,16381,.first,.minus,1⟩]⟩,
  ⟨[1105, 16375], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨16375,1,9,.first,.plus,14⟩,⟨1105,17,17,.second,.reverseMinus,6⟩]⟩,
  ⟨[1105, 32693], [⟨3,1,1,.second,.plus,2⟩,⟨1021,1,3,.first,.plus,10⟩,⟨21,3,3,.second,.plus,3⟩,⟨1105,1021,21,.second,.reverseMinus,2⟩,⟨32693,1021,21,.first,.reverseMinus,5⟩]⟩,
  ⟨[1105, 32749], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨16383,1,1,.second,.plus,14⟩,⟨1105,17,17,.second,.reverseMinus,6⟩,⟨32749,17,16383,.second,.plus,1⟩]⟩,
  ⟨[1115, 2029], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨2029,3,127,.second,.plus,4⟩,⟨1115,127,99,.first,.reverseMinus,3⟩]⟩,
  ⟨[1115, 32463], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨37,1,9,.second,.reverseMinus,2⟩,⟨32759,1,9,.first,.plus,15⟩,⟨1115,9,37,.first,.plus,7⟩,⟨32463,37,32759,.first,.minus,3⟩]⟩,
  ⟨[1143, 13595], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨1143,9,9,.second,.plus,7⟩,⟨15881,9,31,.second,.reverseMinus,9⟩,⟨13595,1143,15881,.first,.minus,1⟩]⟩,
  ⟨[1143, 27189], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨1143,9,9,.second,.plus,7⟩,⟨53,9,17,.first,.reverseMinus,2⟩,⟨27189,53,53,.second,.reverseMinus,9⟩]⟩,
  ⟨[1153, 7861], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨1153,1,9,.second,.reverseMinus,7⟩,⟨1123,15,1153,.first,.minus,1⟩,⟨7861,1123,1123,.second,.plus,3⟩]⟩,
  ⟨[1153, 31443], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1153,1,9,.second,.reverseMinus,7⟩,⟨265,1,9,.first,.reverseMinus,8⟩,⟨7927,1,265,.first,.plus,13⟩,⟨31443,265,7927,.second,.plus,2⟩]⟩,
  ⟨[1155, 8187], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨8187,1,5,.first,.plus,13⟩,⟨35,5,5,.second,.plus,3⟩,⟨1155,35,35,.second,.reverseMinus,5⟩]⟩,
  ⟨[1155, 16343], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨511,1,1,.second,.plus,9⟩,⟨1155,3,9,.second,.reverseMinus,7⟩,⟨16343,9,511,.second,.plus,5⟩]⟩,
  ⟨[1155, 32687], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨4087,1,9,.first,.plus,12⟩,⟨1155,3,9,.second,.reverseMinus,7⟩,⟨32687,9,4087,.second,.plus,3⟩]⟩,
  ⟨[1155, 32747], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨4093,1,3,.first,.plus,12⟩,⟨1155,3,9,.second,.reverseMinus,7⟩,⟨32747,3,4093,.second,.reverseMinus,3⟩]⟩,
  ⟨[1159, 15715], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨73,1,9,.second,.reverseMinus,3⟩,⟨1159,9,73,.second,.plus,4⟩,⟨2245,73,1159,.second,.plus,1⟩,⟨15715,2245,2245,.second,.plus,3⟩]⟩,
  ⟨[1159, 31429], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1019,1,5,.first,.plus,10⟩,⟨1179,5,1019,.first,.reverseMinus,5⟩,⟨1159,5,1179,.first,.minus,2⟩,⟨31429,1019,1179,.first,.plus,5⟩]⟩,
  ⟨[1165, 15707], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨781,3,13,.first,.reverseMinus,8⟩,⟨1165,3,781,.first,.reverseMinus,7⟩,⟨677,13,781,.first,.minus,3⟩,⟨15707,1,677,.first,.plus,14⟩]⟩,
  ⟨[1165, 31415], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨1161,9,9,.second,.reverseMinus,7⟩,⟨1165,1,1161,.first,.reverseMinus,2⟩,⟨1353,3,1161,.first,.reverseMinus,6⟩,⟨31415,1,1353,.first,.plus,15⟩]⟩,
  ⟨[1169, 13453], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨4101,1,1025,.second,.reverseMinus,2⟩,⟨1169,9,1025,.first,.reverseMinus,4⟩,⟨13453,4101,1169,.second,.reverseMinus,3⟩]⟩,
  ⟨[1169, 26905], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨8201,1,9,.first,.reverseMinus,13⟩,⟨1169,9,17,.first,.reverseMinus,7⟩,⟨26905,8201,1169,.second,.reverseMinus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank10
