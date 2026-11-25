import R06Rebuild

namespace R06Width
open MCM R06Targets R06Rebuild

/-- An explicit computable multiplier independent of the number of targets. -/
def g (r : Nat) := r+2+2*((2*r)*shiftFactor r)

private theorem enough (r w : Nat) :
    widthExp r w (shiftFactor r*(w+1)) < g r*(w+1) := by
  have low : r+w < (r+2)*(w+1) := by
    simp only [Nat.add_mul,Nat.mul_add,Nat.mul_one]; omega
  simp only [widthExp,g,Nat.add_mul,Nat.mul_assoc] at *
  omega

private theorem valid_cap {c d : Nat → Prop} {xs : List Nat} (h : Valid c xs)
    (le : ∀ t, c t → d t) : Valid d xs := by
  induction xs with
  | nil => trivial
  | cons t xs ih => exact ⟨ih h.1,h.2.1,le t h.2.2.1,h.2.2.2⟩

private theorem valid_odd {c : Nat → Prop} {xs : List Nat} (h : Valid c xs) (v) (hv : v∈xs) :
    v%2=1 := by
  induction xs with
  | nil => simp at hv
  | cons a xs ih =>
    rcases List.mem_cons.mp hv with rfl|hv
    · exact h.2.1
    · exact ih h.1 hv

/-- The width assertion of Theorem 5 in the paper's normalized `MCM.Fits` model.
Targets are distinct nontrivial fundamentals. Both sides use exactly the same
gate relation and budget. Free output shifts and signs are represented by the
normalization to positive odd targets. -/
theorem fixed_surplus_width {T : List Nat} {r w : Nat} (distinct : T.Nodup)
    (nontrivial : 1∉T) (width : ∀ t∈T, t<2^w)
    (fit : Fits unbounded T (T.length+r)) :
    Fits (fun v => v<2^(g r*(w+1))) T (T.length+r) := by
  have cap : ∀ t∈1::T, t≤2^w := by
    intro t ht
    rcases List.mem_cons.mp ht with rfl|ht
    · exact Nat.two_pow_pos w
    · exact Nat.le_of_lt (width _ ht)
  have odd : ∀ t∈1::T,t%2=1 := by
    obtain ⟨xs,_,valid,covers⟩ := fit
    intro t ht
    rcases List.mem_cons.mp ht with rfl|ht
    · decide
    · rcases List.mem_cons.mp (covers _ ht) with rfl|inxs
      · decide
      · exact valid_odd valid t inxs
  obtain ⟨xs,h,env,eqs,y,len,_,sub,hr,tr,sm,ok⟩ := from_fits distinct nontrivial cap fit
  obtain ⟨zs,lz,vz,cover⟩ := reconstruct tr sub len hr cap odd sm ok
  exact ⟨zs,lz,valid_cap vz (fun v hv =>
    Nat.lt_of_le_of_lt hv (Nat.pow_lt_pow_of_lt (by decide) (enough r w))),cover⟩

/-- Magnitudes of the computable factors furnished by this proof. -/
theorem factors : g 0=2 ∧ g 1=2295 ∧ g 2=1903152634318132 := by decide +kernel

end R06Width
#check R06Width.fixed_surplus_width
#print axioms R06Width.fixed_surplus_width
