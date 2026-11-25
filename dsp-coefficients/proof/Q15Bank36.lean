import Q15Upper
namespace Q15Bank36
open Q15Upper
def entries : List Entry := [
  ⟨[6177, 15175], [⟨63,1,1,.second,.plus,6⟩,⟨2015,1,63,.second,.plus,5⟩,⟨945,63,63,.second,.plus,4⟩,⟨6177,1,2015,.first,.plus,13⟩,⟨15175,2015,945,.first,.plus,3⟩]⟩,
  ⟨[6177, 30351], [⟨63,1,1,.second,.plus,6⟩,⟨2015,1,63,.second,.plus,5⟩,⟨6177,1,2015,.first,.plus,13⟩,⟨16183,63,2015,.second,.reverseMinus,3⟩,⟨30351,2015,16183,.second,.plus,1⟩]⟩,
  ⟨[6195, 10721], [⟨3,1,1,.second,.plus,2⟩,⟨13,1,3,.second,.reverseMinus,2⟩,⟨97,1,3,.second,.reverseMinus,5⟩,⟨6195,13,97,.second,.plus,6⟩,⟨1567,13,97,.first,.plus,7⟩,⟨10721,3,1567,.first,.plus,12⟩]⟩,
  ⟨[6195, 21441], [⟨3,1,1,.second,.plus,2⟩,⟨9,1,1,.second,.reverseMinus,3⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨6195,3,51,.first,.reverseMinus,11⟩,⟨3063,3,9,.first,.plus,10⟩,⟨21441,3063,3063,.second,.plus,3⟩]⟩,
  ⟨[6195, 32177], [⟨511,1,1,.second,.plus,9⟩,⟨2043,1,511,.second,.plus,2⟩,⟨519,1,511,.first,.reverseMinus,3⟩,⟨32177,511,2043,.second,.plus,4⟩,⟨6195,2043,519,.second,.reverseMinus,3⟩]⟩,
  ⟨[6203, 21403], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨6203,3,59,.first,.reverseMinus,11⟩,⟨21307,59,6203,.first,.reverseMinus,8⟩,⟨21403,3,21307,.first,.reverseMinus,5⟩]⟩,
  ⟨[6223, 30313], [⟨15,1,1,.second,.plus,4⟩,⟨49,1,15,.first,.plus,6⟩,⟨30705,15,15,.second,.plus,11⟩,⟨6223,49,49,.second,.plus,7⟩,⟨30313,49,30705,.first,.minus,3⟩]⟩,
  ⟨[6245, 32167], [⟨3,1,1,.second,.plus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨793,1,99,.second,.reverseMinus,3⟩,⟨6245,99,793,.second,.plus,3⟩,⟨601,3,793,.first,.minus,6⟩,⟨32167,1,601,.first,.plus,15⟩]⟩,
  ⟨[6247, 7573], [⟨7,1,1,.second,.plus,3⟩,⟨135,1,7,.first,.reverseMinus,7⟩,⟨1927,7,135,.first,.reverseMinus,8⟩,⟨7573,135,1927,.second,.plus,2⟩,⟨6247,135,1927,.first,.reverseMinus,5⟩]⟩,
  ⟨[6247, 30293], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨165,5,5,.second,.reverseMinus,5⟩,⟨1883,1,165,.first,.plus,11⟩,⟨30293,165,1883,.second,.reverseMinus,4⟩,⟨1563,5,1883,.first,.minus,6⟩,⟨6247,5,1563,.second,.plus,2⟩]⟩,
  ⟨[6293, 15127], [⟨3,1,1,.second,.plus,2⟩,⟨21,3,3,.second,.plus,3⟩,⟨49,1,3,.second,.reverseMinus,4⟩,⟨6293,21,49,.second,.reverseMinus,7⟩,⟨6377,21,6293,.first,.reverseMinus,2⟩,⟨15127,21,6377,.first,.plus,10⟩]⟩,
  ⟨[6293, 30255], [⟨15,1,1,.second,.plus,4⟩,⟨945,15,15,.second,.plus,6⟩,⟨9137,1,945,.first,.reverseMinus,13⟩,⟨30255,15,945,.second,.reverseMinus,5⟩,⟨6293,9137,30255,.first,.plus,2⟩]⟩,
  ⟨[6295, 16079], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨151,1,19,.second,.plus,3⟩,⟨6295,3,151,.first,.reverseMinus,11⟩,⟨305,1,19,.second,.reverseMinus,4⟩,⟨16079,1,305,.first,.plus,14⟩]⟩,
  ⟨[6295, 32157], [⟨3,1,1,.second,.plus,2⟩,⟨19,1,3,.first,.reverseMinus,4⟩,⟨151,1,19,.second,.plus,3⟩,⟨6295,3,151,.first,.reverseMinus,11⟩,⟨611,3,19,.second,.reverseMinus,5⟩,⟨32157,1,611,.first,.plus,15⟩]⟩,
  ⟨[6339, 30215], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨59,3,7,.second,.reverseMinus,3⟩,⟨30215,7,59,.second,.reverseMinus,9⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨6339,3,99,.second,.reverseMinus,6⟩]⟩,
  ⟨[6343, 8037], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨6343,7,99,.second,.reverseMinus,6⟩,⟨155,7,99,.first,.reverseMinus,3⟩,⟨8037,1,155,.first,.plus,13⟩]⟩,
  ⟨[6343, 32149], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨39,1,5,.second,.plus,3⟩,⟨2009,1,39,.first,.plus,11⟩,⟨32149,5,2009,.second,.reverseMinus,4⟩,⟨1849,5,2009,.first,.minus,5⟩,⟨6343,1,1849,.first,.plus,13⟩]⟩,
  ⟨[6363, 7549], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨59,1,5,.first,.plus,6⟩,⟨7549,3,59,.second,.plus,7⟩,⟨1829,59,59,.second,.plus,5⟩,⟨6363,1,1829,.first,.plus,13⟩]⟩,
  ⟨[6363, 30197], [⟨3,1,1,.second,.plus,2⟩,⟨11,1,3,.second,.plus,2⟩,⟨59,3,11,.first,.reverseMinus,4⟩,⟨30197,11,59,.second,.plus,9⟩,⟨1829,59,59,.second,.plus,5⟩,⟨6363,1,1829,.first,.plus,13⟩]⟩,
  ⟨[6393, 16069], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨16069,5,251,.second,.reverseMinus,6⟩,⟨6395,3,251,.first,.reverseMinus,11⟩,⟨6393,1,6395,.first,.minus,1⟩]⟩,
  ⟨[6393, 32139], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨199,1,25,.second,.plus,3⟩,⟨6393,25,199,.second,.reverseMinus,5⟩,⟨7985,199,6393,.first,.reverseMinus,3⟩,⟨32139,199,7985,.second,.reverseMinus,2⟩]⟩,
  ⟨[6409, 7539], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨377,3,7,.first,.plus,7⟩,⟨6409,377,377,.second,.reverseMinus,4⟩,⟨1885,377,377,.second,.reverseMinus,2⟩,⟨7539,1,1885,.second,.plus,2⟩]⟩,
  ⟨[6409, 30157], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨377,3,7,.first,.plus,7⟩,⟨6409,377,377,.second,.reverseMinus,4⟩,⟨1885,377,377,.second,.reverseMinus,2⟩,⟨30157,3,1885,.second,.plus,4⟩]⟩,
  ⟨[6427, 10159], [⟨3,1,1,.second,.plus,2⟩,⟨25,1,3,.second,.reverseMinus,3⟩,⟨803,3,25,.second,.reverseMinus,5⟩,⟨6427,3,803,.second,.reverseMinus,3⟩,⟨4015,803,803,.second,.reverseMinus,2⟩,⟨10159,3,4015,.first,.reverseMinus,11⟩]⟩,
  ⟨[6427, 20319], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨161,1,5,.second,.reverseMinus,5⟩,⟨1275,5,5,.second,.plus,8⟩,⟨20319,5,161,.first,.plus,12⟩,⟨6427,161,1275,.first,.reverseMinus,5⟩]⟩,
  ⟨[6435, 10139], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨6435,99,99,.second,.reverseMinus,6⟩,⟨10141,5,99,.first,.plus,11⟩,⟨10139,1,10141,.first,.minus,1⟩]⟩,
  ⟨[6435, 20279], [⟨3,1,1,.second,.plus,2⟩,⟨5,1,1,.second,.reverseMinus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨6435,99,99,.second,.reverseMinus,6⟩,⟨10141,5,99,.first,.plus,11⟩,⟨20279,3,10141,.second,.plus,1⟩]⟩,
  ⟨[6443, 32129], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨251,1,5,.first,.plus,8⟩,⟨32129,1,251,.second,.reverseMinus,7⟩,⟨379,1,251,.first,.reverseMinus,7⟩,⟨6443,379,379,.second,.reverseMinus,4⟩]⟩,
  ⟨[6455, 15059], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨45,5,5,.second,.reverseMinus,3⟩,⟨1325,5,45,.first,.reverseMinus,8⟩,⟨15059,1,1325,.first,.plus,14⟩,⟨1335,5,1325,.first,.reverseMinus,1⟩,⟨6455,5,1335,.first,.reverseMinus,10⟩]⟩,
  ⟨[6455, 30117], [⟨7,1,1,.second,.plus,3⟩,⟨13,1,7,.second,.plus,1⟩,⟨201,7,13,.second,.plus,4⟩,⟨6455,13,201,.first,.plus,9⟩,⟨26021,201,6455,.second,.reverseMinus,2⟩,⟨30117,1,26021,.first,.reverseMinus,12⟩]⟩,
  ⟨[6489, 10001], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨145,1,9,.second,.reverseMinus,4⟩,⟨721,9,145,.first,.reverseMinus,6⟩,⟨10001,145,721,.first,.reverseMinus,6⟩,⟨6489,721,721,.second,.reverseMinus,3⟩]⟩,
  ⟨[6489, 20001], [⟨3,1,1,.second,.plus,2⟩,⟨7,1,1,.second,.plus,3⟩,⟨103,3,7,.first,.reverseMinus,5⟩,⟨6489,103,103,.second,.plus,6⟩,⟨5665,103,6489,.first,.minus,3⟩,⟨20001,7,5665,.first,.reverseMinus,11⟩]⟩]
set_option maxRecDepth 100000
set_option maxHeartbeats 0
theorem checked : entries.all accepts = true := by decide +kernel
theorem feasible : ∀ e ∈ entries, MCM.Fits MCM.unbounded e.targets e.gates.length := bank_sound entries checked
end Q15Bank36
