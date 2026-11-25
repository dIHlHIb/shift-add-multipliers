import Q15Upper
namespace Q15Bank46
open Q15Upper
def entries : List Entry := [
  ⟨[9557, 26615], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨1197,19,19,.second,.plus,6⟩,⟨9557,19,1197,.second,.plus,3⟩,⟨14345,1197,9557,.first,.reverseMinus,2⟩,⟨26615,5,14345,.first,.plus,13⟩]⟩,
  ⟨[9561, 15671], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨679,5,39,.first,.reverseMinus,7⟩,⟨9561,5,679,.first,.plus,11⟩,⟨1959,5,679,.first,.reverseMinus,8⟩,⟨15671,1,1959,.second,.plus,3⟩]⟩,
  ⟨[9561, 31343], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨679,5,39,.first,.reverseMinus,7⟩,⟨9561,5,679,.first,.plus,11⟩,⟨1959,5,679,.first,.reverseMinus,8⟩,⟨31343,1,1959,.second,.plus,4⟩]⟩,
  ⟨[9577, 13293], [⟨63,1,1,.second,.plus,6⟩,⟨189,63,63,.second,.plus,2⟩,⟨1197,63,189,.first,.reverseMinus,4⟩,⟨9577,1,1197,.second,.reverseMinus,3⟩,⟨13293,189,1197,.first,.reverseMinus,6⟩]⟩,
  ⟨[9577, 26587], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨37,3,13,.first,.reverseMinus,3⟩,⟨26587,13,37,.first,.plus,11⟩,⟨1197,13,37,.second,.reverseMinus,5⟩,⟨9577,1,1197,.second,.reverseMinus,3⟩]⟩,
  ⟨[9609, 31327], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨1441,1,45,.second,.reverseMinus,5⟩,⟨31327,1,1441,.first,.plus,15⟩,⟨1417,3,1441,.first,.minus,3⟩,⟨9609,1,1417,.first,.reverseMinus,13⟩]⟩,
  ⟨[9657, 31313], [⟨15,1,1,.second,.plus,4⟩,⟨945,15,15,.second,.plus,6⟩,⟨1073,1,945,.first,.reverseMinus,7⟩,⟨31313,945,1073,.first,.reverseMinus,5⟩,⟨9657,1073,1073,.second,.reverseMinus,3⟩]⟩,
  ⟨[9659, 26469], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨151,5,9,.first,.plus,5⟩,⟨9659,5,151,.second,.plus,6⟩,⟨14491,151,9659,.first,.reverseMinus,5⟩,⟨26469,5,14491,.first,.plus,13⟩]⟩,
  ⟨[9679, 13219], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨93,3,3,.second,.plus,5⟩,⟨13219,13,93,.first,.plus,10⟩,⟨605,1,93,.first,.reverseMinus,9⟩,⟨9679,1,605,.second,.plus,4⟩]⟩,
  ⟨[9679, 26439], [⟨3,1,1,.second,.plus,2⟩,⟨509,1,3,.first,.plus,9⟩,⟨605,3,509,.first,.reverseMinus,5⟩,⟨9679,1,605,.second,.plus,4⟩,⟨6609,509,9679,.first,.plus,5⟩,⟨26439,3,6609,.second,.reverseMinus,2⟩]⟩,
  ⟨[9699, 13205], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨1891,61,61,.second,.plus,5⟩,⟨9699,61,1891,.first,.reverseMinus,7⟩,⟨13237,1891,1891,.second,.plus,3⟩,⟨13205,1,13237,.first,.minus,5⟩]⟩,
  ⟨[9699, 26409], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨8163,1,29,.first,.plus,13⟩,⟨9699,3,8163,.first,.reverseMinus,9⟩,⟨26025,8163,9699,.first,.reverseMinus,1⟩,⟨26409,3,26025,.first,.reverseMinus,7⟩]⟩,
  ⟨[9705, 15649], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨489,9,15,.second,.reverseMinus,5⟩,⟨15649,1,489,.second,.reverseMinus,5⟩,⟨9705,9,489,.first,.reverseMinus,10⟩]⟩,
  ⟨[9705, 31299], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨23,1,3,.second,.plus,3⟩,⟨9705,19,23,.first,.plus,9⟩,⟨1469,3,23,.second,.plus,6⟩,⟨31299,1,1469,.first,.plus,15⟩]⟩,
  ⟨[9753, 31283], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨9729,1,19,.second,.reverseMinus,9⟩,⟨9753,3,9729,.first,.reverseMinus,3⟩,⟨29235,9729,9753,.second,.reverseMinus,1⟩,⟨31283,1,29235,.first,.reverseMinus,11⟩]⟩,
  ⟨[9801, 31269], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨37,3,61,.first,.minus,3⟩,⟨31269,61,37,.first,.reverseMinus,9⟩,⟨297,1,37,.second,.reverseMinus,3⟩,⟨9801,297,297,.second,.reverseMinus,5⟩]⟩,
  ⟨[9841, 26199], [⟨3,1,1,.second,.plus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨639,1,383,.first,.reverseMinus,8⟩,⟨9841,383,639,.second,.plus,4⟩,⟨3195,639,639,.second,.reverseMinus,2⟩,⟨26199,639,3195,.second,.reverseMinus,3⟩]⟩,
  ⟨[9849, 15627], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨15627,11,61,.second,.reverseMinus,8⟩,⟨1407,1,11,.second,.plus,7⟩,⟨9849,1407,1407,.second,.plus,3⟩]⟩,
  ⟨[9849, 31253], [⟨3,1,1,.second,.plus,2⟩,⟨189,3,3,.second,.plus,6⟩,⟨1515,3,189,.second,.reverseMinus,3⟩,⟨31253,1,1515,.first,.plus,15⟩,⟨10605,1515,1515,.second,.plus,3⟩,⟨9849,189,10605,.first,.minus,2⟩]⟩,
  ⟨[9861, 13085], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨379,3,5,.first,.plus,7⟩,⟨9861,5,379,.first,.plus,11⟩,⟨12893,379,9861,.first,.reverseMinus,3⟩,⟨13085,3,12893,.first,.reverseMinus,6⟩]⟩,
  ⟨[9861, 26169], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨77,3,5,.second,.plus,4⟩,⟨9861,5,77,.second,.reverseMinus,7⟩,⟨39367,77,9861,.second,.plus,2⟩,⟨26169,1,39367,.first,.plus,16⟩]⟩,
  ⟨[9881, 13069], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨781,3,13,.first,.reverseMinus,8⟩,⟨13069,3,781,.first,.reverseMinus,12⟩,⟨9945,781,13069,.first,.minus,2⟩,⟨9881,1,9945,.first,.minus,6⟩]⟩,
  ⟨[9881, 26139], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨26163,51,51,.second,.reverseMinus,9⟩,⟨26139,3,26163,.first,.minus,3⟩,⟨26265,51,26163,.first,.reverseMinus,1⟩,⟨9881,1,26265,.first,.minus,14⟩]⟩,
  ⟨[9897, 15619], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨3331,3,13,.second,.reverseMinus,8⟩,⟨15619,3,3331,.first,.reverseMinus,12⟩,⟨9993,3331,3331,.second,.plus,2⟩,⟨9897,3,9993,.first,.minus,5⟩]⟩,
  ⟨[9897, 31237], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨61,5,41,.first,.reverseMinus,2⟩,⟨31237,5,61,.second,.reverseMinus,9⟩,⟨7849,41,61,.second,.reverseMinus,7⟩,⟨9897,1,7849,.first,.reverseMinus,11⟩]⟩,
  ⟨[9901, 26109], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨26109,3,51,.second,.plus,9⟩,⟨26285,11,26109,.first,.reverseMinus,4⟩,⟨9901,1,26285,.first,.minus,14⟩]⟩,
  ⟨[9921, 13039], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨155,5,5,.second,.plus,5⟩,⟨9921,1,155,.second,.reverseMinus,6⟩,⟨1435,5,155,.first,.reverseMinus,8⟩,⟨13039,9921,1435,.second,.plus,4⟩]⟩,
  ⟨[9921, 26077], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨815,3,47,.first,.reverseMinus,8⟩,⟨26077,3,815,.second,.plus,5⟩,⟨12993,47,815,.second,.plus,4⟩,⟨9921,3,12993,.first,.minus,10⟩]⟩,
  ⟨[9941, 26047], [⟨3,1,1,.second,.plus,2⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨205,3,193,.first,.reverseMinus,2⟩,⟨26047,193,205,.second,.plus,7⟩,⟨1749,193,205,.first,.reverseMinus,3⟩,⟨9941,1,1749,.first,.reverseMinus,13⟩]⟩,
  ⟨[9945, 15611], [⟨7,1,1,.second,.plus,3⟩,⟨255,1,1,.second,.plus,8⟩,⟨1275,255,255,.second,.reverseMinus,2⟩,⟨15611,7,1275,.first,.reverseMinus,11⟩,⟨9945,255,1275,.second,.plus,3⟩]⟩,
  ⟨[9945, 31223], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨39,3,9,.second,.reverseMinus,2⟩,⟨9945,39,39,.second,.plus,8⟩,⟨1545,3,9,.first,.reverseMinus,9⟩,⟨31223,1,1545,.first,.plus,15⟩]⟩,
  ⟨[9961, 26017], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨279,31,31,.second,.reverseMinus,3⟩,⟨9961,5,279,.first,.plus,11⟩,⟨17825,31,279,.second,.plus,6⟩,⟨26017,1,17825,.first,.reverseMinus,13⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank46
