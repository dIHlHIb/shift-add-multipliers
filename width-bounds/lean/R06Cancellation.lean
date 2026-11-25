import Std
namespace R06Cancellation

/-- One term in two assignments. Only the powers of two change. -/
structure Term where
  c : Int
  e : Nat
  f : Nat

def sum (ex : Term → Nat) : List Term → Int
  | [] => 0
  | t::ts => t.c*2^(ex t) + sum ex ts

def mass : List Term → Nat
  | [] => 0
  | t::ts => t.c.natAbs + mass ts

def Nearby (k : Nat) (ts : List Term) := ∀ a ∈ ts, ∀ b ∈ ts,
  a.e ≤ b.e → b.e ≤ a.e+k → b.f+a.e=a.f+b.e

private theorem powerAbs (a : Nat) : ((2:Int)^a).natAbs=(2:Nat)^a := by
  change (((2:Nat) : Int) ^ a).natAbs = _
  rw [←Int.natCast_pow]
  rfl

private theorem powAdd (a b : Nat) : (2:Int)^(a+b)=2^a*2^b := by
  simpa only [Int.natCast_pow,Int.natCast_mul] using
    congrArg (fun n : Nat => (n:Int)) (Nat.pow_add 2 a b)

private theorem divisible {t : Nat} (xs : List Term) (h : ∀ a∈xs, t≤a.e) :
    (2:Int)^t ∣ sum Term.e xs := by
  induction xs with
  | nil => simp [sum]
  | cons a xs ih =>
    have ht := h a (by simp)
    have e : a.e=t+(a.e-t) := by omega
    have hp : (2:Int)^a.e=(2:Int)^t*(2:Int)^(a.e-t) := by
      rw [←powAdd,←e]
    obtain ⟨q,hq⟩ := ih (fun b hb => h b (by simp [hb]))
    refine ⟨a.c*2^(a.e-t)+q, ?_⟩
    simp only [sum,hp,hq,Int.mul_add,Int.mul_left_comm]

