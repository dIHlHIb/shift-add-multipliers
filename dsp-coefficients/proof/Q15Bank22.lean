import Q15Upper
namespace Q15Bank22
open Q15Upper
def entries : List Entry := [
  ⟨[2727, 32311], [⟨3,1,1,.second,.plus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨393,3,195,.second,.reverseMinus,1⟩,⟨2727,195,393,.first,.plus,4⟩,⟨457,1,393,.first,.reverseMinus,6⟩,⟨32311,1,457,.first,.plus,15⟩]⟩,
  ⟨[2761, 8163], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨2721,5,161,.first,.reverseMinus,9⟩,⟨2761,5,2721,.first,.reverseMinus,3⟩,⟨8163,2721,2721,.second,.plus,2⟩]⟩,
  ⟨[2761, 32651], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨55,11,11,.second,.reverseMinus,2⟩,⟨2761,11,55,.first,.plus,8⟩,⟨117,1,11,.first,.plus,7⟩,⟨32651,1,117,.first,.plus,15⟩]⟩,
  ⟨[2797, 5985], [⟨3,1,1,.second,.plus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨187,1,195,.first,.minus,3⟩,⟨5985,1,187,.second,.reverseMinus,5⟩,⟨2797,195,187,.second,.plus,4⟩]⟩,
  ⟨[2797, 23939], [⟨3,1,1,.second,.plus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨187,1,195,.first,.minus,3⟩,⟨23939,3,187,.second,.reverseMinus,7⟩,⟨2797,195,187,.second,.plus,4⟩]⟩,
  ⟨[2801, 16143], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨241,1,15,.second,.reverseMinus,4⟩,⟨16143,1,241,.first,.plus,14⟩,⟨2801,5,241,.first,.reverseMinus,9⟩]⟩,
  ⟨[2801, 32285], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨2801,11,15,.first,.plus,8⟩,⟨483,3,15,.second,.reverseMinus,5⟩,⟨32285,1,483,.first,.plus,15⟩]⟩,
  ⟨[2807, 30785], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨87,1,23,.first,.reverseMinus,6⟩,⟨2807,23,87,.second,.reverseMinus,5⟩,⟨19649,2807,2807,.second,.plus,3⟩,⟨30785,87,19649,.first,.reverseMinus,7⟩]⟩,
  ⟨[2811, 4081], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨4091,1,5,.first,.plus,12⟩,⟨4081,5,4091,.first,.minus,1⟩,⟨2811,5,4091,.first,.minus,8⟩]⟩,
  ⟨[2811, 32647], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨81,1,5,.second,.reverseMinus,4⟩,⟨4091,1,5,.first,.plus,12⟩,⟨2811,5,4091,.first,.minus,8⟩,⟨32647,81,4091,.second,.plus,3⟩]⟩,
  ⟨[2819, 15383], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨2051,1,3,.first,.reverseMinus,11⟩,⟨2819,3,2051,.first,.reverseMinus,8⟩,⟨15383,1025,2051,.second,.plus,3⟩]⟩,
  ⟨[2819, 30767], [⟨3,1,1,.second,.plus,2⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨2051,1,3,.first,.reverseMinus,11⟩,⟨2819,3,2051,.first,.reverseMinus,8⟩,⟨30767,2049,2051,.second,.plus,4⟩]⟩,
  ⟨[2829, 11849], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨697,41,41,.second,.reverseMinus,4⟩,⟨2829,41,697,.second,.reverseMinus,2⟩,⟨11849,697,697,.second,.reverseMinus,4⟩]⟩,
  ⟨[2829, 23697], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨355,3,11,.second,.reverseMinus,5⟩,⟨2829,11,355,.second,.plus,3⟩,⟨6013,355,2829,.second,.reverseMinus,1⟩,⟨23697,355,6013,.second,.plus,2⟩]⟩,
  ⟨[2847, 11779], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨11779,3,23,.second,.reverseMinus,9⟩,⟨2847,23,97,.first,.plus,7⟩]⟩,
  ⟨[2847, 23559], [⟨7,1,1,.second,.plus,3⟩,⟨3583,1,7,.second,.plus,9⟩,⟨23,1,7,.first,.reverseMinus,4⟩,⟨23559,7,23,.second,.reverseMinus,10⟩,⟨2847,3583,23,.second,.minus,5⟩]⟩,
  ⟨[2851, 8067], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨93,1,125,.first,.minus,5⟩,⟨8067,1,125,.first,.plus,13⟩,⟨2851,125,93,.second,.plus,5⟩]⟩,
  ⟨[2851, 32269], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨2827,11,11,.second,.reverseMinus,8⟩,⟨2851,3,2827,.first,.reverseMinus,3⟩,⟨19981,2827,2851,.second,.plus,3⟩,⟨32269,3,19981,.first,.reverseMinus,12⟩]⟩,
  ⟨[2861, 16321], [⟨63,1,1,.second,.plus,6⟩,⟨191,1,63,.first,.reverseMinus,7⟩,⟨16321,1,63,.first,.plus,14⟩,⟨763,1,191,.second,.plus,2⟩,⟨2861,191,763,.second,.plus,2⟩]⟩,
  ⟨[2861, 32643], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨45,1,11,.second,.reverseMinus,2⟩,⟨2861,11,45,.first,.reverseMinus,8⟩,⟨125,1,3,.first,.plus,7⟩,⟨32643,1,125,.first,.plus,15⟩]⟩,
  ⟨[2865, 11709], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨2865,191,191,.second,.plus,4⟩,⟨11709,191,515,.first,.plus,6⟩]⟩,
  ⟨[2865, 23417], [⟨15,1,1,.second,.plus,4⟩,⟨23,1,15,.first,.reverseMinus,3⟩,⟨2929,15,23,.second,.plus,7⟩,⟨2865,1,2929,.first,.minus,6⟩,⟨23417,15,2929,.second,.plus,3⟩]⟩,
  ⟨[2875, 8065], [⟨63,1,1,.second,.plus,6⟩,⟨8065,1,63,.second,.reverseMinus,7⟩,⟨575,1,63,.first,.reverseMinus,9⟩,⟨2875,575,575,.second,.reverseMinus,2⟩]⟩,
  ⟨[2875, 32259], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨575,1,63,.first,.reverseMinus,9⟩,⟨32259,3,63,.second,.reverseMinus,9⟩,⟨2875,575,575,.second,.reverseMinus,2⟩]⟩,
  ⟨[2883, 5819], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨53,1,45,.first,.reverseMinus,3⟩,⟨2883,3,45,.second,.reverseMinus,6⟩,⟨5819,53,2883,.second,.reverseMinus,1⟩]⟩,
  ⟨[2883, 23277], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨363,3,45,.second,.reverseMinus,3⟩,⟨2883,3,45,.second,.reverseMinus,6⟩,⟨23277,45,363,.second,.reverseMinus,6⟩]⟩,
  ⟨[2911, 16319], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨93,3,3,.second,.plus,5⟩,⟨16319,1,65,.first,.plus,14⟩,⟨2911,65,93,.second,.plus,5⟩]⟩,
  ⟨[2911, 32639], [⟨3,1,1,.second,.plus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨95,1,3,.second,.plus,5⟩,⟨32639,1,129,.first,.plus,15⟩,⟨2911,129,95,.second,.plus,5⟩]⟩,
  ⟨[2913, 15313], [⟨15,1,1,.second,.plus,4⟩,⟨47,1,15,.first,.reverseMinus,5⟩,⟨95,1,47,.second,.reverseMinus,1⟩,⟨15313,15,47,.first,.plus,10⟩,⟨2913,47,95,.first,.plus,6⟩]⟩,
  ⟨[2913, 30627], [⟨15,1,1,.second,.plus,4⟩,⟨63,1,1,.second,.plus,6⟩,⟨93,15,63,.first,.reverseMinus,1⟩,⟨30627,15,93,.first,.plus,11⟩,⟨2913,63,93,.second,.plus,5⟩]⟩,
  ⟨[2925, 16121], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨325,5,5,.second,.reverseMinus,6⟩,⟨4421,1,325,.first,.reverseMinus,12⟩,⟨2925,325,325,.second,.reverseMinus,3⟩,⟨16121,4421,2925,.second,.reverseMinus,2⟩]⟩,
  ⟨[2925, 30609], [⟨127,1,1,.second,.plus,7⟩,⟨383,1,127,.first,.reverseMinus,8⟩,⟨2159,127,127,.second,.reverseMinus,4⟩,⟨30609,1,2159,.first,.plus,15⟩,⟨2925,383,2159,.first,.reverseMinus,1⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank22
