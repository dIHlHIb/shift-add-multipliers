import Sparse
import R06Normalize
import R02NearFamily
namespace MCMWidthGate
open MCMWidthSparse R02Residue MCM

inductive Label | source | anchor | base | base32 | base128 | c | d | u | v
  deriving DecidableEq,Repr
def coefficients : Label → Int × Int
  | .source => (0,1) | .anchor => (256,-1) | .base => (256,-5)
  | .base32 => (256,-37) | .base128 => (256,-133) | .c => (256,-39)
  | .d => (256,-149) | .u => (290,-5) | .v => (400,-5)
def number (k : Nat) : Label → Nat
  | .source => 1 | .anchor => R02NearFamily.anchor k | .base => R02NearFamily.b k
  | .base32 => R02NearFamily.b k-32 | .base128 => R02NearFamily.b k-128
  | .c => R02NearFamily.c k | .d => R02NearFamily.d k
  | .u => R02NearFamily.u k | .v => R02NearFamily.v k
def fixed (l : Label) : Poly := [⟨(coefficients l).1,1,0,0⟩,⟨(coefficients l).2,0,0,0⟩]
theorem fixed_eval (l : Label) (k j p) : eval k j p (fixed l)=(number k l:Int) := by
  have h:=R02NearFamily.x_pos k
  have pp : ((R02NearFamily.x k):Int)=(2:Int)^k := by simp [R02NearFamily.x,Int.natCast_pow]
  cases l <;> simp [fixed,coefficients,eval,atPoint,number,R02NearFamily.anchor,
    R02NearFamily.b,R02NearFamily.c,R02NearFamily.d,R02NearFamily.u,R02NearFamily.v] <;> omega

theorem fixed_odd (l : Label) (k : Nat) : number k l%2=1 := by
  have h:=R02NearFamily.x_pos k
  cases l <;> simp [number,R02NearFamily.anchor,R02NearFamily.b,R02NearFamily.c,
    R02NearFamily.d,R02NearFamily.u,R02NearFamily.v] <;> omega

theorem fixed_bound (l : Label) (k : Nat) : number k l≤400*2^k := by
  have h:=R02NearFamily.x_pos k
  change 0<2^k at h
  cases l <;> simp [number,R02NearFamily.anchor,R02NearFamily.b,R02NearFamily.c,
    R02NearFamily.d,R02NearFamily.u,R02NearFamily.v,R02NearFamily.x] <;> omega

theorem fixed_weight (l : Label) : weight (fixed l)≤550 := by cases l <;> decide
theorem fixed_box (l : Label) : box 1 0 0 (fixed l) := by
  intro z m;simp only [fixed,List.mem_cons,List.mem_nil_iff,or_false] at m
  rcases m with rfl|rfl <;> simp

/-- An unscaled helper birth is N/D. The two birth parents are fixed labels. -/
def numerator (r : Tag) (a b : Label) : Poly :=
  match r.pos with
  | .left => signed (!r.f) (plus (shift 1 0 (fixed a)) (signed r.e (fixed b)))
  | .right => signed (!r.e) (plus (shift 1 0 (fixed b)) (signed r.f (fixed a)))
  | .out => minus (plus (signed r.e (fixed a)) (signed r.f (fixed b)))
def denom (r : Tag) (j : Nat) : Nat := if r.pos == .out then 2^j else 1

theorem numerator_weight (r : Tag) (a b : Label) : weight (numerator r a b)≤1100 := by
  have h:=fixed_weight a;have g:=fixed_weight b
  cases r with | mk pos e f =>
    cases pos <;> simp [numerator,weight_plus,weight_signed,weight_minus,weight_shift];all_goals omega

theorem numerator_box (r : Tag) (a b : Label) : box 1 1 0 (numerator r a b) := by
  have plain (l : Label) := box_weaken (fixed_box l) (Nat.le_refl 1) (show 0≤1 by decide) (Nat.le_refl 0)
  have sh (l : Label) : box 1 1 0 (shift 1 0 (fixed l)) := box_shift 1 0 (fixed_box l)
  cases r with | mk pos e f =>
    cases pos
    · exact box_signed _ (box_plus (sh _) (box_signed _ (plain _)))
    · exact box_signed _ (box_plus (sh _) (box_signed _ (plain _)))
    · exact box_signed false (box_plus (box_signed _ (plain _)) (box_signed _ (plain _)))

