import Q15Atlas
import CPBench

namespace DSPWidth
open MCM Q15Upper

def width (ts : List Nat) : Nat :=
  let n := ts.foldl max 1
  MCM.logFuel n n + 1

theorem width_spec (ts : List Nat) : width ts = (ts.foldl max 1).log2+1 := by
  simp [width,MCM.logFuel_spec _ _ (Nat.le_refl _)]
def cap (ts : List Nat) (x : Nat) : Prop := x < 2^width ts

theorem boundedReplay (P : Nat → Prop) (rs : List Step) (xs out : List Nat)
    (valid : Valid P xs) (small : ∀ r ∈ rs, P r.t) (replayed : replay rs xs = some out) :
    Valid P out ∧ out.length = xs.length+rs.length := by
  induction rs generalizing xs with
  | nil =>
    simp [replay] at replayed
    subst out
    simp [valid]
  | cons r rs ih =>
    simp only [replay] at replayed
    split at replayed
    next h =>
      have hp := Bool.and_eq_true_iff.mp h
      have mem : r.a ∈ 1::xs ∧ r.b ∈ 1::xs ∧ r.t%2=1 := of_decide_eq_true hp.1
      have step : Valid P (r.t::xs) :=
        ⟨valid,mem.2.2,small r (by simp),(makes_iff ..).mpr ⟨r.a,mem.1,r.b,mem.2.1,gate_sound r hp.2⟩⟩
      have next := ih (r.t::xs) step (fun v hv => small v (List.mem_cons_of_mem _ hv)) replayed
      exact ⟨next.1,by simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using next.2⟩
    next => contradiction

theorem under_cap (e : Entry) (ok : accepts e = true)
    (small : ∀ r ∈ e.gates, cap e.targets r.t) : Fits (cap e.targets) e.targets e.gates.length := by
  unfold accepts at ok
  split at ok
  next => contradiction
  next out eq =>
    have result := boundedReplay (cap e.targets) e.gates [] out trivial small eq
    exact ⟨out,by simpa using Nat.le_of_eq result.2,result.1,by simpa [List.all_eq_true] using ok⟩

