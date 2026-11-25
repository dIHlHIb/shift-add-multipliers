import Q15Upper
namespace Q15Bank41
open Q15Upper
def entries : List Entry := [
  ⟨[7523, 7973], [⟨7,1,1,.second,.plus,3⟩,⟨223,1,7,.second,.plus,5⟩,⟨7969,1,223,.first,.plus,13⟩,⟨7973,1,7969,.first,.reverseMinus,2⟩,⟨7523,223,7969,.first,.minus,1⟩]⟩,
  ⟨[7523, 14555], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨235,1,21,.first,.plus,8⟩,⟨7523,3,235,.second,.reverseMinus,5⟩,⟨14811,235,7523,.second,.plus,1⟩,⟨14555,1,14811,.first,.minus,8⟩]⟩,
  ⟨[7523, 29109], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨235,1,21,.first,.plus,8⟩,⟨7523,3,235,.second,.reverseMinus,5⟩,⟨939,1,235,.second,.plus,2⟩,⟨29109,939,939,.second,.plus,5⟩]⟩,
  ⟨[7523, 31893], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨235,1,21,.first,.plus,8⟩,⟨7523,3,235,.second,.reverseMinus,5⟩,⟨29845,235,235,.second,.plus,7⟩,⟨31893,1,29845,.first,.reverseMinus,11⟩]⟩,
  ⟨[7539, 12817], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨2577,5,17,.first,.reverseMinus,9⟩,⟨12817,5,2577,.first,.reverseMinus,11⟩,⟨2513,1,2577,.first,.minus,6⟩,⟨7539,2513,2513,.second,.plus,2⟩]⟩,
  ⟨[7545, 14543], [⟨15,1,1,.second,.plus,4⟩,⟨121,1,15,.second,.reverseMinus,3⟩,⟨945,15,15,.second,.plus,6⟩,⟨7545,15,945,.second,.plus,3⟩,⟨14543,121,945,.first,.plus,7⟩]⟩,
  ⟨[7545, 29087], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨59,7,13,.second,.reverseMinus,2⟩,⟨7545,7,59,.second,.plus,7⟩,⟨909,7,13,.first,.reverseMinus,7⟩,⟨29087,1,909,.second,.plus,5⟩]⟩,
  ⟨[7549, 12725], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨643,3,5,.second,.reverseMinus,7⟩,⟨7549,1,643,.first,.plus,13⟩,⟨12693,643,7549,.first,.reverseMinus,3⟩,⟨12725,1,12693,.first,.reverseMinus,5⟩]⟩,
  ⟨[7559, 12633], [⟨7,1,1,.second,.plus,3⟩,⟨121,1,7,.first,.plus,7⟩,⟨391,1,121,.first,.plus,9⟩,⟨7559,7,391,.first,.reverseMinus,10⟩,⟨12633,121,391,.second,.reverseMinus,5⟩]⟩,
  ⟨[7571, 15941], [⟨3,1,1,.second,.plus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨8643,67,67,.second,.reverseMinus,7⟩,⟨7571,67,8643,.first,.minus,4⟩,⟨15933,3,8643,.first,.plus,13⟩,⟨15941,1,15933,.first,.reverseMinus,3⟩]⟩,
  ⟨[7571, 31881], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨119,3,125,.first,.minus,1⟩,⟨31881,125,119,.first,.plus,8⟩,⟨473,3,119,.second,.plus,2⟩,⟨7571,3,473,.second,.reverseMinus,4⟩]⟩,
  ⟨[7573, 12493], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨205,3,13,.second,.plus,4⟩,⟨12493,3,205,.first,.reverseMinus,12⟩,⟨5933,205,12493,.first,.minus,5⟩,⟨7573,205,5933,.first,.reverseMinus,3⟩]⟩,
  ⟨[7583, 12401], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨12401,15,97,.second,.plus,7⟩,⟨7583,15,97,.first,.plus,9⟩]⟩,
  ⟨[7597, 12261], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨577,1,9,.second,.reverseMinus,6⟩,⟨4087,1,9,.first,.plus,12⟩,⟨7597,577,4087,.second,.plus,1⟩,⟨12261,4087,4087,.second,.plus,2⟩]⟩,
  ⟨[7611, 12121], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨59,3,7,.second,.reverseMinus,3⟩,⟨7611,59,59,.second,.reverseMinus,7⟩,⟨391,3,7,.first,.reverseMinus,7⟩,⟨12121,391,391,.second,.plus,5⟩]⟩,
  ⟨[7621, 15935], [⟨7,1,1,.second,.plus,3⟩,⟨449,1,7,.second,.reverseMinus,6⟩,⟨1793,1,7,.second,.reverseMinus,8⟩,⟨15935,1,449,.first,.plus,14⟩,⟨7621,449,1793,.second,.reverseMinus,2⟩]⟩,
  ⟨[7621, 31869], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨899,3,7,.second,.reverseMinus,7⟩,⟨31869,1,899,.first,.plus,15⟩,⟨453,7,899,.output,.plus,1⟩,⟨7621,7,453,.first,.reverseMinus,10⟩]⟩,
  ⟨[7625, 11981], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨1089,1,17,.second,.reverseMinus,6⟩,⟨1087,1,17,.second,.plus,6⟩,⟨7625,1089,1087,.first,.plus,3⟩,⟨11981,1089,7625,.first,.reverseMinus,2⟩]⟩,
  ⟨[7635, 14497], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨509,1,3,.first,.plus,9⟩,⟨7635,509,509,.second,.plus,4⟩,⟨15265,5,7635,.second,.plus,1⟩,⟨14497,3,15265,.first,.minus,8⟩]⟩,
  ⟨[7635, 28993], [⟨513,1,1,.second,.reverseMinus,9⟩,⟨509,1,513,.first,.minus,2⟩,⟨3583,1,513,.first,.plus,12⟩,⟨7635,509,509,.second,.plus,4⟩,⟨28993,509,3583,.first,.plus,6⟩]⟩,
  ⟨[7643, 11793], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨239,3,47,.first,.reverseMinus,6⟩,⟨11793,47,239,.first,.plus,8⟩,⟨1911,1,239,.second,.plus,3⟩,⟨7643,1,1911,.second,.plus,2⟩]⟩,
  ⟨[7657, 14485], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨957,3,15,.second,.plus,6⟩,⟨7657,1,957,.second,.reverseMinus,3⟩,⟨1899,15,957,.second,.plus,1⟩,⟨14485,1,1899,.first,.plus,14⟩]⟩,
  ⟨[7657, 28969], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨247,1,9,.first,.plus,8⟩,⟨7895,9,247,.second,.plus,5⟩,⟨7657,247,247,.second,.plus,5⟩,⟨28969,9,7895,.first,.plus,12⟩]⟩,
  ⟨[7661, 11605], [⟨7,1,1,.second,.plus,3⟩,⟨29,1,7,.second,.reverseMinus,2⟩,⟨493,29,29,.second,.reverseMinus,4⟩,⟨7661,7,493,.first,.reverseMinus,10⟩,⟨11605,493,7661,.first,.reverseMinus,3⟩]⟩,
  ⟨[7669, 15929], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨249,1,7,.first,.plus,8⟩,⟨15929,7,249,.second,.plus,6⟩,⟨3833,7,249,.first,.reverseMinus,9⟩,⟨7669,3,3833,.second,.reverseMinus,1⟩]⟩,
  ⟨[7669, 31857], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨959,1,15,.second,.plus,6⟩,⟨7669,3,959,.second,.plus,3⟩,⟨911,3,959,.first,.minus,4⟩,⟨31857,1,911,.first,.plus,15⟩]⟩,
  ⟨[7679, 14473], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨7679,1,15,.second,.plus,9⟩,⟨113,1,15,.first,.plus,7⟩,⟨14473,9,113,.second,.reverseMinus,7⟩]⟩,
  ⟨[7679, 28947], [⟨15,1,1,.second,.plus,4⟩,⟨8193,1,1,.second,.reverseMinus,13⟩,⟨7679,1,15,.second,.plus,9⟩,⟨3825,15,15,.second,.plus,8⟩,⟨28947,8193,3825,.first,.plus,2⟩]⟩,
  ⟨[7683, 11369], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨7683,3,15,.second,.reverseMinus,9⟩,⟨105,15,15,.second,.plus,3⟩,⟨11369,11,105,.first,.reverseMinus,10⟩]⟩,
  ⟨[7701, 14461], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨14461,3,113,.second,.plus,7⟩,⟨453,1,113,.second,.reverseMinus,2⟩,⟨7701,453,453,.second,.reverseMinus,4⟩]⟩,
  ⟨[7701, 28923], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨963,3,15,.second,.reverseMinus,6⟩,⟨7701,3,963,.second,.plus,3⟩,⟨933,15,963,.first,.minus,1⟩,⟨28923,933,933,.second,.plus,5⟩]⟩,
  ⟨[7709, 11087], [⟨15,1,1,.second,.plus,4⟩,⟨113,1,15,.first,.plus,7⟩,⟨3855,15,15,.second,.reverseMinus,8⟩,⟨7709,1,3855,.second,.plus,1⟩,⟨11087,113,3855,.first,.reverseMinus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank41
