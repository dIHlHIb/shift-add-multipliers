import Q15Upper
namespace Q15Bank58
open Q15Upper
def entries : List Entry := [
  ⟨[15713, 28755], [⟨511,1,1,.second,.plus,9⟩,⟨639,1,511,.first,.reverseMinus,7⟩,⟨15713,511,639,.first,.plus,5⟩,⟨1917,639,639,.second,.plus,2⟩,⟨28755,1917,1917,.second,.plus,4⟩]⟩,
  ⟨[15757, 28731], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨59,7,13,.second,.reverseMinus,2⟩,⟨28731,7,59,.first,.reverseMinus,12⟩,⟨7565,13,59,.second,.reverseMinus,7⟩,⟨15757,1,7565,.first,.reverseMinus,13⟩]⟩,
  ⟨[15801, 28707], [⟨3,1,1,.second,.plus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨16419,3,513,.second,.reverseMinus,5⟩,⟨28707,3,16419,.first,.reverseMinus,12⟩,⟨33351,513,16419,.second,.reverseMinus,1⟩,⟨15801,3,33351,.first,.plus,14⟩]⟩,
  ⟨[15845, 28683], [⟨511,1,1,.second,.plus,9⟩,⟨8193,1,1,.second,.reverseMinus,13⟩,⟨4089,1,511,.second,.reverseMinus,3⟩,⟨15845,511,4089,.second,.plus,2⟩,⟨28683,8193,4089,.first,.plus,2⟩]⟩,
  ⟨[15889, 28659], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨14329,7,7,.second,.plus,11⟩,⟨28659,1,14329,.second,.reverseMinus,1⟩,⟨14353,3,14329,.first,.reverseMinus,3⟩,⟨15889,3,14353,.first,.reverseMinus,9⟩]⟩,
  ⟨[15933, 28635], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨451,3,7,.second,.reverseMinus,6⟩,⟨15933,1,451,.first,.plus,14⟩,⟨4059,451,451,.second,.reverseMinus,3⟩,⟨28635,3,4059,.first,.reverseMinus,13⟩]⟩,
  ⟨[15977, 28609], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨3577,7,7,.second,.plus,9⟩,⟨28609,7,3577,.second,.plus,3⟩,⟨3689,7,3577,.first,.reverseMinus,4⟩,⟨15977,3,3689,.first,.reverseMinus,12⟩]⟩,
  ⟨[16019, 28585], [⟨3,1,1,.second,.plus,2⟩,⟨381,3,3,.second,.plus,7⟩,⟨365,1,381,.first,.minus,4⟩,⟨16019,1,365,.first,.plus,14⟩,⟨31657,381,16019,.second,.plus,1⟩,⟨28585,3,31657,.first,.minus,10⟩]⟩,
  ⟨[16063, 28561], [⟨7,1,1,.second,.plus,3⟩,⟨1785,7,7,.second,.plus,8⟩,⟨7139,1,1785,.second,.plus,2⟩,⟨28561,1,1785,.second,.reverseMinus,4⟩,⟨16063,1785,7139,.second,.reverseMinus,1⟩]⟩,
  ⟨[16107, 28535], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨277,3,35,.second,.plus,3⟩,⟨16107,1,277,.first,.plus,14⟩,⟨16247,35,16107,.first,.reverseMinus,2⟩,⟨28535,3,16247,.first,.reverseMinus,12⟩]⟩,
  ⟨[16151, 28511], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨521,1,9,.first,.reverseMinus,9⟩,⟨1545,1,521,.first,.reverseMinus,10⟩,⟨16151,521,521,.second,.plus,5⟩,⟨28511,1545,16151,.first,.reverseMinus,3⟩]⟩,
  ⟨[16195, 28487], [⟨3,1,1,.second,.plus,2⟩,⟨3073,1,3,.second,.reverseMinus,10⟩,⟨253,1,3,.first,.plus,8⟩,⟨16195,3,253,.second,.reverseMinus,6⟩,⟨28487,3073,16195,.first,.reverseMinus,2⟩]⟩,
  ⟨[16239, 28461], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨4067,1,29,.first,.plus,12⟩,⟨16239,29,4067,.second,.plus,2⟩,⟨28469,4067,4067,.second,.plus,3⟩,⟨28461,1,28469,.first,.minus,3⟩]⟩,
  ⟨[16283, 28437], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨4063,1,33,.first,.plus,12⟩,⟨8125,1,4063,.second,.plus,1⟩,⟨16283,33,8125,.second,.reverseMinus,1⟩,⟨28437,4063,8125,.second,.plus,2⟩]⟩,
  ⟨[16325, 28411], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨16325,1,59,.first,.plus,14⟩,⟨699,5,59,.first,.reverseMinus,7⟩,⟨28411,16325,699,.second,.plus,6⟩]⟩,
  ⟨[16369, 28387], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨15,1,1,.second,.plus,4⟩,⟨4351,1,17,.second,.plus,8⟩,⟨16369,1,15,.first,.plus,14⟩,⟨28387,4351,16369,.second,.plus,1⟩]⟩,
  ⟨[16413, 28361], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨55,3,29,.second,.plus,1⟩,⟨16413,1,29,.first,.reverseMinus,14⟩,⟨28105,55,55,.second,.plus,9⟩,⟨28361,1,28105,.first,.reverseMinus,8⟩]⟩,
  ⟨[16457, 28335], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨265,3,253,.first,.reverseMinus,2⟩,⟨16457,253,265,.first,.reverseMinus,6⟩,⟨1771,253,253,.second,.plus,3⟩,⟨28335,1,1771,.second,.plus,4⟩]⟩,
  ⟨[16499, 28311], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨4119,1,23,.first,.reverseMinus,12⟩,⟨16499,23,4119,.second,.reverseMinus,2⟩,⟨3735,3,4119,.first,.minus,7⟩,⟨28311,3,3735,.first,.reverseMinus,13⟩]⟩,
  ⟨[16543, 28285], [⟨255,1,1,.second,.plus,8⟩,⟨259,1,255,.first,.reverseMinus,2⟩,⟨223,1,255,.first,.minus,5⟩,⟨16543,255,223,.first,.reverseMinus,6⟩,⟨28285,259,223,.second,.plus,7⟩]⟩,
  ⟨[16587, 28259], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨203,29,29,.second,.plus,3⟩,⟨16587,1,203,.first,.reverseMinus,14⟩,⟨3683,29,29,.second,.plus,7⟩,⟨28259,3,3683,.first,.reverseMinus,13⟩]⟩,
  ⟨[16631, 28235], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨503,1,63,.second,.plus,3⟩,⟨16631,63,503,.first,.reverseMinus,8⟩,⟨3529,63,503,.first,.plus,6⟩,⟨28235,3,3529,.second,.reverseMinus,3⟩]⟩,
  ⟨[16673, 28209], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1041,1,17,.first,.reverseMinus,10⟩,⟨5137,1,1041,.first,.reverseMinus,12⟩,⟨16673,17,1041,.second,.reverseMinus,4⟩,⟨28209,5137,16673,.second,.plus,1⟩]⟩,
  ⟨[16717, 28183], [⟨7,1,1,.second,.plus,3⟩,⟨55,1,7,.second,.plus,3⟩,⟨879,1,55,.second,.plus,4⟩,⟨28183,55,879,.second,.reverseMinus,5⟩,⟨2637,879,879,.second,.plus,2⟩,⟨16717,55,2637,.first,.reverseMinus,8⟩]⟩,
  ⟨[16759, 28157], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨55,1,9,.first,.plus,6⟩,⟨28157,3,55,.second,.plus,9⟩,⟨375,3,9,.first,.plus,7⟩,⟨16759,1,375,.first,.reverseMinus,14⟩]⟩,
  ⟨[16803, 28131], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨55,3,29,.second,.plus,1⟩,⟨28131,29,55,.second,.plus,9⟩,⟨31651,55,28131,.first,.reverseMinus,6⟩,⟨16803,29,31651,.first,.minus,9⟩]⟩,
  ⟨[16847, 28107], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨459,27,27,.second,.reverseMinus,4⟩,⟨28107,27,459,.first,.reverseMinus,10⟩,⟨463,1,459,.first,.reverseMinus,2⟩,⟨16847,1,463,.first,.reverseMinus,14⟩]⟩,
  ⟨[16889, 28081], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1143,9,9,.second,.plus,7⟩,⟨1399,1,1143,.first,.reverseMinus,8⟩,⟨16889,1143,1399,.first,.plus,4⟩,⟨28081,1399,16889,.first,.reverseMinus,3⟩]⟩,
  ⟨[16933, 28055], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨265,1,9,.first,.reverseMinus,8⟩,⟨8471,9,265,.second,.plus,5⟩,⟨16933,9,8471,.second,.plus,1⟩,⟨9623,9,8471,.first,.reverseMinus,7⟩,⟨28055,9,9623,.first,.reverseMinus,11⟩]⟩,
  ⟨[16975, 28029], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨37,1,5,.first,.reverseMinus,5⟩,⟨16383,1,1,.second,.plus,14⟩,⟨16975,37,16383,.first,.reverseMinus,4⟩,⟨14015,37,16383,.first,.minus,6⟩,⟨28029,1,14015,.second,.plus,1⟩]⟩,
  ⟨[17019, 28003], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨1891,61,61,.second,.plus,5⟩,⟨17019,1891,1891,.second,.reverseMinus,3⟩,⟨3427,3,1891,.first,.reverseMinus,9⟩,⟨28003,3,3427,.first,.reverseMinus,13⟩]⟩,
  ⟨[17061, 27977], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨17061,517,517,.second,.reverseMinus,5⟩,⟨13989,3,17061,.first,.minus,10⟩,⟨27977,1,13989,.second,.plus,1⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank58
