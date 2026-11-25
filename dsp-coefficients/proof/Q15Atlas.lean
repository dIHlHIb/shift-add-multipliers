import Q15Bank00
import Q15Bank01
import Q15Bank02
import Q15Bank03
import Q15Bank04
import Q15Bank05
import Q15Bank06
import Q15Bank07
import Q15Bank08
import Q15Bank09
import Q15Bank10
import Q15Bank11
import Q15Bank12
import Q15Bank13
import Q15Bank14
import Q15Bank15
import Q15Bank16
import Q15Bank17
import Q15Bank18
import Q15Bank19
import Q15Bank20
import Q15Bank21
import Q15Bank22
import Q15Bank23
import Q15Bank24
import Q15Bank25
import Q15Bank26
import Q15Bank27
import Q15Bank28
import Q15Bank29
import Q15Bank30
import Q15Bank31
import Q15Bank32
import Q15Bank33
import Q15Bank34
import Q15Bank35
import Q15Bank36
import Q15Bank37
import Q15Bank38
import Q15Bank39
import Q15Bank40
import Q15Bank41
import Q15Bank42
import Q15Bank43
import Q15Bank44
import Q15Bank45
import Q15Bank46
import Q15Bank47
import Q15Bank48
import Q15Bank49
import Q15Bank50
import Q15Bank51
import Q15Bank52
import Q15Bank53
import Q15Bank54
import Q15Bank55
import Q15Bank56
import Q15Bank57
import Q15Bank58
import Q15Bank59
import Q15Bank60
import Q15Bank61
import Q15Bank62
import Q15Bank63
namespace Q15Atlas
open Q15Upper
def banks : List (List Entry) := [Q15Bank00.entries,Q15Bank01.entries,Q15Bank02.entries,Q15Bank03.entries,Q15Bank04.entries,Q15Bank05.entries,Q15Bank06.entries,Q15Bank07.entries,Q15Bank08.entries,Q15Bank09.entries,Q15Bank10.entries,Q15Bank11.entries,Q15Bank12.entries,Q15Bank13.entries,Q15Bank14.entries,Q15Bank15.entries,Q15Bank16.entries,Q15Bank17.entries,Q15Bank18.entries,Q15Bank19.entries,Q15Bank20.entries,Q15Bank21.entries,Q15Bank22.entries,Q15Bank23.entries,Q15Bank24.entries,Q15Bank25.entries,Q15Bank26.entries,Q15Bank27.entries,Q15Bank28.entries,Q15Bank29.entries,Q15Bank30.entries,Q15Bank31.entries,Q15Bank32.entries,Q15Bank33.entries,Q15Bank34.entries,Q15Bank35.entries,Q15Bank36.entries,Q15Bank37.entries,Q15Bank38.entries,Q15Bank39.entries,Q15Bank40.entries,Q15Bank41.entries,Q15Bank42.entries,Q15Bank43.entries,Q15Bank44.entries,Q15Bank45.entries,Q15Bank46.entries,Q15Bank47.entries,Q15Bank48.entries,Q15Bank49.entries,Q15Bank50.entries,Q15Bank51.entries,Q15Bank52.entries,Q15Bank53.entries,Q15Bank54.entries,Q15Bank55.entries,Q15Bank56.entries,Q15Bank57.entries,Q15Bank58.entries,Q15Bank59.entries,Q15Bank60.entries,Q15Bank61.entries,Q15Bank62.entries,Q15Bank63.entries]
theorem each_checked : ∀ b ∈ banks, b.all accepts = true := by
  intro b hb
  simp only [banks,List.mem_cons,List.not_mem_nil,or_false] at hb
  rcases hb with h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h | h
  · simpa only [h] using Q15Bank00.checked
  · simpa only [h] using Q15Bank01.checked
  · simpa only [h] using Q15Bank02.checked
  · simpa only [h] using Q15Bank03.checked
  · simpa only [h] using Q15Bank04.checked
  · simpa only [h] using Q15Bank05.checked
  · simpa only [h] using Q15Bank06.checked
  · simpa only [h] using Q15Bank07.checked
  · simpa only [h] using Q15Bank08.checked
  · simpa only [h] using Q15Bank09.checked
  · simpa only [h] using Q15Bank10.checked
  · simpa only [h] using Q15Bank11.checked
  · simpa only [h] using Q15Bank12.checked
  · simpa only [h] using Q15Bank13.checked
  · simpa only [h] using Q15Bank14.checked
  · simpa only [h] using Q15Bank15.checked
  · simpa only [h] using Q15Bank16.checked
  · simpa only [h] using Q15Bank17.checked
  · simpa only [h] using Q15Bank18.checked
  · simpa only [h] using Q15Bank19.checked
  · simpa only [h] using Q15Bank20.checked
  · simpa only [h] using Q15Bank21.checked
  · simpa only [h] using Q15Bank22.checked
  · simpa only [h] using Q15Bank23.checked
  · simpa only [h] using Q15Bank24.checked
  · simpa only [h] using Q15Bank25.checked
  · simpa only [h] using Q15Bank26.checked
  · simpa only [h] using Q15Bank27.checked
  · simpa only [h] using Q15Bank28.checked
  · simpa only [h] using Q15Bank29.checked
  · simpa only [h] using Q15Bank30.checked
  · simpa only [h] using Q15Bank31.checked
  · simpa only [h] using Q15Bank32.checked
  · simpa only [h] using Q15Bank33.checked
  · simpa only [h] using Q15Bank34.checked
  · simpa only [h] using Q15Bank35.checked
  · simpa only [h] using Q15Bank36.checked
  · simpa only [h] using Q15Bank37.checked
  · simpa only [h] using Q15Bank38.checked
  · simpa only [h] using Q15Bank39.checked
  · simpa only [h] using Q15Bank40.checked
  · simpa only [h] using Q15Bank41.checked
  · simpa only [h] using Q15Bank42.checked
  · simpa only [h] using Q15Bank43.checked
  · simpa only [h] using Q15Bank44.checked
  · simpa only [h] using Q15Bank45.checked
  · simpa only [h] using Q15Bank46.checked
  · simpa only [h] using Q15Bank47.checked
  · simpa only [h] using Q15Bank48.checked
  · simpa only [h] using Q15Bank49.checked
  · simpa only [h] using Q15Bank50.checked
  · simpa only [h] using Q15Bank51.checked
  · simpa only [h] using Q15Bank52.checked
  · simpa only [h] using Q15Bank53.checked
  · simpa only [h] using Q15Bank54.checked
  · simpa only [h] using Q15Bank55.checked
  · simpa only [h] using Q15Bank56.checked
  · simpa only [h] using Q15Bank57.checked
  · simpa only [h] using Q15Bank58.checked
  · simpa only [h] using Q15Bank59.checked
  · simpa only [h] using Q15Bank60.checked
  · simpa only [h] using Q15Bank61.checked
  · simpa only [h] using Q15Bank62.checked
  · simpa only [h] using Q15Bank63.checked
theorem all_upper : ∀ b ∈ banks, ∀ e ∈ b, MCM.Fits MCM.unbounded e.targets e.gates.length := fun b hb => bank_sound b (each_checked b hb)
theorem entry_count : (banks.map List.length).sum = 2044 := by decide +kernel
#print axioms all_upper
#print axioms entry_count
end Q15Atlas
