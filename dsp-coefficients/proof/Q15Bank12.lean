import Q15Upper
namespace Q15Bank12
open Q15Upper
def entries : List Entry := [
  ⟨[1227, 32399], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨369,3,15,.first,.plus,7⟩,⟨32399,1,369,.first,.plus,15⟩,⟨309,15,369,.first,.minus,2⟩,⟨1227,3,309,.first,.plus,9⟩]⟩,
  ⟨[1231, 15627], [⟨15,1,1,.second,.plus,4⟩,⟨3839,1,15,.second,.plus,8⟩,⟨271,1,15,.first,.reverseMinus,8⟩,⟨1231,15,271,.first,.reverseMinus,6⟩,⟨15627,3839,271,.first,.reverseMinus,2⟩]⟩,
  ⟨[1231, 31253], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨303,1,19,.second,.plus,4⟩,⟨1231,19,303,.second,.reverseMinus,2⟩,⟨1515,303,303,.second,.reverseMinus,2⟩,⟨31253,1,1515,.first,.plus,15⟩]⟩,
  ⟨[1237, 15619], [⟨31,1,1,.second,.plus,5⟩,⟨61,1,31,.second,.plus,1⟩,⟨245,1,61,.second,.reverseMinus,2⟩,⟨1237,31,245,.first,.reverseMinus,5⟩,⟨15619,61,245,.second,.plus,6⟩]⟩,
  ⟨[1237, 31237], [⟨31,1,1,.second,.plus,5⟩,⟨123,1,31,.second,.plus,2⟩,⟨245,1,123,.second,.plus,1⟩,⟨1237,31,245,.first,.reverseMinus,5⟩,⟨31237,123,245,.second,.plus,7⟩]⟩,
  ⟨[1243, 15611], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1275,5,5,.second,.plus,8⟩,⟨1243,1,1275,.first,.minus,5⟩,⟨15611,7,1275,.first,.reverseMinus,11⟩]⟩,
  ⟨[1243, 31223], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨863,3,95,.first,.reverseMinus,8⟩,⟨1243,95,863,.first,.reverseMinus,2⟩,⟨3903,95,863,.first,.reverseMinus,5⟩,⟨31223,1,3903,.second,.plus,3⟩]⟩,
  ⟨[1249, 3901], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨67,5,31,.second,.reverseMinus,1⟩,⟨1249,5,31,.first,.plus,8⟩,⟨3901,31,67,.first,.plus,7⟩]⟩,
  ⟨[1249, 31207], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨1249,1,39,.second,.reverseMinus,5⟩,⟨4057,1,39,.first,.plus,12⟩,⟨31207,1249,4057,.second,.plus,3⟩]⟩,
  ⟨[1255, 3899], [⟨3,1,1,.second,.plus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨487,3,511,.first,.minus,3⟩,⟨3899,3,487,.second,.reverseMinus,3⟩,⟨1255,3,487,.first,.reverseMinus,8⟩]⟩,
  ⟨[1255, 12947], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨991,1,33,.first,.plus,10⟩,⟨7927,1,991,.second,.plus,3⟩,⟨1255,33,991,.first,.reverseMinus,3⟩,⟨12947,7927,1255,.second,.reverseMinus,2⟩]⟩,
  ⟨[1255, 25895], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨405,5,25,.second,.reverseMinus,4⟩,⟨1255,5,25,.first,.plus,8⟩,⟨25895,25,405,.second,.plus,6⟩]⟩,
  ⟨[1255, 31193], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨487,1,25,.first,.plus,9⟩,⟨1255,3,487,.first,.reverseMinus,8⟩,⟨31193,25,487,.second,.reverseMinus,6⟩]⟩,
  ⟨[1255, 32671], [⟨7,1,1,.second,.plus,3⟩,⟨231,7,7,.second,.reverseMinus,5⟩,⟨1255,1,231,.first,.reverseMinus,10⟩,⟨3927,231,231,.second,.reverseMinus,4⟩,⟨32671,1255,3927,.second,.reverseMinus,3⟩]⟩,
  ⟨[1257, 4093], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨4093,1,3,.first,.plus,12⟩,⟨1257,5,23,.first,.plus,8⟩]⟩,
  ⟨[1257, 32743], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨641,1,5,.second,.reverseMinus,7⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨32743,1,25,.first,.plus,15⟩,⟨1257,641,25,.first,.plus,1⟩]⟩,
  ⟨[1261, 3897], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨659,5,19,.first,.reverseMinus,7⟩,⟨1261,5,19,.first,.plus,8⟩,⟨3897,659,1261,.first,.reverseMinus,2⟩]⟩,
  ⟨[1261, 31177], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨797,3,29,.first,.reverseMinus,8⟩,⟨1261,29,797,.first,.reverseMinus,4⟩,⟨1591,3,797,.second,.plus,1⟩,⟨31177,1,1591,.first,.plus,15⟩]⟩,
  ⟨[1265, 12885], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨161,23,23,.second,.plus,3⟩,⟨1265,23,161,.second,.plus,3⟩,⟨2577,1,161,.second,.reverseMinus,4⟩,⟨12885,2577,2577,.second,.reverseMinus,2⟩]⟩,
  ⟨[1265, 25771], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1275,5,5,.second,.plus,8⟩,⟨1531,1,1275,.first,.reverseMinus,8⟩,⟨1265,5,1275,.first,.minus,1⟩,⟨25771,1275,1531,.second,.reverseMinus,4⟩]⟩,
  ⟨[1267, 15581], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨317,3,5,.second,.plus,6⟩,⟨1267,1,317,.second,.plus,2⟩,⟨10461,317,317,.second,.reverseMinus,5⟩,⟨15581,5,10461,.first,.reverseMinus,10⟩]⟩,
  ⟨[1267, 31161], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨243,3,15,.second,.reverseMinus,4⟩,⟨1267,1,243,.first,.reverseMinus,10⟩,⟨7791,15,243,.second,.reverseMinus,5⟩,⟨31161,3,7791,.second,.plus,2⟩]⟩,
  ⟨[1273, 15573], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨317,3,5,.second,.plus,6⟩,⟨1273,5,317,.second,.reverseMinus,2⟩,⟨1907,317,1273,.first,.reverseMinus,1⟩,⟨15573,317,1907,.second,.reverseMinus,3⟩]⟩,
  ⟨[1273, 31145], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨2073,1,25,.first,.reverseMinus,11⟩,⟨1273,25,2073,.first,.minus,5⟩,⟨33193,25,2073,.second,.reverseMinus,4⟩,⟨31145,1,33193,.first,.minus,11⟩]⟩,
  ⟨[1287, 1593], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1785,7,7,.second,.plus,8⟩,⟨1593,3,1785,.first,.minus,6⟩,⟨1287,3,1785,.first,.plus,10⟩]⟩,
  ⟨[1287, 25489], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨63,1,1,.second,.plus,6⟩,⟨199,17,63,.first,.reverseMinus,3⟩,⟨25489,17,199,.second,.reverseMinus,7⟩,⟨1287,17,199,.first,.reverseMinus,6⟩]⟩,
  ⟨[1289, 4045], [⟨3,1,1,.second,.plus,2⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨253,1,3,.first,.plus,8⟩,⟨4045,3,253,.second,.plus,4⟩,⟨1289,259,253,.first,.reverseMinus,2⟩]⟩,
  ⟨[1289, 32359], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨265,1,9,.first,.reverseMinus,8⟩,⟨2039,1,9,.first,.plus,11⟩,⟨1289,1,265,.first,.reverseMinus,10⟩,⟨32359,265,2039,.second,.plus,4⟩]⟩,
  ⟨[1307, 16371], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨16371,5,2047,.second,.plus,3⟩,⟨1307,5,41,.second,.plus,5⟩]⟩,
  ⟨[1307, 32741], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨27,1,5,.first,.plus,5⟩,⟨32741,1,27,.first,.plus,15⟩,⟨1307,5,27,.first,.reverseMinus,8⟩]⟩,
  ⟨[1321, 1565], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨61,1,3,.first,.plus,6⟩,⟨1565,3,49,.second,.plus,5⟩,⟨1321,61,1565,.first,.minus,2⟩]⟩,
  ⟨[1321, 25041], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1281,1,5,.second,.reverseMinus,8⟩,⟨1321,5,1281,.first,.reverseMinus,3⟩,⟨1473,3,1281,.first,.reverseMinus,6⟩,⟨25041,1473,1473,.second,.reverseMinus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank12
