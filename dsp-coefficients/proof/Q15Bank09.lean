import Q15Upper
namespace Q15Bank09
open Q15Upper
def entries : List Entry := [
  ⟨[977, 15911], [⟨31,1,1,.second,.plus,5⟩,⟨1985,1,31,.second,.reverseMinus,6⟩,⟨977,31,1985,.output,.reverseMinus,1⟩,⟨15911,31,1985,.second,.reverseMinus,3⟩]⟩,
  ⟨[977, 31823], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨977,3,1025,.first,.minus,4⟩,⟨31823,1025,977,.first,.plus,5⟩]⟩,
  ⟨[979, 1201], [⟨15,1,1,.second,.plus,4⟩,⟨241,1,15,.second,.reverseMinus,4⟩,⟨979,15,241,.second,.reverseMinus,2⟩,⟨1201,15,241,.first,.reverseMinus,6⟩]⟩,
  ⟨[979, 9609], [⟨15,1,1,.second,.plus,4⟩,⟨119,1,15,.second,.plus,3⟩,⟨19,1,15,.first,.reverseMinus,2⟩,⟨979,15,19,.first,.reverseMinus,6⟩,⟨9609,119,19,.second,.plus,9⟩]⟩,
  ⟨[983, 15905], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨991,1,33,.first,.plus,10⟩,⟨983,1,991,.first,.minus,3⟩,⟨15905,33,991,.first,.plus,9⟩]⟩,
  ⟨[983, 31811], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨995,1,29,.first,.plus,10⟩,⟨983,3,995,.first,.minus,2⟩,⟨31811,29,995,.second,.plus,5⟩]⟩,
  ⟨[989, 4249], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨133,1,5,.first,.reverseMinus,7⟩,⟨1029,1,5,.first,.reverseMinus,10⟩,⟨989,5,1029,.first,.minus,3⟩,⟨4249,133,1029,.second,.reverseMinus,2⟩]⟩,
  ⟨[989, 8497], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨297,9,9,.second,.reverseMinus,5⟩,⟨989,9,1025,.first,.minus,2⟩,⟨8497,1025,297,.first,.reverseMinus,3⟩]⟩,
  ⟨[991, 4127], [⟨31,1,1,.second,.plus,5⟩,⟨991,1,31,.second,.plus,5⟩,⟨4127,1,31,.first,.reverseMinus,12⟩]⟩,
  ⟨[991, 8255], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨63,1,1,.second,.plus,6⟩,⟨8255,1,63,.first,.reverseMinus,13⟩,⟨991,17,63,.second,.plus,4⟩]⟩,
  ⟨[993, 14329], [⟨7,1,1,.second,.plus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨14329,7,7,.second,.plus,11⟩,⟨993,1,31,.second,.reverseMinus,5⟩]⟩,
  ⟨[993, 28659], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨32759,1,9,.first,.plus,15⟩,⟨993,1,1025,.first,.minus,5⟩,⟨28659,1025,32759,.first,.minus,2⟩]⟩,
  ⟨[997, 3737], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨251,1,125,.second,.reverseMinus,1⟩,⟨997,3,125,.second,.plus,3⟩,⟨3737,251,997,.second,.plus,2⟩]⟩,
  ⟨[997, 7473], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨503,1,9,.first,.plus,9⟩,⟨997,9,503,.second,.plus,1⟩,⟨7473,503,997,.second,.plus,3⟩]⟩,
  ⟨[1003, 16261], [⟨3,1,1,.second,.plus,2⟩,⟨8193,1,1,.second,.reverseMinus,13⟩,⟨125,1,3,.first,.plus,7⟩,⟨1003,3,125,.second,.reverseMinus,3⟩,⟨16261,8193,125,.first,.plus,1⟩]⟩,
  ⟨[1003, 32521], [⟨3,1,1,.second,.plus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨16259,1,125,.first,.plus,14⟩,⟨1003,3,125,.second,.reverseMinus,3⟩,⟨32521,3,16259,.second,.reverseMinus,1⟩]⟩,
  ⟨[1005, 2047], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨2047,1,1,.second,.plus,11⟩,⟨1005,3,63,.second,.plus,4⟩]⟩,
  ⟨[1005, 16353], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨511,1,1,.second,.plus,9⟩,⟨16353,1,511,.second,.reverseMinus,5⟩,⟨1005,17,511,.second,.plus,1⟩]⟩,
  ⟨[1005, 32707], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨511,1,1,.second,.plus,9⟩,⟨32707,3,511,.second,.reverseMinus,6⟩,⟨1005,17,511,.second,.plus,1⟩]⟩,
  ⟨[1005, 32753], [⟨15,1,1,.second,.plus,4⟩,⟨255,1,1,.second,.plus,8⟩,⟨32753,1,15,.first,.plus,15⟩,⟨1005,15,255,.second,.plus,2⟩]⟩,
  ⟨[1007, 1487], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨15,1,1,.second,.plus,4⟩,⟨1007,1,17,.first,.plus,10⟩,⟨1487,15,1007,.first,.reverseMinus,5⟩]⟩,
  ⟨[1007, 5949], [⟨31,1,1,.second,.plus,5⟩,⟨1983,1,31,.second,.plus,6⟩,⟨1007,31,1983,.output,.plus,1⟩,⟨5949,1983,1983,.second,.plus,2⟩]⟩,
  ⟨[1011, 2603], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨13,1,9,.first,.reverseMinus,2⟩,⟨1011,1,13,.first,.plus,10⟩,⟨199,9,13,.second,.plus,4⟩,⟨2603,1011,199,.second,.reverseMinus,3⟩]⟩,
  ⟨[1011, 5205], [⟨3,1,1,.second,.plus,2⟩,⟨771,3,3,.second,.reverseMinus,8⟩,⟨963,3,771,.first,.reverseMinus,6⟩,⟨1011,3,963,.first,.reverseMinus,4⟩,⟨5205,771,963,.first,.plus,3⟩]⟩,
  ⟨[1021, 1255], [⟨255,1,1,.second,.plus,8⟩,⟨1021,1,255,.second,.reverseMinus,2⟩,⟨251,1,255,.first,.minus,2⟩,⟨1255,251,251,.second,.reverseMinus,2⟩]⟩,
  ⟨[1021, 2511], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨1021,1,3,.first,.plus,10⟩,⟨2511,5,49,.first,.plus,9⟩]⟩,
  ⟨[1023, 1457], [⟨3,1,1,.second,.plus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨47,1,3,.second,.plus,4⟩,⟨1457,47,47,.second,.plus,5⟩]⟩,
  ⟨[1055, 8175], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨1023,1,1,.second,.plus,10⟩,⟨1055,1,1023,.first,.reverseMinus,5⟩,⟨8175,9,1023,.second,.plus,3⟩]⟩,
  ⟨[1055, 16375], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨16375,1,9,.first,.plus,14⟩,⟨1055,1,33,.second,.plus,5⟩]⟩,
  ⟨[1055, 32701], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨67,1,17,.second,.plus,2⟩,⟨32701,1,67,.first,.plus,15⟩,⟨1055,17,67,.second,.plus,4⟩]⟩,
  ⟨[1055, 32751], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨32751,1,17,.first,.plus,15⟩,⟨1055,1,33,.second,.plus,5⟩]⟩,
  ⟨[1061, 7007], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨219,5,7,.second,.plus,5⟩,⟨7007,1,219,.second,.plus,5⟩,⟨1061,5,219,.first,.plus,8⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank09
