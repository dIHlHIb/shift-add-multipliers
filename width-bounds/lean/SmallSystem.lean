import Std

/-! Small integral solutions for arbitrarily many simultaneous affine rows.
The dimension controls the recursive coefficient bound. No bound depends on the
number of rows. Pivot elimination on a residue class avoids matrix libraries. -/
namespace McmSmall

abbrev Vec := Nat → Int
def dot : Nat → Vec → Vec → Int
  | 0, _, _ => 0
  | n+1, a, x => dot n a x + a n * x n

def Within (n k : Nat) (x : Vec) := ∀ j, j < n → (x j).natAbs ≤ k

def factor : Nat → Nat → Nat → Nat
  | 0, _, _ => 0
  | n+1, k, a =>
    let c := a + n*k*k
    let q := factor n (k*k+k*k) (a+k*c+n*k*k)
    factor n k a + (k+k*q) + (c+n*k*q)

private theorem ab_add (a b : Int) : (a+b).natAbs ≤ a.natAbs+b.natAbs :=
  Int.natAbs_add_le a b
private theorem ab_sub (a b : Int) : (a-b).natAbs ≤ a.natAbs+b.natAbs := by
  simpa [Int.sub_eq_add_neg] using ab_add a (-b)

theorem dot_bound {n k l : Nat} {a x : Vec} (ha : Within n k a) (hx : Within n l x) :
    (dot n a x).natAbs ≤ n*k*l := by
  induction n with
  | zero => simp [dot]
  | succ n ih =>
    have prev := ih (fun j hj => ha j (by omega)) (fun j hj => hx j (by omega))
    have endpt := Nat.mul_le_mul (ha n (by omega)) (hx n (by omega))
    apply Nat.le_trans (ab_add _ _)
    simpa [Int.natAbs_mul,Nat.succ_mul,Nat.add_mul] using Nat.add_le_add prev endpt

private theorem dot_eq {n : Nat} {a x y : Vec} (h : ∀ j, j<n → x j=y j) :
    dot n a x=dot n a y := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [dot, ih (fun j hj => h j (by omega)), h n (by omega)]

private theorem dot_shear (n : Nat) (a s x : Vec) (p : Int) :
    dot n a (fun j => s j+p*x j)=dot n a s+p*dot n a x := by
  induction n with
  | zero => simp [dot]
  | succ n ih =>
    simp only [dot, ih, Int.mul_add]
    rw [Int.mul_left_comm (a n) p (x n)]
    omega

private theorem dot_reduced (n : Nat) (a u x : Vec) (p t : Int) :
    dot n (fun j => p*a j-t*u j) x=p*dot n a x-t*dot n u x := by
  induction n with
  | zero => simp [dot]
  | succ n ih =>
    simp only [dot, ih, Int.sub_mul, Int.mul_add, Int.mul_assoc]
    omega

private theorem scaled_const (x l : Nat) (hl : 0<l) : x ≤ x*l := by
  simpa using Nat.mul_le_mul_left x (show 1≤l by omega)

private theorem pivot_abs {p c : Int} (hp : p≠0) : c.natAbs ≤ (p*c).natAbs := by
  rw [Int.natAbs_mul]
  have pos := Int.natAbs_pos.mpr hp
  simpa using Nat.mul_le_mul_right c.natAbs (show 1≤p.natAbs by omega)

private theorem evaluate_lift (n : Nat) (row pivot s z : Vec) (p c : Int) :
  dot n row (fun j => s j+p*z j) + row n*(c-dot n pivot z) =
      dot n row s + row n*c + dot n (fun j => p*row j-row n*pivot j) z := by
  rw [dot_shear, dot_reduced, Int.mul_sub]
  omega

private theorem dot_extend (n : Nat) (row tail : Vec) (last : Int) :
    dot (n+1) row (fun j => if j=n then last else tail j) =
    dot n row tail + row n*last := by
  simp only [dot, if_pos rfl]
  rw [dot_eq (x:=fun j => if j=n then last else tail j) (y:=tail)
        (fun j hj => if_neg (by omega : j ≠ n))]
  simp
