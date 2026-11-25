import R06Cost
namespace R06Polynomial
open R06Cost R06Decide R06Candidates

def width : List Nat → Nat
  | [] => 0
  | a::as => max (a.log2+1) (width as)

def size : List Nat → Nat
  | [] => 1
  | a::as => a.log2+2+size as

theorem input_bounds (T : List Nat) : T.length≤size T ∧ width T≤size T ∧ ∀ t∈T,t<2^(width T) := by
  induction T with
  | nil => simp [size,width]
  | cons a T ih =>
    obtain ⟨count,w,cap⟩ := ih
    refine ⟨by simp [size]; omega,by simp only [width,size]; omega,?_⟩
    intro t ht
    rcases List.mem_cons.mp ht with rfl|mem
    · exact Nat.lt_of_lt_of_le Nat.lt_log2_self (Nat.pow_le_pow_right (by decide) (Nat.le_max_left ..))
    · exact Nat.lt_of_lt_of_le (cap t mem) (Nat.pow_le_pow_right (by decide) (Nat.le_max_right ..))

def run (T : List Nat) (r : Nat) := decideMCM T r (width T)
theorem correct {T : List Nat} {r : Nat} (nd : T.Nodup) (nontrivial : 1∉T) :
    run T r=true ↔ MCM.Fits MCM.unbounded T (T.length+r) :=
  R06Decide.correct nd nontrivial (input_bounds T).2.2

/-- Natural polynomials with fixed natural exponents. -/
inductive Poly where
  | var | const (c : Nat) | add (a b : Poly) | mul (a b : Poly) | pow (base : Poly) (k : Nat)
def Poly.eval (n : Nat) : Poly → Nat
  | .var => n | .const c => c | .add a b => a.eval n+b.eval n
  | .mul a b => a.eval n*b.eval n | .pow a k => (a.eval n)^k

def Poly.degree : Poly → Nat
  | .var => 1 | .const _ => 0 | .add a b => max a.degree b.degree
  | .mul a b => a.degree+b.degree | .pow a k => a.degree*k

def polynomial (r : Nat) : Poly :=
  let s : Poly := .add .var (.const (r+1))
  let b : Poly := .mul (.const (R06Width.g r)) (.add .var (.const 1))
  let f : Poly := .mul s (.mul s (.mul (.add b (.const 1)) (.const 9)))
  let w : Poly := .add (.add (.add (.const 1) (.pow s 4)) (.pow s 2)) f
  .mul w (.pow (.add (.const 1) f) r)

theorem degree (r : Nat) : (polynomial r).degree=4+3*r := by simp [polynomial,Poly.degree]; decide

private theorem expr (r z : Nat) :
    (polynomial r).eval z =
      let s := z+(r+1)
      let b := R06Width.g r*(z+1)
      work s b*(1+fan s b)^r := by
  simp only [polynomial,Poly.eval,work,fan,cube,Nat.pow_succ,Nat.pow_zero,Nat.one_mul,Nat.mul_assoc]

/-- Full search charge (gate checks, raw branching visits, output membership)
is bounded by an explicit fixed polynomial in the encoded input at each surplus. -/
theorem polynomial_charge (T : List Nat) (r : Nat) :
    (metered (R06Width.g r*(width T+1)) T r []).2 ≤ (polynomial r).eval (size T) := by
  let N := size T
  let s := N+(r+1)
  let B := R06Width.g r*(width T+1)
  let B' := R06Width.g r*(N+1)
  have ⟨hn,hw,_⟩ := input_bounds T
  have order : B≤B' := Nat.mul_le_mul_left _ (by dsimp [N]; omega)
  have base : T.length+([]:List Nat).length+r+1≤s := by dsimp [s,N]; omega
  have ff : fan s B ≤ fan s B' := Nat.mul_le_mul_left _ (Nat.mul_le_mul_left _
    (Nat.mul_le_mul_right _ (by omega)))
  have ww : work s B ≤ work s B' := by unfold work; omega
  rw [expr]
  exact Nat.le_trans (charged_work B T [] r s base)
    (Nat.mul_le_mul ww (Nat.pow_le_pow_left (by omega : 1+fan s B≤1+fan s B') r))

/-- A raw candidate, even one subsequently rejected, has O(B) bits. -/
theorem raw_bits {B a b j v : Nat} (ha : a<2^B) (hb : b<2^B) (hj : j≤B)
    (hv : v∈atShift a b j) : v<2^(B+B+2) := by
  let m := 2^B
  have pos : 0<m := Nat.two_pow_pos B
  have sh := Nat.pow_le_pow_right (by decide : 0<2) hj
  have a0 : a≤m := Nat.le_of_lt ha
  have b0 : b≤m := Nat.le_of_lt hb
  have mm : m≤m*m := Nat.le_mul_of_pos_right _ pos
  have ab : a≤m*m := Nat.le_trans a0 mm
  have bb : b≤m*m := Nat.le_trans b0 mm
  have l : 2^j*a≤m*m := Nat.mul_le_mul sh a0
  have r : 2^j*b≤m*m := Nat.mul_le_mul sh b0
  have one : 0<m*m := Nat.mul_pos pos pos
  have p := Nat.div_le_self (a+b) (2^j)
  have q := Nat.div_le_self (a-b) (2^j)
  have z := Nat.div_le_self (b-a) (2^j)
  rw [Nat.pow_add 2 (B+B),Nat.pow_add 2 B B]
  change v<m*m*4
  simp only [atShift,List.mem_cons,List.mem_nil_iff,or_false] at hv
  omega

end R06Polynomial
#print axioms R06Polynomial.correct
#print axioms R06Polynomial.polynomial_charge
#print axioms R06Polynomial.degree
#print axioms R06Polynomial.raw_bits
