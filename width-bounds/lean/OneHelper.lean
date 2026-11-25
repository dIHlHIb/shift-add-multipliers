import Std
namespace OneHelper
-- Min shift divides a difference. Residues d and e here are signed offsets
-- translated by M, so lie in [0, 2*M].
theorem shift_cap (w j k u v d e h M : Nat)
 (hM : M=2^w-1) (hu : u≤M) (hv : v≤M) (hd : d≤2*M) (he : e≤2*M)
 (h1 : h+M=2^j*u+d) (h2 : h+M=2^k*v+e) (hne : d≠e) :
 h≤(2^w+1)*M := by
  have common : 2^(min j k) ∣ 2^j*u := Nat.dvd_trans (Nat.pow_dvd_pow 2 (Nat.min_le_left _ _)) (Nat.dvd_mul_right ..)
  have common' : 2^(min j k) ∣ 2^k*v := Nat.dvd_trans (Nat.pow_dvd_pow 2 (Nat.min_le_right _ _)) (Nat.dvd_mul_right ..)
  have hb : 2^(min j k)≤2*M := by
    obtain ⟨x,hx⟩ := common
    obtain ⟨y,hy⟩ := common'
    let n:=2^min j k
    have eq : n*x+d=n*y+e := by change 2^(min j k)*x+d=2^(min j k)*y+e;omega
    by_cases hxy : x≤y
    · obtain ⟨z,hz⟩ := Nat.exists_eq_add_of_le hxy
      rw [hz,Nat.mul_add] at eq
      have pos : z≥1 := by
        cases z with
        | zero => simp_all
        | succ => omega
      have nh := Nat.mul_le_mul_left n pos
      simp only [Nat.mul_one] at nh
      change n≤2*M
      omega
    · have hyx : y≤x := by omega
      obtain ⟨z,hz⟩ := Nat.exists_eq_add_of_le hyx
      rw [hz,Nat.mul_add] at eq
      have pos : z≥1 := by
        cases z with
        | zero => simp_all
        | succ => omega
      have nh := Nat.mul_le_mul_left n pos
      simp only [Nat.mul_one] at nh
      change n≤2*M
      omega
  have hmin : min j k ≤ w := by
    apply Classical.byContradiction
    intro hn
    have hle : w+1 ≤ min j k := by omega
    have H := Nat.pow_le_pow_right (by decide : 0<2) hle
    rw [Nat.pow_succ] at H
    have := Nat.two_pow_pos w
    omega
  rw [Nat.add_mul,Nat.one_mul]
  by_cases hc : j≤k
  · rw [Nat.min_eq_left hc] at hmin
    have hh := Nat.mul_le_mul (Nat.pow_le_pow_right (by decide : 0<2) hmin) hu
    omega
  · have hk : k≤j := by omega
    rw [Nat.min_eq_right hk] at hmin
    have hh := Nat.mul_le_mul (Nat.pow_le_pow_right (by decide : 0<2) hmin) hv
    omega
end OneHelper
#print axioms OneHelper.shift_cap

