import McmAudit
namespace R06Expansion

def signed (neg : Bool) (z : Int) : Int := if neg then -z else z

structure Weights where
  negA : Bool
  negB : Bool
  a : Nat
  b : Nat
  out : Nat
  deriving DecidableEq

def Weights.Exact (u : Weights) (a b t : Nat) : Prop :=
  signed u.negA (a * (2:Int)^u.a) + signed u.negB (b * (2:Int)^u.b) = t * (2:Int)^u.out

private theorem orient {a b c : Nat} (h : MCM.Oriented a b c) :
    ∃ j : Nat, (a:Int)+b=c*(2:Int)^j ∨ (a:Int)-b=c*(2:Int)^j ∨ (b:Int)-a=c*(2:Int)^j := by
  rcases h with h|h|h
  all_goals obtain ⟨hc,j,hj,eq⟩ := MCM.powerTimes_iff _ _ |>.mp h
  · exact ⟨j,Or.inl (by exact_mod_cast (eq.trans (Nat.mul_comm _ _)))⟩
  · have pos : 0 < 2^j*c := Nat.mul_pos (Nat.pow_pos (by decide : 0<2)) hc
    have le : b≤a := by omega
    have e := congrArg (fun z : Nat => (z:Int)) eq
    simp only at e
    rw [Int.ofNat_sub le,Int.natCast_mul,Int.natCast_pow] at e
    exact ⟨j,Or.inr (Or.inl (e.trans (Int.mul_comm _ _)))⟩
  · have pos : 0 < 2^j*c := Nat.mul_pos (Nat.pow_pos (by decide : 0<2)) hc
    have le : a≤b := by omega
    have e := congrArg (fun z : Nat => (z:Int)) eq
    simp only at e
    rw [Int.ofNat_sub le,Int.natCast_mul,Int.natCast_pow] at e
    exact ⟨j,Or.inr (Or.inr (e.trans (Int.mul_comm _ _)))⟩

theorem gate_weights {a b t : Nat} (hg : MCM.Gate a b t) :
    ∃ u : Weights, u.Exact a b t := by
  rcases hg with h|h|h
  · obtain ⟨j,h|h|h⟩ := orient h
    · exact ⟨⟨false,false,0,0,j⟩,by simpa [Weights.Exact,signed] using h⟩
    · exact ⟨⟨false,true,0,0,j⟩,by simpa [Weights.Exact,signed,Int.sub_eq_add_neg] using h⟩
    · exact ⟨⟨true,false,0,0,j⟩,by simpa [Weights.Exact,signed,Int.sub_eq_add_neg,Int.add_comm] using h⟩
  · obtain ⟨j,h|h|h⟩ := orient h
    · exact ⟨⟨true,false,0,j,0⟩,by simp [Weights.Exact,signed]; omega⟩
    · exact ⟨⟨false,true,0,j,0⟩,by simp [Weights.Exact,signed]; omega⟩
    · exact ⟨⟨false,false,0,j,0⟩,by simp [Weights.Exact,signed]; omega⟩
  · obtain ⟨j,h|h|h⟩ := orient h
    · exact ⟨⟨false,true,j,0,0⟩,by simp [Weights.Exact,signed]; omega⟩
    · exact ⟨⟨true,false,j,0,0⟩,by simp [Weights.Exact,signed]; omega⟩
    · exact ⟨⟨false,false,j,0,0⟩,by simp [Weights.Exact,signed]; omega⟩

inductive Expr where
  | anchor (label : Nat)
  | join (i : Nat) (negA negB : Bool) (a b : Expr)
  deriving DecidableEq

def Scoped (T : List Nat) : Nat → Expr → Prop
  | _, .anchor a => a ∈ 1::T
  | h, .join i _ _ a b => i<h ∧ Scoped T i a ∧ Scoped T i b

theorem scoped_mono {T i j e} (hs : Scoped T i e) (h : i≤j) : Scoped T j e := by
  cases e with
  | anchor => exact hs
  | join => exact ⟨Nat.lt_of_lt_of_le hs.1 h,hs.2⟩

