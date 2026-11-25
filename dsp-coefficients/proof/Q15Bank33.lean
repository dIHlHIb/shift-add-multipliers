import Q15Upper
namespace Q15Bank33
open Q15Upper
def entries : List Entry := [
  ⟨[5355, 32327], [⟨7,1,1,.second,.plus,3⟩,⟨505,1,7,.first,.plus,9⟩,⟨21,7,7,.second,.plus,2⟩,⟨32327,7,505,.second,.reverseMinus,6⟩,⟨5355,21,21,.second,.plus,8⟩]⟩,
  ⟨[5377, 30953], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨4353,1,257,.first,.reverseMinus,12⟩,⟨5377,1,4353,.first,.reverseMinus,10⟩,⟨3325,257,4353,.first,.minus,2⟩,⟨30953,4353,3325,.second,.reverseMinus,3⟩]⟩,
  ⟨[5389, 24681], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨105,3,9,.first,.reverseMinus,5⟩,⟨24681,3,105,.first,.reverseMinus,13⟩,⟨43113,9,24681,.first,.reverseMinus,11⟩,⟨5389,1,43113,.output,.reverseMinus,3⟩]⟩,
  ⟨[5401, 30937], [⟨31,1,1,.second,.plus,5⟩,⟨97,1,31,.first,.plus,7⟩,⟨807,31,97,.second,.reverseMinus,3⟩,⟨30937,31,807,.first,.plus,10⟩,⟨5401,97,807,.first,.plus,6⟩]⟩,
  ⟨[5403, 32319], [⟨63,1,1,.second,.plus,6⟩,⟨193,1,63,.first,.plus,8⟩,⟨32319,63,63,.second,.reverseMinus,9⟩,⟨773,1,193,.second,.reverseMinus,2⟩,⟨5403,193,773,.first,.plus,5⟩]⟩,
  ⟨[5417, 6145], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨6145,1,3,.second,.reverseMinus,11⟩,⟨91,3,5,.first,.plus,5⟩,⟨5417,6145,91,.second,.minus,3⟩]⟩,
  ⟨[5417, 24581], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨24581,3,5,.first,.reverseMinus,13⟩,⟨297,9,9,.second,.reverseMinus,5⟩,⟨5417,5,297,.first,.reverseMinus,10⟩]⟩,
  ⟨[5425, 30919], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨775,25,25,.second,.plus,5⟩,⟨5425,775,775,.second,.plus,3⟩,⟨24775,25,775,.second,.plus,5⟩,⟨30919,3,24775,.first,.reverseMinus,11⟩]⟩,
  ⟨[5449, 15451], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨5129,5,9,.first,.reverseMinus,10⟩,⟨5449,5,5129,.first,.reverseMinus,6⟩,⟨15387,5129,5129,.second,.plus,2⟩,⟨15451,1,15387,.first,.reverseMinus,6⟩]⟩,
  ⟨[5449, 30903], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨85,5,5,.second,.reverseMinus,4⟩,⟨5449,9,85,.second,.reverseMinus,6⟩,⟨31415,9,5449,.first,.plus,12⟩,⟨30903,1,31415,.first,.minus,9⟩]⟩,
  ⟨[5453, 32311], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨521,1,513,.first,.reverseMinus,3⟩,⟨32311,513,521,.first,.plus,6⟩,⟨681,5,521,.first,.reverseMinus,5⟩,⟨5453,5,681,.second,.reverseMinus,3⟩]⟩,
  ⟨[5483, 12173], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨381,3,3,.second,.plus,7⟩,⟨12173,19,381,.second,.plus,5⟩,⟨685,19,381,.first,.reverseMinus,4⟩,⟨5483,3,685,.second,.reverseMinus,3⟩]⟩,
  ⟨[5483, 24347], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨107,1,21,.first,.plus,7⟩,⟨5483,21,107,.first,.reverseMinus,8⟩,⟨229,21,107,.first,.plus,4⟩,⟨24347,3,229,.first,.plus,13⟩]⟩,
  ⟨[5503, 16151], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨5503,21,127,.first,.reverseMinus,8⟩,⟨233,21,127,.second,.plus,1⟩,⟨16151,1,233,.first,.plus,14⟩]⟩,
  ⟨[5503, 32303], [⟨63,1,1,.second,.plus,6⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨47,1,63,.first,.minus,4⟩,⟨32303,63,47,.first,.reverseMinus,9⟩,⟨5503,513,47,.second,.plus,7⟩]⟩,
  ⟨[5543, 7709], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨241,1,15,.second,.reverseMinus,4⟩,⟨7709,3,241,.second,.plus,5⟩,⟨6745,241,7709,.first,.minus,2⟩,⟨5543,3,6745,.first,.plus,12⟩]⟩,
  ⟨[5543, 30835], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨345,23,23,.second,.plus,4⟩,⟨5543,23,345,.second,.reverseMinus,4⟩,⟨6167,3,23,.first,.reverseMinus,11⟩,⟨30835,6167,6167,.second,.reverseMinus,2⟩]⟩,
  ⟨[5553, 16147], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨79,1,5,.second,.plus,4⟩,⟨8113,1,79,.first,.plus,13⟩,⟨5553,5,8113,.first,.minus,9⟩,⟨16147,79,8113,.second,.plus,1⟩]⟩,
  ⟨[5553, 32295], [⟨3,1,1,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨4049,1,47,.first,.plus,12⟩,⟨5553,47,4049,.first,.reverseMinus,5⟩,⟨4037,3,4049,.first,.minus,2⟩,⟨32295,1,4037,.second,.plus,3⟩]⟩,
  ⟨[5557, 6019], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨47,1,3,.second,.plus,4⟩,⟨6019,3,47,.second,.reverseMinus,7⟩,⟨5571,7,6019,.first,.minus,6⟩,⟨5557,7,5571,.first,.minus,1⟩]⟩,
  ⟨[5557, 24075], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨47,1,3,.second,.plus,4⟩,⟨24075,11,47,.second,.reverseMinus,9⟩,⟨5621,11,11,.second,.plus,9⟩,⟨5557,1,5621,.first,.minus,6⟩]⟩,
  ⟨[5567, 15409], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨959,1,65,.first,.plus,10⟩,⟨5567,9,959,.first,.reverseMinus,9⟩,⟨15409,65,959,.second,.reverseMinus,4⟩]⟩,
  ⟨[5567, 30819], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨30819,15,99,.first,.reverseMinus,11⟩,⟨87,3,99,.first,.minus,2⟩,⟨5567,1,87,.second,.plus,6⟩]⟩,
  ⟨[5591, 15401], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨41,3,11,.second,.plus,2⟩,⟨5591,11,41,.first,.plus,9⟩,⟨15401,41,5591,.first,.plus,9⟩]⟩,
  ⟨[5591, 30801], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨41,3,11,.second,.plus,2⟩,⟨5591,11,41,.first,.plus,9⟩,⟨15401,41,5591,.first,.plus,9⟩,⟨30801,1,15401,.second,.plus,1⟩]⟩,
  ⟨[5603, 16143], [⟨7,1,1,.second,.plus,3⟩,⟨1793,1,7,.second,.reverseMinus,8⟩,⟨2017,7,1793,.first,.reverseMinus,5⟩,⟨16143,7,2017,.second,.reverseMinus,3⟩,⟨5603,1793,2017,.first,.reverseMinus,1⟩]⟩,
  ⟨[5603, 23905], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨671,1,21,.second,.plus,5⟩,⟨23905,3,671,.first,.plus,13⟩,⟨5347,21,671,.second,.plus,3⟩,⟨5603,1,5347,.first,.reverseMinus,8⟩]⟩,
  ⟨[5603, 32285], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨483,161,161,.second,.plus,2⟩,⟨32285,1,483,.first,.plus,15⟩,⟨5603,5,483,.first,.reverseMinus,10⟩]⟩,
  ⟨[5651, 8069], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨123,1,5,.first,.plus,7⟩,⟨8069,1,123,.first,.plus,13⟩,⟨1413,3,123,.first,.plus,9⟩,⟨5651,1,1413,.second,.plus,2⟩]⟩,
  ⟨[5651, 32277], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨4611,3,9,.second,.reverseMinus,9⟩,⟨32277,4611,4611,.second,.plus,3⟩,⟨4627,1,4611,.first,.reverseMinus,4⟩,⟨5651,1,4627,.first,.reverseMinus,10⟩]⟩,
  ⟨[5661, 15375], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨6141,3,3,.second,.plus,11⟩,⟨15375,15,15,.second,.reverseMinus,10⟩,⟨5661,15,6141,.first,.minus,5⟩]⟩,
  ⟨[5661, 30749], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨4093,1,3,.first,.plus,12⟩,⟨5661,49,4093,.first,.reverseMinus,5⟩,⟨30749,49,5661,.first,.reverseMinus,9⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank33
