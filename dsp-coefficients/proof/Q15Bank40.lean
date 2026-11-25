import Q15Upper
namespace Q15Bank40
open Q15Upper
def entries : List Entry := [
  ⟨[7209, 29425], [⟨3,1,1,.second,.plus,2⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨5885,3,259,.first,.plus,11⟩,⟨29425,5885,5885,.second,.reverseMinus,2⟩,⟨2403,259,5885,.first,.plus,5⟩,⟨7209,2403,2403,.second,.plus,2⟩]⟩,
  ⟨[7213, 15535], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨5125,5,5,.second,.reverseMinus,10⟩,⟨5165,5,5125,.first,.reverseMinus,3⟩,⟨7213,1,5165,.first,.reverseMinus,11⟩,⟨15535,5125,5165,.second,.plus,2⟩]⟩,
  ⟨[7219, 15491], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨1033,1,129,.second,.reverseMinus,3⟩,⟨1037,1,1033,.first,.reverseMinus,2⟩,⟨7219,129,1037,.first,.plus,6⟩,⟨15491,1033,1037,.first,.plus,4⟩]⟩,
  ⟨[7229, 31961], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨1031,1,129,.second,.plus,3⟩,⟨2065,1,129,.second,.reverseMinus,4⟩,⟨31961,1031,1031,.second,.plus,5⟩,⟨7229,1031,2065,.second,.plus,2⟩]⟩,
  ⟨[7231, 7351], [⟨15,1,1,.second,.plus,4⟩,⟨8191,1,1,.second,.plus,13⟩,⟨7231,15,8191,.first,.minus,6⟩,⟨7351,15,7231,.first,.reverseMinus,3⟩]⟩,
  ⟨[7231, 29403], [⟨15,1,1,.second,.plus,4⟩,⟨8191,1,1,.second,.plus,13⟩,⟨479,1,15,.second,.plus,5⟩,⟨7231,15,8191,.first,.minus,6⟩,⟨29403,479,7231,.second,.reverseMinus,2⟩]⟩,
  ⟨[7277, 15975], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨3175,25,25,.second,.plus,7⟩,⟨15975,25,3175,.first,.reverseMinus,9⟩,⟨3181,3,3175,.first,.reverseMinus,1⟩,⟨7277,1,3181,.first,.reverseMinus,12⟩]⟩,
  ⟨[7277, 31949], [⟨3,1,1,.second,.plus,2⟩,⟨2045,1,3,.first,.plus,11⟩,⟨771,3,3,.second,.reverseMinus,8⟩,⟨31949,2045,771,.first,.plus,4⟩,⟨7277,771,31949,.first,.minus,5⟩]⟩,
  ⟨[7283, 7501], [⟨7,1,1,.second,.plus,3⟩,⟨111,1,7,.second,.plus,4⟩,⟨7279,7,111,.first,.reverseMinus,10⟩,⟨7283,1,7279,.first,.reverseMinus,2⟩,⟨7501,111,7279,.first,.reverseMinus,1⟩]⟩,
  ⟨[7283, 15001], [⟨7,1,1,.second,.plus,3⟩,⟨231,7,7,.second,.reverseMinus,5⟩,⟨14567,7,231,.first,.reverseMinus,11⟩,⟨7283,1,14567,.output,.reverseMinus,1⟩,⟨15001,231,14567,.first,.plus,7⟩]⟩,
  ⟨[7289, 14957], [⟨31,1,1,.second,.plus,5⟩,⟨61,1,31,.second,.plus,1⟩,⟨915,61,61,.second,.plus,4⟩,⟨7289,31,915,.second,.plus,3⟩,⟨14957,31,915,.first,.plus,9⟩]⟩,
  ⟨[7299, 29337], [⟨7,1,1,.second,.plus,3⟩,⟨2047,1,1,.second,.plus,11⟩,⟨889,7,7,.second,.plus,7⟩,⟨7299,2047,889,.first,.plus,2⟩,⟨29337,889,889,.second,.reverseMinus,5⟩]⟩,
  ⟨[7321, 14657], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨229,5,7,.second,.reverseMinus,5⟩,⟨14657,1,229,.second,.reverseMinus,6⟩,⟨7321,7,229,.second,.plus,5⟩]⟩,
  ⟨[7321, 29315], [⟨31,1,1,.second,.plus,5⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨451,31,513,.first,.minus,1⟩,⟨29315,451,451,.second,.reverseMinus,6⟩,⟨7321,31,29315,.output,.reverseMinus,2⟩]⟩,
  ⟨[7323, 14687], [⟨7,1,1,.second,.plus,3⟩,⟨39,1,7,.first,.reverseMinus,5⟩,⟨1831,7,39,.first,.reverseMinus,8⟩,⟨7323,1,1831,.second,.plus,2⟩,⟨14687,39,1831,.second,.reverseMinus,3⟩]⟩,
  ⟨[7327, 15969], [⟨31,1,1,.second,.plus,5⟩,⟨29,1,31,.first,.minus,1⟩,⟨97,1,31,.first,.plus,7⟩,⟨15969,31,97,.first,.reverseMinus,9⟩,⟨7327,29,97,.first,.plus,8⟩]⟩,
  ⟨[7327, 31939], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨229,3,253,.first,.minus,3⟩,⟨7327,1,229,.second,.plus,5⟩,⟨32131,253,253,.second,.plus,7⟩,⟨31939,3,32131,.first,.minus,6⟩]⟩,
  ⟨[7351, 14463], [⟨7,1,1,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨903,7,7,.second,.reverseMinus,7⟩,⟨14463,7,127,.first,.reverseMinus,11⟩,⟨7351,127,903,.second,.reverseMinus,3⟩]⟩,
  ⟨[7373, 14283], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨529,1,33,.second,.reverseMinus,4⟩,⟨3703,529,529,.second,.plus,3⟩,⟨7373,33,3703,.second,.plus,1⟩,⟨14283,529,3703,.second,.plus,2⟩]⟩,
  ⟨[7375, 31927], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨1475,3,23,.second,.reverseMinus,6⟩,⟨7375,1475,1475,.second,.reverseMinus,2⟩,⟨7351,3,7375,.first,.minus,3⟩,⟨31927,3,7351,.first,.reverseMinus,13⟩]⟩,
  ⟨[7389, 14623], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨221,3,7,.second,.plus,5⟩,⟨7389,7,221,.first,.reverseMinus,10⟩,⟨1761,7,221,.second,.plus,3⟩,⟨14623,1,1761,.first,.plus,14⟩]⟩,
  ⟨[7389, 29247], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨7389,29,35,.first,.plus,8⟩,⟨7319,35,7389,.first,.minus,1⟩,⟨29247,29,7319,.second,.plus,2⟩]⟩,
  ⟨[7411, 13965], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨7411,13,29,.second,.plus,8⟩,⟨1677,13,13,.second,.reverseMinus,7⟩,⟨13965,3,1677,.first,.reverseMinus,12⟩]⟩,
  ⟨[7411, 29223], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨6643,13,13,.second,.plus,9⟩,⟨7411,3,6643,.first,.reverseMinus,8⟩,⟨19929,6643,6643,.second,.plus,2⟩,⟨29223,3,19929,.first,.plus,14⟩]⟩,
  ⟨[7425, 7979], [⟨15,1,1,.second,.plus,4⟩,⟨59,1,15,.second,.plus,2⟩,⟨495,15,15,.second,.reverseMinus,5⟩,⟨7979,59,495,.second,.reverseMinus,4⟩,⟨7425,495,495,.second,.plus,4⟩]⟩,
  ⟨[7425, 31915], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨495,1,17,.first,.plus,9⟩,⟨491,1,495,.first,.minus,2⟩,⟨7425,495,495,.second,.plus,4⟩,⟨31915,491,491,.second,.reverseMinus,6⟩]⟩,
  ⟨[7427, 13829], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨29,1,3,.first,.plus,5⟩,⟨7427,3,29,.second,.reverseMinus,8⟩,⟨13829,1025,7427,.second,.plus,1⟩]⟩,
  ⟨[7453, 13599], [⟨3,1,1,.second,.plus,2⟩,⟨3073,1,3,.second,.reverseMinus,10⟩,⟨29,1,3,.first,.plus,5⟩,⟨7453,29,29,.second,.reverseMinus,8⟩,⟨13599,3073,7453,.first,.reverseMinus,1⟩]⟩,
  ⟨[7473, 31905], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨503,1,9,.first,.plus,9⟩,⟨997,9,503,.second,.plus,1⟩,⟨31905,1,997,.second,.reverseMinus,5⟩,⟨7473,503,997,.second,.plus,3⟩]⟩,
  ⟨[7479, 13371], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨233,1,23,.first,.plus,8⟩,⟨7479,23,233,.second,.reverseMinus,5⟩,⟨13367,23,7479,.first,.reverseMinus,8⟩,⟨13371,1,13367,.first,.reverseMinus,2⟩]⟩,
  ⟨[7489, 13279], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨577,1,9,.second,.reverseMinus,6⟩,⟨5185,9,577,.first,.reverseMinus,9⟩,⟨7489,9,5185,.first,.reverseMinus,8⟩,⟨13279,577,5185,.first,.plus,5⟩]⟩,
  ⟨[7501, 29133], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨117,13,13,.second,.reverseMinus,3⟩,⟨7501,13,117,.second,.reverseMinus,6⟩,⟨455,13,117,.second,.plus,2⟩,⟨29133,13,455,.second,.reverseMinus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank40
