import R02NearFamily
namespace R02NearUpper
open MCM R02NearFamily
set_option maxRecDepth 8192

private theorem pt {n z j : Nat} (hz : 0<z) (hj : 0<j) (eq : n=2^j*z) : PowerTimes n z :=
  (powerTimes_iff ..).mpr ⟨hz,j,hj,eq⟩
private theorem sub {a b t j : Nat} (hb : 0<b) (hj : 0<j) (eq : 2^j*b+t=a) : Gate a b t :=
  Or.inr (Or.inl (Or.inr (Or.inl (pt hb hj (show a-t=2^j*b by omega)))))
private theorem plus {a b t j : Nat} (hb : 0<b) (hj : 0<j) (eq : 2^j*b+a=t) : Gate a b t :=
  Or.inr (Or.inl (Or.inr (Or.inr (pt hb hj (show t-a=2^j*b by omega)))))
private theorem push {xs : List Nat} {B t a b : Nat} (v : Valid (· < B) xs)
    (ma : a∈1::xs) (mb : b∈1::xs) (odd : t%2=1) (sm : t<B) (g : Gate a b t) :
    Valid (· < B) (t::xs) := ⟨v,odd,sm,(makes_iff ..).mpr ⟨a,ma,b,mb,g⟩⟩

theorem sizes (k : Nat) : 2^(k+8)≤v k ∧ v k<2^(k+9) ∧
    (∀ z∈targets k,z≤v k) ∧ 2^(k+k+8)≤wide k ∧ wide k<2^(k+k+9) := by
  let X := x k
  have px : 0<X := x_pos k
  have be : b k+5=256*X := by dsimp [b,X]; omega
  have mult := congrArg (X*·) be
  simp only [Nat.mul_add] at mult
  have m : X*(256*X)=256*(X*X) := by ac_rfl
  rw [m,Nat.mul_comm X 5] at mult
  have sq : X≤X*X := by simpa using Nat.mul_le_mul_left X (show 1≤X by omega)
  have wh : wide k = X*b k+b k := by simp [wide,X,Nat.add_mul]
  have shift (d) : 2^(k+k+d)=X*X*2^d := by simp [X,x,Nat.pow_add]
  have ww (d) : 2^(k+d)=X*2^d := Nat.pow_add ..
  rw [shift,shift,ww,ww,wh]
  refine ⟨?_,?_,?_,?_,?_⟩
  · change X*256≤400*X-5; omega
  · change 400*X-5<X*512; omega
  · intro z mem; simp only [targets,List.mem_cons,List.mem_nil_iff,or_false] at mem
    simp only [anchor,b,c,d,u,v] at *; omega
  · change X*X*256≤X*b k+b k; omega
  · change X*b k+b k<X*X*512; omega

theorem build_positive {k : Nat} (hk : 0<k) : Fits (· < 2^(k+k+9)) (targets k) 9 := by
  let X := x k
  have px : 0<X := x_pos k
  have even : X%2=0 := Nat.two_pow_mod_two_eq_zero.mpr hk
  have be : b k+5=256*X := by dsimp [b,X]; omega
  have ab : 1+anchor k=256*X := by dsimp [anchor,X]; omega
  have bo : b k%2=1 := by omega
  have bp : 0<b k := by omega
  have uv (n e : Nat) (de : e+n=b k) : X*e+(b k+X*n)=wide k := by
    have q := congrArg (X*·) de
    simp only [Nat.mul_add] at q
    change _=(X+1)*b k
    rw [Nat.add_mul,Nat.one_mul]; omega
  have comps : u k=b k+X*34 ∧ v k=b k+X*144 ∧ c k+34=b k ∧ d k+144=b k := by
    dsimp [u,v,c,d,X] at *; omega
  obtain ⟨lo,hi,targets_small,_,enough⟩ := sizes k
  have b0 : ∀ t∈targets k, t<2^(k+k+9) := by
    have inc := Nat.pow_le_pow_right (by decide : 0<2) (show k+9≤k+k+9 by omega)
    exact fun t mt => Nat.lt_of_lt_of_le (Nat.lt_of_le_of_lt (targets_small t mt) hi) inc
  have a0 : Valid (· < 2^(k+k+9)) [] := trivial
  have a1 := push (t:=anchor k) (a:=1) (b:=1) a0 (by simp) (by simp) (by omega)
    (b0 _ (by simp [targets])) (Or.inr (Or.inl (Or.inl (pt (j:=k+8) (by decide) (by omega)
      (by rw [Nat.pow_add]; change _=X*256*1; omega)))))
  have a2 := push (t:=b k) (a:=anchor k) (b:=1) a1 (by simp) (by simp) bo
    (b0 _ (by simp [targets])) (sub (j:=2) (by decide) (by decide) (by omega))
  have a3 := push (t:=b k-32) (a:=b k) (b:=1) a2 (by simp) (by simp) (by omega)
    (b0 _ (by simp [targets])) (sub (j:=5) (by decide) (by decide) (by omega))
  have a4 := push (t:=b k-128) (a:=b k) (b:=1) a3 (by simp) (by simp) (by omega)
    (b0 _ (by simp [targets])) (sub (j:=7) (by decide) (by decide) (by omega))
  have a5 := push (t:=c k) (a:=b k-32) (b:=1) a4 (by simp) (by simp) (by omega)
    (b0 _ (by simp [targets])) (sub (j:=1) (by decide) (by decide) (by omega))
  have a6 := push (t:=d k) (a:=b k-128) (b:=1) a5 (by simp) (by simp) (by omega)
    (b0 _ (by simp [targets])) (sub (j:=4) (by decide) (by decide) (by omega))
  have evenwide : wide k%2=1 := by
    change ((X+1)*b k)%2=1
    rw [Nat.mul_mod,Nat.add_mod,even,bo]
  have widegate : 2^k*b k+b k=wide k := by simp [wide,x,Nat.add_mul]
  have a7 := push (t:=wide k) (a:=b k) (b:=b k) a6 (by simp) (by simp) evenwide enough (plus bp hk widegate)
  have a8 := push (t:=u k) (a:=wide k) (b:=c k) a7 (by simp) (by simp) (by dsimp [u]; omega)
    (b0 _ (by simp [targets])) (sub (by omega) hk (comps.1 ▸ uv 34 _ comps.2.2.1))
  have a9 := push (t:=v k) (a:=wide k) (b:=d k) a8 (by simp) (by simp) (by dsimp [v]; omega)
    (b0 _ (by simp [targets])) (sub (by omega) hk (comps.2.1 ▸ uv 144 _ comps.2.2.2))
  exact ⟨_,by simp,a9,by simp [targets]⟩
theorem build {k : Nat} (phase : k%31=10) : Fits (· < 2^(k+k+9)) (targets k) 9 :=
  build_positive (by omega)
end R02NearUpper
#print axioms R02NearUpper.sizes
#print axioms R02NearUpper.build
