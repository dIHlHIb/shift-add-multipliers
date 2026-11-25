import R02Screen
import R06Graph
namespace R02NearFamily
set_option maxRecDepth 8192
open MCM R02Residue R02Screen

def x (k : Nat) := 2^k
def anchor (k : Nat) := 256*x k-1
def b (k : Nat) := 256*x k-5
def c (k : Nat) := 256*x k-39
def d (k : Nat) := 256*x k-149
def u (k : Nat) := 290*x k-5
def v (k : Nat) := 400*x k-5
def core (k : Nat) := [1,anchor k,b k,b k-32,b k-128,c k,d k]
def targets (k : Nat) := [anchor k,b k,b k-32,b k-128,c k,d k,u k,v k]
def wide (k : Nat) := (x k+1)*b k

theorem x_pos (k : Nat) : 0<x k := Nat.two_pow_pos _
theorem target_shape (k : Nat) : (targets k).Nodup ∧ 1∉targets k ∧
    u k∉core k ∧ v k∉core k ∧ u k≠v k := by
  have := x_pos k
  simp [targets,core,anchor,b,c,d,u,v]; omega

theorem affine {k z : Nat} (phase : k%31=10) (A B : Nat)
    (eq : z+B=A*x k) : red z=red ((A:Int)*1024-B) := by
  have xx : red (x k : Nat)=red (1024:Int) := by
    have p:=periodic k
    rw [phase] at p
    simpa [x,pow,Int.natCast_pow] using p
  have zi : (z:Int)+B=A*(x k:Nat) := by
    exact_mod_cast eq
  have rew : (z:Int)=A*(x k:Nat)+ -(B:Int) := by omega
  rw [rew]
  simpa [Int.sub_eq_add_neg] using red_add (red_mul (a:= (A:Int)) rfl xx) (a:= (A:Int)*(x k:Nat)) (b:= -(B:Int)) rfl

def names (k z : Nat) (A : Slot) :=
  (A=fixed 262139 → z=b k) ∧ (A=fixed 262105 → z=c k) ∧ (A=fixed 261995 → z=d k)

private theorem rep_fixed {h z : Nat} {n : Int} (e : red z=red n) : represents h z (fixed n) := by
  simpa [represents,fixed,value] using e

theorem represent_core (k : Nat) (phase : k%31=10) (h : Nat) {z : Nat} (mem : z∈core k) :
    ∃ A∈start,represents h z A ∧ names k z A := by
  have pos:=x_pos k
  simp only [core,List.mem_cons,List.mem_nil_iff,or_false] at mem
  rcases mem with m|m|m|m|m|m|m <;> subst z
  · refine ⟨fixed 1,by decide,rep_fixed ?_,?_⟩
    · rfl
    · simp [names,fixed]
  · refine ⟨fixed 262143,by decide,rep_fixed ?_,?_⟩
    · exact affine phase 256 1 (by simp [anchor]; omega)
    · simp [names,fixed]
  · refine ⟨fixed 262139,by decide,rep_fixed ?_,?_⟩
    · exact affine phase 256 5 (by simp [b]; omega)
    · simp [names,fixed]
  · refine ⟨fixed 262107,by decide,rep_fixed ?_,?_⟩
    · exact affine phase 256 37 (by simp [b]; omega)
    · simp [names,fixed]
  · refine ⟨fixed 262011,by decide,rep_fixed ?_,?_⟩
    · exact affine phase 256 133 (by simp [b]; omega)
    · simp [names,fixed]
  · refine ⟨fixed 262105,by decide,rep_fixed ?_,?_⟩
    · exact affine phase 256 39 (by simp [c]; omega)
    · simp [names,fixed]
  · refine ⟨fixed 261995,by decide,rep_fixed ?_,?_⟩
    · exact affine phase 256 149 (by simp [d]; omega)
    · simp [names,fixed]

theorem end_repr (k : Nat) (phase : k%31=10) (h : Nat) :
    represents h (u k) end0 ∧ represents h (v k) end1 := by
  have := x_pos k
  exact ⟨rep_fixed (affine phase 290 5 (by simp [u]; omega)),rep_fixed (affine phase 400 5 (by simp [v]; omega))⟩

private theorem div_shift {s j : Nat} (le : s≤j) (b : Nat) : 2^s ∣ 2^j*b :=
  Nat.dvd_trans (Nat.pow_dvd_pow 2 le) (Nat.dvd_mul_right ..)
private theorem odd_cut (j b : Nat) (odd : b%2=1) : ¬ 2^(j+1) ∣ 2^j*b := by
  rintro ⟨q,eq⟩
  rw [Nat.pow_succ,Nat.mul_assoc] at eq
  have := Nat.eq_of_mul_eq_mul_left (Nat.two_pow_pos _) eq
  omega

theorem forward {j s k B C delta : Nat} (ob : B%2=1) (oc : C%2=1)
    (diff : C+delta=B) (pos : 0<delta)
    (eq : 2^j*B=2^s*C+2^k*delta) : k≤j := by
  apply Classical.byContradiction
  intro ht
  have jk : j<k := by omega
  by_cases lt : j<s
  · have dv := Nat.dvd_add (div_shift (show j+1≤s by omega) C) (div_shift (show j+1≤k by omega) delta)
    rw [←eq] at dv
    exact odd_cut _ _ ob dv
  by_cases gt : s<j
  · have dv := Nat.dvd_sub (div_shift (show s+1≤j by omega) B) (div_shift (show s+1≤k by omega) delta)
    rw [eq,Nat.add_sub_cancel] at dv
    exact odd_cut _ _ oc dv
  have same : s=j := by omega
  subst s
  rw [←diff,Nat.mul_add] at eq
  have p := Nat.pow_lt_pow_of_lt (by decide : 1<2) jk
  have less := Nat.mul_lt_mul_of_pos_right p pos
  omega

theorem reverse {j s B t delta : Nat} (js : j%31=21) (ss : s%31=21) (small : delta%32≠0)
    (eq : 2^s*t=2^j*B+delta) : False := by
  have a := div_shift (show 5≤s by omega) t
  have c := div_shift (show 5≤j by omega) B
  obtain ⟨p,hp⟩ := a; obtain ⟨q,hq⟩ := c
  change 2^s*t=32*p at hp
  change 2^j*B=32*q at hq
  omega

end R02NearFamily
#print axioms R02NearFamily.forward
#print axioms R02NearFamily.reverse