theorem num_birth (r : Tag) (k j p h : Nat) (a b : Label)
    (identity : mix r (pow j) (number k a) (number k b) h=0) :
    eval k j p (numerator r a b)=(denom r j:Int)*h := by
  cases r with | mk pos e f =>
    cases pos <;> cases e <;> cases f <;>
      simp [numerator,eval_plus,eval_shift,eval_signed,eval_minus,fixed_eval,
        mix,denom,sig,pow,Int.natCast_pow] at * <;> omega

def fixedScaled (r : Tag) (a : Label) : Poly :=
  if r.pos == .out then shift 1 0 (fixed a) else fixed a

theorem fixed_scaled_eval (r : Tag) (a : Label) (k j p : Nat) :
    eval k j p (fixedScaled r a)=(denom r j:Int)*number k a := by
  cases r with | mk pos e f =>
    cases pos <;> simp [fixedScaled,denom,eval_shift,fixed_eval,Int.natCast_pow]

/-- none is the unique shared helper, some l is a fixed endpoint or core label. -/
def wire (r : Tag) (a b : Label) : Option Label → Poly
  | none => numerator r a b
  | some l => fixedScaled r l

theorem wire_size (r : Tag) (a b : Label) (z : Option Label) :
    weight (wire r a b z)≤1100 ∧ box 1 1 0 (wire r a b z) := by
  cases z with
  | none => exact ⟨numerator_weight r a b,numerator_box r a b⟩
  | some l =>
    have w:=fixed_weight l
    have q:=fixed_box l
    simp only [wire,fixedScaled]
    split
    · exact ⟨by rw [weight_shift];omega,box_shift 1 0 q⟩
    · exact ⟨by omega,box_weaken q (by decide) (by decide) (by decide)⟩

/-- Generic signed gate equation on three scaled wires using the private shift. -/
def gatePoly (s : Tag) (a b c : Poly) :=
  match s.pos with
  | .left => plus (plus (shift 0 1 a) (signed s.e b)) (signed s.f c)
  | .right => plus (plus (shift 0 1 b) (signed s.e c)) (signed s.f a)
  | .out => plus (plus (shift 0 1 c) (signed s.e a)) (signed s.f b)

theorem gate_eval (s : Tag) (a b c : Poly) (k j p : Nat) :
    eval k j p (gatePoly s a b c)=mix s (pow p) (eval k j p a) (eval k j p b) (eval k j p c) := by
  cases s with | mk pos e f =>
    cases pos <;> simp [gatePoly,eval_plus,eval_shift,eval_signed,mix,pow]

theorem gate_size (s : Tag) {a b c : Poly}
    (A : weight a≤1100 ∧ box 1 1 0 a) (B : weight b≤1100 ∧ box 1 1 0 b)
    (C : weight c≤1100 ∧ box 1 1 0 c) : box 4 1 1 (gatePoly s a b c) ∧ weight (gatePoly s a b c)≤4096 := by
  have narrow {v : Poly} (h : box 1 1 0 v) (s : Bool) := box_weaken (box_signed s h)
    (show 1≤4 by decide) (Nat.le_refl 1) (show 0≤1 by decide)
  have raised {v : Poly} (h : box 1 1 0 v) := box_weaken (box_shift 0 1 h)
    (show 1≤4 by decide) (Nat.le_refl 1) (Nat.le_refl 1)
  cases s with | mk pos e f =>
    cases pos <;> constructor
    · exact box_plus (box_plus (raised A.2) (narrow B.2 e)) (narrow C.2 f)
    · simp [gatePoly,weight_plus,weight_shift,weight_signed];omega
    · exact box_plus (box_plus (raised B.2) (narrow C.2 e)) (narrow A.2 f)
    · simp [gatePoly,weight_plus,weight_shift,weight_signed];omega
    · exact box_plus (box_plus (raised C.2) (narrow A.2 e)) (narrow B.2 f)
    · simp [gatePoly,weight_plus,weight_shift,weight_signed];omega

end MCMWidthGate
#print axioms MCMWidthGate.num_birth
#print axioms MCMWidthGate.gate_size
