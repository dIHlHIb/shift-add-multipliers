import Std
namespace AuditSurplus
-- A path expansion stops at an anchor even if the original target has predecessors.
inductive Expr where
| anchor (label : Nat)
| add (left right : Expr)
def leaves : Expr → Nat
| .anchor _ => 1
| .add u v => leaves u + leaves v
def depth : Expr → Nat
| .anchor _ => 0
| .add u v => max (depth u) (depth v) + 1
theorem leaf_bound (e : Expr) : leaves e ≤ 2^depth e := by
  induction e with
  | anchor => simp [leaves,depth]
  | add u v hu hv =>
    have h1 := Nat.pow_le_pow_right (by decide : 0<2) (Nat.le_max_left (depth u) (depth v))
    have h2 := Nat.pow_le_pow_right (by decide : 0<2) (Nat.le_max_right (depth u) (depth v))
    simp only [leaves,depth,Nat.pow_succ]
    omega
-- For a fixed shared x, A,B,C are *all* RHS values of the (01,02,12)
-- edges after orientations have been standardized. Reversed edges negate
-- their RHS. The conjunction on the right states exactly all 2/3-cycles.
def SingleValued (A : Int → Prop) := ∀ x y, A x → A y → x=y
theorem three_potentials (A B C : Int → Prop) :
  (∃ p q : Int, (∀ x, A x → x=p) ∧ (∀ x, B x → x=q) ∧ (∀ x, C x → x=q-p)) ↔
  (SingleValued A ∧ SingleValued B ∧ SingleValued C ∧
   ∀ a b c, A a → B b → C c → a+c=b) := by
  constructor
  · rintro ⟨p,q,ha,hb,hc⟩
    refine ⟨fun x y hx hy => (ha x hx).trans (ha y hy).symm,
            fun x y hx hy => (hb x hx).trans (hb y hy).symm,
            fun x y hx hy => (hc x hx).trans (hc y hy).symm,?_⟩
    intro a b c h1 h2 h3
    rw [ha a h1,hb b h2,hc c h3];omega
  · rintro ⟨sa,sb,sc,tri⟩
    by_cases ea : ∃ a, A a
    · obtain ⟨a,ha⟩ := ea
      by_cases eb : ∃ b, B b
      · obtain ⟨b,hb⟩ := eb
        refine ⟨a,b,fun _ h => sa _ _ h ha, fun _ h => sb _ _ h hb,?_⟩
        intro x hx;have := tri a b x ha hb hx; omega
      · by_cases ec : ∃ c, C c
        · obtain ⟨c,hc⟩ := ec
          refine ⟨a,a+c,fun _ h => sa _ _ h ha,fun x hx => (eb ⟨x,hx⟩).elim,?_⟩
          intro x hx;have := sc x c hx hc;omega
        · exact ⟨a,0,fun _ h => sa _ _ h ha,fun x hx => (eb ⟨x,hx⟩).elim,fun x hx => (ec ⟨x,hx⟩).elim⟩
    · by_cases eb : ∃ b, B b
      · obtain ⟨b,hb⟩ := eb
        by_cases ec : ∃ c, C c
        · obtain ⟨c,hc⟩ := ec
          refine ⟨b-c,b,fun x hx => (ea ⟨x,hx⟩).elim,fun _ h => sb _ _ h hb,?_⟩
          intro x hx;have := sc x c hx hc;omega
        · exact ⟨0,b,fun x hx => (ea ⟨x,hx⟩).elim,fun _ h => sb _ _ h hb,fun x hx => (ec ⟨x,hx⟩).elim⟩
      · by_cases ec : ∃ c, C c
        · obtain ⟨c,hc⟩ := ec
          exact ⟨0,c,fun x hx => (ea ⟨x,hx⟩).elim,fun x hx => (eb ⟨x,hx⟩).elim,fun x hx => by simpa using sc x c hx hc⟩
        · exact ⟨0,0,fun x hx => (ea ⟨x,hx⟩).elim,fun x hx => (eb ⟨x,hx⟩).elim,fun x hx => (ec ⟨x,hx⟩).elim⟩
-- Every row of a Cramer numerator contains linear contributions from free coordinates.
def lin (f : Int → Int) : List (Int × Int) → Int
| [] => 0
| (c,x)::xs => c*f x + lin f xs
theorem lin_residue (d : Int) (xs : List (Int × Int)) :
  lin id xs = lin (fun x => x%d) xs + d*lin (fun x => x/d) xs := by
  induction xs with
  | nil => simp [lin]
  | cons head xs ih =>
    obtain ⟨c,x⟩ := head
    have h := congrArg (fun t : Int => c*t) (Int.emod_add_ediv x d)
    simp only [Int.mul_add] at h
    simp only [lin,id_eq,Int.mul_add]
    rw [ih]
    have assoc : c*(d*(x/d)) = d*(c*(x/d)) := by simp [Int.mul_left_comm]
    rw [assoc] at h
    omega
theorem integral_pivot_after_residue (d z b : Int) (xs : List (Int × Int))
 (h : d*z=b+lin id xs) : ∃ z' : Int, d*z'=b+lin (fun x=>x%d) xs := by
  refine ⟨z-lin (fun x=>x/d) xs,?_⟩
  rw [Int.mul_sub, h, lin_residue d xs];omega
end AuditSurplus
#print axioms AuditSurplus.leaf_bound
#print axioms AuditSurplus.three_potentials
#print axioms AuditSurplus.integral_pivot_after_residue

