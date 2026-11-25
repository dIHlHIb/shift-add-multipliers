import Q15Upper
namespace Q15Bank00
open Q15Upper
def entries : List Entry := [
  ⟨[], []⟩,
  ⟨[5, 8167], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨25,5,5,.second,.reverseMinus,2⟩,⟨8167,1,25,.first,.plus,13⟩]⟩,
  ⟨[5, 32667], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨1021,1,3,.first,.plus,10⟩,⟨32667,5,1021,.second,.plus,5⟩]⟩,
  ⟨[11, 4095], [⟨4095,1,1,.second,.plus,12⟩,⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩]⟩,
  ⟨[11, 16369], [⟨15,1,1,.second,.plus,4⟩,⟨11,1,15,.first,.minus,2⟩,⟨16369,1,15,.first,.plus,14⟩]⟩,
  ⟨[11, 16383], [⟨16383,1,1,.second,.plus,14⟩,⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩]⟩,
  ⟨[11, 32737], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨11,1,3,.second,.plus,2⟩,⟨32737,1,31,.first,.plus,15⟩]⟩,
  ⟨[11, 32761], [⟨7,1,1,.second,.plus,3⟩,⟨11,1,7,.first,.reverseMinus,2⟩,⟨32761,1,7,.first,.plus,15⟩]⟩,
  ⟨[11, 32767], [⟨32767,1,1,.second,.plus,15⟩,⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩]⟩,
  ⟨[25], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩]⟩,
  ⟨[25, 32767], [⟨32767,1,1,.second,.plus,15⟩,⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩]⟩,
  ⟨[29, 7979], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨29,1,3,.first,.plus,5⟩,⟨1987,3,31,.second,.reverseMinus,6⟩,⟨7979,31,1987,.second,.reverseMinus,2⟩]⟩,
  ⟨[29, 16279], [⟨7,1,1,.second,.plus,3⟩,⟨29,1,7,.second,.reverseMinus,2⟩,⟨1017,1,7,.first,.plus,10⟩,⟨16279,7,1017,.second,.reverseMinus,4⟩]⟩,
  ⟨[29, 31915], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨29,1,3,.first,.plus,5⟩,⟨491,65,29,.first,.plus,3⟩,⟨31915,491,491,.second,.reverseMinus,6⟩]⟩,
  ⟨[29, 32557], [⟨15,1,1,.second,.plus,4⟩,⟨29,1,15,.second,.plus,1⟩,⟨2033,1,15,.first,.plus,11⟩,⟨32557,29,2033,.second,.reverseMinus,4⟩]⟩,
  ⟨[33, 7915], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨533,5,33,.second,.reverseMinus,4⟩,⟨7915,33,533,.first,.plus,8⟩]⟩,
  ⟨[33, 16375], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨16375,1,9,.first,.plus,14⟩]⟩,
  ⟨[33, 31661], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨2111,1,33,.second,.plus,6⟩,⟨8443,1,2111,.second,.plus,2⟩,⟨31661,2111,8443,.second,.plus,2⟩]⟩,
  ⟨[33, 32751], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨32751,1,17,.first,.plus,15⟩]⟩,
  ⟨[43, 16151], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨43,3,31,.first,.reverseMinus,2⟩,⟨279,31,31,.second,.reverseMinus,3⟩,⟨16151,31,279,.first,.reverseMinus,9⟩]⟩,
  ⟨[43, 32303], [⟨63,1,1,.second,.plus,6⟩,⟨47,1,63,.first,.minus,4⟩,⟨43,1,47,.first,.minus,2⟩,⟨32303,63,47,.first,.reverseMinus,9⟩]⟩,
  ⟨[51], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩]⟩,
  ⟨[51, 32767], [⟨32767,1,1,.second,.plus,15⟩,⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩]⟩,
  ⟨[63], [⟨63,1,1,.second,.plus,6⟩]⟩,
  ⟨[63, 32767], [⟨63,1,1,.second,.plus,6⟩,⟨32767,1,1,.second,.plus,15⟩]⟩,
  ⟨[65, 16251], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨16381,1,3,.first,.plus,14⟩,⟨16251,65,16381,.first,.minus,1⟩]⟩,
  ⟨[65, 32503], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨32763,1,5,.first,.plus,15⟩,⟨32503,65,32763,.first,.minus,2⟩]⟩,
  ⟨[69, 8191], [⟨8191,1,1,.second,.plus,13⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩]⟩,
  ⟨[69, 32763], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨69,1,5,.first,.reverseMinus,6⟩,⟨32763,1,5,.first,.plus,15⟩]⟩,
  ⟨[75], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨75,5,5,.second,.plus,4⟩]⟩,
  ⟨[75, 32767], [⟨32767,1,1,.second,.plus,15⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨75,5,5,.second,.plus,4⟩]⟩,
  ⟨[79, 4047], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨79,3,31,.first,.reverseMinus,4⟩,⟨4047,31,79,.first,.reverseMinus,7⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank00
