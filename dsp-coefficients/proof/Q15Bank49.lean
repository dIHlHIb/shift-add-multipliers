import Q15Upper
namespace Q15Bank49
open Q15Upper
def entries : List Entry := [
  ⟨[10815, 24615], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨769,1,3,.second,.reverseMinus,8⟩,⟨24615,7,769,.second,.reverseMinus,5⟩,⟨1545,7,769,.second,.reverseMinus,1⟩,⟨10815,1545,1545,.second,.plus,3⟩]⟩,
  ⟨[10849, 30919], [⟨3,1,1,.second,.plus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨1407,1,383,.first,.reverseMinus,10⟩,⟨10849,383,1407,.first,.plus,5⟩,⟨5221,1407,10849,.first,.minus,2⟩,⟨30919,10849,5221,.second,.plus,3⟩]⟩,
  ⟨[10853, 24547], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨767,1,3,.second,.plus,8⟩,⟨24547,3,767,.second,.reverseMinus,5⟩,⟨679,11,767,.first,.minus,3⟩,⟨10853,11,679,.second,.plus,4⟩]⟩,
  ⟨[10891, 24481], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨85,3,11,.second,.plus,3⟩,⟨10891,11,85,.second,.reverseMinus,7⟩,⟨765,3,3,.second,.plus,8⟩,⟨24481,1,765,.second,.reverseMinus,5⟩]⟩,
  ⟨[10897, 15451], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨641,1,5,.second,.reverseMinus,7⟩,⟨10897,641,641,.second,.reverseMinus,4⟩,⟨20571,59,641,.second,.reverseMinus,5⟩,⟨15451,5,20571,.first,.minus,10⟩]⟩,
  ⟨[10897, 30903], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨45,5,5,.second,.reverseMinus,3⟩,⟨641,1,5,.second,.reverseMinus,7⟩,⟨10897,641,641,.second,.reverseMinus,4⟩,⟨10301,45,641,.second,.reverseMinus,4⟩,⟨30903,10301,10301,.second,.plus,2⟩]⟩,
  ⟨[10909, 24447], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨24447,3,129,.first,.plus,13⟩,⟨341,11,11,.second,.plus,5⟩,⟨10909,3,341,.second,.plus,5⟩]⟩,
  ⟨[10945, 15443], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨10945,21,193,.first,.reverseMinus,9⟩,⟨965,193,193,.second,.reverseMinus,2⟩,⟨15443,3,965,.second,.reverseMinus,4⟩]⟩,
  ⟨[10945, 30887], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨12289,1,3,.second,.reverseMinus,12⟩,⟨10945,21,12289,.first,.minus,6⟩,⟨12121,21,12289,.first,.minus,3⟩,⟨30887,21,12121,.first,.plus,11⟩]⟩,
  ⟨[10947, 24381], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨24381,3,195,.first,.plus,13⟩,⟨10947,21,195,.first,.reverseMinus,9⟩]⟩,
  ⟨[10991, 15435], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨1029,1,5,.first,.reverseMinus,10⟩,⟨15435,1029,1029,.second,.plus,4⟩,⟨11319,1029,15435,.first,.minus,2⟩,⟨10991,41,11319,.first,.minus,3⟩]⟩,
  ⟨[10991, 30869], [⟨15,1,1,.second,.plus,4⟩,⟨29,1,15,.second,.plus,1⟩,⟨3855,15,15,.second,.reverseMinus,8⟩,⟨30869,29,3855,.second,.reverseMinus,3⟩,⟨10993,29,3855,.first,.plus,9⟩,⟨10991,1,10993,.first,.minus,1⟩]⟩,
  ⟨[11003, 24279], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨16123,5,63,.second,.plus,8⟩,⟨11003,5,16123,.first,.minus,10⟩,⟨8093,63,16123,.output,.plus,1⟩,⟨24279,8093,8093,.second,.plus,2⟩]⟩,
  ⟨[11021, 12123], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨13851,27,27,.second,.reverseMinus,9⟩,⟨12123,27,13851,.first,.minus,6⟩,⟨6925,1,13851,.output,.reverseMinus,1⟩,⟨11021,1,6925,.first,.reverseMinus,12⟩]⟩,
  ⟨[11021, 24245], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨43,7,13,.first,.plus,3⟩,⟨11021,13,43,.second,.reverseMinus,8⟩,⟨373,13,43,.first,.plus,5⟩,⟨24245,373,373,.second,.reverseMinus,6⟩]⟩,
  ⟨[11039, 30853], [⟨15,1,1,.second,.plus,4⟩,⟨15359,1,15,.second,.plus,10⟩,⟨135,15,15,.second,.reverseMinus,3⟩,⟨11039,15359,135,.second,.minus,5⟩,⟨30853,15359,135,.first,.reverseMinus,1⟩]⟩,
  ⟨[11059, 12089], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨189,3,3,.second,.plus,6⟩,⟨12089,7,189,.second,.plus,6⟩,⟨12083,3,12089,.first,.minus,1⟩,⟨11059,1,12083,.first,.minus,10⟩]⟩,
  ⟨[11059, 24177], [⟨3,1,1,.second,.plus,2⟩,⟨383,1,3,.second,.plus,7⟩,⟨335,3,383,.first,.minus,4⟩,⟨24177,383,335,.first,.plus,6⟩,⟨11055,335,335,.second,.reverseMinus,5⟩,⟨11059,1,11055,.first,.reverseMinus,2⟩]⟩,
  ⟨[11077, 24145], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨187,11,11,.second,.reverseMinus,4⟩,⟨11077,11,187,.first,.plus,10⟩,⟨24123,187,187,.second,.reverseMinus,7⟩,⟨24145,11,24123,.first,.reverseMinus,1⟩]⟩,
  ⟨[11087, 30835], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨3855,15,15,.second,.reverseMinus,8⟩,⟨30835,5,3855,.second,.plus,3⟩,⟨2895,15,3855,.first,.minus,6⟩,⟨11087,1,2895,.first,.reverseMinus,13⟩]⟩,
  ⟨[11133, 12021], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨87,3,9,.first,.plus,5⟩,⟨11133,3,87,.second,.plus,7⟩,⟨11829,87,11133,.first,.reverseMinus,3⟩,⟨12021,3,11829,.first,.reverseMinus,6⟩]⟩,
  ⟨[11133, 15409], [⟨1023,1,1,.second,.plus,10⟩,⟨959,1,1023,.first,.minus,6⟩,⟨9215,1,1023,.first,.reverseMinus,13⟩,⟨15409,1023,959,.first,.plus,4⟩,⟨11133,959,9215,.first,.reverseMinus,1⟩]⟩,
  ⟨[11133, 24041], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨131,1,3,.first,.reverseMinus,7⟩,⟨11133,11,131,.first,.plus,10⟩,⟨535,11,131,.second,.reverseMinus,2⟩,⟨24041,3,535,.first,.plus,13⟩]⟩,
  ⟨[11133, 30819], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨1155,3,9,.second,.reverseMinus,7⟩,⟨11133,3,1155,.first,.plus,12⟩,⟨963,3,1155,.first,.minus,6⟩,⟨30819,3,963,.second,.reverseMinus,5⟩]⟩,
  ⟨[11151, 24007], [⟨7,1,1,.second,.plus,3⟩,⟨25,1,7,.first,.plus,5⟩,⟨1593,7,25,.second,.plus,6⟩,⟨24007,25,1593,.first,.plus,10⟩,⟨11151,1593,1593,.second,.plus,3⟩]⟩,
  ⟨[11169, 11987], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨95,1,3,.second,.plus,5⟩,⟨11169,11,95,.first,.plus,10⟩,⟨749,11,95,.second,.plus,3⟩,⟨11987,3,749,.second,.reverseMinus,4⟩]⟩,
  ⟨[11169, 23973], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨349,3,35,.first,.plus,7⟩,⟨11169,1,349,.second,.reverseMinus,5⟩,⟨11867,349,11169,.first,.reverseMinus,1⟩,⟨23973,35,11867,.first,.plus,10⟩]⟩,
  ⟨[11181, 15401], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨1925,385,385,.second,.reverseMinus,2⟩,⟨15401,1,1925,.second,.reverseMinus,3⟩,⟨17325,1925,1925,.second,.reverseMinus,3⟩,⟨11181,3,17325,.first,.minus,11⟩]⟩,
  ⟨[11181, 30801], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨1925,385,385,.second,.reverseMinus,2⟩,⟨30801,1,1925,.second,.reverseMinus,4⟩,⟨17325,1925,1925,.second,.reverseMinus,3⟩,⟨11181,3,17325,.first,.minus,11⟩]⟩,
  ⟨[11229, 30785], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨481,3,97,.first,.reverseMinus,7⟩,⟨30785,1,481,.second,.reverseMinus,6⟩,⟨1059,97,481,.second,.reverseMinus,1⟩,⟨11229,3,1059,.first,.plus,12⟩]⟩,
  ⟨[11243, 23835], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨741,3,27,.first,.plus,8⟩,⟨23835,3,741,.first,.plus,13⟩,⟨11115,741,741,.second,.plus,4⟩,⟨11243,1,11115,.first,.reverseMinus,7⟩]⟩,
  ⟨[11261, 11901], [⟨3,1,1,.second,.plus,2⟩,⟨12285,3,3,.second,.plus,12⟩,⟨11261,1,12285,.first,.minus,10⟩,⟨11901,3,12285,.first,.minus,7⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank49
