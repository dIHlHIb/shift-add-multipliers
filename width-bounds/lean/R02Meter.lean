import R02Bits
namespace R02Meter
/-- The second component counts fixed finite-control transitions. Bit and
list-cell patterns, a bounded number of constructors, and Boolean gates have
unit cost up to a fixed constant. The counter is ghost state. -/
abbrev M (A : Type) := A × Nat

def ret {A} (a : A) : M A := (a,1)
def next {A B} (u : M A) (f : A → M B) : M B :=
  let v := f u.1
  (v.1,1+u.2+v.2)
def mapM {A B} (f : A → B) (u : M A) : M B := (f u.1,1+u.2)

/-- Constant-work callback lift. Calls below use this only for constructors,
projections, and fixed truth tables. -/
def mapL {A B} (f : A → B) : List A → M (List B)
  | [] => ret []
  | a::as => mapM (f a :: ·) (mapL f as)
theorem mapL_spec {A B} (f : A → B) (as : List A) :
    (mapL f as).1=as.map f ∧ (mapL f as).2=as.length+1 := by
  induction as with
  | nil => exact ⟨rfl,rfl⟩
  | cons a as ih => simp [mapL,mapM,ih.1,ih.2,Nat.add_comm]

def append {A} : List A → List A → M (List A)
  | [],bs => ret bs
  | a::as,bs => mapM (a :: ·) (append as bs)
theorem append_spec {A} (as bs : List A) :
    (append as bs).1=as++bs ∧ (append as bs).2=as.length+1 := by
  induction as with
  | nil => exact ⟨rfl,rfl⟩
  | cons a as ih => simp [append,mapM,ih.1,ih.2,Nat.add_comm]

def anyM {A} (f : A → M Bool) : List A → M Bool
  | [] => ret false
  | a::as => next (f a) (fun hit => if hit then ret true else anyM f as)
theorem any_spec {A} (f : A → M Bool) (xs : List A) : (anyM f xs).1=xs.any (fun a => (f a).1) := by
  induction xs with
  | nil => rfl
  | cons a xs ih => cases h : (f a).1 <;> simp [anyM,next,ret,h,ih]

theorem any_cost {A} (f : A → M Bool) (xs : List A) (c : Nat) (hf : ∀ a∈xs,(f a).2≤c) :
    (anyM f xs).2 ≤ 1+xs.length*(c+2) := by
  induction xs with
  | nil => simp [anyM,ret]
  | cons a xs ih =>
    have h := hf a List.mem_cons_self
    have tail := ih (fun a ha => hf _ (List.mem_cons_of_mem _ ha))
    cases z : (f a).1 <;> simp only [anyM,next,z,if_true,if_false,Bool.false_eq_true,ret,List.length_cons,Nat.succ_mul] <;> omega

def findM {A} (f : A → M Bool) : List A → M (Option A)
  | [] => ret none
  | a::as => next (f a) (fun hit => if hit then ret (some a) else findM f as)
theorem find_spec {A} (f : A → M Bool) (xs : List A) : (findM f xs).1=xs.find? (fun a => (f a).1) := by
  induction xs with
  | nil => rfl
  | cons a xs ih => cases h : (f a).1 <;> simp [findM,next,ret,h,ih]

theorem find_cost {A} (f : A → M Bool) (xs : List A) (c : Nat) (hf : ∀ a∈xs,(f a).2≤c) :
    (findM f xs).2 ≤ 1+xs.length*(c+2) := by
  induction xs with
  | nil => simp [findM,ret]
  | cons a xs ih =>
    have h := hf a List.mem_cons_self
    have tail := ih (fun a ha => hf _ (List.mem_cons_of_mem _ ha))
    cases z : (f a).1 <;> simp only [findM,next,z,if_true,if_false,Bool.false_eq_true,ret,List.length_cons,Nat.succ_mul] <;> omega

def len {A} : List A → M Nat
  | [] => ret 0
  | _::as => mapM Nat.succ (len as)
theorem len_spec {A} (as : List A) : (len as).1=as.length ∧ (len as).2=as.length+1 := by
  induction as with
  | nil => exact ⟨rfl,rfl⟩
  | cons a xs ih => simp [len,mapM,ih.1,ih.2,Nat.add_comm]

/-- Clock estimates use a natural polynomial. Only the input variable,
constants, addition and multiplication appear in these budgets. -/
inductive P where
 | X | C (c : Nat) | add (p q : P) | mul (p q : P)
instance : Coe Nat P := ⟨P.C⟩
instance (n : Nat) : OfNat P n := ⟨P.C n⟩
instance : Add P := ⟨P.add⟩
instance : Mul P := ⟨P.mul⟩
def ev (n : Nat) : P → Nat
 | .X => n | .C c => c | .add a b => ev n a+ev n b | .mul a b => ev n a*ev n b
theorem ev_mono {a b} (h : a≤b) (p : P) : ev a p≤ev b p := by
  induction p with
  | X => exact h
  | C => exact Nat.le_refl _
  | add p q ih jh => exact Nat.add_le_add ih jh
  | mul p q ih jh => exact Nat.mul_le_mul ih jh

end R02Meter
