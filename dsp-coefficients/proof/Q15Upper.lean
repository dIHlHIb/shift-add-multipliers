import McmAudit

namespace Q15Upper
open MCM

inductive Side | output | second | first deriving Repr
inductive Op | plus | minus | reverseMinus deriving Repr

structure Step where
  t : Nat
  a : Nat
  b : Nat
  side : Side
  op : Op
  shift : Nat
  deriving Repr

def term (op : Op) (a b : Nat) : Nat :=
  match op with
  | .plus => a + b
  | .minus => a - b
  | .reverseMinus => b - a

def oriented (a b z j : Nat) (op : Op) : Bool :=
  decide (0 < z ∧ 0 < j ∧ term op a b = 2^j*z)

theorem oriented_sound {a b z j : Nat} {op : Op}
    (pass : oriented a b z j op = true) : Oriented a b z := by
  have h : 0 < z ∧ 0 < j ∧ term op a b = 2^j*z := of_decide_eq_true pass
  have pow : PowerTimes (term op a b) z :=
    (powerTimes_iff ..).mpr ⟨h.1,j,h.2.1,h.2.2⟩
  cases op with
  | plus => exact Or.inl pow
  | minus => exact Or.inr (Or.inl pow)
  | reverseMinus => exact Or.inr (Or.inr pow)

def gateCheck (r : Step) : Bool :=
  match r.side with
  | .output => oriented r.a r.b r.t r.shift r.op
  | .second => oriented r.a r.t r.b r.shift r.op
  | .first => oriented r.b r.t r.a r.shift r.op

theorem gate_sound (r : Step) (h : gateCheck r = true) : Gate r.a r.b r.t := by
  cases r with
  | mk t a b side op shift =>
    cases side with
    | output => exact Or.inl (oriented_sound h)
    | second => exact Or.inr (Or.inl (oriented_sound h))
    | first => exact Or.inr (Or.inr (oriented_sound h))

def legal (xs : List Nat) (r : Step) : Bool :=
  decide (r.a ∈ 1::xs ∧ r.b ∈ 1::xs ∧ r.t%2=1) && gateCheck r

theorem cons_valid (xs : List Nat) (r : Step) (hx : Valid unbounded xs)
    (h : legal xs r = true) : Valid unbounded (r.t::xs) := by
  have hp := Bool.and_eq_true_iff.mp h
  have mem : r.a ∈ 1::xs ∧ r.b ∈ 1::xs ∧ r.t%2=1 := of_decide_eq_true hp.1
  exact ⟨hx,mem.2.2,trivial,(makes_iff ..).mpr ⟨r.a,mem.1,r.b,mem.2.1,gate_sound r hp.2⟩⟩

def replay : List Step → List Nat → Option (List Nat)
  | [], xs => some xs
  | r::rs, xs => if legal xs r then replay rs (r.t::xs) else none

theorem replay_sound (rs : List Step) (xs out : List Nat) (hx : Valid unbounded xs)
    (h : replay rs xs = some out) : Valid unbounded out ∧ out.length = xs.length + rs.length := by
  induction rs generalizing xs with
  | nil =>
    simp [replay] at h
    subst out
    simp [hx]
  | cons r rs ih =>
    simp only [replay] at h
    split at h
    next ok =>
      have step := ih (r.t::xs) (cons_valid xs r hx ok) h
      exact ⟨step.1,by simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using step.2⟩
    next => contradiction

structure Entry where
  targets : List Nat
  gates : List Step
  deriving Repr

def accepts (e : Entry) : Bool :=
  match replay e.gates [] with
  | none => false
  | some out => e.targets.all (fun t => decide (t ∈ 1::out))

theorem sound (e : Entry) (h : accepts e = true) : Fits unbounded e.targets e.gates.length := by
  unfold accepts at h
  split at h
  next => contradiction
  next out eq =>
    have v := replay_sound e.gates [] out trivial eq
    refine ⟨out,by simpa using Nat.le_of_eq v.2,v.1,?_⟩
    simpa [List.all_eq_true] using h

theorem bank_sound (bank : List Entry) (h : bank.all accepts = true) :
    ∀ e ∈ bank, Fits unbounded e.targets e.gates.length := by
  intro e mem
  exact sound e ((List.all_eq_true.mp h) e mem)

#print axioms sound
end Q15Upper