/-- Replace any integral solution by a bounded one preserving the value of every row.
The index type may even be infinite. The natural number `l` carries the input width. -/
theorem small_solution {ι : Type} (n k a l : Nat) (hl : 0<l)
    (A : ι → Vec) (x : Vec) (ha : ∀ i, Within n k (A i))
    (hb : ∀ i, (dot n (A i) x).natAbs ≤ a*l) :
    ∃ y, Within n (factor n k a*l) y ∧ ∀ i, dot n (A i) y=dot n (A i) x := by
  induction n generalizing k a A x with
  | zero => exact ⟨x, fun j hj => by omega, fun _ => rfl⟩
  | succ n ih =>
    classical
    by_cases pivot : ∃ i, A i n ≠ 0
    · obtain ⟨i₀, hp⟩ := pivot
      let p := A i₀ n
      let u := A i₀
      let s : Vec := fun j => x j % p
      let q : Vec := fun j => x j / p
      let c := x n + dot n u q
      let C := a+n*k*k
      let B := a+k*C+n*k*k
      let R : ι → Vec := fun i j => p*A i j - A i n*u j
      let Q := factor n (k*k+k*k) B
      have pk : p.natAbs ≤ k := ha i₀ n (by omega)
      have old : ∀ j, x j=s j+p*q j := fun j => (Int.emod_add_ediv (x j) p).symm
      have hs : Within n k s := by
        intro j _
        change (x j % p).natAbs ≤ k
        have h₁ := Int.emod_nonneg (x j) (show p ≠ 0 from hp)
        have h₂ := Int.emod_lt (x j) (show p ≠ 0 from hp)
        omega
      have smallA (i) : Within n k (A i) := fun j hj => ha i j (by omega)
      have oldsum (i) : dot n (A i) x=dot n (A i) s+p*dot n (A i) q :=
        (dot_eq (fun j _ => old j)).trans (dot_shear _ _ _ _ _)
      have pc : p*c = dot (n+1) u x-dot n u s := by
        dsimp only [c,u,p]
        rw [dot,oldsum i₀,Int.mul_add]
        dsimp only [p]
        omega
      have boundc : c.natAbs ≤ C*l := by
        apply Nat.le_trans (pivot_abs (p:=p) hp)
        rw [pc]
        apply Nat.le_trans (ab_sub _ _)
        exact Nat.le_trans (Nat.add_le_add (hb i₀) (dot_bound (smallA i₀) hs))
          (by simp only [C,Nat.add_mul]; have := scaled_const (n*k*k) l hl; omega)
      have hR (i) : Within n (k*k+k*k) (R i) := by
        intro j hj
        apply Nat.le_trans (ab_sub _ _)
        simp only [Int.natAbs_mul]
        exact Nat.add_le_add (Nat.mul_le_mul pk (smallA i _ hj))
          (Nat.mul_le_mul (ha i n (by omega)) (smallA i₀ _ hj))
      have eqR (i) :
          dot n (R i) q = dot (n+1) (A i) x - A i n*c - dot n (A i) s := by
        dsimp only [R,c]
        rw [dot_reduced, dot, oldsum i, Int.mul_add]
        omega
      have boundR (i) : (dot n (R i) q).natAbs ≤ B*l := by
        rw [eqR]
        apply Nat.le_trans (ab_sub _ _)
        apply Nat.le_trans (Nat.add_le_add_right (ab_sub _ _) _)
        simp only [Int.natAbs_mul]
        have bound := Nat.add_le_add
          (Nat.add_le_add (hb i) (Nat.mul_le_mul (ha i n (by omega)) boundc))
          (dot_bound (smallA i) hs)
        apply Nat.le_trans bound
        simp only [B,Nat.add_mul,Nat.mul_assoc]
        have := scaled_const (n*k*k) l hl
        simp only [Nat.mul_assoc] at this
        omega
      obtain ⟨z,hz,rows⟩ := ih (k*k+k*k) B R q hR boundR
      let tail : Vec := fun j => s j+p*z j
      let last := c-dot n u z
      let y : Vec := fun j => if j=n then last else tail j
      refine ⟨y, ?_, ?_⟩
      · have zsmall : Within n (Q*l) z := hz
        intro j hj
        by_cases h : j=n
        · subst j
          change (if n=n then last else tail n).natAbs ≤ _
          simp only [if_pos rfl]
          apply Nat.le_trans (ab_sub _ _)
          apply Nat.le_trans (Nat.add_le_add boundc (dot_bound (smallA i₀) zsmall))
          change C*l+n*k*(Q*l) ≤ (factor n k a+(k+k*Q)+(C+n*k*Q))*l
          simp only [Nat.add_mul,Nat.mul_assoc]
          omega
        · have jn : j<n := by omega
          change (if j=n then last else tail j).natAbs ≤ _
          rw [if_neg h]
          apply Nat.le_trans (ab_add _ _)
          simp only [Int.natAbs_mul]
          apply Nat.le_trans (Nat.add_le_add (hs _ jn) (Nat.mul_le_mul pk (zsmall _ jn)))
          change k+k*(Q*l) ≤ (factor n k a+(k+k*Q)+(C+n*k*Q))*l
          simp only [Nat.add_mul,Nat.mul_assoc]
          have := scaled_const k l hl
          omega
      · intro i
        change dot (n+1) (A i) (fun j => if j=n then last else tail j) = _
        rw [dot_extend]
        change dot n (A i) (fun j => s j+p*z j)+A i n*(c-dot n u z)=_
        rw [evaluate_lift]
        change dot n (A i) s + A i n * c + dot n (R i) z = _
        rw [rows i, eqR]
        omega
    · have zero (i) : A i n=0 := Classical.byContradiction (fun h => pivot ⟨i,h⟩)
      have eqn (i) : dot (n+1) (A i) x=dot n (A i) x := by simp [dot,zero]
      obtain ⟨z,hz,rows⟩ := ih k a A x (fun i j hj => ha i j (by omega))
        (fun i => (eqn i) ▸ hb i)
      refine ⟨fun j => if j=n then 0 else z j, ?_, ?_⟩
      · intro j hj
        change (if j=n then (0:Int) else z j).natAbs ≤ _
        split
        · simp
        · rename_i h
          apply Nat.le_trans (hz j (by omega))
          apply Nat.mul_le_mul_right
          simp only [factor]
          omega
      · intro i
        rw [dot_extend,eqn,rows i]; simp [zero]

end McmSmall
#print axioms McmSmall.small_solution
