import GatePoly
namespace MCMWidthLift
open MCMWidthGate MCMWidthSparse R02Residue MCM

def scale (d z : Nat) : Int := (2:Int)^d*(z:Int)
private theorem oriented {x y z : Nat} (ox : x%2=1) (oy : y%2=1) (oz : z%2=1)
    (i j k q : Nat) (e f : Bool)
    (eq : pow q*scale k z+sig e*scale i x+sig f*scale j y=0) : Gate x y z := by
  apply R06Normalize.gate_of_signed_odd ox oy oz i j (q+k) e f false
  have cast (a v : Nat) : ((v*2^a:Nat):Int)=scale a v := by simp [scale,Int.natCast_pow,Int.mul_comm]
  rw [cast,cast,cast]
  have comb : scale (q+k) z=pow q*scale k z := by
    change pow (q+k)*z=pow q*(pow k*z)
    rw [pow_sum,Int.mul_assoc]
  rw [comb]
  cases e <;> cases f <;> simp [sig,R06Expansion.signed] at * <;> omega

theorem unscale {x y z : Nat} (ox : x%2=1) (oy : y%2=1) (oz : z%2=1)
    (i j k q : Nat) (r : Tag)
    (eq : mix r (pow q) (scale i x) (scale j y) (scale k z)=0) : Gate x y z := by
  obtain ⟨pos,e,f⟩:=r
  cases pos with
  | out => exact oriented ox oy oz i j k q e f eq
  | right =>
    have g:=oriented oz ox oy k i j q e f eq
    exact (gate_cycle ..).mpr ((gate_cycle ..).mpr g)
  | left =>
    have g:=oriented oy oz ox j k i q e f eq
    exact (gate_cycle ..).mpr g

def numVal (r : Tag) (k j : Nat) (a b : Label) := eval k j 0 (numerator r a b)
theorem num_at (r : Tag) (k j p : Nat) (a b : Label) :
    eval k j p (numerator r a b)=numVal r k j a b := by
  cases r with | mk pos e f =>
    cases pos <;> simp [numVal,numerator,eval_shift,eval_plus,eval_minus,eval_signed,fixed_eval]

def denomShift (r : Tag) (j : Nat) := if r.pos == .out then j else 0
theorem scale_fixed (r : Tag) (k j : Nat) (l : Label) :
    (denom r j:Int)*number k l=scale (denomShift r j) (number k l) := by
  cases r with | mk pos e f =>
    cases pos <;> simp [denom,denomShift,scale,Int.natCast_pow]

theorem birth_identity (r : Tag) (k j : Nat) (a b : Label) :
    mix r (pow j) (number k a) (number k b) (numVal r k j a b)=0 ∨
    (r.pos=.out ∧
      (sig r.e*(number k a:Int)+sig r.f*(number k b:Int)+numVal r k j a b=0)) := by
  cases r with | mk pos e f =>
    cases pos <;> cases e <;> cases f <;>
      simp [mix,numVal,numerator,eval_shift,eval_minus,eval_plus,eval_signed,fixed_eval,sig,pow] <;> omega

theorem normalized_birth (r : Tag) (k j : Nat) (a b : Label) {h d : Nat}
    (odd : h%2=1) (factor : numVal r k j a b=scale d h) :
    Gate (number k a) (number k b) h := by
  obtain ⟨pos,e,f⟩:=r
  cases pos with
  | left =>
    apply unscale (fixed_odd a k) (fixed_odd b k) odd 0 0 d j ⟨.left,e,f⟩
    rw [←factor]
    rcases birth_identity ⟨.left,e,f⟩ k j a b with h|h
    · simpa [scale] using h
    · cases h.1
  | right =>
    apply unscale (fixed_odd a k) (fixed_odd b k) odd 0 0 d j ⟨.right,e,f⟩
    rw [←factor]
    rcases birth_identity ⟨.right,e,f⟩ k j a b with h|h
    · simpa [scale] using h
    · cases h.1
  | out =>
    apply unscale (fixed_odd a k) (fixed_odd b k) odd 0 0 d 0 ⟨.out,e,f⟩
    rw [←factor]
    cases e <;> cases f <;> simp [numVal,numerator,eval_minus,eval_plus,eval_signed,fixed_eval,mix,scale,pow,sig] <;> omega

def cap (k : Nat) := 2^(k+k+8)
def capPoly : Poly := [⟨256,2,0,0⟩]
private theorem cap_eval (k j p : Nat) : eval k j p capPoly=(cap k:Int) := by
  simp only [capPoly,eval,atPoint,Nat.zero_mul,Nat.add_zero,Int.add_zero,cap,Int.natCast_pow]
  have e : k+k+8=8+2*k := by omega
  rw [e]
  exact (pow_sum 8 (2*k)).symm

def limitPoly (r : Tag) (a b : Label) :=
  plus (if r.pos == .out then shift 1 0 capPoly else capPoly) (minus (numerator r a b))
theorem limit_eval (r : Tag) (a b : Label) (k j p : Nat) :
    eval k j p (limitPoly r a b)=(denom r j:Int)*cap k-numVal r k j a b := by
  cases r with | mk pos e f =>
    cases pos <;> simp [limitPoly,denom,eval_plus,eval_minus,eval_shift,cap_eval,
      num_at,Int.natCast_pow,Int.sub_eq_add_neg]

theorem limit_size (r : Tag) (a b : Label) : box 4 1 1 (limitPoly r a b) ∧ weight (limitPoly r a b)≤4096 := by
  have w:=numerator_weight r a b
  have bound:=box_weaken (box_signed false (numerator_box r a b)) (show 1≤4 by decide)
      (Nat.le_refl 1) (show 0≤1 by decide)
  have cc : box 2 0 0 capPoly := by intro x m;simp [capPoly] at m;subst x;decide
  have cw : weight capPoly=256 := rfl
  unfold limitPoly
  split
  · exact ⟨box_plus (box_weaken (box_shift 1 0 cc) (by decide) (by decide) (by decide)) bound,
          by rw [weight_plus,weight_shift,cw,weight_minus];omega⟩
  · exact ⟨box_plus (box_weaken cc (by decide) (by decide) (by decide)) bound,
          by rw [weight_plus,cw,weight_minus];omega⟩

theorem cap_normalized (r : Tag) (a b : Label) {K J h : Nat} (large : 2≤K)
    (bound : numVal r K J a b < (denom r J:Int)*cap K)
    (le : (h:Int)≤numVal r K J a b) : h<cap K := by
  have p : 4≤2^K := Nat.pow_le_pow_right (by decide : 0<2) large
  have ab:=fixed_bound a K;have bb:=fixed_bound b K
  have c : 800*2^K<cap K := by
    have s : 800<2^K*256 := by omega
    have g:=Nat.mul_lt_mul_of_pos_left s (Nat.two_pow_pos K)
    dsimp [cap];rw [Nat.pow_add,Nat.pow_add]
    change _<2^K*2^K*256
    rw [Nat.mul_assoc]
    simpa [Nat.mul_comm 800] using g
  obtain ⟨pos,e,f⟩:=r
  cases pos with
  | left => simp [denom] at bound;omega
  | right => simp [denom] at bound;omega
  | out =>
    have n : numVal ⟨.out,e,f⟩ K J a b≤(number K a:Int)+number K b := by
      cases e <;> cases f <;> simp [numVal,numerator,eval_minus,eval_plus,eval_signed,fixed_eval,sig] <;> omega
    omega

end MCMWidthLift
#print axioms MCMWidthLift.normalized_birth
#print axioms MCMWidthLift.cap_normalized
