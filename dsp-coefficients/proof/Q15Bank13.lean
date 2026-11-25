import Q15Upper
namespace Q15Bank13
open Q15Upper
def entries : List Entry := [
  ⟨[1331, 8165], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨35,1,9,.second,.plus,2⟩,⟨1187,9,35,.first,.reverseMinus,7⟩,⟨1331,9,1187,.first,.reverseMinus,4⟩,⟨8165,1187,1331,.first,.plus,3⟩]⟩,
  ⟨[1331, 32659], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨109,1,45,.first,.reverseMinus,6⟩,⟨32659,1,109,.first,.plus,15⟩,⟨1331,45,109,.first,.plus,5⟩]⟩,
  ⟨[1351, 32319], [⟨63,1,1,.second,.plus,6⟩,⟨193,1,63,.first,.plus,8⟩,⟨32319,63,63,.second,.reverseMinus,9⟩,⟨1351,193,193,.second,.plus,3⟩]⟩,
  ⟨[1357, 8185], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨8185,1,7,.first,.plus,13⟩,⟨21,1,13,.first,.reverseMinus,3⟩,⟨1357,13,21,.second,.reverseMinus,6⟩]⟩,
  ⟨[1357, 32739], [⟨7,1,1,.second,.plus,3⟩,⟨29,1,7,.second,.reverseMinus,2⟩,⟨32739,1,29,.first,.plus,15⟩,⟨83,7,29,.first,.plus,4⟩,⟨1357,29,83,.second,.reverseMinus,4⟩]⟩,
  ⟨[1359, 12257], [⟨3,1,1,.second,.plus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨61,1,3,.first,.plus,6⟩,⟨12257,1,383,.second,.reverseMinus,5⟩,⟨1359,383,61,.second,.reverseMinus,4⟩]⟩,
  ⟨[1359, 24515], [⟨3,1,1,.second,.plus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨61,1,3,.first,.plus,6⟩,⟨24515,3,383,.second,.reverseMinus,6⟩,⟨1359,383,61,.second,.reverseMinus,4⟩]⟩,
  ⟨[1373, 12157], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨131,1,3,.first,.reverseMinus,7⟩,⟨12157,3,131,.first,.plus,12⟩,⟨1373,47,131,.first,.plus,5⟩]⟩,
  ⟨[1373, 24313], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨83,1,45,.first,.plus,7⟩,⟨1373,45,83,.second,.reverseMinus,4⟩,⟨263,45,83,.first,.reverseMinus,2⟩,⟨24313,3,263,.first,.plus,13⟩]⟩,
  ⟨[1381, 8163], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1161,9,9,.second,.reverseMinus,7⟩,⟨1125,9,1161,.first,.minus,2⟩,⟨1381,1,1125,.first,.reverseMinus,8⟩,⟨8163,1161,1125,.first,.plus,3⟩]⟩,
  ⟨[1381, 32651], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨43,3,5,.second,.reverseMinus,3⟩,⟨1381,5,43,.second,.reverseMinus,5⟩,⟨117,5,43,.first,.plus,5⟩,⟨32651,1,117,.first,.plus,15⟩]⟩,
  ⟨[1387, 12055], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨21,1,5,.second,.reverseMinus,2⟩,⟨2667,21,21,.second,.plus,7⟩,⟨1387,5,2667,.first,.minus,8⟩,⟨12055,2667,1387,.first,.reverseMinus,2⟩]⟩,
  ⟨[1387, 24109], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨173,3,11,.second,.plus,4⟩,⟨1387,3,173,.second,.reverseMinus,3⟩,⟨1581,11,173,.first,.reverseMinus,7⟩,⟨24109,11,1581,.first,.reverseMinus,11⟩]⟩,
  ⟨[1403, 11935], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨509,1,3,.first,.plus,9⟩,⟨11935,385,385,.second,.plus,5⟩,⟨1403,385,509,.second,.reverseMinus,1⟩]⟩,
  ⟨[1403, 23871], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨379,3,385,.first,.minus,1⟩,⟨1403,1,379,.first,.reverseMinus,10⟩,⟨23871,385,379,.second,.plus,6⟩]⟩,
  ⟨[1407, 16369], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨16369,1,1023,.second,.reverseMinus,4⟩,⟨1407,3,1023,.first,.reverseMinus,7⟩]⟩,
  ⟨[1407, 32737], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨32737,1,1023,.second,.reverseMinus,5⟩,⟨1407,3,1023,.first,.reverseMinus,7⟩]⟩,
  ⟨[1413, 8069], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨123,1,5,.first,.plus,7⟩,⟨8069,1,123,.first,.plus,13⟩,⟨1413,3,123,.first,.plus,9⟩]⟩,
  ⟨[1413, 32277], [⟨15,1,1,.second,.plus,4⟩,⟨119,1,15,.second,.plus,3⟩,⟨491,15,119,.second,.reverseMinus,2⟩,⟨32277,1,491,.first,.plus,15⟩,⟨1413,119,491,.first,.plus,4⟩]⟩,
  ⟨[1419, 5907], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨179,3,13,.first,.plus,6⟩,⟨1419,13,179,.second,.plus,3⟩,⟨5907,179,179,.second,.reverseMinus,5⟩]⟩,
  ⟨[1419, 23627], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨11,1,5,.second,.reverseMinus,1⟩,⟨347,5,11,.second,.plus,5⟩,⟨1419,11,11,.second,.reverseMinus,7⟩,⟨23627,347,1419,.first,.reverseMinus,6⟩]⟩,
  ⟨[1427, 15357], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨1027,1,3,.first,.reverseMinus,10⟩,⟨15357,1,1027,.first,.plus,14⟩,⟨1427,25,1027,.first,.reverseMinus,4⟩]⟩,
  ⟨[1427, 30715], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨89,3,7,.first,.plus,5⟩,⟨1427,3,89,.second,.reverseMinus,4⟩,⟨6143,1,3,.second,.plus,11⟩,⟨30715,6143,6143,.second,.reverseMinus,2⟩]⟩,
  ⟨[1431, 16321], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨16321,1,63,.first,.plus,14⟩,⟨159,3,63,.first,.reverseMinus,5⟩,⟨1431,159,159,.second,.reverseMinus,3⟩]⟩,
  ⟨[1431, 32643], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨32643,3,255,.second,.reverseMinus,7⟩,⟨159,3,255,.first,.minus,5⟩,⟨1431,159,159,.second,.reverseMinus,3⟩]⟩,
  ⟨[1433, 15349], [⟨15,1,1,.second,.plus,4⟩,⟨3841,1,15,.second,.reverseMinus,8⟩,⟨975,15,15,.second,.reverseMinus,6⟩,⟨15349,15,3841,.second,.plus,2⟩,⟨1433,3841,975,.output,.minus,1⟩]⟩,
  ⟨[1433, 30697], [⟨15,1,1,.second,.plus,4⟩,⟨23,1,15,.first,.reverseMinus,3⟩,⟨91,1,23,.second,.plus,2⟩,⟨30697,15,23,.first,.plus,11⟩,⟨1433,23,91,.second,.plus,4⟩]⟩,
  ⟨[1437, 5837], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨365,3,23,.second,.plus,4⟩,⟨5837,3,365,.second,.plus,4⟩,⟨1437,23,365,.second,.plus,2⟩]⟩,
  ⟨[1437, 23347], [⟨3,1,1,.second,.plus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨355,1,99,.first,.reverseMinus,8⟩,⟨1437,3,99,.first,.plus,9⟩,⟨23347,355,1437,.second,.reverseMinus,4⟩]⟩,
  ⟨[1439, 3835], [⟨15,1,1,.second,.plus,4⟩,⟨959,1,15,.second,.plus,6⟩,⟨3835,1,959,.second,.plus,2⟩,⟨1439,15,959,.first,.reverseMinus,5⟩]⟩,
  ⟨[1439, 30679], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨959,1,15,.second,.plus,6⟩,⟨30679,9,959,.second,.plus,5⟩,⟨1439,15,959,.first,.reverseMinus,5⟩]⟩,
  ⟨[1457, 5757], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨45,3,3,.second,.plus,4⟩,⟨5757,3,45,.second,.plus,7⟩,⟨1457,17,45,.second,.reverseMinus,5⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank13
