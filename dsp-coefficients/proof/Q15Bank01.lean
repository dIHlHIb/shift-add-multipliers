import Q15Upper
namespace Q15Bank01
open Q15Upper
def entries : List Entry := [
  ⟨[79, 32375], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨31743,1,31,.second,.plus,10⟩,⟨79,3,31,.first,.reverseMinus,4⟩,⟨32375,31743,79,.second,.reverseMinus,3⟩]⟩,
  ⟨[91, 16319], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨91,3,5,.first,.plus,5⟩,⟨16319,1,65,.first,.plus,14⟩]⟩,
  ⟨[91, 32639], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨91,9,127,.first,.minus,2⟩,⟨32639,127,127,.second,.reverseMinus,8⟩]⟩,
  ⟨[101], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨101,3,5,.first,.reverseMinus,5⟩]⟩,
  ⟨[101, 32767], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨32767,1,1,.second,.plus,15⟩,⟨101,3,5,.first,.reverseMinus,5⟩]⟩,
  ⟨[113, 8189], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨8189,1,3,.first,.plus,13⟩,⟨113,1,7,.second,.reverseMinus,4⟩]⟩,
  ⟨[113, 8191], [⟨8191,1,1,.second,.plus,13⟩,⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩]⟩,
  ⟨[113, 16359], [⟨7,1,1,.second,.plus,3⟩,⟨511,1,1,.second,.plus,9⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨16359,7,511,.second,.reverseMinus,5⟩]⟩,
  ⟨[113, 32719], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨113,1,49,.first,.reverseMinus,6⟩,⟨32719,1,49,.first,.plus,15⟩]⟩,
  ⟨[113, 32755], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨13,1,9,.first,.reverseMinus,2⟩,⟨32755,1,13,.first,.plus,15⟩,⟨113,9,13,.second,.reverseMinus,3⟩]⟩,
  ⟨[113, 32765], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨32765,1,3,.first,.plus,15⟩,⟨113,1,7,.second,.reverseMinus,4⟩]⟩,
  ⟨[135, 4087], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨135,9,9,.second,.plus,4⟩,⟨4087,1,9,.first,.plus,12⟩]⟩,
  ⟨[135, 32697], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨135,9,9,.second,.plus,4⟩,⟨32697,513,135,.first,.plus,6⟩]⟩,
  ⟨[151], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨151,1,19,.second,.plus,3⟩]⟩,
  ⟨[151, 16381], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨16381,1,3,.first,.plus,14⟩,⟨151,3,127,.first,.reverseMinus,3⟩]⟩,
  ⟨[151, 16383], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨16383,1,1,.second,.plus,14⟩,⟨151,3,127,.first,.reverseMinus,3⟩]⟩,
  ⟨[151, 32763], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨32763,1,5,.first,.plus,15⟩,⟨151,5,9,.first,.plus,5⟩]⟩,
  ⟨[151, 32767], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨32767,1,1,.second,.plus,15⟩,⟨151,3,127,.first,.reverseMinus,3⟩]⟩,
  ⟨[157, 4093], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨4093,1,3,.first,.plus,12⟩,⟨157,3,5,.second,.plus,5⟩]⟩,
  ⟨[157, 32743], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨25,1,33,.first,.minus,3⟩,⟨32743,1,25,.first,.plus,15⟩,⟨157,33,25,.first,.reverseMinus,2⟩]⟩,
  ⟨[171, 15443], [⟨15,1,1,.second,.plus,4⟩,⟨241,1,15,.second,.reverseMinus,4⟩,⟨19,1,15,.first,.reverseMinus,2⟩,⟨15443,241,19,.first,.reverseMinus,6⟩,⟨171,19,19,.second,.reverseMinus,3⟩]⟩,
  ⟨[171, 30887], [⟨7,1,1,.second,.plus,3⟩,⟨57,1,7,.second,.reverseMinus,3⟩,⟨967,1,57,.first,.plus,10⟩,⟨171,57,57,.second,.plus,2⟩,⟨30887,57,967,.second,.plus,5⟩]⟩,
  ⟨[185, 15277], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨3053,3,191,.second,.plus,4⟩,⟨185,3,191,.first,.minus,1⟩,⟨15277,191,3053,.first,.reverseMinus,6⟩]⟩,
  ⟨[185, 30555], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨6111,1,191,.second,.plus,5⟩,⟨185,3,191,.first,.minus,1⟩,⟨30555,6111,6111,.second,.reverseMinus,2⟩]⟩,
  ⟨[189, 16103], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨189,3,3,.second,.plus,6⟩,⟨16103,63,25,.first,.plus,8⟩]⟩,
  ⟨[189, 32205], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨189,3,3,.second,.plus,6⟩,⟨32205,63,51,.first,.plus,9⟩]⟩,
  ⟨[191, 10909], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨355,3,11,.second,.reverseMinus,5⟩,⟨10909,11,355,.first,.plus,10⟩]⟩,
  ⟨[191, 21819], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨61,1,3,.first,.plus,6⟩,⟨3117,191,61,.first,.reverseMinus,4⟩,⟨21819,3117,3117,.second,.plus,3⟩]⟩,
  ⟨[201], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨201,3,9,.first,.reverseMinus,6⟩]⟩,
  ⟨[201, 4091], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨4091,1,5,.first,.plus,12⟩,⟨201,5,41,.first,.reverseMinus,5⟩]⟩,
  ⟨[201, 15069], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨59,3,35,.first,.reverseMinus,3⟩,⟨201,35,59,.second,.plus,2⟩,⟨15069,35,59,.second,.plus,8⟩]⟩,
  ⟨[201, 16379], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨16379,1,5,.first,.plus,14⟩,⟨201,5,41,.first,.reverseMinus,5⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank01
