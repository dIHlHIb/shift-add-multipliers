import Q15Upper
namespace Q15Bank18
open Q15Upper
def entries : List Entry := [
  ⟨[1975, 7177], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨2039,1,9,.first,.plus,11⟩,⟨1975,1,2039,.first,.minus,6⟩,⟨7177,9,2039,.first,.plus,10⟩]⟩,
  ⟨[1975, 28707], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨2039,1,9,.first,.plus,11⟩,⟨8157,1,2039,.second,.reverseMinus,2⟩,⟨1975,1,2039,.first,.minus,6⟩,⟨28707,9,8157,.first,.plus,12⟩]⟩,
  ⟨[1981, 2033], [⟨3,1,1,.second,.plus,2⟩,⟨2045,1,3,.first,.plus,11⟩,⟨1981,1,2045,.first,.minus,6⟩,⟨2033,3,2045,.first,.minus,2⟩]⟩,
  ⟨[1981, 32527], [⟨3,1,1,.second,.plus,2⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨2045,1,3,.first,.plus,11⟩,⟨1981,1,2045,.first,.minus,6⟩,⟨32527,193,2045,.second,.plus,4⟩]⟩,
  ⟨[1997, 14305], [⟨7,1,1,.second,.plus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨13,1,7,.second,.plus,1⟩,⟨14305,7,31,.first,.plus,11⟩,⟨1997,31,13,.first,.reverseMinus,6⟩]⟩,
  ⟨[1997, 28609], [⟨3,1,1,.second,.plus,2⟩,⟨2045,1,3,.first,.plus,11⟩,⟨4087,3,2045,.second,.plus,1⟩,⟨1997,3,2045,.first,.minus,4⟩,⟨28609,4087,4087,.second,.plus,3⟩]⟩,
  ⟨[2001, 6983], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨1001,3,1025,.first,.minus,3⟩,⟨2001,1,1001,.second,.plus,1⟩,⟨6983,1025,1001,.second,.plus,3⟩]⟩,
  ⟨[2003, 6835], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨501,1,11,.first,.plus,9⟩,⟨2003,1,501,.second,.plus,2⟩,⟨853,11,501,.first,.reverseMinus,5⟩,⟨6835,11,853,.second,.reverseMinus,3⟩]⟩,
  ⟨[2009, 16353], [⟨31,1,1,.second,.plus,5⟩,⟨255,1,1,.second,.plus,8⟩,⟨16353,1,31,.first,.plus,14⟩,⟨2009,31,255,.second,.plus,3⟩]⟩,
  ⟨[2009, 32707], [⟨3,1,1,.second,.plus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨35,1,3,.first,.reverseMinus,5⟩,⟨32707,3,511,.second,.reverseMinus,6⟩,⟨2009,511,35,.first,.plus,2⟩]⟩,
  ⟨[2011, 6195], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨2047,1,1,.second,.plus,11⟩,⟨4103,9,2047,.second,.reverseMinus,1⟩,⟨2011,9,2047,.first,.minus,2⟩,⟨6195,4103,2011,.first,.plus,1⟩]⟩,
  ⟨[2015, 15881], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨15881,9,31,.second,.reverseMinus,9⟩,⟨2015,31,31,.second,.reverseMinus,6⟩]⟩,
  ⟨[2015, 31761], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨31,1,1,.second,.plus,5⟩,⟨31761,17,31,.second,.reverseMinus,10⟩,⟨2015,31,31,.second,.reverseMinus,6⟩]⟩,
  ⟨[2019, 28511], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨223,1,33,.first,.plus,8⟩,⟨2019,33,513,.second,.plus,2⟩,⟨28511,33,223,.second,.plus,7⟩]⟩,
  ⟨[2021, 5305], [⟨7,1,1,.second,.plus,3⟩,⟨27,1,7,.second,.plus,2⟩,⟨3577,7,7,.second,.plus,9⟩,⟨2021,1,27,.first,.plus,11⟩,⟨5305,27,3577,.first,.reverseMinus,6⟩]⟩,
  ⟨[2023, 2553], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨505,1,7,.first,.plus,9⟩,⟨2553,1,505,.first,.reverseMinus,11⟩,⟨2023,3,505,.second,.reverseMinus,2⟩]⟩,
  ⟨[2023, 5107], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨1011,3,63,.second,.reverseMinus,4⟩,⟨2023,1,1011,.second,.reverseMinus,1⟩,⟨5107,1,1011,.first,.reverseMinus,12⟩]⟩,
  ⟨[2027, 15875], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨509,1,3,.first,.plus,9⟩,⟨15875,1,509,.first,.plus,14⟩,⟨2027,9,509,.second,.plus,2⟩]⟩,
  ⟨[2027, 31749], [⟨3,1,1,.second,.plus,2⟩,⟨63,1,1,.second,.plus,6⟩,⟨507,3,63,.second,.reverseMinus,3⟩,⟨2027,1,507,.second,.plus,2⟩,⟨31749,63,507,.first,.plus,9⟩]⟩,
  ⟨[2029, 4459], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨1215,1,19,.second,.plus,6⟩,⟨2029,1,19,.first,.plus,11⟩,⟨4459,1215,2029,.first,.reverseMinus,1⟩]⟩,
  ⟨[2031, 2105], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨2031,1,17,.first,.plus,11⟩,⟨37,3,17,.second,.reverseMinus,1⟩,⟨2105,2031,37,.second,.reverseMinus,1⟩]⟩,
  ⟨[2031, 4211], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨545,1,17,.second,.reverseMinus,5⟩,⟨2031,1,17,.first,.plus,11⟩,⟨4211,545,2031,.first,.reverseMinus,2⟩]⟩,
  ⟨[2031, 8129], [⟨127,1,1,.second,.plus,7⟩,⟨2031,1,127,.second,.plus,4⟩,⟨8129,1,127,.second,.reverseMinus,6⟩]⟩,
  ⟨[2031, 32515], [⟨3,1,1,.second,.plus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨2031,1,127,.second,.plus,4⟩,⟨32515,3,127,.second,.reverseMinus,8⟩]⟩,
  ⟨[2033, 3961], [⟨15,1,1,.second,.plus,4⟩,⟨121,1,15,.second,.reverseMinus,3⟩,⟨2033,1,15,.first,.plus,11⟩,⟨3961,15,121,.first,.reverseMinus,8⟩]⟩,
  ⟨[2039, 3061], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨2039,5,511,.second,.plus,2⟩,⟨3061,511,2039,.first,.reverseMinus,1⟩]⟩,
  ⟨[2039, 3967], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨31,1,1,.second,.plus,5⟩,⟨2039,1,9,.first,.plus,11⟩,⟨3967,1,31,.second,.plus,7⟩]⟩,
  ⟨[2039, 31737], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨2039,1,9,.first,.plus,11⟩,⟨2111,9,2039,.first,.reverseMinus,3⟩,⟨31737,2039,2111,.second,.plus,4⟩]⟩,
  ⟨[2041, 2711], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨2041,1,255,.second,.reverseMinus,3⟩,⟨335,5,255,.first,.reverseMinus,4⟩,⟨2711,2041,335,.second,.reverseMinus,1⟩]⟩,
  ⟨[2055, 16255], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨16255,1,129,.first,.plus,14⟩,⟨2055,9,129,.second,.plus,4⟩]⟩,
  ⟨[2055, 32509], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨16383,1,1,.second,.plus,14⟩,⟨2055,1,257,.second,.plus,3⟩,⟨32509,257,16383,.second,.plus,1⟩]⟩,
  ⟨[2057, 28335], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨2057,1,2049,.first,.reverseMinus,3⟩,⟨1889,5,2049,.first,.minus,5⟩,⟨28335,1889,1889,.second,.plus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank18
