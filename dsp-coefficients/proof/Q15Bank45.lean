import Q15Upper
namespace Q15Bank45
open Q15Upper
def entries : List Entry := [
  ⟨[9079, 31485], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨491,3,61,.second,.reverseMinus,3⟩,⟨31485,61,491,.second,.reverseMinus,6⟩,⟨15497,491,31485,.output,.reverseMinus,1⟩,⟨9079,3,15497,.first,.plus,13⟩]⟩,
  ⟨[9123, 13609], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨71,1,35,.second,.reverseMinus,1⟩,⟨9123,35,71,.second,.reverseMinus,7⟩,⟨13603,35,9123,.first,.reverseMinus,7⟩,⟨13609,3,13603,.first,.reverseMinus,1⟩]⟩,
  ⟨[9123, 27217], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨285,19,19,.second,.plus,4⟩,⟨9123,3,285,.second,.reverseMinus,5⟩,⟨27369,9123,9123,.second,.plus,2⟩,⟨27217,19,27369,.first,.minus,3⟩]⟩,
  ⟨[9127, 31471], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨507,1,5,.first,.plus,9⟩,⟨1015,1,507,.second,.reverseMinus,1⟩,⟨9127,507,1015,.first,.reverseMinus,4⟩,⟨15733,507,1015,.second,.plus,4⟩,⟨31471,5,15733,.second,.reverseMinus,1⟩]⟩,
  ⟨[9165, 13581], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨9165,9,51,.first,.plus,10⟩,⟨13773,9,9165,.first,.reverseMinus,9⟩,⟨13581,3,13773,.first,.minus,6⟩]⟩,
  ⟨[9165, 27161], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨141,1,13,.first,.reverseMinus,7⟩,⟨9165,141,141,.second,.reverseMinus,6⟩,⟨27213,141,9165,.first,.reverseMinus,7⟩,⟨27161,13,27213,.first,.minus,2⟩]⟩,
  ⟨[9175, 15729], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨983,5,1023,.first,.minus,3⟩,⟨15729,1,983,.second,.reverseMinus,4⟩,⟨9175,1,983,.first,.reverseMinus,13⟩]⟩,
  ⟨[9175, 31457], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨983,5,1023,.first,.minus,3⟩,⟨31457,1,983,.second,.reverseMinus,5⟩,⟨9175,1,983,.first,.reverseMinus,13⟩]⟩,
  ⟨[9207, 13553], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨143,1,9,.second,.plus,4⟩,⟨9207,9,9,.second,.plus,10⟩,⟨107,9,143,.first,.minus,2⟩,⟨13553,143,107,.second,.plus,7⟩]⟩,
  ⟨[9207, 27105], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨9207,9,9,.second,.plus,10⟩,⟨53,9,31,.second,.plus,1⟩,⟨27105,31,53,.second,.plus,9⟩]⟩,
  ⟨[9223, 31443], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨1031,5,513,.second,.reverseMinus,1⟩,⟨9223,1,1031,.first,.reverseMinus,13⟩,⟨15465,1031,1031,.second,.plus,4⟩,⟨31443,513,15465,.second,.reverseMinus,1⟩]⟩,
  ⟨[9227, 27077], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨2309,5,9,.second,.reverseMinus,8⟩,⟨9227,9,2309,.second,.plus,2⟩,⟨27717,2309,9227,.first,.plus,4⟩,⟨27077,5,27717,.first,.minus,7⟩]⟩,
  ⟨[9269, 27021], [⟨3,1,1,.second,.plus,2⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨8239,1,515,.second,.plus,4⟩,⟨9269,515,8239,.first,.reverseMinus,1⟩,⟨9007,3,8239,.first,.reverseMinus,8⟩,⟨27021,9007,9007,.second,.plus,2⟩]⟩,
  ⟨[9271, 15715], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨73,3,35,.second,.reverseMinus,1⟩,⟨9271,73,73,.second,.plus,7⟩,⟨245,35,35,.second,.plus,3⟩,⟨15715,35,245,.second,.reverseMinus,6⟩]⟩,
  ⟨[9271, 31429], [⟨3,1,1,.second,.plus,2⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨8241,1,515,.second,.reverseMinus,4⟩,⟨9271,515,8241,.first,.reverseMinus,1⟩,⟨7857,3,8241,.first,.minus,7⟩,⟨31429,1,7857,.second,.reverseMinus,2⟩]⟩,
  ⟨[9319, 15707], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨73,3,25,.first,.reverseMinus,4⟩,⟨9319,25,73,.second,.plus,7⟩,⟨15719,25,9319,.first,.reverseMinus,8⟩,⟨15707,3,15719,.first,.minus,2⟩]⟩,
  ⟨[9319, 31415], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨73,3,25,.first,.reverseMinus,4⟩,⟨9319,25,73,.second,.plus,7⟩,⟨18615,73,73,.second,.plus,8⟩,⟨31415,25,18615,.first,.reverseMinus,9⟩]⟩,
  ⟨[9331, 13467], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨437,5,517,.first,.minus,4⟩,⟨13467,517,437,.second,.plus,5⟩,⟨9331,517,13467,.first,.minus,3⟩]⟩,
  ⟨[9331, 26935], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨23,1,9,.first,.plus,5⟩,⟨9239,9,23,.first,.reverseMinus,10⟩,⟨9331,23,9239,.first,.reverseMinus,2⟩,⟨8503,23,9239,.first,.minus,5⟩,⟨26935,9,8503,.first,.reverseMinus,11⟩]⟩,
  ⟨[9367, 31401], [⟨7,1,1,.second,.plus,3⟩,⟨505,1,7,.first,.plus,9⟩,⟨617,7,505,.first,.reverseMinus,4⟩,⟨9367,505,617,.second,.plus,4⟩,⟨1963,505,617,.second,.plus,2⟩,⟨31401,7,1963,.second,.plus,4⟩]⟩,
  ⟨[9393, 26849], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨6321,49,49,.second,.reverseMinus,7⟩,⟨9393,3,6321,.first,.reverseMinus,10⟩,⟨6713,49,6321,.first,.reverseMinus,3⟩,⟨26849,3,6713,.second,.plus,2⟩]⟩,
  ⟨[9413, 26819], [⟨3,1,1,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨419,1,387,.first,.reverseMinus,5⟩,⟨26819,3,419,.second,.reverseMinus,6⟩,⟨1225,387,419,.second,.reverseMinus,1⟩,⟨9413,387,1225,.second,.plus,3⟩]⟩,
  ⟨[9415, 15693], [⟨7,1,1,.second,.plus,3⟩,⟨21,7,7,.second,.plus,2⟩,⟨1345,1,21,.second,.reverseMinus,6⟩,⟨9415,1345,1345,.second,.plus,3⟩,⟨17485,1345,9415,.second,.plus,1⟩,⟨15693,7,17485,.first,.minus,8⟩]⟩,
  ⟨[9415, 31387], [⟨7,1,1,.second,.plus,3⟩,⟨35,7,7,.second,.reverseMinus,2⟩,⟨8967,7,35,.second,.reverseMinus,8⟩,⟨9415,7,8967,.first,.reverseMinus,6⟩,⟨7847,35,8967,.first,.minus,5⟩,⟨31387,1,7847,.second,.plus,2⟩]⟩,
  ⟨[9455, 13381], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨751,3,17,.first,.plus,8⟩,⟨9455,17,751,.first,.reverseMinus,9⟩,⟨3003,1,751,.second,.plus,2⟩,⟨13381,1,3003,.first,.plus,14⟩]⟩,
  ⟨[9455, 26761], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨751,3,17,.first,.plus,8⟩,⟨9455,17,751,.first,.reverseMinus,9⟩,⟨3345,1,751,.first,.plus,12⟩,⟨26761,1,3345,.second,.reverseMinus,3⟩]⟩,
  ⟨[9463, 31371], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨247,1,9,.first,.plus,8⟩,⟨15809,1,247,.second,.reverseMinus,6⟩,⟨9463,9,247,.first,.reverseMinus,10⟩,⟨31371,247,15809,.second,.plus,1⟩]⟩,
  ⟨[9475, 26733], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨37,3,13,.first,.reverseMinus,3⟩,⟨9475,3,37,.second,.reverseMinus,8⟩,⟨26637,13,13,.second,.reverseMinus,11⟩,⟨26733,3,26637,.first,.reverseMinus,5⟩]⟩,
  ⟨[9513, 15679], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨245,1,11,.first,.plus,8⟩,⟨15679,1,245,.second,.plus,6⟩,⟨15657,11,15679,.first,.minus,1⟩,⟨9513,3,15657,.first,.minus,11⟩]⟩,
  ⟨[9513, 31357], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨4483,3,35,.second,.reverseMinus,7⟩,⟨31357,35,4483,.first,.plus,10⟩,⟨9001,35,4483,.second,.reverseMinus,1⟩,⟨9513,1,9001,.first,.reverseMinus,9⟩]⟩,
  ⟨[9537, 13323], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨6655,1,13,.second,.plus,9⟩,⟨13323,13,6655,.second,.reverseMinus,1⟩,⟨6847,3,6655,.first,.reverseMinus,6⟩,⟨9537,1,6847,.first,.plus,14⟩]⟩,
  ⟨[9537, 26645], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨21,1,13,.first,.reverseMinus,3⟩,⟨26645,13,21,.first,.reverseMinus,11⟩,⟨149,1,21,.first,.reverseMinus,7⟩,⟨9537,1,149,.second,.reverseMinus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank45
