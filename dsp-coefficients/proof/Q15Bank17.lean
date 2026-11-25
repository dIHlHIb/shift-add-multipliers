import Q15Upper
namespace Q15Bank17
open Q15Upper
def entries : List Entry := [
  ⟨[1831, 16281], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨27,1,5,.first,.plus,5⟩,⟨103,5,27,.second,.plus,2⟩,⟨16281,1,103,.first,.plus,14⟩,⟨1831,27,103,.first,.reverseMinus,6⟩]⟩,
  ⟨[1831, 32563], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨217,7,7,.second,.plus,5⟩,⟨1831,1,217,.first,.plus,11⟩,⟨205,3,217,.first,.minus,2⟩,⟨32563,1,205,.first,.plus,15⟩]⟩,
  ⟨[1835, 14553], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨71,1,9,.second,.plus,3⟩,⟨441,1,71,.first,.plus,9⟩,⟨1835,71,441,.second,.reverseMinus,2⟩,⟨14553,441,441,.second,.reverseMinus,5⟩]⟩,
  ⟨[1859, 8179], [⟨3,1,1,.second,.plus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨29,1,3,.first,.plus,5⟩,⟨1859,3,29,.second,.reverseMinus,6⟩,⟨8179,513,29,.first,.plus,4⟩]⟩,
  ⟨[1859, 32715], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨4093,1,3,.first,.plus,12⟩,⟨1859,3,29,.second,.reverseMinus,6⟩,⟨32715,29,4093,.second,.plus,3⟩]⟩,
  ⟨[1871, 3331], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨207,1,13,.second,.plus,4⟩,⟨3331,3,13,.second,.reverseMinus,8⟩,⟨1871,13,207,.first,.reverseMinus,7⟩]⟩,
  ⟨[1871, 13325], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨207,1,13,.second,.plus,4⟩,⟨13325,13,13,.second,.reverseMinus,10⟩,⟨1871,13,207,.first,.reverseMinus,7⟩]⟩,
  ⟨[1881, 4069], [⟨3,1,1,.second,.plus,2⟩,⟨27,3,3,.second,.reverseMinus,3⟩,⟨3455,1,27,.second,.plus,7⟩,⟨4069,1,27,.first,.plus,12⟩,⟨1881,3455,4069,.output,.plus,2⟩]⟩,
  ⟨[1881, 32551], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨145,1,9,.second,.reverseMinus,4⟩,⟨217,9,145,.first,.reverseMinus,3⟩,⟨32551,1,217,.first,.plus,15⟩,⟨1881,145,217,.second,.reverseMinus,3⟩]⟩,
  ⟨[1893, 15941], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨137,1,9,.first,.reverseMinus,7⟩,⟨439,9,137,.first,.plus,6⟩,⟨1893,137,439,.second,.reverseMinus,2⟩,⟨15941,439,1893,.first,.reverseMinus,5⟩]⟩,
  ⟨[1893, 31881], [⟨63,1,1,.second,.plus,6⟩,⟨127,1,1,.second,.plus,7⟩,⟨631,63,127,.first,.reverseMinus,3⟩,⟨31881,127,631,.first,.plus,8⟩,⟨1893,631,631,.second,.plus,2⟩]⟩,
  ⟨[1903, 3627], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨145,1,9,.second,.reverseMinus,4⟩,⟨1903,1,145,.first,.plus,11⟩,⟨431,9,145,.first,.plus,6⟩,⟨3627,1903,431,.second,.reverseMinus,2⟩]⟩,
  ⟨[1903, 29017], [⟨15,1,1,.second,.plus,4⟩,⟨59,1,15,.second,.plus,2⟩,⟨1903,15,59,.second,.reverseMinus,5⟩,⟨3865,59,1903,.second,.reverseMinus,1⟩,⟨29017,1903,3865,.second,.plus,3⟩]⟩,
  ⟨[1905, 3007], [⟨15,1,1,.second,.plus,4⟩,⟨2047,1,1,.second,.plus,11⟩,⟨1905,15,15,.second,.plus,7⟩,⟨3007,15,2047,.first,.reverseMinus,6⟩]⟩,
  ⟨[1905, 12027], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨8187,1,5,.first,.plus,13⟩,⟨1905,15,15,.second,.plus,7⟩,⟨12027,15,8187,.first,.reverseMinus,8⟩]⟩,
  ⟨[1905, 15935], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨127,1,1,.second,.plus,7⟩,⟨321,1,5,.second,.reverseMinus,6⟩,⟨1905,127,127,.second,.plus,4⟩,⟨15935,127,321,.first,.plus,7⟩]⟩,
  ⟨[1905, 31869], [⟨15,1,1,.second,.plus,4⟩,⟨31,1,1,.second,.plus,5⟩,⟨1905,15,15,.second,.plus,7⟩,⟨125,1,31,.second,.reverseMinus,2⟩,⟨31869,31,125,.first,.reverseMinus,10⟩]⟩,
  ⟨[1909, 4089], [⟨3,1,1,.second,.plus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨2045,1,3,.first,.plus,11⟩,⟨4089,1,2045,.second,.plus,1⟩,⟨1909,17,2045,.first,.minus,3⟩]⟩,
  ⟨[1909, 32713], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨511,1,1,.second,.plus,9⟩,⟨135,9,9,.second,.plus,4⟩,⟨32713,9,511,.second,.reverseMinus,6⟩,⟨1909,511,135,.first,.plus,2⟩]⟩,
  ⟨[1913, 2925], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨45,3,3,.second,.plus,4⟩,⟨2925,45,45,.second,.reverseMinus,6⟩,⟨1913,253,2925,.first,.minus,2⟩]⟩,
  ⟨[1913, 11699], [⟨127,1,1,.second,.plus,7⟩,⟨255,1,1,.second,.plus,8⟩,⟨1913,127,255,.second,.plus,3⟩,⟨7873,127,255,.first,.plus,6⟩,⟨11699,1913,7873,.first,.reverseMinus,1⟩]⟩,
  ⟨[1931, 8135], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨121,1,129,.first,.minus,3⟩,⟨1931,5,121,.second,.plus,4⟩,⟨8135,129,121,.first,.plus,6⟩]⟩,
  ⟨[1931, 32539], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨119,1,9,.first,.plus,7⟩,⟨1913,9,119,.second,.reverseMinus,4⟩,⟨1931,9,1913,.first,.reverseMinus,1⟩,⟨32539,1913,1931,.first,.reverseMinus,4⟩]⟩,
  ⟨[1953, 7201], [⟨31,1,1,.second,.plus,5⟩,⟨991,1,31,.second,.plus,5⟩,⟨1953,31,31,.second,.plus,6⟩,⟨7201,1,991,.first,.plus,13⟩]⟩,
  ⟨[1953, 28803], [⟨3,1,1,.second,.plus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨225,1,31,.first,.plus,8⟩,⟨1953,31,31,.second,.plus,6⟩,⟨28803,3,225,.second,.reverseMinus,7⟩]⟩,
  ⟨[1957, 9657], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨1925,385,385,.second,.reverseMinus,2⟩,⟨1957,1,1925,.first,.reverseMinus,5⟩,⟨9657,1925,1957,.first,.reverseMinus,2⟩]⟩,
  ⟨[1959, 16355], [⟨7,1,1,.second,.plus,3⟩,⟨29,1,7,.second,.reverseMinus,2⟩,⟨1031,1,7,.first,.reverseMinus,10⟩,⟨16355,1,29,.first,.plus,14⟩,⟨1959,29,1031,.first,.reverseMinus,5⟩]⟩,
  ⟨[1959, 32709], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨85,5,5,.second,.reverseMinus,4⟩,⟨32709,5,511,.second,.reverseMinus,6⟩,⟨1959,511,85,.first,.plus,2⟩]⟩,
  ⟨[1967, 4563], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2047,1,1,.second,.plus,11⟩,⟨507,1,5,.first,.plus,9⟩,⟨1967,5,2047,.first,.minus,4⟩,⟨4563,507,507,.second,.reverseMinus,3⟩]⟩,
  ⟨[1967, 9127], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨1023,1,1,.second,.plus,10⟩,⟨943,5,1023,.first,.minus,4⟩,⟨1967,1,943,.first,.reverseMinus,10⟩,⟨9127,1023,943,.first,.reverseMinus,3⟩]⟩,
  ⟨[1973, 2197], [⟨3,1,1,.second,.plus,2⟩,⟨259,1,3,.first,.reverseMinus,8⟩,⟨2069,3,259,.second,.plus,3⟩,⟨2197,1,2069,.first,.reverseMinus,7⟩,⟨1973,3,2069,.first,.minus,5⟩]⟩,
  ⟨[1973, 8789], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨123,1,5,.first,.plus,7⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨1973,5,123,.second,.reverseMinus,4⟩,⟨8789,517,517,.second,.reverseMinus,4⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank17
