import Q15Upper
namespace Q15Bank39
open Q15Upper
def entries : List Entry := [
  ⟨[6981, 17147], [⟨3,1,1,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨763,3,95,.second,.reverseMinus,3⟩,⟨17147,1,763,.first,.reverseMinus,14⟩,⟨7173,95,17147,.first,.plus,8⟩,⟨6981,3,7173,.first,.minus,6⟩]⟩,
  ⟨[6983, 32015], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨753,3,15,.first,.plus,8⟩,⟨32015,1,753,.first,.plus,15⟩,⟨873,15,753,.first,.reverseMinus,3⟩,⟨6983,1,873,.second,.plus,3⟩]⟩,
  ⟨[7005, 14811], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨219,3,27,.second,.reverseMinus,3⟩,⟨7005,3,219,.second,.plus,5⟩,⟨14043,27,219,.second,.reverseMinus,6⟩,⟨14811,3,14043,.first,.reverseMinus,8⟩]⟩,
  ⟨[7005, 29621], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨635,5,5,.second,.plus,7⟩,⟨955,5,635,.first,.reverseMinus,6⟩,⟨7005,635,955,.second,.plus,3⟩,⟨29605,955,955,.second,.plus,5⟩,⟨29621,1,29605,.first,.reverseMinus,4⟩]⟩,
  ⟨[7007, 16975], [⟨7,1,1,.second,.plus,3⟩,⟨511,1,1,.second,.plus,9⟩,⟨623,7,511,.first,.reverseMinus,4⟩,⟨16975,511,623,.first,.reverseMinus,5⟩,⟨7007,623,16975,.first,.minus,4⟩]⟩,
  ⟨[7033, 8001], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨889,7,7,.second,.plus,7⟩,⟨7033,3,889,.first,.reverseMinus,11⟩,⟨8001,889,889,.second,.reverseMinus,3⟩]⟩,
  ⟨[7033, 8401], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨145,1,9,.second,.reverseMinus,4⟩,⟨879,1,145,.first,.plus,10⟩,⟨7033,1,879,.second,.reverseMinus,3⟩,⟨8401,145,879,.first,.plus,6⟩]⟩,
  ⟨[7033, 16803], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨161,1,129,.first,.reverseMinus,5⟩,⟨8321,1,129,.first,.reverseMinus,13⟩,⟨16803,161,8321,.second,.reverseMinus,1⟩,⟨7033,161,8321,.first,.minus,3⟩]⟩,
  ⟨[7033, 32005], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨889,7,7,.second,.plus,7⟩,⟨7033,3,889,.first,.reverseMinus,11⟩,⟨8001,889,889,.second,.reverseMinus,3⟩,⟨32005,1,8001,.second,.reverseMinus,2⟩]⟩,
  ⟨[7065, 8293], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨8293,5,259,.second,.reverseMinus,5⟩,⟨7257,259,8293,.first,.minus,2⟩,⟨7065,3,7257,.first,.minus,6⟩]⟩,
  ⟨[7065, 16587], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨153,9,9,.second,.reverseMinus,4⟩,⟨2457,9,153,.second,.reverseMinus,4⟩,⟨7065,9,2457,.first,.reverseMinus,9⟩,⟨16587,2457,7065,.second,.reverseMinus,1⟩]⟩,
  ⟨[7073, 14779], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨221,3,7,.second,.plus,5⟩,⟨7073,1,221,.second,.reverseMinus,5⟩,⟨7389,7,221,.first,.reverseMinus,10⟩,⟨14779,1,7389,.second,.reverseMinus,1⟩]⟩,
  ⟨[7073, 29557], [⟨7,1,1,.second,.plus,3⟩,⟨223,1,7,.second,.plus,5⟩,⟨885,7,223,.second,.plus,2⟩,⟨7073,7,885,.second,.plus,3⟩,⟨29557,7,885,.first,.reverseMinus,12⟩]⟩,
  ⟨[7081, 15997], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨515,1,129,.second,.plus,2⟩,⟨1159,129,515,.second,.reverseMinus,1⟩,⟨15997,129,515,.first,.plus,7⟩,⟨7081,515,1159,.first,.plus,4⟩]⟩,
  ⟨[7081, 31993], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨775,3,7,.first,.reverseMinus,8⟩,⟨31993,1,775,.first,.plus,15⟩,⟨7193,775,31993,.first,.minus,5⟩,⟨7081,7,7193,.first,.minus,4⟩]⟩,
  ⟨[7103, 8163], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨8159,1,33,.first,.plus,13⟩,⟨8163,1,8159,.first,.reverseMinus,2⟩,⟨7103,33,8159,.first,.minus,5⟩]⟩,
  ⟨[7103, 16325], [⟨7,1,1,.second,.plus,3⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨8159,1,33,.first,.plus,13⟩,⟨16325,7,8159,.second,.reverseMinus,1⟩,⟨7103,33,8159,.first,.minus,5⟩]⟩,
  ⟨[7109, 8141], [⟨3,1,1,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨509,1,3,.first,.plus,9⟩,⟨8141,3,509,.second,.plus,4⟩,⟨7109,129,8141,.first,.minus,3⟩]⟩,
  ⟨[7109, 16283], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨2031,1,17,.first,.plus,11⟩,⟨16249,1,2031,.second,.reverseMinus,3⟩,⟨16283,17,16249,.first,.reverseMinus,1⟩,⟨7109,2031,16249,.output,.reverseMinus,1⟩]⟩,
  ⟨[7131, 15991], [⟨7,1,1,.second,.plus,3⟩,⟨111,1,7,.second,.plus,4⟩,⟨1783,7,111,.second,.reverseMinus,4⟩,⟨7131,1,1783,.second,.plus,2⟩,⟨15991,111,1783,.first,.reverseMinus,7⟩]⟩,
  ⟨[7131, 31983], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨785,3,17,.first,.reverseMinus,8⟩,⟨31983,1,785,.first,.plus,15⟩,⟨3567,17,785,.first,.plus,8⟩,⟨7131,3,3567,.second,.plus,1⟩]⟩,
  ⟨[7141, 7373], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨7373,29,51,.first,.plus,8⟩,⟨7141,29,7373,.first,.minus,3⟩]⟩,
  ⟨[7141, 29491], [⟨3,1,1,.second,.plus,2⟩,⟨509,1,3,.first,.plus,9⟩,⟨3069,3,3,.second,.plus,10⟩,⟨7141,509,3069,.first,.reverseMinus,3⟩,⟨29507,509,3069,.first,.plus,6⟩,⟨29491,1,29507,.first,.minus,4⟩]⟩,
  ⟨[7177, 15801], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨7,1,1,.second,.plus,3⟩,⟨247,1,9,.first,.plus,8⟩,⟨7177,9,7,.second,.reverseMinus,10⟩,⟨15801,7,247,.second,.plus,6⟩]⟩,
  ⟨[7179, 7993], [⟨7,1,1,.second,.plus,3⟩,⟨25,1,7,.first,.plus,5⟩,⟨7193,7,25,.first,.reverseMinus,10⟩,⟨7179,7,7193,.first,.minus,1⟩,⟨7993,25,7193,.first,.reverseMinus,5⟩]⟩,
  ⟨[7179, 31971], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨7171,3,7,.second,.reverseMinus,10⟩,⟨7179,1,7171,.first,.reverseMinus,3⟩,⟨7395,7,7171,.first,.reverseMinus,5⟩,⟨31971,3,7395,.first,.reverseMinus,13⟩]⟩,
  ⟨[7183, 15757], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨1009,1,15,.first,.plus,10⟩,⟨7183,1,1009,.first,.plus,13⟩,⟨985,3,1009,.first,.minus,3⟩,⟨15757,3,985,.second,.plus,4⟩]⟩,
  ⟨[7189, 15713], [⟨7,1,1,.second,.plus,3⟩,⟨21,7,7,.second,.plus,2⟩,⟨671,1,21,.second,.plus,5⟩,⟨7189,7,21,.first,.reverseMinus,10⟩,⟨15713,1,671,.first,.plus,14⟩]⟩,
  ⟨[7195, 15667], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨899,3,7,.second,.reverseMinus,7⟩,⟨7195,3,899,.second,.reverseMinus,3⟩,⟨15283,899,899,.second,.reverseMinus,4⟩,⟨15667,3,15283,.first,.reverseMinus,7⟩]⟩,
  ⟨[7201, 15623], [⟨7,1,1,.second,.plus,3⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨7175,7,7,.second,.reverseMinus,10⟩,⟨7201,7,33,.first,.reverseMinus,10⟩,⟨15623,33,7175,.first,.reverseMinus,8⟩]⟩,
  ⟨[7207, 15579], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨515,1,129,.second,.plus,2⟩,⟨901,129,515,.second,.plus,1⟩,⟨7207,1,901,.second,.plus,3⟩,⟨15579,515,901,.first,.plus,5⟩]⟩,
  ⟨[7209, 14713], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1015,1,9,.first,.plus,10⟩,⟨983,1,1015,.first,.minus,5⟩,⟨7209,1,983,.first,.plus,13⟩,⟨14713,1015,983,.second,.plus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank39
