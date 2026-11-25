import Q15Upper
namespace Q15Bank31
open Q15Upper
def entries : List Entry := [
  ⟨[4587, 31457], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨31,1,1,.second,.plus,5⟩,⟨287,1,31,.first,.reverseMinus,8⟩,⟨4587,5,287,.second,.plus,4⟩,⟨31457,31,287,.first,.plus,10⟩]⟩,
  ⟨[4593, 13567], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨71,1,9,.second,.plus,3⟩,⟨4609,1,9,.second,.reverseMinus,9⟩,⟨4593,1,4609,.first,.minus,4⟩,⟨13567,71,4609,.first,.plus,8⟩]⟩,
  ⟨[4593, 27133], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨5635,3,11,.second,.reverseMinus,9⟩,⟨27133,1,5635,.first,.plus,15⟩,⟨4593,5635,27133,.first,.minus,2⟩]⟩,
  ⟨[4609, 16221], [⟨3,1,1,.second,.plus,2⟩,⟨513,1,1,.second,.reverseMinus,9⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨4609,1,513,.first,.reverseMinus,12⟩,⟨16221,513,195,.first,.plus,5⟩]⟩,
  ⟨[4609, 32443], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨507,1,5,.first,.plus,9⟩,⟨4609,1,9,.second,.reverseMinus,9⟩,⟨32443,5,507,.second,.plus,6⟩]⟩,
  ⟨[4645, 26991], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨17,1,1,.second,.reverseMinus,4⟩,⟨145,1,17,.first,.reverseMinus,7⟩,⟨4645,5,145,.second,.reverseMinus,5⟩,⟨8997,17,4645,.first,.reverseMinus,8⟩,⟨26991,8997,8997,.second,.plus,2⟩]⟩,
  ⟨[4655, 6741], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨47,1,3,.second,.plus,4⟩,⟨4655,9,47,.first,.reverseMinus,9⟩,⟨749,3,47,.second,.plus,4⟩,⟨6741,749,749,.second,.reverseMinus,3⟩]⟩,
  ⟨[4655, 26963], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨211,1,45,.first,.plus,8⟩,⟨26963,45,211,.second,.plus,7⟩,⟨931,45,211,.first,.reverseMinus,4⟩,⟨4655,931,931,.second,.reverseMinus,2⟩]⟩,
  ⟨[4659, 8109], [⟨3,1,1,.second,.plus,2⟩,⟨515,1,3,.first,.reverseMinus,9⟩,⟨539,3,515,.first,.reverseMinus,3⟩,⟨8109,515,539,.second,.plus,4⟩,⟨4659,515,539,.first,.reverseMinus,3⟩]⟩,
  ⟨[4659, 32435], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨4659,9,51,.first,.reverseMinus,9⟩,⟨333,3,51,.first,.plus,7⟩,⟨32435,1,333,.first,.plus,15⟩]⟩,
  ⟨[4709, 8107], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨545,1,17,.second,.reverseMinus,5⟩,⟨613,17,545,.first,.reverseMinus,2⟩,⟨4709,1,613,.first,.reverseMinus,12⟩,⟨8107,545,613,.first,.plus,4⟩]⟩,
  ⟨[4709, 32427], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨273,1,17,.second,.reverseMinus,4⟩,⟨341,17,273,.first,.reverseMinus,2⟩,⟨32427,1,341,.first,.plus,15⟩,⟨4709,273,341,.first,.reverseMinus,4⟩]⟩,
  ⟨[4717, 13395], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨83,3,13,.first,.plus,5⟩,⟨13395,13,83,.first,.reverseMinus,10⟩,⟨2669,13,83,.second,.reverseMinus,5⟩,⟨4717,1,2669,.first,.reverseMinus,11⟩]⟩,
  ⟨[4717, 26791], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨13,1,5,.first,.reverseMinus,3⟩,⟨147,5,13,.first,.plus,5⟩,⟨4717,13,147,.second,.reverseMinus,5⟩,⟨26771,13,147,.first,.reverseMinus,11⟩,⟨26791,5,26771,.first,.reverseMinus,2⟩]⟩,
  ⟨[4759, 8105], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨67,1,65,.first,.reverseMinus,1⟩,⟨471,65,67,.second,.plus,3⟩,⟨4759,67,471,.first,.reverseMinus,6⟩,⟨8105,67,471,.first,.plus,7⟩]⟩,
  ⟨[4759, 32421], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨511,1,1,.second,.plus,9⟩,⟨531,5,511,.first,.reverseMinus,2⟩,⟨4759,511,531,.second,.reverseMinus,3⟩,⟨37541,531,4759,.second,.plus,3⟩,⟨32421,5,37541,.first,.minus,10⟩]⟩,
  ⟨[4799, 13279], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨255,1,1,.second,.plus,8⟩,⟨5119,1,5,.second,.plus,10⟩,⟨4799,5,5119,.first,.minus,6⟩,⟨13279,255,5119,.first,.reverseMinus,5⟩]⟩,
  ⟨[4799, 26557], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨67,1,3,.first,.reverseMinus,6⟩,⟨26557,13,67,.first,.plus,11⟩,⟨75,1,67,.first,.reverseMinus,3⟩,⟨4799,1,75,.second,.plus,6⟩]⟩,
  ⟨[4809, 16207], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨201,3,9,.first,.reverseMinus,6⟩,⟨4809,9,201,.first,.reverseMinus,9⟩,⟨177,3,201,.first,.minus,3⟩,⟨16207,1,177,.first,.plus,14⟩]⟩,
  ⟨[4809, 26527], [⟨3,1,1,.second,.plus,2⟩,⟨195,3,3,.second,.reverseMinus,6⟩,⟨6241,1,195,.second,.reverseMinus,5⟩,⟨26527,1,6241,.first,.plus,15⟩,⟨4681,195,6241,.first,.minus,3⟩,⟨4809,1,4681,.first,.reverseMinus,7⟩]⟩,
  ⟨[4809, 32413], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨355,3,11,.second,.reverseMinus,5⟩,⟨32413,1,355,.first,.plus,15⟩,⟨713,3,355,.second,.reverseMinus,1⟩,⟨4809,1,713,.first,.reverseMinus,12⟩]⟩,
  ⟨[4819, 13249], [⟨3,1,1,.second,.plus,2⟩,⟨15,1,1,.second,.plus,4⟩,⟨961,1,15,.second,.reverseMinus,6⟩,⟨13249,3,961,.first,.reverseMinus,12⟩,⟨1201,15,961,.first,.reverseMinus,4⟩,⟨4819,15,1201,.second,.reverseMinus,2⟩]⟩,
  ⟨[4819, 26499], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨125,1,3,.first,.plus,7⟩,⟨26499,13,125,.first,.plus,11⟩,⟨151,13,125,.first,.reverseMinus,1⟩,⟨4819,13,151,.second,.plus,5⟩]⟩,
  ⟨[4857, 16203], [⟨3,1,1,.second,.plus,2⟩,⟨45,3,3,.second,.plus,4⟩,⟨16383,1,1,.second,.plus,14⟩,⟨16203,45,16383,.first,.minus,2⟩,⟨4863,45,16383,.first,.minus,8⟩,⟨4857,3,4863,.first,.minus,1⟩]⟩,
  ⟨[4857, 32405], [⟨3,1,1,.second,.plus,2⟩,⟨387,3,3,.second,.reverseMinus,7⟩,⟨4099,1,3,.first,.reverseMinus,12⟩,⟨32405,387,4099,.second,.plus,3⟩,⟨4873,387,4099,.first,.reverseMinus,1⟩,⟨4857,1,4873,.first,.minus,4⟩]⟩,
  ⟨[4907, 16199], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨253,1,3,.first,.plus,8⟩,⟨16199,7,253,.second,.reverseMinus,6⟩,⟨701,7,253,.first,.reverseMinus,6⟩,⟨4907,701,701,.second,.plus,3⟩]⟩,
  ⟨[4907, 32399], [⟨3,1,1,.second,.plus,2⟩,⟨93,3,3,.second,.plus,5⟩,⟨369,3,93,.second,.plus,2⟩,⟨32399,1,369,.first,.plus,15⟩,⟨2859,93,369,.second,.plus,3⟩,⟨4907,1,2859,.first,.reverseMinus,11⟩]⟩,
  ⟨[4957, 16195], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨155,5,5,.second,.plus,5⟩,⟨4957,3,155,.second,.plus,5⟩,⟨189,3,3,.second,.plus,6⟩,⟨16195,1,189,.first,.plus,14⟩]⟩,
  ⟨[4957, 32391], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨377,3,7,.first,.plus,7⟩,⟨32391,1,377,.first,.plus,15⟩,⟨1885,377,377,.second,.reverseMinus,2⟩,⟨4957,3,1885,.first,.reverseMinus,10⟩]⟩,
  ⟨[5007, 32383], [⟨3,1,1,.second,.plus,2⟩,⟨385,1,3,.second,.reverseMinus,7⟩,⟨32383,1,385,.first,.plus,15⟩,⟨337,3,385,.first,.minus,4⟩,⟨5007,385,337,.second,.plus,4⟩]⟩,
  ⟨[5057, 32375], [⟨7,1,1,.second,.plus,3⟩,⟨505,1,7,.first,.plus,9⟩,⟨4047,7,505,.second,.reverseMinus,3⟩,⟨32375,1,4047,.second,.plus,3⟩,⟨5057,505,4047,.first,.reverseMinus,1⟩]⟩,
  ⟨[5099, 12823], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨41,1,5,.second,.reverseMinus,3⟩,⟨10199,5,41,.first,.plus,11⟩,⟨5099,1,10199,.output,.reverseMinus,1⟩,⟨12823,41,10199,.first,.reverseMinus,6⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank31
