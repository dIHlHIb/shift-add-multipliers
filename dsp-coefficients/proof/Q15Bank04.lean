import Q15Upper
namespace Q15Bank04
open Q15Upper
def entries : List Entry := [
  ⟨[381, 32195], [⟨3,1,1,.second,.plus,2⟩,⟨509,1,3,.first,.plus,9⟩,⟨381,1,509,.first,.minus,7⟩,⟨32195,509,381,.first,.plus,6⟩]⟩,
  ⟨[389, 8155], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨389,3,5,.first,.reverseMinus,7⟩,⟨8155,5,255,.second,.plus,5⟩]⟩,
  ⟨[389, 32619], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨133,1,5,.first,.reverseMinus,7⟩,⟨389,1,133,.first,.reverseMinus,8⟩,⟨32619,2047,133,.first,.plus,4⟩]⟩,
  ⟨[403, 16383], [⟨3,1,1,.second,.plus,2⟩,⟨16383,1,1,.second,.plus,14⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨403,13,13,.second,.plus,5⟩]⟩,
  ⟨[403, 32765], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨32765,1,3,.first,.plus,15⟩,⟨403,13,13,.second,.plus,5⟩]⟩,
  ⟨[407, 9941], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨69,1,65,.first,.reverseMinus,2⟩,⟨617,65,69,.second,.reverseMinus,3⟩,⟨407,1,617,.first,.plus,10⟩,⟨9941,69,617,.second,.reverseMinus,4⟩]⟩,
  ⟨[407, 19881], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨407,3,23,.first,.reverseMinus,7⟩,⟨6167,3,23,.first,.reverseMinus,11⟩,⟨19881,407,6167,.first,.plus,6⟩]⟩,
  ⟨[415, 4011], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨995,3,31,.second,.reverseMinus,5⟩,⟨415,3,31,.first,.reverseMinus,7⟩,⟨4011,31,995,.second,.reverseMinus,2⟩]⟩,
  ⟨[415, 32089], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨415,1,97,.first,.plus,9⟩,⟨3999,1,97,.first,.plus,12⟩,⟨32089,97,3999,.second,.reverseMinus,3⟩]⟩,
  ⟨[425, 7453], [⟨3,1,1,.second,.plus,2⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨233,3,257,.first,.minus,3⟩,⟨7453,3,233,.second,.plus,5⟩,⟨425,3,233,.first,.reverseMinus,6⟩]⟩,
  ⟨[425, 29813], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨53,3,5,.first,.reverseMinus,4⟩,⟨425,1,53,.second,.reverseMinus,3⟩,⟨27253,53,425,.second,.reverseMinus,6⟩,⟨29813,5,27253,.first,.reverseMinus,9⟩]⟩,
  ⟨[427, 8181], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨61,1,3,.first,.plus,6⟩,⟨8181,3,1023,.second,.plus,3⟩,⟨427,61,61,.second,.plus,3⟩]⟩,
  ⟨[427, 8189], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨8189,1,3,.first,.plus,13⟩,⟨427,61,61,.second,.plus,3⟩]⟩,
  ⟨[427, 32723], [⟨3,1,1,.second,.plus,2⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨61,1,3,.first,.plus,6⟩,⟨32723,2049,61,.first,.plus,4⟩,⟨427,61,61,.second,.plus,3⟩]⟩,
  ⟨[427, 32757], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨523,3,65,.second,.reverseMinus,3⟩,⟨427,3,523,.first,.minus,5⟩,⟨32757,65,523,.first,.plus,9⟩]⟩,
  ⟨[433, 1093], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨639,1,385,.first,.plus,10⟩,⟨433,3,385,.first,.reverseMinus,4⟩,⟨1093,639,433,.second,.plus,2⟩]⟩,
  ⟨[433, 17489], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨273,1,17,.second,.reverseMinus,4⟩,⟨433,5,273,.first,.reverseMinus,5⟩,⟨17489,17,273,.second,.reverseMinus,6⟩]⟩,
  ⟨[435, 927], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨927,1,29,.second,.plus,5⟩,⟨435,29,29,.second,.plus,4⟩]⟩,
  ⟨[435, 29665], [⟨31,1,1,.second,.plus,5⟩,⟨29,1,31,.first,.minus,1⟩,⟨29665,31,29,.second,.plus,10⟩,⟨435,29,29,.second,.plus,4⟩]⟩,
  ⟨[439, 8145], [⟨63,1,1,.second,.plus,6⟩,⟨47,1,63,.first,.minus,4⟩,⟨8145,1,47,.first,.plus,13⟩,⟨439,63,47,.second,.reverseMinus,3⟩]⟩,
  ⟨[439, 32579], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨509,1,3,.first,.plus,9⟩,⟨32579,3,509,.second,.reverseMinus,6⟩,⟨439,35,509,.first,.minus,1⟩]⟩,
  ⟨[453, 8191], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨8191,1,1,.second,.plus,13⟩,⟨453,5,7,.second,.reverseMinus,6⟩]⟩,
  ⟨[453, 32765], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨32765,1,3,.first,.plus,15⟩,⟨453,5,7,.second,.reverseMinus,6⟩]⟩,
  ⟨[459, 7323], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨21,3,3,.second,.plus,3⟩,⟨459,15,21,.first,.plus,5⟩,⟨7323,21,459,.second,.plus,4⟩]⟩,
  ⟨[459, 29291], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨85,17,17,.second,.reverseMinus,2⟩,⟨459,17,85,.first,.plus,5⟩,⟨29291,85,459,.second,.plus,6⟩]⟩,
  ⟨[461, 3991], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨3069,3,3,.second,.plus,10⟩,⟨461,3,29,.second,.plus,4⟩,⟨3991,3069,461,.second,.reverseMinus,1⟩]⟩,
  ⟨[461, 31927], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨495,1,17,.first,.plus,9⟩,⟨247,1,495,.output,.reverseMinus,1⟩,⟨461,17,495,.first,.minus,1⟩,⟨31927,495,247,.first,.reverseMinus,6⟩]⟩,
  ⟨[473, 14531], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨473,1,39,.first,.plus,9⟩,⟨3623,1,473,.first,.plus,12⟩,⟨14531,39,3623,.second,.reverseMinus,2⟩]⟩,
  ⟨[473, 29063], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨473,1,39,.first,.plus,9⟩,⟨1209,39,39,.second,.plus,5⟩,⟨29063,473,1209,.first,.plus,6⟩]⟩,
  ⟨[477, 16377], [⟨7,1,1,.second,.plus,3⟩,⟨29,1,7,.second,.reverseMinus,2⟩,⟨16377,1,7,.first,.plus,14⟩,⟨477,7,29,.first,.reverseMinus,6⟩]⟩,
  ⟨[477, 32755], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨2047,1,1,.second,.plus,11⟩,⟨477,3,15,.second,.plus,5⟩,⟨32755,3,2047,.second,.reverseMinus,4⟩]⟩,
  ⟨[481, 2807], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨401,1,385,.first,.reverseMinus,4⟩,⟨481,3,385,.first,.reverseMinus,5⟩,⟨2807,401,401,.second,.plus,3⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank04
