import R06Expansion
import R06Graph

namespace R06Trace
open R06Expansion MCM

structure TargetEq where
  t : Nat
  negA : Bool
  negB : Bool
  a : Expr
  b : Expr
  deriving DecidableEq

def TargetEq.Holds (e : TargetEq) (x : Nat → Int) : Prop :=
  ∃ p q, Equation x e.negA e.negB e.a e.b p q e.t

def TargetEq.ScopedAt (e : TargetEq) (T : List Nat) (h : Nat) :=
  e.t∈T ∧ Scoped T h e.a ∧ Scoped T h e.b

theorem TargetEq.weaken {e : TargetEq} {T h h' x y} (scope : e.ScopedAt T h) (le : h≤h')
    (agree : ∀ j, j<2*h → x j=y j) (hold : e.Holds x) : e.ScopedAt T h' ∧ e.Holds y := by
  rcases hold with ⟨p,q,K,hK⟩
  refine ⟨⟨scope.1,scoped_mono scope.2.1 le,scoped_mono scope.2.2 le⟩,p,q,K,?_⟩
  intro k hk
  have eq := hK k hk
  simpa only [branch,sample_agree scope.2.1 agree,sample_agree scope.2.2 agree] using eq

def put (env : Nat → Expr) (v : Nat) (e : Expr) (j : Nat) := if j=v then e else env j

/-- Retain both original parents of every gate. Target expressions restart at
the actual target value. The helper counter is the shared coordinate allocator. -/
inductive Trace (T : List Nat) : List Nat → Nat → (Nat → Expr) → List TargetEq → Prop
  | start : Trace T [] 0 Expr.anchor []
  | helper {xs h env eqs v a b} (na nb : Bool) :
    Trace T xs h env eqs → a∈1::xs → b∈1::xs → v∉T →
    Trace T (v::xs) (h+1) (put env v (.join h na nb (env a) (env b))) eqs
  | target {xs h env eqs t a b} (na nb : Bool) :
    Trace T xs h env eqs → a∈1::xs → b∈1::xs → t∈T →
    Trace T (t::xs) h (put env t (.anchor t)) (⟨t,na,nb,env a,env b⟩::eqs)

theorem translate {T xs : List Nat} (hv : Valid unbounded xs) :
    ∃ h env eqs x, Trace T xs h env eqs ∧ h=(xs.filter (· ∉ T)).length ∧
      (∀ a∈1::xs, Scoped T h (env a) ∧ Represents x (env a) a) ∧
      (∀ e∈eqs, e.ScopedAt T h ∧ e.Holds x) := by
  induction xs with
  | nil =>
    refine ⟨0,Expr.anchor,[],fun _ => 0,.start,rfl,?_,by simp⟩
    intro a ha
    simp only [List.mem_singleton] at ha
    subst a
    exact ⟨by simp [Scoped],anchor_rep _ _⟩
  | cons t xs ih =>
    obtain ⟨h,env,eqs,x,trace,count,labels,sys⟩ := ih hv.1
    obtain ⟨a,ha,b,hb,hg⟩ := (makes_iff _ _).mp hv.2.2.2
    obtain ⟨u,hu⟩ := gate_weights hg
    have la := labels a ha
    have lb := labels b hb
    by_cases target : t∈T
    · refine ⟨h,_,_,x,.target u.negA u.negB trace ha hb target,?_,?_,?_⟩
      · simp [List.filter_cons,target,count]
      · intro v hv
        by_cases eq : v=t
        · subst v
          simp only [put,if_pos rfl]
          exact ⟨List.mem_cons_of_mem _ target,anchor_rep _ _⟩
        · rw [put,if_neg eq]
          apply labels
          simp only [List.mem_cons] at hv ⊢
          grind
      · intro e he
        rcases List.mem_cons.mp he with rfl|he
        · exact ⟨⟨target,la.1,lb.1⟩,_,_,equation_of_gate u hu la.2 lb.2⟩
        · exact sys _ he
    · let y (j : Nat) : Int := if j=2*h then (u.a:Int)-u.out else
          if j=2*h+1 then (u.b:Int)-u.out else x j
      have agree (j) (hj : j<2*h) : x j=y j := by simp [y,show j≠2*h by omega, show j≠2*h+1 by omega]
      have left := rep_agree la.1 agree la.2
      have right := rep_agree lb.1 agree lb.2
      have eq := equation_of_gate u hu left right
      let ex := Expr.join h u.negA u.negB (env a) (env b)
      refine ⟨h+1,put env t ex,eqs,y,.helper u.negA u.negB trace ha hb target,?_,?_,?_⟩
      · simp [List.filter_cons,target,count]
      · intro v hv
        by_cases ht : v=t
        · subst v
          simp only [put,if_pos rfl]
          refine ⟨⟨by omega,la.1,lb.1⟩,?_⟩
          obtain ⟨K,hK⟩ := eq
          refine ⟨K,fun k hk => ?_⟩
          change sample y ex k = _
          simpa only [ex,sample,y,if_pos rfl,show 2*h+1≠2*h by omega,if_false,branch]
            using hK k hk
        · rw [put,if_neg ht]
          have mem : v∈1::xs := by simp only [List.mem_cons] at hv ⊢; grind
          obtain ⟨hs,hr⟩ := labels v mem
          exact ⟨scoped_mono hs (by omega),rep_agree hs agree hr⟩
      · intro e he
        obtain ⟨s,ok⟩ := sys e he
        exact e.weaken s (by omega) agree ok

/-- Directly from the unrestricted decision predicate. The produced equations all
hold at one shared assignment; 2*r coordinates suffice for every target at once. -/
theorem from_fits {T : List Nat} {r : Nat} (nd : T.Nodup) (nontrivial : 1∉T)
    (fit : Fits unbounded T (T.length+r)) :
    ∃ xs h env eqs x, xs.length≤T.length+r ∧ (1::xs).Nodup ∧ T ⊆ xs ∧ h≤r ∧
      Trace T xs h env eqs ∧ (∀ a∈1::xs, Scoped T h (env a) ∧ Represents x (env a) a) ∧
      ∀ e∈eqs, e.ScopedAt T h ∧ e.Holds x := by
  obtain ⟨xs,v,uniq,covers,len,number⟩ := R06Graph.extract nd nontrivial fit
  obtain ⟨h,env,eqs,x,tr,hc,hs,ok⟩ := translate (T:=T) v
  exact ⟨xs,h,env,eqs,x,len,uniq,covers,by omega,tr,hs,ok⟩

end R06Trace
#print axioms R06Trace.from_fits