/-- Sample a dyadic expression at integer scale 2^k. All shifts are signed;
at sufficiently large scales each exponent at a leaf is nonnegative. -/
def sample (x : Nat → Int) : Expr → Int → Int
  | .anchor a, k => (a:Int)*2^k.toNat
  | .join i na nb a b, k =>
    signed na (sample x a (k+x (2*i))) + signed nb (sample x b (k+x (2*i+1)))

def Represents (x : Nat → Int) (e : Expr) (v : Nat) : Prop :=
  ∃ K : Int, ∀ k : Int, K≤k → sample x e k = (v:Int)*2^k.toNat

theorem anchor_rep (x) (v) : Represents x (.anchor v) v := ⟨0,fun _ _ => rfl⟩

theorem sample_agree {T h x y e} (hs : Scoped T h e)
    (agree : ∀ j, j<2*h → x j=y j) (k : Int) : sample x e k=sample y e k := by
  induction e generalizing h k with
  | anchor => rfl
  | join i na nb a b ia ib =>
    obtain ⟨hi,ha,hb⟩ := hs
    have small : ∀ j, j<2*i → x j=y j := fun j hj => agree _ (by omega)
    simp only [sample,agree _ (show 2*i<2*h by omega),agree _ (show 2*i+1<2*h by omega),
      ia ha small,ib hb small]

theorem rep_agree {T h x y e v} (hs : Scoped T h e) (agree : ∀ j, j<2*h → x j=y j)
    (hr : Represents x e v) : Represents y e v := by
  obtain ⟨K,hK⟩ := hr
  exact ⟨K,fun k hk => (sample_agree hs agree k).symm.trans (hK _ hk)⟩

def branch (x : Nat → Int) (na nb : Bool) (a b : Expr) (p q k : Int) :=
  signed na (sample x a (k+p))+signed nb (sample x b (k+q))

def Equation (x : Nat → Int) (na nb : Bool) (a b : Expr) (p q : Int) (t : Nat) :=
  ∃ K : Int, ∀ k : Int, K≤k → branch x na nb a b p q k = (t:Int)*2^k.toNat

private theorem addpow (a b : Nat) : (2:Int)^(a+b)=2^a*2^b := by
  simpa only [Int.natCast_pow,Int.natCast_mul] using congrArg (fun n : Nat => (n:Int)) (Nat.pow_add 2 a b)

private theorem signed_mul (s : Bool) (x y : Int) : signed s (x*y)=signed s x*y := by
  cases s <;> simp [signed,Int.neg_mul]

/-- Exact normalized gate semantics, including an output right shift. -/
theorem equation_of_gate {a b t : Nat} {ea eb : Expr} {x} (u : Weights)
    (hu : u.Exact a b t) (ha : Represents x ea a) (hb : Represents x eb b) :
    Equation x u.negA u.negB ea eb ((u.a:Int)-u.out) ((u.b:Int)-u.out) t := by
  obtain ⟨ka,ha⟩ := ha
  obtain ⟨kb,hb⟩ := hb
  refine ⟨max 0 (max ka kb)+(u.out:Int),?_⟩
  intro k hk
  let n := (k-(u.out:Int)).toNat
  have base : (n:Int)=k-u.out := by dsimp [n]; omega
  have e (i : Nat) : (k+((i:Int)-u.out)).toNat=i+n := by omega
  have out : k.toNat=u.out+n := by omega
  unfold branch
  rw [ha _ (by omega),hb _ (by omega),e,e,out,addpow,addpow,addpow]
  simp only [←Int.mul_assoc,signed_mul,←Int.add_mul]
  simp only [Weights.Exact,signed_mul] at hu
  exact congrArg (fun z : Int => z*2^n) hu

end R06Expansion
#print axioms R06Expansion.gate_weights
#print axioms R06Expansion.equation_of_gate
