import Q15Upper
namespace Q15Bank03
open Q15Upper
def entries : List Entry := [
  ⟨[295, 16341], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨43,3,49,.first,.minus,1⟩,⟨16341,1,43,.first,.plus,14⟩,⟨295,49,43,.second,.plus,3⟩]⟩,
  ⟨[295, 32683], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨2043,1,5,.first,.plus,11⟩,⟨295,5,255,.first,.reverseMinus,3⟩,⟨32683,5,2043,.second,.plus,4⟩]⟩,
  ⟨[301, 16383], [⟨3,1,1,.second,.plus,2⟩,⟨16383,1,1,.second,.plus,14⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨301,3,19,.second,.plus,4⟩]⟩,
  ⟨[301, 32767], [⟨3,1,1,.second,.plus,2⟩,⟨32767,1,1,.second,.plus,15⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨301,3,19,.second,.plus,4⟩]⟩,
  ⟨[305, 1645], [⟨3,1,1,.second,.plus,2⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨305,3,257,.first,.reverseMinus,4⟩,⟨329,3,305,.first,.reverseMinus,3⟩,⟨1645,329,329,.second,.reverseMinus,2⟩]⟩,
  ⟨[305, 26319], [⟨3,1,1,.second,.plus,2⟩,⟨257,1,1,.second,.reverseMinus,8⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨305,3,257,.first,.reverseMinus,4⟩,⟨26319,13,305,.first,.plus,11⟩]⟩,
  ⟨[315, 3229], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨315,5,5,.second,.plus,6⟩,⟨443,1,315,.first,.reverseMinus,7⟩,⟨3229,315,443,.second,.plus,3⟩]⟩,
  ⟨[315, 25833], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨24573,3,3,.second,.plus,13⟩,⟨315,5,5,.second,.plus,6⟩,⟨25833,24573,315,.second,.reverseMinus,2⟩]⟩,
  ⟨[323, 12713], [⟨3,1,1,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨323,1,387,.first,.minus,6⟩,⟨6195,3,387,.second,.reverseMinus,4⟩,⟨12713,323,6195,.second,.reverseMinus,1⟩]⟩,
  ⟨[323, 25425], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨81,9,9,.second,.reverseMinus,3⟩,⟨323,1,81,.second,.plus,2⟩,⟨99,9,81,.first,.reverseMinus,1⟩,⟨25425,81,99,.second,.reverseMinus,8⟩]⟩,
  ⟨[327, 16381], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨16381,1,3,.first,.plus,14⟩,⟨327,5,7,.first,.reverseMinus,6⟩]⟩,
  ⟨[327, 32761], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨32761,1,7,.first,.plus,15⟩,⟨327,5,7,.first,.reverseMinus,6⟩]⟩,
  ⟨[339, 2041], [⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨2041,1,7,.first,.plus,11⟩,⟨339,113,113,.second,.plus,2⟩]⟩,
  ⟨[339, 8185], [⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨8185,1,7,.first,.plus,13⟩,⟨339,113,113,.second,.plus,2⟩]⟩,
  ⟨[339, 32655], [⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨32655,1,113,.first,.plus,15⟩,⟨339,113,113,.second,.plus,2⟩]⟩,
  ⟨[339, 32739], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨21,3,3,.second,.plus,3⟩,⟨32739,3,1023,.second,.reverseMinus,5⟩,⟨339,3,21,.second,.reverseMinus,4⟩]⟩,
  ⟨[345, 6053], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨6145,1,3,.second,.reverseMinus,11⟩,⟨345,23,23,.second,.plus,4⟩,⟨6053,23,6145,.first,.minus,2⟩]⟩,
  ⟨[345, 7713], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨249,3,255,.first,.minus,1⟩,⟨345,3,249,.first,.reverseMinus,5⟩,⟨7713,255,249,.second,.plus,5⟩]⟩,
  ⟨[345, 24211], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨24579,3,3,.second,.reverseMinus,13⟩,⟨345,23,23,.second,.plus,4⟩,⟨24211,23,24579,.first,.minus,4⟩]⟩,
  ⟨[345, 30853], [⟨7,1,1,.second,.plus,3⟩,⟨121,1,7,.first,.plus,7⟩,⟨15487,1,121,.second,.plus,7⟩,⟨345,7,121,.first,.reverseMinus,5⟩,⟨30853,121,15487,.second,.plus,1⟩]⟩,
  ⟨[347, 16147], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨127,1,1,.second,.plus,7⟩,⟨237,17,127,.second,.plus,1⟩,⟨16147,1,237,.first,.plus,14⟩,⟨347,127,237,.second,.plus,1⟩]⟩,
  ⟨[347, 32295], [⟨31,1,1,.second,.plus,5⟩,⟨63,1,1,.second,.plus,6⟩,⟨473,31,63,.second,.plus,3⟩,⟨32295,1,473,.first,.plus,15⟩,⟨347,63,473,.first,.minus,1⟩]⟩,
  ⟨[351, 16383], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨16383,1,1,.second,.plus,14⟩,⟨351,3,33,.first,.plus,7⟩]⟩,
  ⟨[351, 32767], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨32767,1,1,.second,.plus,15⟩,⟨351,3,33,.first,.plus,7⟩]⟩,
  ⟨[357, 367], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨11,1,5,.second,.reverseMinus,1⟩,⟨357,5,11,.second,.reverseMinus,5⟩,⟨367,5,357,.first,.reverseMinus,1⟩]⟩,
  ⟨[357, 23489], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨361,3,385,.first,.minus,3⟩,⟨357,1,361,.first,.minus,2⟩,⟨23489,385,361,.second,.reverseMinus,6⟩]⟩,
  ⟨[367, 22849], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨367,3,17,.first,.plus,7⟩,⟨1451,17,367,.second,.plus,2⟩,⟨22849,367,1451,.second,.plus,4⟩]⟩,
  ⟨[377, 4095], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨4095,1,1,.second,.plus,12⟩,⟨377,3,7,.first,.plus,7⟩]⟩,
  ⟨[377, 16367], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨16367,1,17,.first,.plus,14⟩,⟨377,17,513,.first,.minus,3⟩]⟩,
  ⟨[377, 32733], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1023,1,1,.second,.plus,10⟩,⟨377,3,7,.first,.plus,7⟩,⟨32733,3,1023,.second,.plus,5⟩]⟩,
  ⟨[377, 32759], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨23,1,9,.first,.plus,5⟩,⟨32759,1,9,.first,.plus,15⟩,⟨377,9,23,.second,.reverseMinus,4⟩]⟩,
  ⟨[381, 8049], [⟨3,1,1,.second,.plus,2⟩,⟨381,3,3,.second,.plus,7⟩,⟨1917,3,381,.first,.reverseMinus,9⟩,⟨8049,381,1917,.second,.reverseMinus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank03
