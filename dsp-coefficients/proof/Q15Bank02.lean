import Q15Upper
namespace Q15Bank02
open Q15Upper
def entries : List Entry := [
  ⟨[201, 16383], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨16383,1,1,.second,.plus,14⟩,⟨201,3,9,.first,.reverseMinus,6⟩]⟩,
  ⟨[201, 30137], [⟨7,1,1,.second,.plus,3⟩,⟨23,1,7,.first,.reverseMinus,4⟩,⟨28665,7,7,.second,.plus,12⟩,⟨201,7,23,.first,.plus,5⟩,⟨30137,23,28665,.first,.reverseMinus,6⟩]⟩,
  ⟨[201, 32729], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨2045,1,3,.first,.plus,11⟩,⟨201,3,9,.first,.reverseMinus,6⟩,⟨32729,9,2045,.second,.reverseMinus,4⟩]⟩,
  ⟨[201, 32759], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨32759,1,9,.first,.plus,15⟩,⟨201,3,9,.first,.reverseMinus,6⟩]⟩,
  ⟨[201, 32765], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨32765,1,3,.first,.plus,15⟩,⟨201,3,9,.first,.reverseMinus,6⟩]⟩,
  ⟨[201, 32767], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨32767,1,1,.second,.plus,15⟩,⟨201,3,9,.first,.reverseMinus,6⟩]⟩,
  ⟨[207, 4075], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨207,3,255,.first,.minus,4⟩,⟨4075,5,255,.second,.plus,4⟩]⟩,
  ⟨[207, 32601], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨4099,1,3,.first,.reverseMinus,12⟩,⟨207,1,191,.first,.reverseMinus,4⟩,⟨32601,191,4099,.second,.plus,3⟩]⟩,
  ⟨[209, 16039], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨2031,1,17,.first,.plus,11⟩,⟨209,3,17,.first,.reverseMinus,6⟩,⟨16039,2031,209,.first,.plus,3⟩]⟩,
  ⟨[209, 32079], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨145,1,9,.second,.reverseMinus,4⟩,⟨209,1,145,.first,.reverseMinus,6⟩,⟨1007,9,145,.first,.plus,7⟩,⟨32079,145,1007,.second,.plus,5⟩]⟩,
  ⟨[233, 14589], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨233,1,29,.second,.reverseMinus,3⟩,⟨14589,29,259,.first,.plus,9⟩]⟩,
  ⟨[233, 29179], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨57,1,7,.second,.reverseMinus,3⟩,⟨233,5,57,.second,.reverseMinus,2⟩,⟨29179,5,57,.second,.plus,9⟩]⟩,
  ⟨[245, 16355], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨511,1,1,.second,.plus,9⟩,⟨245,3,31,.second,.plus,3⟩,⟨16355,3,511,.second,.reverseMinus,5⟩]⟩,
  ⟨[245, 32709], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨16353,1,31,.first,.plus,14⟩,⟨245,3,31,.second,.plus,3⟩,⟨32709,3,16353,.second,.reverseMinus,1⟩]⟩,
  ⟨[251], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩]⟩,
  ⟨[251, 1785], [⟨255,1,1,.second,.plus,8⟩,⟨251,1,255,.first,.minus,2⟩,⟨1785,255,255,.second,.plus,3⟩]⟩,
  ⟨[251, 3221], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨251,3,31,.second,.reverseMinus,3⟩,⟨217,31,31,.second,.plus,3⟩,⟨3221,251,217,.second,.plus,4⟩]⟩,
  ⟨[251, 6443], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨379,1,251,.first,.reverseMinus,7⟩,⟨6443,379,379,.second,.reverseMinus,4⟩]⟩,
  ⟨[251, 8191], [⟨8191,1,1,.second,.plus,13⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩]⟩,
  ⟨[251, 28561], [⟨255,1,1,.second,.plus,8⟩,⟨4079,1,255,.second,.plus,4⟩,⟨251,1,255,.first,.minus,2⟩,⟨28561,255,4079,.first,.plus,7⟩]⟩,
  ⟨[251, 32765], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨32765,1,3,.first,.plus,15⟩,⟨251,1,5,.first,.plus,8⟩]⟩,
  ⟨[251, 32767], [⟨32767,1,1,.second,.plus,15⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩]⟩,
  ⟨[253, 2503], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨253,1,3,.first,.plus,8⟩,⟨1545,3,9,.first,.reverseMinus,9⟩,⟨2503,253,1545,.first,.plus,4⟩]⟩,
  ⟨[253, 5007], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨253,1,3,.first,.plus,8⟩,⟨3089,3,17,.first,.reverseMinus,10⟩,⟨5007,253,3089,.first,.plus,5⟩]⟩,
  ⟨[261, 15843], [⟨31,1,1,.second,.plus,5⟩,⟨29,1,31,.first,.minus,1⟩,⟨15843,31,29,.first,.plus,9⟩,⟨261,29,29,.second,.reverseMinus,3⟩]⟩,
  ⟨[261, 31685], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨261,1,5,.first,.reverseMinus,8⟩,⟨495,1,17,.first,.plus,9⟩,⟨31685,5,495,.second,.reverseMinus,6⟩]⟩,
  ⟨[285, 16225], [⟨31,1,1,.second,.plus,5⟩,⟨127,1,1,.second,.plus,7⟩,⟨285,31,127,.second,.reverseMinus,1⟩,⟨16225,31,127,.second,.plus,7⟩]⟩,
  ⟨[285, 32449], [⟨3,1,1,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨253,1,3,.first,.plus,8⟩,⟨285,1,253,.first,.reverseMinus,5⟩,⟨32449,65,253,.second,.reverseMinus,7⟩]⟩,
  ⟨[289, 3381], [⟨3,1,1,.second,.plus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨773,3,97,.second,.plus,3⟩,⟨289,3,97,.first,.reverseMinus,6⟩,⟨3381,773,289,.first,.reverseMinus,2⟩]⟩,
  ⟨[289, 8187], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨8187,1,5,.first,.plus,13⟩,⟨289,1,9,.second,.reverseMinus,5⟩]⟩,
  ⟨[289, 27049], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨289,1,9,.second,.reverseMinus,5⟩,⟨13,1,9,.first,.reverseMinus,2⟩,⟨425,9,13,.second,.reverseMinus,5⟩,⟨27049,13,425,.first,.reverseMinus,11⟩]⟩,
  ⟨[289, 32747], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨8191,1,1,.second,.plus,13⟩,⟨289,17,17,.second,.reverseMinus,4⟩,⟨32747,17,8191,.second,.plus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank02
