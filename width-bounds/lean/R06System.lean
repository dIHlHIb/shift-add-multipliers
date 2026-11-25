import R06Transport
import R06Private
namespace R06System
open R06Expansion R06Paths R06Private McmSmall R06Transport

inductive Slot where
  | base | left | right
  deriving DecidableEq
def potential (p q : Int) : Slot → Int
  | .base => 0 | .left => p | .right => q

def orient : Slot → Slot → Edge × Bool
  | .base,.left => (.left,false)
  | .base,.right => (.right,false)
  | .left,.right => (.across,false)
  | .left,.base => (.left,true)
  | .right,.base => (.right,true)
  | .right,.left => (.across,true)
  | _,_ => (.loop,false)

private theorem orient_eq (p q : Int) (a b : Slot) :
    signed (orient a b).2 (potential p q b-potential p q a)=delta p q (orient a b).1 := by
  cases a <;> cases b <;> simp [orient,signed,potential,delta] <;> omega

structure Term extends Path where
  slot : Slot

def exponent (n : Nat) (x : Vec) (p q : Int) (t : Term) :=
  dot n t.mask x + potential p q t.slot

private def row (old : Term → Int) (a b : Term) : Row :=
  let s := (orient a.slot b.slot).2
  ⟨fun j => signed s (a.mask j-b.mask j),signed s (old b-old a)⟩

private theorem dot_sub (x a b : Vec) (n : Nat) :
    dot n (fun j => a j-b j) x=dot n a x-dot n b x := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [dot,ih,Int.sub_mul]; omega

private theorem dot_sign (s : Bool) (x a : Vec) (n : Nat) :
    dot n (fun j => signed s (a j)) x=signed s (dot n a x) := by
  induction n with
  | zero => cases s <;> simp [signed,dot]
  | succ n ih => simp only [dot,ih]; cases s <;> simp [signed,Int.neg_mul,Int.neg_add]

private theorem row_eq (n : Nat) (old : Term → Int) (a b : Term) (x : Vec) (p q : Int) :
    (row old a b).val n x=delta p q (orient a.slot b.slot).1 ↔
    exponent n x p q b-exponent n x p q a=old b-old a := by
  rw [←orient_eq p q a.slot b.slot]
  simp only [Row.val,row,dot_sign,dot_sub,exponent]
  cases (orient a.slot b.slot).2 <;> simp only [signed,if_true,if_false,Bool.false_eq_true] <;> omega

private theorem abs_signed (s) (x : Int) : (signed s x).natAbs=x.natAbs := by
  cases s <;> simp [signed]

theorem compress {G : Type} (n h l : Nat) (hl : 0<l) (ts : G → List Term) (x : Vec)
    (p q : G → Int)
    (binary : ∀ g, ∀ t∈ts g, ∀ j, t.mask j=0 ∨ t.mask j=1)
    (mass_ok : ∀ g, mass (fun t => t.c) (ts g) ≤ 2^(h*l))
    (old_ok : ∀ g, AtZero (ts g) (fun t => t.c) (exponent n x (p g) (q g))) :
    ∃ y, Within n (factor n 3 (3*h)*l) y ∧
      ∀ g, ∃ p' q', AtZero (ts g) (fun t => t.c) (exponent n y p' q') := by
  let old g := exponent n x (p g) (q g)
  let edges (g : G) (e : Edge) (u : Row) :=
    ∃ a∈ts g, ∃ b∈ts g, ((old g b)-(old g a)).natAbs≤h*l ∧
      (orient a.slot b.slot).1=e ∧ row (old g) a b=u
  have bounds g e u (hu : edges g e u) : u.Bounded n 1 (h*l) := by
    obtain ⟨a,ha,b,hb,close,rfl,rfl⟩ := hu
    refine ⟨?_,by simpa only [row,abs_signed] using close⟩
    intro j _
    simp only [row,abs_signed]
    rcases binary _ _ ha j with h1|h1 <;> rcases binary _ _ hb j with h2|h2 <;> rw [h1,h2] <;> decide
  have witness g : ∃ u v, ∀ e r, edges g e r → r.val n x=delta u v e := by
    refine ⟨p g,q g,?_⟩
    rintro _ _ ⟨a,ha,b,hb,_,rfl,rfl⟩
    exact (row_eq ..).mpr rfl
  obtain ⟨y,small,works⟩ := R06Private.compress n 1 h l hl x edges bounds witness
  refine ⟨y,small,?_⟩
  intro g
  obtain ⟨pp,qq,keep⟩ := works g
  refine ⟨pp,qq,R06Transport.transfer (ts g) _ (old g) _ (h*l) (mass_ok g) (old_ok g) ?_⟩
  intro a ha b hb close
  apply (row_eq ..).mp
  exact keep _ _ ⟨a,ha,b,hb,close,rfl,rfl⟩

end R06System
#print axioms R06System.compress
