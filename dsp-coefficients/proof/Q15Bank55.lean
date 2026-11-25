import Q15Upper
namespace Q15Bank55
open Q15Upper
def entries : List Entry := [
  ⟨[13651, 18121], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨803,3,35,.first,.reverseMinus,8⟩,⟨13651,803,803,.second,.reverseMinus,4⟩,⟨201,1,803,.output,.plus,2⟩,⟨18121,35,201,.first,.reverseMinus,9⟩]⟩,
  ⟨[13665, 18079], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨31,1,1,.second,.plus,5⟩,⟨141,17,31,.second,.reverseMinus,2⟩,⟨18079,31,141,.second,.reverseMinus,7⟩,⟨13665,31,18079,.first,.plus,10⟩]⟩,
  ⟨[13691, 14885], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨229,1,27,.first,.plus,8⟩,⟨14885,229,229,.second,.reverseMinus,6⟩,⟨13595,27,229,.first,.plus,9⟩,⟨13691,3,13595,.first,.reverseMinus,5⟩]⟩,
  ⟨[13691, 29771], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨27,1,5,.first,.plus,5⟩,⟨133,1,5,.first,.reverseMinus,7⟩,⟨13691,27,133,.first,.plus,9⟩,⟨1861,27,133,.first,.reverseMinus,6⟩,⟨29771,5,1861,.second,.plus,4⟩]⟩,
  ⟨[13733, 17869], [⟨511,1,1,.second,.plus,9⟩,⟨3577,511,511,.second,.plus,3⟩,⟨3561,1,3577,.first,.minus,4⟩,⟨13733,511,3561,.second,.plus,2⟩,⟨17869,3577,3561,.first,.reverseMinus,2⟩]⟩,
  ⟨[13737, 14875], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨29,1,3,.first,.plus,5⟩,⟨14875,27,29,.second,.reverseMinus,9⟩,⟨87,29,29,.second,.plus,2⟩,⟨13737,27,87,.first,.plus,9⟩]⟩,
  ⟨[13737, 29749], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨53,3,29,.first,.reverseMinus,3⟩,⟨29749,29,53,.first,.reverseMinus,10⟩,⟨13621,53,53,.second,.reverseMinus,8⟩,⟨13737,29,13621,.first,.reverseMinus,2⟩]⟩,
  ⟨[13747, 17827], [⟨127,1,1,.second,.plus,7⟩,⟨509,1,127,.second,.reverseMinus,2⟩,⟨15779,509,509,.second,.plus,5⟩,⟨17827,1,15779,.first,.reverseMinus,11⟩,⟨13747,127,15779,.first,.minus,4⟩]⟩,
  ⟨[13761, 17785], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨575,1,9,.second,.plus,6⟩,⟨17857,9,575,.first,.plus,11⟩,⟨13761,1,17857,.first,.minus,12⟩,⟨17785,9,17857,.first,.minus,3⟩]⟩,
  ⟨[13783, 29729], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨959,3,191,.first,.reverseMinus,8⟩,⟨29729,959,959,.second,.plus,5⟩,⟨1723,191,959,.first,.reverseMinus,2⟩,⟨13783,1,1723,.second,.plus,3⟩]⟩,
  ⟨[13815, 17615], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨271,1,15,.first,.reverseMinus,8⟩,⟨17615,271,271,.second,.reverseMinus,6⟩,⟨1535,1,3,.second,.plus,9⟩,⟨13815,1535,1535,.second,.reverseMinus,3⟩]⟩,
  ⟨[13829, 17573], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨37,1,5,.first,.reverseMinus,5⟩,⟨16389,1,5,.first,.reverseMinus,14⟩,⟨13829,5,16389,.first,.minus,9⟩,⟨17573,37,16389,.first,.reverseMinus,5⟩]⟩,
  ⟨[13829, 29707], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨27,1,5,.first,.plus,5⟩,⟨13829,5,27,.second,.reverseMinus,9⟩,⟨29707,2049,13829,.second,.reverseMinus,1⟩]⟩,
  ⟨[13869, 17445], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1541,3,5,.first,.reverseMinus,9⟩,⟨13869,1541,1541,.second,.reverseMinus,3⟩,⟨2181,5,1541,.first,.reverseMinus,7⟩,⟨17445,3,2181,.second,.plus,3⟩]⟩,
  ⟨[13873, 14843], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨27,1,5,.first,.plus,5⟩,⟨13819,5,27,.second,.plus,9⟩,⟨14843,1,13819,.first,.reverseMinus,10⟩,⟨13873,27,13819,.first,.reverseMinus,1⟩]⟩,
  ⟨[13873, 29687], [⟨3,1,1,.second,.plus,2⟩,⟨771,3,3,.second,.reverseMinus,8⟩,⟨867,3,771,.first,.reverseMinus,5⟩,⟨13873,1,867,.second,.reverseMinus,4⟩,⟨3081,3,771,.second,.plus,2⟩,⟨29687,1,3081,.first,.plus,15⟩]⟩,
  ⟨[13909, 17317], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨1987,1,61,.first,.plus,11⟩,⟨13909,1987,1987,.second,.plus,3⟩,⟨17323,61,13909,.first,.plus,9⟩,⟨17317,3,17323,.first,.minus,1⟩]⟩,
  ⟨[13919, 29665], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨14847,1,29,.second,.plus,9⟩,⟨29665,29,14847,.second,.plus,1⟩,⟨13919,29,14847,.first,.minus,5⟩]⟩,
  ⟨[13935, 17233], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨833,3,1025,.first,.minus,6⟩,⟨17233,1025,833,.first,.reverseMinus,4⟩,⟨929,3,1025,.first,.minus,5⟩,⟨13935,929,929,.second,.plus,4⟩]⟩,
  ⟨[13949, 17189], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨109,1,27,.second,.reverseMinus,2⟩,⟨13949,3,109,.second,.plus,7⟩,⟨13733,27,13949,.first,.minus,3⟩,⟨17189,27,13733,.first,.reverseMinus,7⟩]⟩,
  ⟨[13965, 29643], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨53,3,29,.first,.reverseMinus,3⟩,⟨29643,29,53,.first,.plus,10⟩,⟨1995,1,53,.first,.plus,11⟩,⟨13965,1995,1995,.second,.plus,3⟩]⟩,
  ⟨[13975, 17105], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨16385,1,1,.second,.reverseMinus,14⟩,⟨17105,45,16385,.first,.reverseMinus,4⟩,⟨8215,45,16385,.output,.plus,1⟩,⟨13975,45,8215,.first,.reverseMinus,7⟩]⟩,
  ⟨[14001, 17019], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨1999,1,125,.second,.plus,4⟩,⟨14001,125,1999,.first,.plus,7⟩,⟨15995,3,1999,.second,.reverseMinus,3⟩,⟨17019,1,15995,.first,.reverseMinus,10⟩]⟩,
  ⟨[14011, 14811], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨37,1,29,.first,.reverseMinus,3⟩,⟨14811,29,37,.first,.plus,9⟩,⟨13883,29,14811,.first,.minus,5⟩,⟨14011,1,13883,.first,.reverseMinus,7⟩]⟩,
  ⟨[14011, 29621], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2053,1,5,.first,.reverseMinus,11⟩,⟨2373,5,2053,.first,.reverseMinus,6⟩,⟨14011,1,2373,.first,.plus,14⟩,⟨35915,2053,2373,.second,.plus,4⟩,⟨29621,1,35915,.first,.plus,16⟩]⟩,
  ⟨[14027, 16933], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨389,1,517,.first,.minus,7⟩,⟨16933,517,389,.first,.reverseMinus,5⟩,⟨5835,389,389,.second,.plus,4⟩,⟨14027,1,5835,.first,.reverseMinus,13⟩]⟩,
  ⟨[14053, 16847], [⟨511,1,1,.second,.plus,9⟩,⟨2043,1,511,.second,.plus,2⟩,⟨503,1,511,.first,.minus,3⟩,⟨14053,2043,503,.second,.plus,5⟩,⟨16847,2043,503,.first,.reverseMinus,3⟩]⟩,
  ⟨[14055, 29601], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨95,1,3,.second,.plus,5⟩,⟨29601,29,95,.first,.plus,10⟩,⟨28081,95,29601,.first,.minus,4⟩,⟨14055,29,28081,.output,.plus,1⟩]⟩,
  ⟨[14079, 16759], [⟨63,1,1,.second,.plus,6⟩,⟨16127,1,63,.second,.plus,8⟩,⟨79,1,63,.first,.reverseMinus,4⟩,⟨14079,1,16127,.first,.minus,11⟩,⟨16759,16127,79,.second,.reverseMinus,3⟩]⟩,
  ⟨[14101, 14789], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨15045,59,59,.second,.plus,8⟩,⟨14789,1,15045,.first,.minus,8⟩,⟨14101,59,15045,.first,.minus,4⟩]⟩,
  ⟨[14101, 29579], [⟨7,1,1,.second,.plus,3⟩,⟨455,7,7,.second,.reverseMinus,6⟩,⟨459,1,455,.first,.reverseMinus,2⟩,⟨14101,455,459,.first,.plus,5⟩,⟨29579,455,459,.first,.reverseMinus,6⟩]⟩,
  ⟨[14117, 16631], [⟨63,1,1,.second,.plus,6⟩,⟨503,1,63,.second,.plus,3⟩,⟨16129,1,63,.second,.reverseMinus,8⟩,⟨16631,63,503,.first,.reverseMinus,8⟩,⟨14117,503,16129,.first,.minus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank55
