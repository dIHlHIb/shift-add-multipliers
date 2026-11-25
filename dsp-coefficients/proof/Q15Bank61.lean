import Q15Upper
namespace Q15Bank61
open Q15Upper
def entries : List Entry := [
  ⟨[19761, 26139], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨305,1,19,.second,.reverseMinus,4⟩,⟨19761,19,305,.first,.reverseMinus,10⟩,⟨9755,5,305,.second,.plus,5⟩,⟨26139,1,9755,.first,.reverseMinus,14⟩]⟩,
  ⟨[19801, 26109], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨1533,3,3,.second,.plus,9⟩,⟨26109,3,1533,.first,.reverseMinus,13⟩,⟨19977,1533,26109,.first,.minus,2⟩,⟨19801,11,19977,.first,.minus,4⟩]⟩,
  ⟨[19841, 26077], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨19841,19,385,.first,.reverseMinus,10⟩,⟨26001,385,19841,.first,.reverseMinus,4⟩,⟨26077,19,26001,.first,.reverseMinus,2⟩]⟩,
  ⟨[19881, 26047], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨407,3,23,.first,.reverseMinus,7⟩,⟨26047,1,407,.second,.plus,6⟩,⟨26025,23,407,.second,.plus,6⟩,⟨19881,3,26025,.first,.minus,11⟩]⟩,
  ⟨[19921, 26017], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨813,3,45,.first,.reverseMinus,8⟩,⟨26017,1,813,.second,.reverseMinus,5⟩,⟨19873,3,26017,.first,.minus,11⟩,⟨19921,3,19873,.first,.reverseMinus,4⟩]⟩,
  ⟨[19961, 25987], [⟨3,1,1,.second,.plus,2⟩,⟨1539,3,3,.second,.reverseMinus,9⟩,⟨26115,3,1539,.first,.reverseMinus,13⟩,⟨25987,1,26115,.first,.minus,7⟩,⟨19959,1539,26115,.first,.minus,2⟩,⟨19961,1,19959,.first,.reverseMinus,1⟩]⟩,
  ⟨[20001, 25955], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨3105,3,33,.first,.reverseMinus,10⟩,⟨20001,33,3105,.first,.reverseMinus,9⟩,⟨26211,3105,20001,.first,.reverseMinus,1⟩,⟨25955,1,26211,.first,.minus,8⟩]⟩,
  ⟨[20041, 25925], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨20741,5,81,.second,.reverseMinus,8⟩,⟨25925,81,20741,.first,.reverseMinus,6⟩,⟨21065,81,20741,.first,.reverseMinus,2⟩,⟨20041,1,21065,.first,.minus,10⟩]⟩,
  ⟨[20081, 25895], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨295,5,25,.first,.plus,6⟩,⟨25895,25,295,.first,.reverseMinus,10⟩,⟨1255,5,25,.first,.plus,8⟩,⟨20081,1,1255,.second,.reverseMinus,4⟩]⟩,
  ⟨[20121, 25863], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨359,5,39,.first,.reverseMinus,6⟩,⟨20121,5,359,.first,.plus,12⟩,⟨25831,359,20121,.first,.plus,7⟩,⟨25863,1,25831,.first,.reverseMinus,5⟩]⟩,
  ⟨[20159, 25833], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨315,5,5,.second,.plus,6⟩,⟨20159,1,315,.second,.plus,6⟩,⟨1257,3,315,.second,.plus,2⟩,⟨25833,3,1257,.first,.reverseMinus,13⟩]⟩,
  ⟨[20199, 25801], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨79,1,5,.second,.plus,4⟩,⟨20199,25,79,.second,.plus,8⟩,⟨3225,25,25,.second,.reverseMinus,7⟩,⟨25801,1,3225,.second,.reverseMinus,3⟩]⟩,
  ⟨[20239, 25771], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨1275,5,5,.second,.plus,8⟩,⟨20239,161,1275,.second,.plus,4⟩,⟨21675,1275,1275,.second,.reverseMinus,4⟩,⟨25771,1,21675,.first,.reverseMinus,12⟩]⟩,
  ⟨[20279, 25739], [⟨3,1,1,.second,.plus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨779,1,195,.second,.plus,2⟩,⟨25739,195,779,.first,.reverseMinus,7⟩,⟨3895,779,779,.second,.reverseMinus,2⟩,⟨20279,1,3895,.first,.reverseMinus,14⟩]⟩,
  ⟨[20319, 25709], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨20319,5,161,.first,.plus,12⟩,⟨20589,19,161,.second,.plus,7⟩,⟨25709,5,20589,.first,.reverseMinus,10⟩]⟩,
  ⟨[20357, 25677], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨20485,5,5,.second,.reverseMinus,12⟩,⟨20357,1,20485,.first,.minus,7⟩,⟨20557,9,20485,.first,.reverseMinus,3⟩,⟨25677,5,20557,.first,.reverseMinus,10⟩]⟩,
  ⟨[20397, 25645], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨20479,1,5,.second,.plus,12⟩,⟨20397,41,20479,.first,.minus,1⟩,⟨25645,41,20397,.first,.reverseMinus,7⟩]⟩,
  ⟨[20437, 25615], [⟨511,1,1,.second,.plus,9⟩,⟨8175,1,511,.second,.plus,4⟩,⟨7153,511,8175,.first,.minus,1⟩,⟨25615,1,7153,.first,.plus,15⟩,⟨20437,8175,7153,.second,.plus,2⟩]⟩,
  ⟨[20475, 25583], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1277,3,5,.second,.plus,8⟩,⟨20475,5,5,.second,.plus,12⟩,⟨25583,1277,20475,.first,.reverseMinus,2⟩]⟩,
  ⟨[20515, 25551], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨5127,5,7,.first,.reverseMinus,10⟩,⟨20515,7,5127,.second,.reverseMinus,2⟩,⟨5071,7,5127,.first,.minus,3⟩,⟨25551,5,5071,.first,.reverseMinus,12⟩]⟩,
  ⟨[20553, 25521], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨799,47,47,.second,.reverseMinus,4⟩,⟨25521,47,799,.second,.plus,5⟩,⟨12361,799,25521,.output,.reverseMinus,1⟩,⟨20553,1,12361,.first,.reverseMinus,13⟩]⟩,
  ⟨[20593, 25489], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨20593,5,113,.first,.reverseMinus,12⟩,⟨20369,7,20593,.first,.minus,5⟩,⟨25489,5,20369,.first,.reverseMinus,10⟩]⟩,
  ⟨[20631, 25457], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨151,1,19,.second,.plus,3⟩,⟨20631,5,151,.first,.reverseMinus,12⟩,⟨20593,19,20631,.first,.minus,1⟩,⟨25457,19,20593,.first,.reverseMinus,8⟩]⟩,
  ⟨[20671, 25425], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨20671,5,191,.first,.reverseMinus,12⟩,⟨23727,191,20671,.first,.reverseMinus,4⟩,⟨25425,3,23727,.first,.plus,14⟩]⟩,
  ⟨[20709, 25393], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨305,1,49,.first,.reverseMinus,8⟩,⟨25393,49,305,.first,.reverseMinus,9⟩,⟨20513,305,25393,.first,.minus,4⟩,⟨20709,49,20513,.first,.reverseMinus,2⟩]⟩,
  ⟨[20749, 25361], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨785,3,17,.first,.reverseMinus,8⟩,⟨25361,3,785,.first,.reverseMinus,13⟩,⟨12557,3,785,.second,.plus,4⟩,⟨20749,1,12557,.first,.reverseMinus,13⟩]⟩,
  ⟨[20787, 25331], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨25331,13,99,.second,.plus,8⟩,⟨1293,13,25331,.first,.plus,11⟩,⟨20787,99,1293,.second,.reverseMinus,4⟩]⟩,
  ⟨[20827, 25299], [⟨3,1,1,.second,.plus,2⟩,⟨93,3,3,.second,.plus,5⟩,⟨1491,3,93,.second,.reverseMinus,4⟩,⟨25299,93,1491,.first,.reverseMinus,8⟩,⟨10413,93,1491,.first,.plus,7⟩,⟨20827,1,10413,.second,.reverseMinus,1⟩]⟩,
  ⟨[20865, 25267], [⟨3,1,1,.second,.plus,2⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨163,3,259,.first,.minus,5⟩,⟨20865,1,163,.second,.reverseMinus,7⟩,⟨1563,259,163,.second,.reverseMinus,3⟩,⟨25267,259,1563,.second,.reverseMinus,4⟩]⟩,
  ⟨[20905, 25235], [⟨15,1,1,.second,.plus,4⟩,⟨49,1,15,.first,.plus,6⟩,⟨12593,49,49,.second,.reverseMinus,8⟩,⟨25235,49,12593,.second,.reverseMinus,1⟩,⟨12713,15,12593,.first,.reverseMinus,3⟩,⟨20905,1,12713,.first,.reverseMinus,13⟩]⟩,
  ⟨[20943, 25201], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨41,1,49,.first,.minus,3⟩,⟨20943,49,41,.second,.plus,9⟩,⟨25137,49,49,.second,.reverseMinus,9⟩,⟨25201,1,25137,.first,.reverseMinus,6⟩]⟩,
  ⟨[20981, 25169], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨81,1,49,.first,.reverseMinus,5⟩,⟨25169,49,81,.first,.reverseMinus,9⟩,⟨5233,49,81,.second,.reverseMinus,6⟩,⟨20981,49,5233,.second,.reverseMinus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank61
