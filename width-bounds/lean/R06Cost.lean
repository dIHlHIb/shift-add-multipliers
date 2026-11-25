import R06Decide
namespace R06Cost
open R06Decide R06Closure R06Candidates MCM

/-- Upper charge for gate predicates in the implemented closure. Every scan can
try every remaining label against every ordered pair of available parents. -/
def gateCharge : Nat → List Nat → List Nat → Nat
  | 0,_,_ => 0
  | n+1,P,Y =>
    let pass := P.length*((Y.length+1)*(Y.length+1))
    match P.find? (ready Y) with
    | none => pass
    | some v => pass+gateCharge n (P.erase v) (v::Y)

def cube (s : Nat) := s*(s*s)
theorem closure_bound (n : Nat) (P Y : List Nat) (s : Nat) (h : P.length+Y.length+1≤s) :
    gateCharge n P Y ≤ n*cube s := by
  induction n generalizing P Y with
  | zero => simp [gateCharge]
  | succ n ih =>
    have pass : P.length*((Y.length+1)*(Y.length+1))≤cube s :=
      Nat.mul_le_mul (by omega) (Nat.mul_le_mul (by omega) (by omega))
    rw [gateCharge,Nat.succ_mul n (cube s)]
    split
    next => omega
    next v eq =>
      have hm := List.mem_of_find?_eq_some eq
      have hlen := List.length_erase_of_mem hm
      have hp := List.length_pos_of_mem hm
      have rec := ih (P.erase v) (v::Y) (by simp only [List.length_cons]; omega)
      omega

/-- Full traversal for a checkable bound. Every raw candidate incurs a visit
charge, including candidates rejected by the width or parity guard. -/
def scan {A} (f : A → Bool × Nat) : List A → Bool × Nat
  | [] => (false,0)
  | a::as =>
    let c := f a
    let tail := scan f as
    (c.1 || tail.1,1+c.2+tail.2)

theorem scan_value {A} (f : A → Bool × Nat) (xs : List A) :
    (scan f xs).1=xs.any (fun x => (f x).1) := by
  induction xs with
  | nil => rfl
  | cons a xs ih => simp [scan,ih]

theorem scan_bound {A} (f : A → Bool × Nat) (xs : List A) (s : Nat)
    (h : ∀ a∈xs,(f a).2≤s) : (scan f xs).2≤xs.length*(1+s) := by
  induction xs with
  | nil => simp [scan]
  | cons a xs ih =>
    simp only [scan,List.length_cons,Nat.succ_mul]
    have := ih (fun a ha => h _ (List.mem_cons_of_mem _ ha))
    have := h a List.mem_cons_self
    omega

def localCharge (T H : List Nat) :=
  let L := T++H
  1+gateCharge L.length L []+T.length*(L.length+1)

def metered (B : Nat) (T : List Nat) : Nat → List Nat → Bool × Nat
  | 0,H => (accepts T H,localCharge T H)
  | k+1,H =>
    let z := scan (fun v => if allowed B v then metered B T k (v::H) else (false,0))
      (children B (1::(T++H)))
    (accepts T H || z.1,localCharge T H+z.2)

theorem same_answer (B : Nat) (T H : List Nat) (k : Nat) :
    (metered B T k H).1=search B T k H := by
  induction k generalizing H with
  | zero => rfl
  | succ k ih =>
    simp only [metered,search,scan_value]
    congr 1
    apply congrArg (fun f : Nat → Bool => (children B (1::(T++H))).any f)
    funext v
    cases h : allowed B v <;> simp [h,ih]

def fan (s B : Nat) := s*(s*((B+1)*9))
def work (s B : Nat) := 1+s*cube s+s*s+fan s B

private theorem local_bound (T H) (s B : Nat) (h : T.length+H.length+1≤s) :
    localCharge T H+fan s B≤work s B := by
  have hp : (T++H).length+([]:List Nat).length+1≤s := by simpa using h
  have gate := closure_bound (T++H).length (T++H) [] s hp
  have g := Nat.le_trans gate (Nat.mul_le_mul_right (cube s) (by simp [List.length_append]; omega : (T++H).length≤s))
  have last : T.length*((T++H).length+1)≤s*s := Nat.mul_le_mul (by omega) (by simpa using h)
  dsimp only [localCharge,work]
  omega

theorem charged_work (B : Nat) (T H : List Nat) (k s : Nat)
    (maxSize : T.length+H.length+k+1≤s) :
    (metered B T k H).2 ≤ work s B*(1+fan s B)^k := by
  induction k generalizing H with
  | zero =>
    simp only [metered,Nat.pow_zero,Nat.mul_one]
    have := local_bound T H s B (by omega)
    omega
  | succ k ih =>
    let kids := children B (1::(T++H))
    let childWork (v : Nat) := if allowed B v then metered B T k (v::H) else (false,0)
    let F := fan s B
    let W := work s B
    let Z := W*(1+F)^k
    have per (v) (_ : v∈kids) : (childWork v).2≤Z := by
      simp only [childWork]
      split
      · exact ih _ (by simp only [List.length_cons]; omega)
      · exact Nat.zero_le _
    have kidsBound : kids.length≤F := by
      let ss := (1::(T++H)).length
      have le : ss≤s := by simp [ss]; omega
      unfold kids F fan
      rw [branching]
      exact Nat.mul_le_mul le (Nat.mul_le_mul_right _ le)
    have total := Nat.le_trans (scan_bound childWork kids Z per) (Nat.mul_le_mul_right _ kidsBound)
    have base : localCharge T H+F≤W := local_bound T H s B (by omega)
    have zlarge : W≤Z := Nat.le_mul_of_pos_right _ (Nat.pow_pos (by omega : 0<1+F))
    change localCharge T H + (scan childWork kids).2 ≤ W*(1+F)^(k+1)
    rw [Nat.pow_succ,←Nat.mul_assoc]
    change _≤Z*(1+F)
    rw [Nat.mul_add,Nat.mul_one,Nat.mul_comm Z F]
    rw [Nat.mul_add,Nat.mul_one] at total
    omega

/-- The fuel counter of the gate predicate can be exponentially large in bits.
This counts its actual halving recursion along either branch of `MCM.logFuel`. -/
def logSteps : Nat → Nat → Nat
  | 0,_ => 1
  | f+1,n => if n≥2 then 1+logSteps f (n/2) else 1
theorem log_steps_bits (b n f : Nat) (small : n<2^b) : logSteps f n ≤ b+1 := by
  induction b generalizing n f with
  | zero => have hn : n=0 := by simpa using (Nat.lt_one_iff.mp (show n<1 from small))
            subst n; cases f <;> simp [logSteps]
  | succ b ih =>
    cases f with
    | zero => simp [logSteps]
    | succ f =>
      rw [logSteps]; split
      · have bound := ih (n/2) f (by simp only [Nat.pow_succ] at small; omega)
        omega
      · omega

end R06Cost
#print axioms R06Cost.charged_work
#print axioms R06Cost.log_steps_bits
