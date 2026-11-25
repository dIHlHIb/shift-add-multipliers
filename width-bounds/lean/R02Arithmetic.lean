import OneHelper
import McmAudit

namespace R02Arithmetic
open MCM

def offset (M : Nat) (plus : Bool) (v : Nat) := if plus then M+v else M-v

private theorem shifted_ge {n z : Nat} (pt : PowerTimes n z) : 2*z ≤ n := by
  obtain ⟨_,j,hj,rfl⟩ := (powerTimes_iff ..).mp pt
  exact Nat.mul_le_mul_right _ (show 2^1≤2^j from Nat.pow_le_pow_right (by decide : 0<2) hj)

private theorem orient_big {a b h M : Nat} (ha : a≤M) (big : M<h)
    (g : Oriented a h b) :
    ∃ j s, 0<j ∧ h+M=2^j*b+offset M s a := by
  rcases g with g|g|g
  · obtain ⟨_,j,hj,eq⟩ := (powerTimes_iff ..).mp g
    exact ⟨j,false,hj,by simp [offset]; omega⟩
  · obtain ⟨pos,j,_,eq⟩ := (powerTimes_iff ..).mp g
    have := Nat.mul_pos (Nat.two_pow_pos j) pos
    omega
  · obtain ⟨_,j,hj,eq⟩ := (powerTimes_iff ..).mp g
    exact ⟨j,true,hj,by simp [offset]; omega⟩

theorem oversized {a b h M : Nat} (ha : a≤M) (hb : b≤M) (big : M<h)
    (g : Gate a b h) :
    ∃ u v j s, ((u=a ∧ v=b) ∨ (u=b ∧ v=a)) ∧ 0<j ∧ h+M=2^j*u+offset M s v := by
  rcases g with g|g|g
  · rcases g with g|g|g <;> have := shifted_ge g <;> omega
  · obtain ⟨j,s,hj,eq⟩ := orient_big ha big g
    exact ⟨b,a,j,s,Or.inr ⟨rfl,rfl⟩,hj,eq⟩
  · obtain ⟨j,s,hj,eq⟩ := orient_big hb big g
    exact ⟨a,b,j,s,Or.inl ⟨rfl,rfl⟩,hj,eq⟩

theorem odd_unique {u v : Nat} (hu : u%2=1) (hv : v%2=1) (j k : Nat)
    (eq : 2^j*u=2^k*v) : u=v := by
  induction j generalizing k with
  | zero => cases k <;> simp only [Nat.pow_zero,Nat.one_mul,Nat.pow_succ,
                                     Nat.mul_comm _ 2,Nat.mul_assoc] at eq <;> omega
  | succ j ih =>
    cases k with
    | zero => simp only [Nat.pow_zero,Nat.one_mul,Nat.pow_succ,Nat.mul_comm _ 2,Nat.mul_assoc] at eq; omega
    | succ k => exact ih k (by simp only [Nat.pow_succ,Nat.mul_comm _ 2,Nat.mul_assoc] at eq; omega)

private theorem offset_injective {M a b : Nat} {s t : Bool} (ha : a≤M) (hb : b≤M)
    (eq : offset M s a=offset M t b) : a=b := by
  cases s <;> cases t <;> simp only [offset,Bool.false_eq_true,if_false,if_true] at eq <;> omega

theorem two_relations {a b c t h w : Nat} (ha : a≤2^w-1) (hb : b≤2^w-1)
    (hc : c≤2^w-1) (ht : t≤2^w-1)
    (oa : a%2=1) (ob : b%2=1) (oc : c%2=1) (ot : t%2=1)
    (freshA : t≠a) (freshB : t≠b) (big : 2^w-1<h)
    (birth : Gate a b h) (use : Gate c t h) : h<2^(2*w) := by
  let M := 2^w-1
  obtain ⟨u,v,j,s,pair,_,eq⟩ := oversized ha hb big birth
  obtain ⟨z,y,k,f,pair',_,eq'⟩ := oversized hc ht big use
  have ou : u%2=1 := by rcases pair with ⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;> assumption
  have oz : z%2=1 := by rcases pair' with ⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;> assumption
  have hu : u≤M ∧ v≤M := by rcases pair with ⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;> exact ⟨by assumption,by assumption⟩
  have hz : z≤M ∧ y≤M := by rcases pair' with ⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;> exact ⟨by assumption,by assumption⟩
  have off (v) (s : Bool) (h : v≤M) : offset M s v≤2*M := by cases s <;> simp [offset] <;> omega
  have ne : offset M s v≠offset M f y := by
    intro e
    have e1 := offset_injective hu.2 hz.2 e
    have e2 := odd_unique ou oz j k (by change offset (2^w-1) s v=offset (2^w-1) f y at e; omega)
    rcases pair with ⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;> rcases pair' with ⟨rfl,rfl⟩|⟨rfl,rfl⟩ <;> omega
  have bound := OneHelper.shift_cap w j k u z _ _ h M rfl hu.1 hz.1 (off _ _ hu.2) (off _ _ hz.2) eq eq' ne
  have pos := Nat.two_pow_pos w
  have poly : (2^w+1)*M+1=2^(2*w) := by
    rw [show 2*w=w+w by omega,Nat.pow_add]
    change (2^w+1)*(2^w-1)+1=_
    rw [Nat.mul_sub,Nat.add_mul,Nat.mul_one,Nat.one_mul]
    have hpos := Nat.le_mul_of_pos_left (2^w) pos
    omega
  omega

theorem repeated {h t : Nat} (oh : h%2=1) (ot : t%2=1) (g : Gate h h t) : h≤t := by
  rcases g with (g|g|g)|g|g
  · obtain ⟨_,j,_,eq⟩ := (powerTimes_iff ..).mp g
    have same := odd_unique oh ot 1 j (by simpa [Nat.two_mul] using eq)
    omega
  · have := shifted_ge g; omega
  · have := shifted_ge g; omega
  all_goals rcases g with g|g|g <;> have := shifted_ge g <;> omega

end R02Arithmetic
#print axioms R02Arithmetic.two_relations
#print axioms R02Arithmetic.repeated
