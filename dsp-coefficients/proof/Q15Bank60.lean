import Q15Upper
namespace Q15Bank60
open Q15Upper
def entries : List Entry := [
  ⟨[18455, 27077], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨18437,5,9,.second,.reverseMinus,11⟩,⟨18455,9,18437,.first,.reverseMinus,1⟩,⟨17861,9,18437,.first,.minus,6⟩,⟨27077,9,17861,.first,.reverseMinus,10⟩]⟩,
  ⟨[18497, 27049], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨1089,1,17,.second,.reverseMinus,6⟩,⟨18497,17,1089,.first,.reverseMinus,10⟩,⟨27209,1089,18497,.first,.reverseMinus,3⟩,⟨27049,5,27209,.first,.minus,5⟩]⟩,
  ⟨[18537, 27021], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨105,3,9,.first,.reverseMinus,5⟩,⟨18537,9,105,.first,.reverseMinus,11⟩,⟨1689,9,105,.second,.reverseMinus,4⟩,⟨27021,3,1689,.second,.plus,4⟩]⟩,
  ⟨[18579, 26991], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨19,1,9,.second,.reverseMinus,1⟩,⟨145,1,9,.second,.reverseMinus,4⟩,⟨18579,19,145,.second,.reverseMinus,7⟩,⟨9873,19,145,.first,.reverseMinus,9⟩,⟨26991,9,9873,.first,.plus,12⟩]⟩,
  ⟨[18621, 26963], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨2069,1,21,.first,.reverseMinus,11⟩,⟨18621,2069,2069,.second,.reverseMinus,3⟩,⟨1685,3,2069,.first,.minus,7⟩,⟨26963,3,1685,.second,.reverseMinus,4⟩]⟩,
  ⟨[18663, 26935], [⟨7,1,1,.second,.plus,3⟩,⟨217,7,7,.second,.plus,5⟩,⟨295,1,217,.first,.plus,9⟩,⟨18663,217,295,.second,.plus,6⟩,⟨3367,7,217,.first,.plus,9⟩,⟨26935,1,3367,.second,.plus,3⟩]⟩,
  ⟨[18703, 26905], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨4101,1,5,.first,.reverseMinus,12⟩,⟨5381,5,4101,.first,.reverseMinus,8⟩,⟨26905,5381,5381,.second,.reverseMinus,2⟩,⟨18703,4101,26905,.first,.minus,1⟩]⟩,
  ⟨[18745, 26877], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨105,15,15,.second,.plus,3⟩,⟨26877,3,105,.second,.plus,8⟩,⟨26937,15,26877,.first,.reverseMinus,2⟩,⟨18745,1,26937,.first,.minus,13⟩]⟩,
  ⟨[18785, 26849], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨63,1,1,.second,.plus,6⟩,⟨289,1,9,.second,.reverseMinus,5⟩,⟨18785,289,289,.second,.reverseMinus,6⟩,⟨26849,63,18785,.first,.reverseMinus,7⟩]⟩,
  ⟨[18827, 26819], [⟨15,1,1,.second,.plus,4⟩,⟨13,1,15,.first,.minus,1⟩,⟨26611,13,13,.second,.plus,11⟩,⟨26819,13,26611,.first,.reverseMinus,4⟩,⟨26507,13,26611,.first,.minus,3⟩,⟨18827,15,26507,.first,.minus,9⟩]⟩,
  ⟨[18869, 26791], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1275,5,5,.second,.plus,8⟩,⟨1259,1,1275,.first,.minus,4⟩,⟨18869,1275,1259,.second,.plus,4⟩,⟨6311,1275,1259,.second,.reverseMinus,2⟩,⟨26791,5,6311,.first,.reverseMinus,12⟩]⟩,
  ⟨[18909, 26761], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨17885,35,35,.second,.plus,9⟩,⟨18909,1,17885,.first,.reverseMinus,10⟩,⟨6691,3,17885,.first,.plus,13⟩,⟨26761,3,6691,.second,.plus,2⟩]⟩,
  ⟨[18951, 26733], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨18431,1,9,.second,.plus,11⟩,⟨18951,65,18431,.first,.reverseMinus,3⟩,⟨26751,65,18431,.first,.reverseMinus,7⟩,⟨26733,9,26751,.first,.minus,1⟩]⟩,
  ⟨[18991, 26703], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨79,1,5,.second,.plus,4⟩,⟨16463,1,79,.first,.reverseMinus,14⟩,⟨26703,5,16463,.first,.reverseMinus,11⟩,⟨18991,79,16463,.first,.reverseMinus,5⟩]⟩,
  ⟨[19033, 26675], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨577,1,9,.second,.reverseMinus,6⟩,⟨2307,1,577,.second,.plus,2⟩,⟨19033,577,2307,.second,.reverseMinus,3⟩,⟨5335,2307,19033,.output,.plus,2⟩,⟨26675,5335,5335,.second,.reverseMinus,2⟩]⟩,
  ⟨[19073, 26645], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨21,1,13,.first,.reverseMinus,3⟩,⟨26645,13,21,.first,.reverseMinus,11⟩,⟨149,1,21,.first,.reverseMinus,7⟩,⟨19073,1,149,.second,.reverseMinus,7⟩]⟩,
  ⟨[19113, 26615], [⟨7,1,1,.second,.plus,3⟩,⟨121,1,7,.first,.plus,7⟩,⟨1671,7,121,.first,.plus,8⟩,⟨26615,121,1671,.second,.plus,4⟩,⟨1187,121,1671,.first,.minus,2⟩,⟨19113,121,1187,.second,.reverseMinus,4⟩]⟩,
  ⟨[19155, 26587], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨37,3,13,.first,.reverseMinus,3⟩,⟨26587,13,37,.first,.plus,11⟩,⟨1197,13,37,.second,.reverseMinus,5⟩,⟨19155,3,1197,.second,.reverseMinus,4⟩]⟩,
  ⟨[19195, 26557], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨415,1,13,.second,.plus,5⟩,⟨26557,3,415,.second,.plus,6⟩,⟨27387,415,26557,.first,.reverseMinus,1⟩,⟨19195,1,27387,.first,.minus,13⟩]⟩,
  ⟨[19237, 26527], [⟨3,1,1,.second,.plus,2⟩,⟨765,3,3,.second,.plus,8⟩,⟨829,1,765,.first,.reverseMinus,6⟩,⟨26527,1,829,.second,.plus,5⟩,⟨6949,765,829,.first,.reverseMinus,3⟩,⟨19237,3,6949,.first,.reverseMinus,12⟩]⟩,
  ⟨[19277, 26499], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨521,1,9,.first,.reverseMinus,9⟩,⟨2605,521,521,.second,.reverseMinus,2⟩,⟨19277,521,2605,.first,.reverseMinus,5⟩,⟨22403,2605,19277,.first,.plus,4⟩,⟨26499,1,22403,.first,.reverseMinus,12⟩]⟩,
  ⟨[19317, 26469], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨2941,3,23,.second,.plus,7⟩,⟨26469,2941,2941,.second,.reverseMinus,3⟩,⟨2933,1,2941,.first,.minus,3⟩,⟨19317,1,2933,.first,.reverseMinus,14⟩]⟩,
  ⟨[19359, 26439], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨35,5,5,.second,.plus,3⟩,⟨605,5,35,.first,.plus,7⟩,⟨19359,1,605,.second,.plus,5⟩,⟨24199,605,19359,.first,.reverseMinus,3⟩,⟨26439,35,24199,.first,.reverseMinus,6⟩]⟩,
  ⟨[19399, 26409], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨25,1,9,.first,.reverseMinus,4⟩,⟨825,25,25,.second,.reverseMinus,5⟩,⟨26409,9,825,.second,.reverseMinus,5⟩,⟨2425,25,825,.first,.reverseMinus,6⟩,⟨19399,1,2425,.second,.plus,3⟩]⟩,
  ⟨[19439, 26379], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨1215,5,65,.first,.plus,8⟩,⟨19439,1,1215,.second,.plus,4⟩,⟨24299,1215,19439,.first,.reverseMinus,2⟩,⟨26379,65,24299,.first,.reverseMinus,5⟩]⟩,
  ⟨[19479, 26349], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨151,1,19,.second,.plus,3⟩,⟨19479,151,151,.second,.reverseMinus,7⟩,⟨38637,19,151,.second,.plus,8⟩,⟨26349,3,38637,.first,.minus,12⟩]⟩,
  ⟨[19519, 26319], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨305,1,19,.second,.reverseMinus,4⟩,⟨19519,1,305,.second,.plus,6⟩,⟨6449,3,305,.first,.reverseMinus,11⟩,⟨26319,1,6449,.first,.plus,15⟩]⟩,
  ⟨[19561, 26289], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨585,9,9,.second,.reverseMinus,6⟩,⟨841,1,585,.first,.reverseMinus,8⟩,⟨19561,585,841,.first,.reverseMinus,5⟩,⟨26289,841,19561,.first,.reverseMinus,3⟩]⟩,
  ⟨[19601, 26259], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1281,1,5,.second,.reverseMinus,8⟩,⟨1153,1,1281,.first,.minus,7⟩,⟨19601,1153,1153,.second,.reverseMinus,4⟩,⟨22163,1281,19601,.first,.reverseMinus,1⟩,⟨26259,1,22163,.first,.reverseMinus,12⟩]⟩,
  ⟨[19641, 26229], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨57,3,51,.first,.reverseMinus,1⟩,⟨13113,51,57,.first,.reverseMinus,8⟩,⟨19641,51,13113,.first,.reverseMinus,7⟩,⟨26229,3,13113,.second,.reverseMinus,1⟩]⟩,
  ⟨[19681, 26199], [⟨3,1,1,.second,.plus,2⟩,⟨767,1,3,.second,.plus,8⟩,⟨639,1,767,.first,.minus,7⟩,⟨19681,767,639,.second,.plus,5⟩,⟨3195,639,639,.second,.reverseMinus,2⟩,⟨26199,639,3195,.second,.reverseMinus,3⟩]⟩,
  ⟨[19721, 26169], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨793,3,25,.first,.reverseMinus,8⟩,⟨26169,793,793,.second,.reverseMinus,5⟩,⟨19769,25,26169,.first,.minus,8⟩,⟨19721,3,19769,.first,.minus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank60