private theorem transport_sorted (k : Nat) (xs : List Term) (p : Term) (u v : Int)
    (m : Nat) (total : m+mass xs≤2^k)
    (sorted : (p::xs).Pairwise (fun a b => a.e≤b.e))
    (near : Nearby k (p::xs)) (bound : u.natAbs≤m*2^p.e)
    (aligned : v*2^p.e=u*2^p.f) (zero : u+sum Term.e xs=0) :
    v+sum Term.f xs=0 := by
  induction xs generalizing p u v m with
  | nil =>
    simp only [sum,Int.add_zero] at *
    rw [zero,Int.zero_mul] at aligned
    rcases Int.mul_eq_zero.mp aligned with h|h
    · exact h
    · have := Int.pow_pos (m:=p.e) (by decide : (0:Int)<2); omega
  | cons b xs ih =>
    have first := (List.pairwise_cons.mp sorted).1 b (by simp)
    have tail := (List.pairwise_cons.mp sorted).2
    have inc := Nat.pow_le_pow_right (by decide : 0<2) first
    have bridge : v*2^b.e=u*2^b.f := by
      by_cases close : b.e≤p.e+k
      · have known := near p (by simp) b (by simp) first close
        let d := b.e-p.e
        have old : b.e=p.e+d := by dsimp [d]; omega
        have new : b.f=p.f+d := by omega
        rw [old,new,powAdd,powAdd,←Int.mul_assoc,←Int.mul_assoc,aligned]
      · have hdiv := divisible (t:=b.e) (b::xs) (by
          intro t ht
          rcases List.mem_cons.mp ht with rfl|ht
          · omega
          · exact (List.pairwise_cons.mp tail).1 t ht)
        have hu : u=-sum Term.e (b::xs) := by omega
        have hd : (2:Int)^b.e ∣ u := by rw [hu]; exact Int.dvd_neg.mpr hdiv
        have ht : m≤2^k := by omega
        have small : u.natAbs < ((2:Int)^b.e).natAbs := by
          rw [powerAbs]
          apply Nat.lt_of_le_of_lt (Nat.le_trans bound (Nat.mul_le_mul_right _ ht))
          rw [←Nat.pow_add]
          exact Nat.pow_lt_pow_of_lt (by decide) (by omega)
        have u0 := Int.eq_zero_of_dvd_of_natAbs_lt_natAbs hd small
        rw [u0,Int.zero_mul] at aligned ⊢
        rcases Int.mul_eq_zero.mp aligned with v0|impossible
        · simp [v0]
        · have := Int.pow_pos (m:=p.e) (by decide : (0:Int)<2); omega
    let u' := u+b.c*2^b.e
    let v' := v+b.c*2^b.f
    have bound' : u'.natAbs ≤ (m+b.c.natAbs)*2^b.e := by
      apply Nat.le_trans (Int.natAbs_add_le _ _)
      rw [Int.natAbs_mul,powerAbs,Nat.add_mul]
      exact Nat.add_le_add_right (Nat.le_trans bound (Nat.mul_le_mul_left _ inc)) _
    have aligned' : v'*2^b.e=u'*2^b.f := by
      dsimp [v',u']
      simp only [Int.add_mul,bridge]
      rw [Int.mul_assoc b.c,Int.mul_comm ((2:Int)^b.f),←Int.mul_assoc]
    have result := ih b u' v' (m+b.c.natAbs) (by simp only [mass] at total; omega)
      tail (fun a ha z hz => near a (List.mem_cons_of_mem _ ha) z (List.mem_cons_of_mem _ hz))
      bound' aligned' (by dsimp [u']; simp only [sum] at zero; omega)
    dsimp [v'] at result
    simp only [sum]
    omega

private theorem perm_sum {xs ys : List Term} (h : xs.Perm ys) (ex : Term → Nat) :
    sum ex xs=sum ex ys := by
  induction h with
  | nil => rfl
  | cons _ _ ih => simp [sum,ih]
  | swap => simp only [sum]; omega
  | trans _ _ ih jh => exact ih.trans jh

private theorem perm_mass {xs ys : List Term} (h : xs.Perm ys) : mass xs=mass ys := by
  induction h with
  | nil => rfl
  | cons _ _ ih => simp [mass,ih]
  | swap => simp only [mass]; omega
  | trans _ _ ih jh => exact ih.trans jh

/-- Preservation of all short exponent differences transfers an arbitrary exact
signed cancellation. A wider gap forces the lower partial sum to be zero. -/
theorem transfer (ts : List Term) (k : Nat) (h : sum Term.e ts=0)
    (hb : mass ts ≤ 2^k) (hn : Nearby k ts) : sum Term.f ts=0 := by
  let le (a b : Term) := decide (a.e≤b.e)
  let sorted := ts.mergeSort le
  have perm : sorted.Perm ts := List.mergeSort_perm ts le
  have order : sorted.Pairwise (fun a b => a.e≤b.e) := by
    simpa [sorted,le] using List.sorted_mergeSort
      (le:=le) (by simp [le]; omega) (by simp [le]; omega) ts
  rw [←perm_sum perm Term.f]
  have old := (perm_sum perm Term.e).trans h
  have m := perm_mass perm
  have near : Nearby k sorted := fun a ha b hh => hn a (perm.mem_iff.mp ha) b (perm.mem_iff.mp hh)
  cases hs : sorted with
  | nil => rfl
  | cons p xs =>
    rw [hs] at order near old m
    exact transport_sorted k xs p (p.c*2^p.e) (p.c*2^p.f) p.c.natAbs
      (by simp only [mass] at m; omega) order near (by simp [Int.natAbs_mul,powerAbs])
      (by rw [Int.mul_assoc,Int.mul_comm ((2:Int)^p.f),←Int.mul_assoc]) old

end R06Cancellation
#print axioms R06Cancellation.transfer
