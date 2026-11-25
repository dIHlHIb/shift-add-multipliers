import Q15Upper
namespace Q15Bank16
open Q15Upper
def entries : List Entry := [
  ⟨[1715, 17911], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨35,1,9,.second,.plus,2⟩,⟨17911,9,35,.second,.plus,9⟩,⟨105,35,35,.second,.plus,2⟩,⟨1715,35,105,.second,.reverseMinus,4⟩]⟩,
  ⟨[1717, 14875], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨51,17,17,.second,.plus,2⟩,⟨2125,17,51,.first,.plus,7⟩,⟨1717,51,2125,.first,.minus,3⟩,⟨14875,2125,2125,.second,.plus,3⟩]⟩,
  ⟨[1717, 29749], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨101,3,5,.first,.reverseMinus,5⟩,⟨1717,101,101,.second,.reverseMinus,4⟩,⟨11211,101,1717,.first,.plus,7⟩,⟨29749,5,11211,.first,.plus,13⟩]⟩,
  ⟨[1721, 8009], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨119,1,9,.first,.plus,7⟩,⟨183,1,119,.first,.reverseMinus,6⟩,⟨8009,1,183,.first,.plus,13⟩,⟨1721,119,183,.first,.plus,4⟩]⟩,
  ⟨[1721, 32037], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨27,1,5,.first,.plus,5⟩,⟨437,5,27,.second,.reverseMinus,4⟩,⟨1721,27,437,.second,.plus,2⟩,⟨27941,27,437,.second,.plus,6⟩,⟨32037,1,27941,.first,.reverseMinus,12⟩]⟩,
  ⟨[1731, 4073], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨1731,3,27,.second,.reverseMinus,6⟩,⟨4073,1025,27,.first,.plus,2⟩]⟩,
  ⟨[1731, 32585], [⟨3,1,1,.second,.plus,2⟩,⟨8195,1,3,.first,.reverseMinus,13⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨1731,3,195,.first,.reverseMinus,9⟩,⟨32585,8195,195,.first,.plus,2⟩]⟩,
  ⟨[1737, 17361], [⟨3,1,1,.second,.plus,2⟩,⟨193,1,3,.second,.reverseMinus,6⟩,⟨1737,193,193,.second,.reverseMinus,3⟩,⟨1929,3,1737,.first,.reverseMinus,6⟩,⟨17361,1929,1929,.second,.reverseMinus,3⟩]⟩,
  ⟨[1755, 8445], [⟨3,1,1,.second,.plus,2⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨8445,3,33,.second,.plus,8⟩,⟨1755,27,27,.second,.reverseMinus,6⟩]⟩,
  ⟨[1755, 16889], [⟨7,1,1,.second,.plus,3⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨27,1,7,.second,.plus,2⟩,⟨16889,7,33,.second,.plus,9⟩,⟨1755,27,27,.second,.reverseMinus,6⟩]⟩,
  ⟨[1757, 29601], [⟨7,1,1,.second,.plus,3⟩,⟨897,1,7,.second,.reverseMinus,7⟩,⟨35,7,7,.second,.reverseMinus,2⟩,⟨29601,897,897,.second,.reverseMinus,5⟩,⟨1757,7,35,.first,.plus,8⟩]⟩,
  ⟨[1759, 2045], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨2047,1,1,.second,.plus,11⟩,⟨2045,1,2047,.first,.minus,1⟩,⟨1759,9,2047,.first,.minus,5⟩]⟩,
  ⟨[1759, 32721], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨47,1,3,.second,.plus,4⟩,⟨32721,1,47,.first,.plus,15⟩,⟨1759,255,47,.second,.reverseMinus,5⟩]⟩,
  ⟨[1763, 8337], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨641,1,5,.second,.reverseMinus,7⟩,⟨481,5,641,.first,.minus,5⟩,⟨8337,641,481,.second,.reverseMinus,4⟩,⟨1763,641,481,.first,.reverseMinus,1⟩]⟩,
  ⟨[1763, 16673], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨289,1,9,.second,.reverseMinus,5⟩,⟨16673,1,289,.first,.reverseMinus,14⟩,⟨1763,513,289,.first,.plus,2⟩]⟩,
  ⟨[1771, 2057], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨143,1,9,.second,.plus,4⟩,⟨2057,1,9,.first,.reverseMinus,11⟩,⟨1771,143,2057,.first,.minus,1⟩]⟩,
  ⟨[1771, 16457], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨4051,3,253,.second,.reverseMinus,4⟩,⟨1771,253,253,.second,.plus,3⟩,⟨16457,253,4051,.second,.reverseMinus,2⟩]⟩,
  ⟨[1781, 16287], [⟨255,1,1,.second,.plus,8⟩,⟨509,1,255,.second,.plus,1⟩,⟨16287,1,509,.second,.plus,5⟩,⟨1781,255,509,.second,.plus,2⟩]⟩,
  ⟨[1781, 32573], [⟨3,1,1,.second,.plus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨509,1,3,.first,.plus,9⟩,⟨32573,3,509,.second,.plus,6⟩,⟨1781,255,509,.second,.plus,2⟩]⟩,
  ⟨[1785, 16063], [⟨7,1,1,.second,.plus,3⟩,⟨1785,7,7,.second,.plus,8⟩,⟨7139,1,1785,.second,.plus,2⟩,⟨16063,1785,7139,.second,.reverseMinus,1⟩]⟩,
  ⟨[1791, 14735], [⟨7,1,1,.second,.plus,3⟩,⟨33,1,1,.second,.reverseMinus,5⟩,⟨1791,1,7,.second,.plus,8⟩,⟨2105,7,33,.second,.plus,6⟩,⟨14735,2105,2105,.second,.plus,3⟩]⟩,
  ⟨[1791, 29469], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨1791,1,7,.second,.plus,8⟩,⟨893,3,7,.second,.plus,7⟩,⟨29469,893,893,.second,.reverseMinus,5⟩]⟩,
  ⟨[1795, 7993], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨125,1,3,.first,.plus,7⟩,⟨1795,3,7,.second,.reverseMinus,8⟩,⟨7993,7,125,.second,.plus,6⟩]⟩,
  ⟨[1795, 31971], [⟨63,1,1,.second,.plus,6⟩,⟨253,1,63,.second,.reverseMinus,2⟩,⟨1007,1,63,.second,.plus,4⟩,⟨1795,1,253,.first,.plus,11⟩,⟨31971,253,1007,.second,.plus,5⟩]⟩,
  ⟨[1807, 3995], [⟨3,1,1,.second,.plus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨1999,3,2047,.first,.minus,4⟩,⟨3995,3,1999,.second,.plus,1⟩,⟨1807,3,1999,.first,.minus,6⟩]⟩,
  ⟨[1807, 31961], [⟨7,1,1,.second,.plus,3⟩,⟨15,1,1,.second,.plus,4⟩,⟨1031,1,7,.first,.reverseMinus,10⟩,⟨1807,7,15,.first,.reverseMinus,8⟩,⟨31961,1031,1031,.second,.plus,5⟩]⟩,
  ⟨[1809, 16359], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨201,1,25,.second,.reverseMinus,3⟩,⟨16359,1,25,.first,.plus,14⟩,⟨1809,201,201,.second,.reverseMinus,3⟩]⟩,
  ⟨[1809, 32719], [⟨3,1,1,.second,.plus,2⟩,⟨1025,1,1,.second,.reverseMinus,10⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨32719,1,49,.first,.plus,15⟩,⟨1809,1025,49,.second,.reverseMinus,4⟩]⟩,
  ⟨[1815, 3795], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨165,5,5,.second,.reverseMinus,5⟩,⟨1325,5,165,.second,.reverseMinus,3⟩,⟨3795,5,1325,.first,.plus,10⟩,⟨1815,165,3795,.output,.reverseMinus,1⟩]⟩,
  ⟨[1815, 15181], [⟨129,1,1,.second,.reverseMinus,7⟩,⟨121,1,129,.first,.minus,3⟩,⟨4249,129,121,.first,.reverseMinus,5⟩,⟨1815,121,121,.second,.plus,4⟩,⟨15181,4249,1815,.first,.plus,2⟩]⟩,
  ⟨[1819, 1835], [⟨7,1,1,.second,.plus,3⟩,⟨27,1,7,.second,.plus,2⟩,⟨1819,7,27,.first,.reverseMinus,8⟩,⟨1835,1,1819,.first,.reverseMinus,4⟩]⟩,
  ⟨[1819, 29359], [⟨7,1,1,.second,.plus,3⟩,⟨255,1,1,.second,.plus,8⟩,⟨27,1,7,.second,.plus,2⟩,⟨1819,7,27,.first,.reverseMinus,8⟩,⟨29359,255,1819,.second,.reverseMinus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank16
