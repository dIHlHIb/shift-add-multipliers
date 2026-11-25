import Q15Upper
namespace Q15Bank52
open Q15Upper
def entries : List Entry := [
  ⟨[12307, 30369], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨12307,3,19,.first,.reverseMinus,12⟩,⟨2399,19,33,.first,.plus,7⟩,⟨30369,1,2399,.first,.plus,15⟩]⟩,
  ⟨[12353, 15175], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨65,1,1,.second,.reverseMinus,6⟩,⟨12353,3,65,.first,.reverseMinus,12⟩,⟨15169,11,12353,.first,.reverseMinus,8⟩,⟨15175,3,15169,.first,.reverseMinus,1⟩]⟩,
  ⟨[12353, 30351], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨3085,3,13,.first,.reverseMinus,10⟩,⟨12353,13,3085,.second,.reverseMinus,2⟩,⟨37007,3085,12353,.first,.plus,4⟩,⟨30351,13,37007,.first,.minus,9⟩]⟩,
  ⟨[12357, 21517], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨12293,3,5,.first,.reverseMinus,12⟩,⟨12357,1,12293,.first,.reverseMinus,6⟩,⟨10757,3,12293,.first,.minus,9⟩,⟨21517,3,10757,.second,.reverseMinus,1⟩]⟩,
  ⟨[12373, 21479], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨773,3,5,.first,.reverseMinus,8⟩,⟨12373,5,773,.second,.reverseMinus,4⟩,⟨3097,5,773,.second,.reverseMinus,2⟩,⟨21479,3,3097,.first,.plus,13⟩]⟩,
  ⟨[12401, 30331], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨12401,15,97,.second,.plus,7⟩,⟨7583,15,97,.first,.plus,9⟩,⟨30331,1,7583,.second,.plus,2⟩]⟩,
  ⟨[12423, 21365], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨135,3,33,.second,.reverseMinus,2⟩,⟨12423,3,135,.first,.reverseMinus,12⟩,⟨21369,33,12423,.first,.plus,10⟩,⟨21365,1,21369,.first,.minus,2⟩]⟩,
  ⟨[12439, 21327], [⟨3,1,1,.second,.plus,2⟩,⟨191,1,3,.second,.plus,6⟩,⟨215,3,191,.first,.reverseMinus,3⟩,⟨12439,191,215,.first,.reverseMinus,6⟩,⟨3249,191,215,.second,.plus,4⟩,⟨21327,3,3249,.first,.plus,13⟩]⟩,
  ⟨[12447, 30313], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨159,1,31,.first,.reverseMinus,7⟩,⟨12447,3,159,.first,.reverseMinus,12⟩,⟨1431,159,159,.second,.reverseMinus,3⟩,⟨30313,31,1431,.first,.plus,10⟩]⟩,
  ⟨[12455, 21289], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨167,1,21,.second,.plus,3⟩,⟨12455,3,167,.first,.reverseMinus,12⟩,⟨5323,21,167,.second,.plus,5⟩,⟨21289,3,5323,.second,.plus,2⟩]⟩,
  ⟨[12493, 30293], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨165,5,5,.second,.reverseMinus,5⟩,⟨32933,1,165,.first,.reverseMinus,15⟩,⟨30293,165,32933,.first,.minus,4⟩,⟨12453,5,32933,.first,.minus,12⟩,⟨12493,5,12453,.first,.reverseMinus,3⟩]⟩,
  ⟨[12537, 21097], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨249,1,7,.first,.plus,8⟩,⟨12537,3,249,.first,.reverseMinus,12⟩,⟨10545,249,12537,.first,.minus,3⟩,⟨21097,7,10545,.second,.reverseMinus,1⟩]⟩,
  ⟨[12539, 15137], [⟨3,1,1,.second,.plus,2⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨12545,1,49,.second,.reverseMinus,8⟩,⟨12539,3,12545,.first,.minus,1⟩,⟨14113,49,12545,.first,.reverseMinus,5⟩,⟨15137,1,14113,.first,.reverseMinus,10⟩]⟩,
  ⟨[12539, 30273], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2559,1,5,.second,.plus,9⟩,⟨2495,1,2559,.first,.minus,6⟩,⟨30273,1,2495,.first,.plus,15⟩,⟨12539,2559,2495,.second,.reverseMinus,2⟩]⟩,
  ⟨[12553, 21059], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨12553,9,49,.second,.reverseMinus,8⟩,⟨25155,49,12553,.second,.reverseMinus,1⟩,⟨21059,1,25155,.first,.minus,12⟩]⟩,
  ⟨[12569, 21021], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨99,33,33,.second,.plus,2⟩,⟨12573,99,99,.second,.plus,7⟩,⟨12569,1,12573,.first,.minus,2⟩,⟨21021,33,12573,.first,.reverseMinus,8⟩]⟩,
  ⟨[12585, 20981], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨41,3,11,.second,.plus,2⟩,⟨20981,11,41,.second,.plus,9⟩,⟨10537,41,41,.second,.reverseMinus,8⟩,⟨12585,1,10537,.first,.reverseMinus,11⟩]⟩,
  ⟨[12587, 15127], [⟨3,1,1,.second,.plus,2⟩,⟨61,1,3,.first,.plus,6⟩,⟨489,1,61,.second,.reverseMinus,3⟩,⟨15127,61,489,.first,.plus,8⟩,⟨3797,61,15127,.output,.plus,2⟩,⟨12587,1,3797,.first,.plus,14⟩]⟩,
  ⟨[12587, 30255], [⟨15,1,1,.second,.plus,4⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨945,15,15,.second,.plus,6⟩,⟨30255,15,945,.second,.reverseMinus,5⟩,⟨3797,17,945,.second,.reverseMinus,2⟩,⟨12587,1,3797,.first,.plus,14⟩]⟩,
  ⟨[12601, 20943], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨12801,1,25,.second,.reverseMinus,9⟩,⟨12601,25,12801,.first,.minus,3⟩,⟨12751,25,12801,.first,.minus,1⟩,⟨20943,1,12751,.first,.reverseMinus,13⟩]⟩,
  ⟨[12617, 20905], [⟨3,1,1,.second,.plus,2⟩,⟨23,1,3,.second,.plus,3⟩,⟨407,3,23,.first,.reverseMinus,7⟩,⟨12617,407,407,.second,.plus,5⟩,⟨12713,3,12617,.first,.reverseMinus,5⟩,⟨20905,1,12713,.first,.reverseMinus,13⟩]⟩,
  ⟨[12633, 20865], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨321,1,5,.second,.reverseMinus,6⟩,⟨1029,1,5,.first,.reverseMinus,10⟩,⟨20865,321,321,.second,.reverseMinus,6⟩,⟨12633,1029,20865,.first,.minus,3⟩]⟩,
  ⟨[12633, 30235], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨27,1,5,.first,.plus,5⟩,⟨2533,5,27,.first,.plus,9⟩,⟨30235,1,2533,.first,.plus,15⟩,⟨12665,2533,2533,.second,.reverseMinus,2⟩,⟨12633,1,12665,.first,.minus,5⟩]⟩,
  ⟨[12649, 20827], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨361,1,45,.second,.reverseMinus,3⟩,⟨12649,3,361,.first,.reverseMinus,12⟩,⟨10391,45,12649,.first,.plus,9⟩,⟨20827,45,10391,.second,.reverseMinus,1⟩]⟩,
  ⟨[12665, 20787], [⟨3,1,1,.second,.plus,2⟩,⟨769,1,3,.second,.reverseMinus,8⟩,⟨745,3,769,.first,.minus,3⟩,⟨12665,745,745,.second,.reverseMinus,4⟩,⟨3821,769,745,.first,.reverseMinus,2⟩,⟨20787,769,3821,.first,.plus,5⟩]⟩,
  ⟨[12679, 30215], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨137,1,17,.second,.reverseMinus,3⟩,⟨409,17,137,.first,.reverseMinus,4⟩,⟨12679,409,409,.second,.plus,5⟩,⟨30215,137,12679,.first,.reverseMinus,7⟩]⟩,
  ⟨[12681, 20749], [⟨3,1,1,.second,.plus,2⟩,⟨1537,1,3,.second,.reverseMinus,9⟩,⟨1585,3,1537,.first,.reverseMinus,4⟩,⟨12681,1,1585,.second,.reverseMinus,3⟩,⟨4803,1537,1585,.second,.plus,2⟩,⟨20749,1537,4803,.second,.reverseMinus,2⟩]⟩,
  ⟨[12697, 20709], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨2301,1,253,.first,.reverseMinus,11⟩,⟨20709,2301,2301,.second,.reverseMinus,3⟩,⟨6349,253,2301,.first,.reverseMinus,4⟩,⟨12697,1,6349,.second,.plus,1⟩]⟩,
  ⟨[12713, 20671], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨393,1,385,.first,.reverseMinus,3⟩,⟨12713,385,393,.first,.reverseMinus,5⟩,⟨24767,385,393,.second,.plus,6⟩,⟨20671,1,24767,.first,.minus,12⟩]⟩,
  ⟨[12725, 30197], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨159,1,5,.second,.plus,5⟩,⟨2549,5,159,.second,.reverseMinus,4⟩,⟨12725,159,2549,.first,.reverseMinus,6⟩,⟨2571,5,2549,.first,.plus,10⟩,⟨30197,1,2571,.first,.plus,15⟩]⟩,
  ⟨[12729, 20631], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨151,5,9,.first,.plus,5⟩,⟨20631,5,151,.first,.reverseMinus,12⟩,⟨25463,151,20631,.first,.reverseMinus,5⟩,⟨12729,5,25463,.output,.reverseMinus,1⟩]⟩,
  ⟨[12771, 30177], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨479,1,33,.first,.plus,9⟩,⟨99,33,33,.second,.plus,2⟩,⟨30177,479,479,.second,.plus,6⟩,⟨12771,99,99,.second,.reverseMinus,7⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank52
