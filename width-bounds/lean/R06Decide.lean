import R06Candidates
import R06Closure
import R06Width
namespace R06Decide
open MCM R06Candidates R06Closure

abbrev cap (B v : Nat) := v<2^B
def allowed (B v : Nat) : Bool := decide (cap B v ∧ v%2=1)

def search (B : Nat) (T : List Nat) : Nat → List Nat → Bool
  | 0,H => accepts T H
  | k+1,H => accepts T H || (children B (1::(T++H))).any
      (fun v => allowed B v && search B T k (v::H))

private theorem search_here {B T k H} (ok : accepts T H=true) : search B T k H=true := by
  cases k <;> simp [search,ok]

private theorem relax {c T a b} (h : Fits c T a) (le : a≤b) : Fits c T b := by
  obtain ⟨xs,len,v,all⟩ := h
  exact ⟨xs,Nat.le_trans len le,v,all⟩

theorem sound {B T k H} (ok : search B T k H=true) : Fits unbounded T (T.length+H.length+k) := by
  induction k generalizing H with
  | zero => exact R06Closure.sound ok
  | succ k ih =>
    simp only [search,Bool.or_eq_true] at ok
    rcases ok with hit|more
    · exact relax (R06Closure.sound hit) (by omega)
    · obtain ⟨v,_,win⟩ := List.any_eq_true.mp more
      simp only [Bool.and_eq_true] at win
      have sub := ih win.2
      apply relax sub
      simp only [List.length_cons]; omega

inductive Chain (B : Nat) (T : List Nat) : List Nat → Prop
  | start : Chain B T []
  | next {H v} : Chain B T H → v∈children B (1::(T++H)) → allowed B v=true → Chain B T (v::H)

private theorem unwind {B T H} (gen : Chain B T H) (k) (ok : search B T k H=true) :
    search B T (k+H.length) []=true := by
  induction gen generalizing k with
  | start => simpa using ok
  | @next H v prev mem good ih =>
    have more : search B T (k+1) H=true := by
      simp only [search,Bool.or_eq_true]
      exact Or.inr (List.any_eq_true.mpr ⟨v,mem,by simp [good,ok]⟩)
    simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using ih (k+1) more

private theorem label_cap {B xs} (h : Valid (cap B) xs) (one : cap B 1) :
    ∀ t∈1::xs, cap B t := by
  induction xs with
  | nil => simpa using one
  | cons a xs ih =>
    intro v hv
    rcases List.mem_cons.mp hv with eq|rest
    · exact eq ▸ one
    · rcases List.mem_cons.mp rest with eq|hv
      · exact eq ▸ h.2.2.1
      · exact ih h.1 v (List.mem_cons_of_mem _ hv)

private theorem schedule {B xs} (T : List Nat) (valid : Valid (cap B) xs) (one : cap B 1) :
    ∃ H, Chain B T H ∧ H.length = (xs.filter (· ∉ T)).length ∧
      ∀ a∈1::xs, a∈1::(T++H) := by
  induction xs with
  | nil => exact ⟨[],.start,rfl,by simp⟩
  | cons v xs ih =>
    obtain ⟨H,c,len,pool⟩ := ih valid.1
    by_cases tar : v∈T
    · refine ⟨H,c,by simp [List.filter_cons,tar,len],?_⟩
      intro z hz
      rcases List.mem_cons.mp hz with eq|hz
      · exact List.mem_cons.mpr (Or.inl eq)
      · rcases List.mem_cons.mp hz with rfl|hz
        · simp [tar]
        · exact pool _ (List.mem_cons_of_mem _ hz)
    · obtain ⟨a,ma,b,mb,g⟩ := (makes_iff ..).mp valid.2.2.2
      have bounds := label_cap valid.1 one
      have gen := child_mem (pool a ma) (pool b mb) (bounds a ma) (bounds b mb) valid.2.2.1 g
      refine ⟨v::H,.next c gen (decide_eq_true ⟨valid.2.2.1,valid.2.1⟩),?_,?_⟩
      · simp [List.filter_cons,tar,len]
      · intro z hz
        by_cases eq : z=v
        · simp [eq]
        · have old : z∈1::xs := by simp only [List.mem_cons] at hz ⊢; grind
          have mem := pool z old
          simp only [List.mem_cons,List.mem_append] at mem ⊢
          grind

theorem complete {B r T} (nd : T.Nodup) (nontrivial : 1∉T) (one : cap B 1)
    (fit : Fits (cap B) T (T.length+r)) : search B T r []=true := by
  obtain ⟨xs,valid,_,sub,_,size⟩ := R06Graph.extract nd nontrivial fit
  obtain ⟨H,c,len,pool⟩ := schedule T valid one
  have hit := R06Closure.complete valid (fun t ht => List.mem_cons_of_mem _ (sub ht))
      (H:=H) (fun v hv => pool v (List.mem_cons_of_mem _ hv))
  have good := unwind c (r-H.length) (search_here hit)
  rwa [show r-H.length+H.length=r by omega] at good

def decideMCM (T : List Nat) (r w : Nat) : Bool := search (R06Width.g r*(w+1)) T r []

theorem correct {T : List Nat} {r w : Nat} (nd : T.Nodup) (nontrivial : 1∉T)
    (width : ∀ t∈T,t<2^w) :
    decideMCM T r w=true ↔ Fits unbounded T (T.length+r) := by
  constructor
  · intro ok
    simpa using sound ok
  · intro fit
    apply complete nd nontrivial _ (R06Width.fixed_surplus_width nd nontrivial width fit)
    unfold cap
    have pos : 0<R06Width.g r := by unfold R06Width.g; omega
    have e := Nat.mul_pos pos (show 0<w+1 by omega)
    exact Nat.pow_lt_pow_of_lt (a:=2) (n:=0) (by decide) e

end R06Decide
#print axioms R06Decide.correct