def repairs : List Entry := [
  ⟨[793, 32149], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨635,5,5,.second,.plus,7⟩,⟨795,5,635,.first,.reverseMinus,5⟩,⟨793,1,795,.first,.minus,1⟩,⟨32133,1,635,.first,.plus,15⟩,⟨32149,1,32133,.first,.reverseMinus,4⟩]⟩,
  ⟨[1225, 26259], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨73,1,9,.second,.reverseMinus,3⟩,⟨1225,9,73,.first,.reverseMinus,7⟩,⟨16383,1,1,.second,.plus,14⟩,⟨6583,1225,16383,.first,.minus,3⟩,⟨26259,73,6583,.second,.plus,2⟩]⟩,
  ⟨[1273, 31145], [⟨255,1,1,.second,.plus,8⟩,⟨509,1,255,.second,.plus,1⟩,⟨1273,255,509,.second,.reverseMinus,1⟩,⟨16893,1,509,.first,.reverseMinus,14⟩,⟨14857,509,16893,.first,.minus,2⟩,⟨31145,509,14857,.first,.reverseMinus,5⟩]⟩,
  ⟨[1631, 15029], [⟨3,1,1,.second,.plus,2⟩,⟨51,3,3,.second,.reverseMinus,4⟩,⟨1631,1,51,.second,.plus,5⟩,⟨2099,1,51,.first,.reverseMinus,11⟩,⟨2147,3,2099,.first,.reverseMinus,4⟩,⟨15029,2147,2147,.second,.plus,3⟩]⟩,
  ⟨[3491, 29643], [⟨3,1,1,.second,.plus,2⟩,⟨29,1,3,.first,.plus,5⟩,⟨29667,29,29,.second,.plus,10⟩,⟨29643,3,29667,.first,.minus,3⟩,⟨3683,29,29,.second,.plus,7⟩,⟨3491,3,3683,.first,.minus,6⟩]⟩,
  ⟨[4125, 28311], [⟨127,1,1,.second,.plus,7⟩,⟨125,1,127,.first,.minus,1⟩,⟨4125,125,125,.second,.reverseMinus,5⟩,⟨31875,125,125,.second,.plus,8⟩,⟨891,127,125,.first,.plus,3⟩,⟨28311,31875,891,.second,.minus,2⟩]⟩,
  ⟨[4409, 32469], [⟨63,1,1,.second,.plus,6⟩,⟨47,1,63,.first,.minus,4⟩,⟨559,1,47,.first,.reverseMinus,9⟩,⟨4409,63,559,.second,.plus,3⟩,⟨299,63,47,.first,.reverseMinus,2⟩,⟨32469,1,299,.first,.plus,15⟩]⟩,
  ⟨[4509, 32457], [⟨7,1,1,.second,.plus,3⟩,⟨127,1,1,.second,.plus,7⟩,⟨32513,1,127,.second,.reverseMinus,8⟩,⟨32457,7,32513,.first,.minus,3⟩,⟨501,7,127,.second,.plus,2⟩,⟨4509,501,501,.second,.reverseMinus,3⟩]⟩,
  ⟨[4759, 32421], [⟨3,1,1,.second,.plus,2⟩,⟨99,3,3,.second,.reverseMinus,5⟩,⟨793,1,99,.second,.reverseMinus,3⟩,⟨347,99,793,.output,.reverseMinus,1⟩,⟨4759,793,347,.second,.plus,4⟩,⟨32421,1,347,.first,.plus,15⟩]⟩,
  ⟨[5389, 24681], [⟨257,1,1,.second,.reverseMinus,8⟩,⟨1027,1,257,.second,.plus,2⟩,⟨1281,1,257,.first,.reverseMinus,10⟩,⟨5389,1027,1281,.first,.reverseMinus,2⟩,⟨3085,257,1027,.first,.plus,4⟩,⟨24681,1,3085,.second,.reverseMinus,3⟩]⟩,
  ⟨[5897, 7643], [⟨9,1,1,.second,.reverseMinus,3⟩,⟨23,1,9,.first,.plus,5⟩,⟨5897,9,23,.second,.reverseMinus,8⟩,⟨279,1,23,.first,.reverseMinus,8⟩,⟨549,9,279,.second,.plus,1⟩,⟨7643,1,549,.first,.plus,13⟩]⟩,
  ⟨[7717, 15923], [⟨33,1,1,.second,.reverseMinus,5⟩,⟨8225,1,33,.first,.reverseMinus,13⟩,⟨7961,33,8225,.first,.minus,3⟩,⟨15923,1,7961,.second,.reverseMinus,1⟩,⟨8229,1,8225,.first,.reverseMinus,2⟩,⟨7717,1,8229,.first,.minus,9⟩]⟩,
  ⟨[8789, 31567], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨517,1,5,.first,.reverseMinus,9⟩,⟨8789,517,517,.second,.reverseMinus,4⟩,⟨32767,1,1,.second,.plus,15⟩,⟨75,5,5,.second,.plus,4⟩,⟨31567,32767,75,.second,.minus,4⟩]⟩,
  ⟨[9415, 15693], [⟨65,1,1,.second,.reverseMinus,6⟩,⟨1039,1,65,.second,.plus,4⟩,⟨1047,1,1039,.first,.reverseMinus,3⟩,⟨9415,1039,1047,.second,.reverseMinus,3⟩,⟨5231,1047,9415,.output,.plus,1⟩,⟨15693,5231,5231,.second,.plus,2⟩]⟩,
  ⟨[9861, 26169], [⟨31,1,1,.second,.plus,5⟩,⟨39,1,31,.first,.reverseMinus,3⟩,⟨9985,1,39,.second,.reverseMinus,8⟩,⟨9861,31,9985,.first,.minus,2⟩,⟨2023,31,39,.first,.reverseMinus,6⟩,⟨26169,9985,2023,.second,.reverseMinus,3⟩]⟩,
  ⟨[10231, 15565], [⟨255,1,1,.second,.plus,8⟩,⟨8191,1,1,.second,.plus,13⟩,⟨10231,255,8191,.first,.reverseMinus,3⟩,⟨247,1,255,.first,.minus,3⟩,⟨243,1,247,.first,.minus,2⟩,⟨15565,247,243,.first,.plus,6⟩]⟩,
  ⟨[10897, 15451], [⟨3,1,1,.second,.plus,2⟩,⟨253,1,3,.first,.plus,8⟩,⟨277,3,253,.first,.reverseMinus,3⟩,⟨2277,253,253,.second,.reverseMinus,3⟩,⟨15451,277,2277,.first,.plus,6⟩,⟨10897,2277,15451,.first,.minus,1⟩]⟩,
  ⟨[11181, 15401], [⟨1023,1,1,.second,.plus,10⟩,⟨1015,1,1023,.first,.minus,3⟩,⟨15369,1,1015,.first,.plus,14⟩,⟨15401,1,15369,.first,.reverseMinus,5⟩,⟨9135,1015,1015,.second,.reverseMinus,3⟩,⟨11181,1023,9135,.first,.reverseMinus,1⟩]⟩,
  ⟨[12121, 30443], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨119,17,17,.second,.plus,3⟩,⟨21,1,17,.first,.reverseMinus,2⟩,⟨30443,119,21,.first,.plus,8⟩,⟨391,17,119,.first,.reverseMinus,4⟩,⟨12121,391,391,.second,.plus,5⟩]⟩,
  ⟨[12353, 30351], [⟨15,1,1,.second,.plus,4⟩,⟨129,1,1,.second,.reverseMinus,7⟩,⟨4097,1,1,.second,.reverseMinus,12⟩,⟨12353,129,4097,.first,.reverseMinus,6⟩,⟨30591,15,129,.first,.plus,11⟩,⟨30351,15,30591,.first,.minus,4⟩]⟩,
  ⟨[12493, 30293], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨4369,17,17,.second,.reverseMinus,8⟩,⟨12561,1,4369,.first,.reverseMinus,13⟩,⟨12493,17,12561,.first,.minus,2⟩,⟨4433,1,4369,.first,.reverseMinus,6⟩,⟨30293,12561,4433,.second,.reverseMinus,2⟩]⟩,
  ⟨[13095, 30037], [⟨17,1,1,.second,.reverseMinus,4⟩,⟨4369,17,17,.second,.reverseMinus,8⟩,⟨6417,1,4369,.first,.reverseMinus,11⟩,⟨30037,4369,6417,.second,.reverseMinus,2⟩,⟨4365,1,4369,.first,.minus,2⟩,⟨13095,4365,4365,.second,.plus,2⟩]⟩,
  ⟨[14011, 29621], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨2053,1,5,.first,.reverseMinus,11⟩,⟨2373,5,2053,.first,.reverseMinus,6⟩,⟨14011,1,2373,.first,.plus,14⟩,⟨1723,1,2373,.first,.plus,12⟩,⟨29621,2053,1723,.second,.reverseMinus,4⟩]⟩,
  ⟨[15801, 28707], [⟨7,1,1,.second,.plus,3⟩,⟨7175,7,7,.second,.reverseMinus,10⟩,⟨28707,7,7175,.second,.reverseMinus,2⟩,⟨16377,1,7,.first,.plus,14⟩,⟨16313,1,16377,.first,.minus,6⟩,⟨15801,1,16313,.first,.minus,9⟩]⟩,
  ⟨[17445, 27737], [⟨7,1,1,.second,.plus,3⟩,⟨55,1,7,.second,.plus,3⟩,⟨3577,7,7,.second,.plus,9⟩,⟨3467,55,3577,.first,.minus,1⟩,⟨17445,3577,3467,.second,.reverseMinus,2⟩,⟨27737,1,3467,.second,.reverseMinus,3⟩]⟩,
  ⟨[17911, 27439], [⟨127,1,1,.second,.plus,7⟩,⟨4065,1,127,.second,.reverseMinus,5⟩,⟨1969,127,4065,.output,.reverseMinus,1⟩,⟨27439,4065,1969,.second,.plus,4⟩,⟨2159,127,127,.second,.reverseMinus,4⟩,⟨17911,1969,2159,.first,.reverseMinus,3⟩]⟩,
  ⟨[18247, 27217], [⟨7,1,1,.second,.plus,3⟩,⟨71,1,7,.first,.reverseMinus,6⟩,⟨18247,71,71,.second,.reverseMinus,8⟩,⟨2049,1,1,.second,.reverseMinus,11⟩,⟨1601,7,2049,.first,.minus,6⟩,⟨27217,1601,1601,.second,.reverseMinus,4⟩]⟩,
  ⟨[19479, 26349], [⟨5,1,1,.second,.reverseMinus,2⟩,⟨19,1,5,.second,.plus,2⟩,⟨23,1,19,.first,.reverseMinus,2⟩,⟨19479,19,23,.first,.reverseMinus,10⟩,⟨5869,19,23,.second,.plus,8⟩,⟨26349,5,5869,.first,.reverseMinus,12⟩]⟩,
  ⟨[21555, 24681], [⟨1023,1,1,.second,.plus,10⟩,⟨1007,1,1023,.first,.minus,4⟩,⟨32737,1,1023,.second,.reverseMinus,5⟩,⟨24681,1007,32737,.first,.minus,3⟩,⟨7185,1,1007,.first,.plus,13⟩,⟨21555,7185,7185,.second,.plus,2⟩]⟩
]

