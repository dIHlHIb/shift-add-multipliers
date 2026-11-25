import R06Expansion
namespace R06Normalize
open R06Expansion MCM

private theorem power_witness {a n j : Nat} (ha : a%2=1) (hj : 0<j) (eq : n=a*2^j) :
    PowerTimes n a := (powerTimes_iff ..).mpr ⟨by omega,j,hj,eq.trans (Nat.mul_comm ..)⟩

private theorem natural_gate {a b c : Nat} (ha : a%2=1) (hb : b%2=1) (hc : c%2=1)
    (i j k : Nat) (eq : a*2^i+b*2^j=c*2^k) : Gate a b c := by
  induction i generalizing j k with
  | zero =>
    cases j with
    | zero =>
      cases k with
      | zero => simp only [Nat.pow_zero,Nat.mul_one] at eq; omega
      | succ k =>
        simp only [Nat.pow_zero,Nat.mul_one] at eq
        exact Or.inl (Or.inl (power_witness hc (by omega : 0<k+1) eq))
    | succ j =>
      cases k with
      | zero =>
        simp only [Nat.pow_zero,Nat.mul_one] at eq
        exact Or.inr (Or.inl (Or.inr (Or.inr (power_witness hb (by omega : 0<j+1) (by omega)))))
      | succ k => simp only [Nat.pow_zero,Nat.mul_one,Nat.pow_succ,←Nat.mul_assoc] at eq; omega
  | succ i ih =>
    cases j with
    | zero =>
      cases k with
      | zero =>
        simp only [Nat.pow_zero,Nat.mul_one] at eq
        exact Or.inr (Or.inr (Or.inr (Or.inr (power_witness ha (by omega : 0<i+1) (by omega)))))
      | succ k => simp only [Nat.pow_zero,Nat.mul_one,Nat.pow_succ,←Nat.mul_assoc] at eq; omega
    | succ j =>
      cases k with
      | zero => simp only [Nat.pow_zero,Nat.mul_one,Nat.pow_succ,←Nat.mul_assoc] at eq; omega
      | succ k =>
        simp only [Nat.pow_succ,←Nat.mul_assoc] at eq
        exact ih j k (by omega)

private theorem same_odd {a b : Nat} (ha : a%2=1) (hb : b%2=1)
    (i j : Nat) (eq : a*2^i=b*2^j) : a=b := by
  induction i generalizing j with
  | zero => cases j <;> simp only [Nat.pow_zero,Nat.mul_one,Nat.pow_succ,←Nat.mul_assoc] at eq <;> omega
  | succ i ih =>
    cases j with
    | zero => simp only [Nat.pow_zero,Nat.mul_one,Nat.pow_succ,←Nat.mul_assoc] at eq; omega
    | succ j => exact ih j (by simp only [Nat.pow_succ,←Nat.mul_assoc] at eq; omega)

theorem gate_of_signed_odd {a b c : Nat} (ha : a%2=1) (hb : b%2=1) (hc : c%2=1)
    (i j k : Nat) (s t u : Bool)
    (eq : signed s ((a*2^i:Nat):Int)+signed t ((b*2^j:Nat):Int)=signed u ((c*2^k:Nat):Int)) :
    Gate a b c := by
  let A := a*2^i
  let B := b*2^j
  let C := c*2^k
  have shape : A+B=C ∨ A+C=B ∨ B+C=A := by
    change signed s (A:Int)+signed t (B:Int)=signed u (C:Int) at eq
    cases s <;> cases t <;> cases u <;> simp only [signed,Bool.false_eq_true,if_true,if_false] at eq <;> omega
  rcases shape with e|e|e
  · exact natural_gate ha hb hc i j k e
  · have g := natural_gate ha hc hb i k j e
    exact (gate_swap ..).mpr ((gate_cycle ..).mpr g)
  · exact (gate_cycle ..).mpr (natural_gate hb hc ha j k i e)

/-- The canonical gate exactly represents signed shift/add with a free output shift
on odd positive fundamentals. Both directions allow equal labels and repeated parents. -/
theorem gate_iff_weights {a b t : Nat} (ha : a%2=1) (hb : b%2=1) (ht : t%2=1) :
    Gate a b t ↔ ∃ u : Weights, u.Exact a b t := by
  refine ⟨gate_weights,?_⟩
  rintro ⟨u,h⟩
  apply gate_of_signed_odd ha hb ht u.a u.b u.out u.negA u.negB false
  simpa only [Int.natCast_mul,Int.natCast_pow,signed,Bool.false_eq_true,if_false,Weights.Exact]
    using h

inductive Outcome (a b t : Nat) : Prop
  | zero : t=0 → Outcome a b t
  | left : t=a → Outcome a b t
  | right : t=b → Outcome a b t
  | gate : a%2=1 → b%2=1 → Gate a b t → Outcome a b t

private theorem signed_abs (s : Bool) (n : Nat) : (signed s (n:Int)).natAbs=n := by
  cases s <;> simp [signed]

/-- Independent of all exponent bounds. Clearing the three denominators of a
dyadic gate yields a legal normalized gate or a free copy or zero. -/
theorem normalize {a b c : Nat} (ha : a=0 ∨ a%2=1) (hb : b=0 ∨ b%2=1)
    (hc : c=0 ∨ c%2=1) (i j k : Nat) (s t u : Bool)
    (eq : signed s ((a*2^i:Nat):Int)+signed t ((b*2^j:Nat):Int)=signed u ((c*2^k:Nat):Int)) :
    Outcome a b c := by
  rcases hc with rfl|hc
  · exact .zero rfl
  rcases ha with rfl|ha
  · have eq' : signed t ((b*2^j:Nat):Int)=signed u ((c*2^k:Nat):Int) := by
      simpa [signed] using eq
    have ee := congrArg Int.natAbs eq'
    rw [signed_abs,signed_abs] at ee
    rcases hb with rfl|hb
    · have hp : 0<c*2^k := Nat.mul_pos (by omega) (Nat.pow_pos (by decide))
      simp only [Nat.zero_mul] at ee; omega
    · exact .right (same_odd hb hc j k ee).symm
  rcases hb with rfl|hb
  · have eq' : signed s ((a*2^i:Nat):Int)=signed u ((c*2^k:Nat):Int) := by
      simpa [signed] using eq
    have ee := congrArg Int.natAbs eq'
    rw [signed_abs,signed_abs] at ee
    exact .left (same_odd ha hc i k ee).symm
  exact .gate ha hb (gate_of_signed_odd ha hb hc i j k s t u eq)

theorem odd_factor (a : Nat) (ha : 0<a) : ∃ v d : Nat, v%2=1 ∧ a=v*2^d ∧ v≤a := by
  induction a using Nat.strongRecOn with
  | ind a ih =>
    by_cases odd : a%2=1
    · exact ⟨a,0,odd,by simp,Nat.le_refl _⟩
    · have half : a/2<a := by omega
      obtain ⟨v,d,hv,eq,le⟩ := ih (a/2) half (by omega)
      refine ⟨v,d+1,hv,?_,by omega⟩
      rw [Nat.pow_succ,←Nat.mul_assoc,←eq]; omega

end R06Normalize
#print axioms R06Normalize.normalize
#print axioms R06Normalize.gate_iff_weights
