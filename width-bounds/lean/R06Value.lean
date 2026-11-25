import R06Targets
import R06Normalize
namespace R06Value
open R06Expansion R06Paths McmSmall R06Normalize

def Label (x : Vec) (e : Expr) (v : Nat) := (v=0 ∨ v%2=1) ∧
  ∃ neg : Bool, ∃ d K : Int, ∀ k : Int, K≤k → sample x e k=signed neg ((v:Int)*power (k+d))

theorem anchor_label (x : Vec) (v : Nat) (odd : v%2=1) : Label x (.anchor v) v :=
  ⟨Or.inr odd,false,0,0,by intro k _; simp [sample,signed,power]⟩

private theorem pow_add (a b : Nat) : (2:Int)^(a+b)=2^a*2^b := by
  simpa only [Int.natCast_pow,Int.natCast_mul] using congrArg (fun n : Nat => (n:Int)) (Nat.pow_add 2 a b)

private theorem power_add (a b : Int) (ha : 0≤a) (hb : 0≤b) : power (a+b)=power a*power b := by
  unfold power
  rw [show (a+b).toNat=a.toNat+b.toNat by omega,pow_add]

private theorem sigma_mul {A} (ts : List A) (f : A → Int) (x : Int) :
    sigma (fun t => f t*x) ts = sigma f ts*x := by
  induction ts with
  | nil => simp [sigma]
  | cons a ts ih => simp [sigma,ih,Int.add_mul]

private theorem sigma_bound {A} (ts : List A) (c f : A → Int) (z : Nat)
    (hf : ∀ a∈ts, (f a).natAbs≤z) : (sigma (fun a => c a*f a) ts).natAbs ≤ mass c ts*z := by
  induction ts with
  | nil => simp [sigma,mass]
  | cons a ts ih =>
    simp only [mass,sigma,Nat.add_mul]
    apply Nat.le_trans (Int.natAbs_add_le ..)
    apply Nat.add_le_add _ (ih (fun b hb => hf _ (List.mem_cons_of_mem _ hb)))
    rw [Int.natAbs_mul]
    exact Nat.mul_le_mul_left _ (hf a (by simp))

private theorem abs_power (k : Int) : (power k).natAbs=2^k.toNat := by
  change (((2:Nat):Int)^k.toNat).natAbs=_
  rw [←Int.natCast_pow]; rfl

private theorem eligible {T r e} (sc : Scoped T r e) {x : Vec} {U} (sm : Within (2*r) U x)
    (a : Path) (ha : a∈paths e) : (dot (2*r) a.mask x).natAbs ≤ (2*r)*U := by
  have bound : Within (2*r) 1 a.mask := by
    intro j _
    rcases (binary sc _ ha).1 j with hz|hz <;> rw [hz] <;> decide
  simpa using dot_bound bound sm

private theorem signed_mul (s : Bool) (a b : Int) : signed s a*b=signed s (a*b) := by
  cases s <;> simp [signed,Int.neg_mul]

/-- Recover a positive odd fundamental (or zero) from any bounded-shift helper.
The value at a single common integer scale additionally bounds the label. -/
theorem bounded_label {T r e w U} {x : Vec} (sc : Scoped T r e)
    (cap : ∀ t∈1::T, t≤2^w) (sm : Within (2*r) U x) :
    ∃ v, Label x e v ∧ v≤2^(r+w+2*((2*r)*U)) := by
  let D := (2*r)*U
  let V := sample x e (D:Int)
  have scale (k : Int) (hk : (D:Int)≤k) : sample x e k=V*power (k-D) := by
    unfold V
    rw [←expand sc _ (Nat.le_refl _) x k,←expand sc _ (Nat.le_refl _) x (D:Int),←sigma_mul]
    apply sigma_ext
    intro a ha
    have bound := eligible sc sm a ha
    have lo : 0≤(D:Int)+dot (2*r) a.mask x := by change 0≤(((2*r)*U:Nat):Int)+_; omega
    simp only [pathval,Int.mul_assoc]
    rw [←power_add _ _ lo (by omega),show (D:Int)+dot (2*r) a.mask x+(k-D)=k+dot (2*r) a.mask x by omega]
  have vbound : V.natAbs ≤ 2^(r+w+2*D) := by
    unfold V
    rw [←expand sc _ (Nat.le_refl _) x (D:Int)]
    have point (a) (ha : a∈paths e) : (power ((D:Int)+dot (2*r) a.mask x)).natAbs≤2^(2*D) := by
      rw [abs_power]
      apply Nat.pow_le_pow_right (by decide)
      have b := eligible sc sm a ha
      change _≤2*((2*r)*U)
      dsimp [D]; omega
    have h := sigma_bound (paths e) Path.c _ _ point
    have m := Nat.mul_le_mul_right (2^(2*D)) (mass_bound sc w cap)
    rw [Nat.pow_add 2 (r+w),Nat.pow_add 2 r w]
    exact Nat.le_trans h m
  by_cases zero : V=0
  · refine ⟨0,⟨Or.inl rfl,false,0,(D:Int),?_⟩,Nat.zero_le _⟩
    intro k hk
    rw [scale k hk,zero]; simp [signed]
  · obtain ⟨v,d,odd,eq,le⟩ := odd_factor V.natAbs (Int.natAbs_pos.mpr zero)
    let neg := decide (V<0)
    have sign : V=signed neg (V.natAbs:Int) := by
      by_cases ne : V<0 <;> simp [neg,signed,ne] <;> omega
    refine ⟨v,⟨Or.inr odd,neg,(d:Int)-D,(D:Int),?_⟩,Nat.le_trans le vbound⟩
    intro k hk
    rw [scale k hk,sign,eq,Int.natCast_mul,Int.natCast_pow,signed_mul,Int.mul_assoc]
    have hd : power (d:Int)=(2:Int)^d := by simp [power]
    change signed neg ((v:Int)*((2:Int)^d*power (k-D))) = _
    rw [←hd,←power_add _ _ (by omega) (by omega),show (d:Int)+(k-D)=k+(d-D) by omega]

end R06Value
#print axioms R06Value.bounded_label