def selected (e : Entry) : Entry := (repairs.find? (fun r => r.targets==e.targets)).getD e
def armBudget (e : Entry) := e.gates.length + (if e.targets=[5897,7643] then 1 else 0)

def check (e : Entry) (wanted : List Nat) (budget : Nat) : Bool :=
  decide (e.targets=wanted ∧ e.gates.length=budget) &&
  (accepts e && e.gates.all (fun r => decide (r.t < 2^width e.targets)))

theorem checked_sound (e : Entry) (T : List Nat) (n : Nat) (h : check e T n = true) :
    Fits (cap T) T n := by
  obtain ⟨same,ok⟩ := Bool.and_eq_true_iff.mp h
  have eq : e.targets=T ∧ e.gates.length=n := of_decide_eq_true same
  obtain ⟨accept,small⟩ := Bool.and_eq_true_iff.mp ok
  rw [←eq.1,←eq.2]
  apply under_cap e accept
  intro r hr
  change r.t < 2^width e.targets
  exact of_decide_eq_true ((List.all_eq_true.mp small) r hr)

set_option maxRecDepth 300000
set_option maxHeartbeats 0

def armCheck (e : Entry) := check (selected e) e.targets (armBudget e)
theorem arm_checked : Q15Atlas.banks.all (fun bank => bank.all armCheck) = true := by decide +kernel
theorem arm_width_upper : ∀ b ∈ Q15Atlas.banks, ∀ e ∈ b,
    Fits (cap e.targets) e.targets (armBudget e) := by
  intro b hb e he
  have c := (List.all_eq_true.mp ((List.all_eq_true.mp arm_checked) b hb)) e he
  exact checked_sound (selected e) e.targets (armBudget e) c

theorem cp_checked : CPBench.entries.all (fun e => check e e.targets e.gates.length) = true := by decide +kernel
theorem cp_width_upper : ∀ e ∈ CPBench.entries, Fits (cap e.targets) e.targets e.gates.length := by
  intro e he
  exact checked_sound e e.targets e.gates.length ((List.all_eq_true.mp cp_checked) e he)

#print axioms arm_width_upper
#print axioms cp_width_upper
end DSPWidth
