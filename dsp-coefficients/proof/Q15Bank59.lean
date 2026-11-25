import Q15Upper
namespace Q15Bank59
open Q15Upper
def entries : List Entry := [
  ⟨[17105, 27949], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨109,1,45,.first,.reverseMinus,6⟩,⟨27949,45,109,.second,.reverseMinus,8⟩,⟨721,1,45,.second,.reverseMinus,4⟩,⟨17105,1,721,.first,.reverseMinus,14⟩]⟩,
  ⟨[17147, 27923], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨17147,5,67,.second,.plus,8⟩,⟨17683,67,17147,.first,.reverseMinus,3⟩,⟨27923,5,17683,.first,.reverseMinus,11⟩]⟩,
  ⟨[17189, 27897], [⟨7,1,1,.second,.plus,3⟩,⟨113,1,7,.second,.reverseMinus,4⟩,⟨1031,1,7,.first,.reverseMinus,10⟩,⟨27897,113,1031,.first,.plus,8⟩,⟨805,113,1031,.first,.minus,1⟩,⟨17189,1,805,.first,.reverseMinus,14⟩]⟩,
  ⟨[17233, 27871], [⟨1025,1,1,.second,.reverseMinus,10⟩,⟨897,1,1025,.first,.minus,7⟩,⟨833,1,897,.first,.minus,6⟩,⟨17233,1025,833,.first,.reverseMinus,4⟩,⟨27871,897,833,.first,.plus,5⟩]⟩,
  ⟨[17275, 27845], [⟨7,1,1,.second,.plus,3⟩,⟨449,1,7,.second,.reverseMinus,6⟩,⟨891,7,449,.second,.plus,1⟩,⟨17275,1,891,.first,.reverseMinus,14⟩,⟨27845,449,891,.first,.plus,6⟩]⟩,
  ⟨[17317, 27817], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨525,1,517,.first,.reverseMinus,3⟩,⟨17317,517,525,.second,.reverseMinus,5⟩,⟨19417,525,17317,.first,.reverseMinus,2⟩,⟨27817,525,19417,.first,.reverseMinus,4⟩]⟩,
  ⟨[17361, 27791], [⟨7,1,1,.second,.plus,3⟩,⟨217,7,7,.second,.plus,5⟩,⟨3473,1,217,.second,.reverseMinus,4⟩,⟨27791,7,3473,.second,.reverseMinus,3⟩,⟨17361,217,3473,.first,.reverseMinus,6⟩]⟩,
  ⟨[17403, 27765], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨3077,3,5,.first,.reverseMinus,10⟩,⟨17403,5,3077,.first,.plus,12⟩,⟨3085,1,3077,.first,.reverseMinus,3⟩,⟨27765,3085,3085,.second,.reverseMinus,3⟩]⟩,
  ⟨[17445, 27737], [⟨7,1,1,.second,.plus,3⟩,⟨217,7,7,.second,.plus,5⟩,⟨867,1,217,.second,.plus,2⟩,⟨27737,7,867,.second,.plus,5⟩,⟨34673,867,27737,.first,.reverseMinus,3⟩,⟨17445,217,34673,.output,.plus,1⟩]⟩,
  ⟨[17489, 27711], [⟨1025,1,1,.second,.reverseMinus,10⟩,⟨1029,1,1025,.first,.reverseMinus,2⟩,⟨17489,1025,1029,.second,.reverseMinus,4⟩,⟨3079,1025,1029,.first,.reverseMinus,1⟩,⟨27711,3079,3079,.second,.reverseMinus,3⟩]⟩,
  ⟨[17531, 27685], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨37,1,27,.first,.plus,6⟩,⟨27685,27,37,.first,.reverseMinus,10⟩,⟨1147,37,37,.second,.plus,5⟩,⟨17531,1,1147,.first,.reverseMinus,14⟩]⟩,
  ⟨[17573, 27657], [⟨3,1,1,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨3073,1,3,.second,.reverseMinus,10⟩,⟨27657,3073,3073,.second,.reverseMinus,3⟩,⟨7011,387,27657,.output,.plus,2⟩,⟨17573,3073,7011,.first,.plus,3⟩]⟩,
  ⟨[17615, 27631], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨27631,17,27,.second,.plus,10⟩,⟨271,1,17,.second,.plus,4⟩,⟨17615,271,271,.second,.reverseMinus,6⟩]⟩,
  ⟨[17659, 27603], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1275,5,5,.second,.plus,8⟩,⟨1243,1,1275,.first,.minus,5⟩,⟨17659,1,1275,.first,.reverseMinus,14⟩,⟨27603,1243,17659,.first,.reverseMinus,3⟩]⟩,
  ⟨[17701, 27577], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨571,5,9,.second,.plus,6⟩,⟨17701,571,571,.second,.plus,5⟩,⟨1723,9,571,.first,.reverseMinus,7⟩,⟨27577,9,1723,.second,.reverseMinus,4⟩]⟩,
  ⟨[17743, 27549], [⟨15,1,1,.second,.plus,4⟩,⟨271,1,15,.first,.reverseMinus,8⟩,⟨17615,271,271,.second,.reverseMinus,6⟩,⟨17743,1,17615,.first,.reverseMinus,7⟩,⟨13775,15,17615,.first,.minus,8⟩,⟨27549,1,13775,.second,.plus,1⟩]⟩,
  ⟨[17785, 27521], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨24449,1,191,.second,.reverseMinus,7⟩,⟨27521,3,24449,.first,.reverseMinus,10⟩,⟨25977,191,24449,.first,.reverseMinus,3⟩,⟨17785,1,25977,.first,.minus,13⟩]⟩,
  ⟨[17827, 27495], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨557,1,45,.first,.reverseMinus,9⟩,⟨17827,3,557,.second,.reverseMinus,5⟩,⟨3437,45,557,.first,.reverseMinus,6⟩,⟨27495,1,3437,.second,.plus,3⟩]⟩,
  ⟨[17869, 27467], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨75,5,5,.second,.plus,4⟩,⟨107,1,75,.first,.reverseMinus,5⟩,⟨27467,75,107,.second,.reverseMinus,8⟩,⟨17867,75,27467,.first,.minus,7⟩,⟨17869,1,17867,.first,.reverseMinus,1⟩]⟩,
  ⟨[17911, 27439], [⟨3,1,1,.second,.plus,2⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨2239,1,35,.second,.plus,6⟩,⟨17911,1,2239,.second,.plus,3⟩,⟨33583,2239,17911,.second,.plus,1⟩,⟨27439,3,33583,.first,.minus,11⟩]⟩,
  ⟨[17953, 27411], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨2835,45,45,.second,.plus,6⟩,⟨27411,3,2835,.first,.reverseMinus,13⟩,⟨17949,2835,27411,.first,.plus,4⟩,⟨17953,1,17949,.first,.reverseMinus,2⟩]⟩,
  ⟨[17995, 27385], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨75,5,5,.second,.plus,4⟩,⟨19195,5,75,.second,.plus,8⟩,⟨17995,75,19195,.first,.minus,4⟩,⟨19193,1,19195,.first,.minus,1⟩,⟨27385,1,19193,.first,.reverseMinus,13⟩]⟩,
  ⟨[18037, 27357], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨35,1,9,.second,.plus,2⟩,⟨107,9,35,.first,.reverseMinus,3⟩,⟨27357,35,107,.second,.plus,8⟩,⟨395,9,107,.first,.reverseMinus,5⟩,⟨18037,9,395,.first,.plus,11⟩]⟩,
  ⟨[18079, 27329], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨11,1,9,.first,.reverseMinus,1⟩,⟨353,1,11,.second,.reverseMinus,5⟩,⟨18079,9,353,.first,.plus,11⟩,⟨17727,11,18079,.first,.minus,5⟩,⟨27329,11,17727,.first,.plus,12⟩]⟩,
  ⟨[18121, 27301], [⟨255,1,1,.second,.plus,8⟩,⟨239,1,255,.first,.minus,4⟩,⟨2295,255,255,.second,.reverseMinus,3⟩,⟨18121,239,2295,.second,.plus,3⟩,⟨27301,2295,18121,.first,.reverseMinus,2⟩]⟩,
  ⟨[18163, 27273], [⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨9081,7,71,.second,.plus,7⟩,⟨18163,1,9081,.second,.reverseMinus,1⟩,⟨27257,71,9081,.first,.reverseMinus,8⟩,⟨27273,1,27257,.first,.reverseMinus,4⟩]⟩,
  ⟨[18205, 27245], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨35,5,5,.second,.plus,3⟩,⟨285,5,35,.second,.reverseMinus,3⟩,⟨18205,35,285,.second,.plus,6⟩,⟨27165,35,18205,.first,.reverseMinus,8⟩,⟨27245,5,27165,.first,.reverseMinus,4⟩]⟩,
  ⟨[18247, 27217], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨71,3,23,.first,.reverseMinus,4⟩,⟨18247,71,71,.second,.reverseMinus,8⟩,⟨54457,71,18247,.first,.plus,10⟩,⟨27217,23,54457,.output,.reverseMinus,1⟩]⟩,
  ⟨[18289, 27189], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨2033,1,127,.second,.reverseMinus,4⟩,⟨18289,127,2033,.first,.reverseMinus,7⟩,⟨26421,2033,18289,.first,.reverseMinus,2⟩,⟨27189,3,26421,.first,.reverseMinus,8⟩]⟩,
  ⟨[18331, 27161], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨1561,3,25,.first,.reverseMinus,9⟩,⟨27161,25,1561,.first,.reverseMinus,10⟩,⟨4583,3,1561,.first,.plus,11⟩,⟨18331,1,4583,.second,.plus,2⟩]⟩,
  ⟨[18371, 27133], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1539,3,3,.second,.reverseMinus,9⟩,⟨27133,7,1539,.first,.plus,12⟩,⟨1987,7,1539,.first,.reverseMinus,6⟩,⟨18371,1,1987,.first,.reverseMinus,14⟩]⟩,
  ⟨[18413, 27105], [⟨1023,1,1,.second,.plus,10⟩,⟨2045,1,1023,.second,.plus,1⟩,⟨2173,1,2045,.first,.reverseMinus,7⟩,⟨18413,1023,2045,.first,.reverseMinus,4⟩,⟨27105,2173,18413,.first,.reverseMinus,2⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank59
