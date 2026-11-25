import Q15Upper
namespace Q15Bank57
open Q15Upper
def entries : List Entry := [
  ⟨[14553, 29359], [⟨63,1,1,.second,.plus,6⟩,⟨253,1,63,.second,.reverseMinus,2⟩,⟨441,63,63,.second,.plus,3⟩,⟨14553,441,441,.second,.reverseMinus,5⟩,⟨29359,253,14553,.second,.reverseMinus,1⟩]⟩,
  ⟨[14555, 15047], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨219,5,7,.second,.plus,5⟩,⟨14555,7,219,.first,.reverseMinus,11⟩,⟨14023,7,219,.second,.reverseMinus,6⟩,⟨15047,1,14023,.first,.reverseMinus,10⟩]⟩,
  ⟨[14589, 14913], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨261,1,257,.first,.reverseMinus,2⟩,⟨1791,1,257,.first,.plus,11⟩,⟨14589,261,1791,.second,.reverseMinus,3⟩,⟨14913,261,1791,.first,.plus,6⟩]⟩,
  ⟨[14599, 29337], [⟨7,1,1,.second,.plus,3⟩,⟨57,1,7,.second,.reverseMinus,3⟩,⟨231,7,7,.second,.reverseMinus,5⟩,⟨14599,7,57,.second,.reverseMinus,8⟩,⟨29337,231,231,.second,.plus,7⟩]⟩,
  ⟨[14601, 14867], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨991,1,33,.first,.plus,10⟩,⟨14865,991,991,.second,.plus,4⟩,⟨14867,1,14865,.first,.reverseMinus,1⟩,⟨14601,33,14865,.first,.minus,3⟩]⟩,
  ⟨[14623, 14777], [⟨7,1,1,.second,.plus,3⟩,⟨511,1,1,.second,.plus,9⟩,⟨441,7,7,.second,.plus,6⟩,⟨14777,7,441,.first,.reverseMinus,11⟩,⟨14623,511,441,.second,.reverseMinus,5⟩]⟩,
  ⟨[14635, 14733], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨115,1,13,.first,.plus,7⟩,⟨14733,13,115,.second,.reverseMinus,7⟩,⟨14637,3,14733,.first,.minus,5⟩,⟨14635,1,14637,.first,.minus,1⟩]⟩,
  ⟨[14643, 14657], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨321,1,5,.second,.reverseMinus,6⟩,⟨14657,7,321,.first,.reverseMinus,11⟩,⟨14643,7,14657,.first,.minus,1⟩]⟩,
  ⟨[14643, 29315], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨381,3,3,.second,.plus,7⟩,⟨29315,29,381,.first,.plus,10⟩,⟨14643,29,29315,.output,.reverseMinus,1⟩]⟩,
  ⟨[14687, 29291], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨85,17,17,.second,.reverseMinus,2⟩,⟨459,17,85,.first,.plus,5⟩,⟨14687,1,459,.second,.plus,5⟩,⟨29291,85,459,.second,.plus,6⟩]⟩,
  ⟨[14733, 29269], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨3683,29,29,.second,.plus,7⟩,⟨14733,1,3683,.second,.reverseMinus,2⟩,⟨3659,3,3683,.first,.minus,3⟩,⟨29269,3,3659,.second,.plus,3⟩]⟩,
  ⟨[14777, 29247], [⟨7,1,1,.second,.plus,3⟩,⟨1023,1,1,.second,.plus,10⟩,⟨441,7,7,.second,.plus,6⟩,⟨14777,7,441,.first,.reverseMinus,11⟩,⟨29247,1023,441,.second,.reverseMinus,6⟩]⟩,
  ⟨[14823, 29223], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨153,9,9,.second,.reverseMinus,4⟩,⟨19431,153,153,.second,.plus,7⟩,⟨14823,9,19431,.first,.minus,9⟩,⟨29223,153,19431,.first,.reverseMinus,6⟩]⟩,
  ⟨[14867, 29201], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨9709,19,19,.second,.plus,9⟩,⟨14867,3,9709,.first,.plus,13⟩,⟨29203,19,9709,.first,.plus,11⟩,⟨29201,1,29203,.first,.minus,1⟩]⟩,
  ⟨[14913, 29179], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨14913,29,65,.first,.reverseMinus,9⟩,⟨3647,29,65,.first,.plus,7⟩,⟨29179,3,3647,.second,.reverseMinus,3⟩]⟩,
  ⟨[14957, 29155], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨4165,1,69,.first,.reverseMinus,12⟩,⟨29155,4165,4165,.second,.plus,3⟩,⟨4717,69,4165,.first,.reverseMinus,3⟩,⟨14957,5,4717,.first,.reverseMinus,11⟩]⟩,
  ⟨[15001, 29133], [⟨7,1,1,.second,.plus,3⟩,⟨231,7,7,.second,.reverseMinus,5⟩,⟨14567,7,231,.first,.reverseMinus,11⟩,⟨29133,1,14567,.second,.plus,1⟩,⟨15001,231,14567,.first,.plus,7⟩]⟩,
  ⟨[15047, 29109], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨57,1,59,.first,.minus,1⟩,⟨15047,59,57,.first,.plus,8⟩,⟨29125,59,57,.second,.plus,9⟩,⟨29109,1,29125,.first,.minus,4⟩]⟩,
  ⟨[15091, 29087], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨59,7,13,.second,.reverseMinus,2⟩,⟨15091,13,59,.second,.plus,8⟩,⟨909,7,13,.first,.reverseMinus,7⟩,⟨29087,1,909,.second,.plus,5⟩]⟩,
  ⟨[15135, 29063], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨473,1,39,.first,.plus,9⟩,⟨15135,1,473,.second,.plus,5⟩,⟨907,39,473,.second,.plus,1⟩,⟨29063,39,907,.second,.reverseMinus,5⟩]⟩,
  ⟨[15181, 29039], [⟨7,1,1,.second,.plus,3⟩,⟨55,1,7,.second,.plus,3⟩,⟨879,1,55,.second,.plus,4⟩,⟨29039,55,879,.first,.reverseMinus,9⟩,⟨893,7,879,.first,.reverseMinus,1⟩,⟨15181,893,893,.second,.reverseMinus,4⟩]⟩,
  ⟨[15225, 29017], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨3045,3,27,.first,.plus,10⟩,⟨15225,3045,3045,.second,.reverseMinus,2⟩,⟨29049,27,15225,.first,.reverseMinus,9⟩,⟨29017,1,29049,.first,.minus,5⟩]⟩,
  ⟨[15269, 28993], [⟨3,1,1,.second,.plus,2⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨225,1,193,.first,.reverseMinus,5⟩,⟨28993,193,225,.second,.reverseMinus,7⟩,⟨30537,193,28993,.first,.reverseMinus,3⟩,⟨15269,1,30537,.output,.plus,1⟩]⟩,
  ⟨[15313, 28969], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨957,29,29,.second,.reverseMinus,5⟩,⟨15313,1,957,.second,.reverseMinus,4⟩,⟨3799,29,957,.second,.plus,2⟩,⟨28969,1,3799,.first,.plus,15⟩]⟩,
  ⟨[15357, 28947], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨15357,3,15,.second,.plus,10⟩,⟨3821,15,19,.first,.plus,8⟩,⟨28947,1,3821,.first,.plus,15⟩]⟩,
  ⟨[15403, 28923], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨1925,385,385,.second,.reverseMinus,2⟩,⟨15403,3,1925,.second,.reverseMinus,3⟩,⟨28875,1925,1925,.second,.plus,4⟩,⟨28923,3,28875,.first,.reverseMinus,4⟩]⟩,
  ⟨[15447, 28899], [⟨15,1,1,.second,.plus,4⟩,⟨29,1,15,.second,.plus,1⟩,⟨3869,15,29,.first,.reverseMinus,8⟩,⟨28899,1,3869,.first,.plus,15⟩,⟨15447,29,3869,.second,.plus,2⟩]⟩,
  ⟨[15491, 28875], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨3203,3,25,.second,.reverseMinus,7⟩,⟨15491,3,3203,.first,.reverseMinus,12⟩,⟨28827,3203,3203,.second,.reverseMinus,3⟩,⟨28875,3,28827,.first,.reverseMinus,4⟩]⟩,
  ⟨[15535, 28851], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨16575,65,65,.second,.plus,8⟩,⟨15535,65,16575,.first,.minus,4⟩,⟨16563,3,16575,.first,.minus,2⟩,⟨28851,3,16563,.first,.reverseMinus,12⟩]⟩,
  ⟨[15579, 28827], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨37,3,61,.first,.minus,3⟩,⟨15579,61,37,.first,.plus,8⟩,⟨3941,61,37,.first,.reverseMinus,6⟩,⟨28827,1,3941,.first,.plus,15⟩]⟩,
  ⟨[15623, 28803], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨61,1,3,.first,.plus,6⟩,⟨15623,7,61,.second,.reverseMinus,8⟩,⟨3965,61,61,.second,.reverseMinus,6⟩,⟨28803,1,3965,.first,.plus,15⟩]⟩,
  ⟨[15667, 28779], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨717,3,45,.second,.plus,4⟩,⟨15667,1,717,.first,.plus,14⟩,⟨3597,45,717,.first,.reverseMinus,6⟩,⟨28779,3,3597,.second,.reverseMinus,3⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank57
