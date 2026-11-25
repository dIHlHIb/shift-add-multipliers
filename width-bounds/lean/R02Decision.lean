import R02Width
import R06Polynomial

namespace R02Decision
open MCM R06Candidates R06Closure

/-- Candidate overgeneration is harmless. The pool closure constructs every
selected label by legal gates before counting it as an available parent. -/
def decideAt (T : List Nat) (B : Nat) :=
  accepts T [] || (children B (1::T)).any (fun v => decide (v<2^B) && accepts T [v])

theorem decideAt_sound {T B} (ok : decideAt T B=true) : Fits unbounded T (T.length+1) := by
  simp only [decideAt,Bool.or_eq_true] at ok
  rcases ok with free|extra
  · obtain ⟨xs,hl,hv,hc⟩ := R06Closure.sound free
    exact ⟨xs,by simp_all; omega,hv,hc⟩
  · obtain ⟨v,_,hit⟩ := List.any_eq_true.mp extra
    simp only [Bool.and_eq_true] at hit
    exact R06Closure.sound hit.2

theorem complete {T : List Nat} {w B : Nat} (distinct : T.Nodup) (nontrivial : 1∉T)
    (width : ∀ t∈T,t<2^w) (enough : 2*w≤B)
    (fit : Fits unbounded T (T.length+1)) : decideAt T B=true := by
  by_cases empty : T=[]
  · subst T; rfl
  have pos : w≠0 := by
    obtain ⟨xs,_,valid,cover⟩ := fit
    cases T with
    | nil => contradiction
    | cons a ts =>
      intro z; subst w
      have sm := width a List.mem_cons_self
      have ha := cover a List.mem_cons_self
      have odd {ys : List Nat} (hv : Valid unbounded ys) {j} (hj : j∈1::ys) : j%2=1 := by
        induction ys with
        | nil => simp_all
        | cons t ys ih =>
          by_cases e : j=t
          · exact e ▸ hv.2.1
          · exact ih hv.1 (by simp only [List.mem_cons] at hj ⊢; grind)
      have := odd valid ha
      simp at sm; omega
  obtain ⟨ys,le,v,ok⟩ := R02Width.twice_width distinct nontrivial width fit
  have inc : 2^(2*w)≤2^B := Nat.pow_le_pow_right (by decide) enough
  have lift {zs} (h : Valid (· < 2^(2*w)) zs) : Valid (R06Decide.cap B) zs := by
    induction zs with
    | nil => trivial
    | cons a zs ih => exact ⟨ih h.1,h.2.1,Nat.lt_of_lt_of_le h.2.2.1 inc,h.2.2.2⟩
  have one : R06Decide.cap B 1 := Nat.one_lt_two_pow (by omega)
  have found := R06Decide.complete distinct nontrivial one ⟨ys,le,lift v,ok⟩
  change R06Decide.search B T 1 []=true at found
  simp only [R06Decide.search,List.append_nil,Bool.or_eq_true] at found
  simp only [decideAt,Bool.or_eq_true]
  rcases found with f|f
  · exact Or.inl f
  · obtain ⟨v,mem,good⟩ := List.any_eq_true.mp f
    simp only [Bool.and_eq_true] at good
    have guard : v<2^B ∧ v%2=1 := of_decide_eq_true good.1
    exact Or.inr (List.any_eq_true.mpr ⟨v,mem,by simp [guard.1,good.2]⟩)

theorem correct {T : List Nat} (nd : T.Nodup) (nt : 1∉T) :
    decideAt T (2*R06Polynomial.width T)=true ↔ Fits unbounded T (T.length+1) :=
  ⟨decideAt_sound,complete nd nt (R06Polynomial.input_bounds T).2.2 (Nat.le_refl _)⟩

end R02Decision
#print axioms R02Decision.correct
