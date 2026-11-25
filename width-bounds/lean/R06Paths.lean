import R06Trace
import SmallSystem
namespace R06Paths
open R06Expansion McmSmall R06Trace
structure Path where
  c : Int
  mask : Vec

def shift (s : Bool) (j : Nat) (p : Path) : Path :=
  ⟨signed s p.c,fun k => p.mask k + (if k=j then 1 else 0)⟩
def paths : Expr → List Path
  | .anchor a => [⟨a,fun _ => 0⟩]
  | .join i s t a b =>
      (paths a).map (shift s (2*i)) ++ (paths b).map (shift t (2*i+1))

def power (k : Int) : Int := 2^k.toNat
def pathval (n : Nat) (x : Vec) (k : Int) (p : Path) :=
  p.c * power (k+dot n p.mask x)
def sigma {α} (f : α → Int) : List α → Int
  | [] => 0
  | a::as => f a + sigma f as

theorem sigma_ext {α} {f g : α → Int} (xs : List α) (eq : ∀ a∈xs, f a=g a) :
    sigma f xs = sigma g xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih =>
    simp only [sigma,eq _ (List.mem_cons_self)]
    rw [ih (fun j hj => eq j (List.mem_cons_of_mem _ hj))]

theorem sigma_append {α} (f : α → Int) (xs ys : List α) :
    sigma f (xs++ys)=sigma f xs+sigma f ys := by
  induction xs with
  | nil => simp [sigma]
  | cons a xs ih => simp only [List.cons_append,sigma,ih,Int.add_assoc]

theorem sigma_map {α β} (f : β → Int) (g : α → β) (xs : List α) :
    sigma f (xs.map g)= sigma (fun a => f (g a)) xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp [sigma,ih]

theorem sigma_signed {α} (s : Bool) (f : α → Int) (xs : List α) :
    sigma (fun a => signed s (f a)) xs=signed s (sigma f xs) := by
  induction xs with
  | nil => cases s <;> simp [signed,sigma]
  | cons a xs ih =>
    simp only [sigma,ih]
    cases s <;> simp [signed,Int.neg_add]

theorem dot_zero (n : Nat) (x : Vec) : dot n (fun _ => 0) x=0 := by
  induction n with
  | zero => rfl
  | succ n ih => simp [dot,ih]

private theorem bump_eval (x a : Vec) (j n : Nat) :
    dot n (fun k => a k+(if k=j then 1 else 0)) x =
      dot n a x + (if j<n then x j else 0) := by
  induction n with
  | zero => simp [dot]
  | succ n ih =>
    simp only [dot,ih]
    by_cases eq : n=j
    · subst j; simp [Int.add_mul]; omega
    · by_cases lt : j<n
      · simp [eq,lt,show j<n+1 by omega]; omega
      · simp [eq,lt,show ¬j<n+1 by omega]

private theorem signed_factor (s : Bool) (a b : Int) : signed s a*b=signed s (a*b) := by
  cases s <;> simp [signed,Int.neg_mul]

private theorem branch_sum (s : Bool) (j n : Nat) (x : Vec) (k : Int) (xs : List Path)
    (hj : j<n) : sigma (pathval n x k) (xs.map (shift s j)) =
    signed s (sigma (pathval n x (k+x j)) xs) := by
  rw [sigma_map,←sigma_signed]
  apply sigma_ext
  intro p _
  simp only [pathval,shift,bump_eval,if_pos hj,signed_factor]
  rw [show k+(dot n p.mask x+x j) = k+x j+dot n p.mask x by omega]

theorem expand {T h e} (hs : Scoped T h e) (n) (hn : 2*h≤n) (x : Vec) (k : Int) :
    sigma (pathval n x k) (paths e) = sample x e k := by
  induction e generalizing h k with
  | anchor a => simp [sample,paths,sigma,pathval,power,dot_zero]
  | join i sa sb a b ia ib =>
    obtain ⟨hi,ha,hb⟩ := hs
    rw [paths,sigma_append,branch_sum _ _ _ _ _ _ (by omega),branch_sum _ _ _ _ _ _ (by omega)]
    rw [ia ha (by omega),ib hb (by omega)]
    rfl

def BinaryBelow (bound : Nat) (p : Path) :=
  (∀ j, p.mask j=0 ∨ p.mask j=1) ∧ ∀ j, bound≤j → p.mask j=0

private theorem fresh {h : Nat} {p : Path} (hp : BinaryBelow (2*h) p) (s j : _) (hj : 2*h≤j)
    (lim : Nat) (hl : j<lim) : BinaryBelow lim (shift s j p) := by
  obtain ⟨bin,tail⟩ := hp
  constructor
  · intro k
    by_cases hk : k=j
    · subst k; simp [shift,tail j hj]
    · simpa [shift,hk] using bin k
  · intro k hk
    simp [shift,tail k (by omega),show k≠j by omega]

theorem binary {T h e} (hs : Scoped T h e) (p) (hp : p∈paths e) : BinaryBelow (2*h) p := by
  induction e generalizing h p with
  | anchor a =>
    simp only [paths,List.mem_singleton] at hp
    subst p; exact ⟨fun _ => Or.inl rfl,fun _ _ => rfl⟩
  | join i s t a b ia ib =>
    obtain ⟨lt,ha,hb⟩ := hs
    rcases List.mem_append.mp hp with hp|hp
    · obtain ⟨p,hm,rfl⟩ := List.mem_map.mp hp
      exact fresh (ia ha p hm) _ _ (by omega) _ (by omega)
    · obtain ⟨p,hm,rfl⟩ := List.mem_map.mp hp
      exact fresh (ib hb p hm) _ _ (by omega) _ (by omega)

def mass {α} (c : α → Int) : List α → Nat
  | [] => 0
  | a::as => (c a).natAbs + mass c as

theorem mass_append {α} (c : α → Int) (as bs : List α) :
    mass c (as++bs)=mass c as+mass c bs := by
  induction as with
  | nil => simp [mass]
  | cons a as ih => simp [mass,ih,Nat.add_assoc]

theorem mass_map {α β} (c : β → Int) (f : α → β) (xs : List α) :
    mass c (xs.map f)=mass (fun a => c (f a)) xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp [mass,ih]

private theorem shift_mass (s j) (xs : List Path) :
    mass Path.c (xs.map (shift s j))=mass Path.c xs := by
  rw [mass_map]
  induction xs with
  | nil => rfl
  | cons a xs ih => cases s <;> simp_all [mass,shift,signed]

theorem mass_bound {T h e} (hs : Scoped T h e) (w : Nat) (cap : ∀ t∈1::T, t≤2^w) :
    mass Path.c (paths e) ≤ 2^h * 2^w := by
  induction e generalizing h with
  | anchor a => simpa [paths,mass] using Nat.le_trans (cap a hs)
                  (Nat.le_mul_of_pos_left (2^w) (Nat.pow_pos (by decide)))
  | join i s t a b ia ib =>
    obtain ⟨lt,ha,hb⟩ := hs
    rw [paths,mass_append,shift_mass,shift_mass]
    have both := Nat.add_le_add (ia ha) (ib hb)
    have up := Nat.mul_le_mul_right (2^w) (Nat.pow_le_pow_right (by decide : 0<2)
      (show i+1≤h by omega))
    simp only [Nat.pow_succ,Nat.mul_comm _ 2,Nat.mul_assoc] at up
    omega

end R06Paths
#print axioms R06Paths.expand
#print axioms R06Paths.binary
#print axioms R06Paths.mass_bound
