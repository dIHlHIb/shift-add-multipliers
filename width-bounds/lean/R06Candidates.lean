import McmAudit
namespace R06Candidates
open MCM

/-- With all three coefficients below 2^B, no witnessing shift exceeds B. -/
theorem pt_bound {a b v B : Nat} (ha : a<2^B) (hb : b<2^B) {n : Nat}
    (hn : n≤a+b) (pt : PowerTimes n v) :
    ∃ j : Nat, 0<j ∧ j≤B ∧ n=2^j*v := by
  obtain ⟨hv,j,hj,eq⟩ := (powerTimes_iff ..).mp pt
  have lo : 2^j≤n := by rw [eq]; exact Nat.le_mul_of_pos_right _ hv
  refine ⟨j,hj,?_,eq⟩
  apply Classical.byContradiction
  intro gt
  have p := Nat.pow_le_pow_right (by decide : 0<2) (show B+1≤j by omega)
  rw [Nat.pow_succ] at p; omega

def atShift (a b j : Nat) : List Nat :=
  let q := 2^j
  [(a+b)/q,(a-b)/q,(b-a)/q,q*b-a,a-q*b,a+q*b,q*a-b,b-q*a,b+q*a]

def pair (B a b : Nat) := (List.range (B+1)).flatMap (atShift a b)

private theorem pta {a b t B : Nat} (ha : a<2^B) (hb : b<2^B) {n} (hn : n≤a+b)
    (h : PowerTimes n t) : ∃ j≤B, t=n/2^j := by
  obtain ⟨j,_,le,eq⟩ := pt_bound ha hb hn h
  exact ⟨j,le,by rw [eq,Nat.mul_div_cancel_left _ (Nat.two_pow_pos _)]⟩

theorem covers {B a b t : Nat} (ha : a<2^B) (hb : b<2^B) (ht : t<2^B)
    (g : Gate a b t) : t∈pair B a b := by
  have mem (j) (hj : j≤B) (h : t∈atShift a b j) : t∈pair B a b :=
    List.mem_flatMap.mpr ⟨j,List.mem_range.mpr (by omega),h⟩
  rcases g with (h|h|h)|(h|h|h)|(h|h|h)
  · obtain ⟨j,le,e⟩ := pta ha hb (Nat.le_refl _) h
    exact mem j le (by simp [atShift,e])
  · obtain ⟨j,le,e⟩ := pta ha hb (by omega) h
    exact mem j le (by simp [atShift,e])
  · obtain ⟨j,le,e⟩ := pta ha hb (by omega) h
    exact mem j le (by simp [atShift,e])
  · obtain ⟨j,_,le,e⟩ := pt_bound ha ht (by omega) h
    exact mem j le (by simp only [atShift,List.mem_cons,List.mem_nil_iff,or_false]; omega)
  · obtain ⟨j,_,le,e⟩ := pt_bound ha ht (by omega) h
    have pos : 0<2^j*b := Nat.mul_pos (Nat.two_pow_pos _) ((powerTimes_iff ..).mp h).1
    exact mem j le (by simp only [atShift,List.mem_cons,List.mem_nil_iff,or_false]; omega)
  · obtain ⟨j,_,le,e⟩ := pt_bound ha ht (by omega) h
    have pos : 0<2^j*b := Nat.mul_pos (Nat.two_pow_pos _) ((powerTimes_iff ..).mp h).1
    exact mem j le (by simp only [atShift,List.mem_cons,List.mem_nil_iff,or_false]; omega)
  · obtain ⟨j,_,le,e⟩ := pt_bound hb ht (by omega) h
    exact mem j le (by simp only [atShift,List.mem_cons,List.mem_nil_iff,or_false]; omega)
  · obtain ⟨j,_,le,e⟩ := pt_bound hb ht (by omega) h
    have pos : 0<2^j*a := Nat.mul_pos (Nat.two_pow_pos _) ((powerTimes_iff ..).mp h).1
    exact mem j le (by simp only [atShift,List.mem_cons,List.mem_nil_iff,or_false]; omega)
  · obtain ⟨j,_,le,e⟩ := pt_bound hb ht (by omega) h
    have pos : 0<2^j*a := Nat.mul_pos (Nat.two_pow_pos _) ((powerTimes_iff ..).mp h).1
    exact mem j le (by simp only [atShift,List.mem_cons,List.mem_nil_iff,or_false]; omega)

theorem length_pair (B a b : Nat) : (pair B a b).length = (B+1)*9 := by
  have each (js : List Nat) : (js.flatMap (atShift a b)).length=js.length*9 := by
    induction js with
    | nil => simp
    | cons j js ih => simp [List.flatMap_cons,atShift,ih,Nat.succ_mul]
  simpa [pair] using each (List.range (B+1))

def children (B : Nat) (pool : List Nat) :=
  pool.flatMap fun a => pool.flatMap fun b => pair B a b

theorem child_mem {a b t B pool} (ma : a∈pool) (mb : b∈pool) (ha : a<2^B) (hb : b<2^B)
    (ht : t<2^B) (g : Gate a b t) : t∈children B pool :=
  List.mem_flatMap.mpr ⟨a,ma,List.mem_flatMap.mpr ⟨b,mb,covers ha hb ht g⟩⟩

private theorem flat_length {A C : Type} (xs : List A) (f : A → List C) (z : Nat)
    (same : ∀ a, (f a).length=z) : (xs.flatMap f).length=xs.length*z := by
  induction xs with
  | nil => simp
  | cons a xs ih => simp [List.flatMap_cons,same,ih,Nat.succ_mul]; omega

theorem branching (B : Nat) (pool : List Nat) :
    (children B pool).length=pool.length*(pool.length*((B+1)*9)) := by
  apply flat_length
  intro a
  exact flat_length pool _ _ (length_pair B a)

end R06Candidates
#print axioms R06Candidates.covers
#print axioms R06Candidates.branching
