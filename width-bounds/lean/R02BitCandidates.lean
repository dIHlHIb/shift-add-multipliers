import R02Pools
import R06Candidates
namespace R02BitCandidates
open R02Bits R02Meter R02BitCost R02BitClosure

/-- Unary loop indices govern shifting. Each iteration reads or writes one cell. -/
def upM : Nat → Word → M Word
  | 0,a => ret a
  | j+1,a => mapM (false::·) (upM j a)
def downM : Nat → Word → M Word
  | 0,a => ret a
  | j+1,a => next (ret a.tail) (downM j)

theorem up_spec (j) (a : Word) :
    (upM j a).1=up j a ∧ (upM j a).2=j+1 ∧ (upM j a).1.length=j+a.length := by
  induction j with
  | zero => simp [upM,up,ret]
  | succ j ih => simp [upM,up,mapM,List.replicate_succ,ih.1,ih.2,List.length_append,Nat.add_comm,Nat.add_left_comm,Nat.add_assoc]

theorem down_spec (j) (a : Word) :
    (downM j a).1=down j a ∧ (downM j a).2=2*j+1 ∧ (downM j a).1.length≤a.length := by
  induction j generalizing a with
  | zero => simp [downM,down,ret]
  | succ j ih =>
    obtain ⟨v,c,l⟩ := ih a.tail
    have le : a.tail.length≤a.length := by cases a <;> simp
    exact ⟨v,by change 1+1+(downM j a.tail).2=_; rw [c]; omega,Nat.le_trans l le⟩

def low (sub : Bool) (a b : Word) (j : Nat) := next (alu sub a b) (downM j)
def high (sub rev : Bool) (a b : Word) (j : Nat) :=
  next (upM j a) (fun h => if rev then alu sub b h else alu sub h b)
def seq {A} : List (M A) → M (List A)
  | [] => ret []
  | m::ms => next m (fun a => mapM (a::·) (seq ms))
theorem seq_spec {A} (xs : List (M A)) : (seq xs).1=xs.map Prod.fst := by
  induction xs <;> simp_all [seq,next,mapM,ret]
theorem seq_cost {A} (xs : List (M A)) (c : Nat) (h : ∀ a∈xs,a.2≤c) :
    (seq xs).2≤1+xs.length*(c+2) := by
  induction xs with
  | nil => simp [seq,ret]
  | cons a xs ih =>
    have x := h a List.mem_cons_self
    have tail := ih (fun z hz => h _ (List.mem_cons_of_mem _ hz))
    simp only [seq,next,mapM,List.length_cons,Nat.succ_mul]; omega

def ops (a b : Word) (j : Nat) :=
  [low false a b j,low true a b j,low true b a j,
   high true false b a j,high true true b a j,high false true b a j,
   high true false a b j,high true true a b j,high false true a b j]
def atM (a b : Word) (j : Nat) := seq (ops a b j)

theorem at_spec (a b : Word) (j : Nat) :
    nums (atM a b j).1=R06Candidates.atShift (val a) (val b) j := by
  simp only [atM,seq_spec,nums,ops,List.map_cons,List.map_nil,low,high,next,(alu_spec ..).1,
    (up_spec ..).1,(down_spec ..).1,if_true,Bool.false_eq_true,if_false,down_val,up_val,
    plus_val,minus_val,R06Candidates.atShift,Nat.add_comm]

def atBudget (s : Nat) := 1+9*(6*s+10)
theorem at_bounds {a b : Word} {j s : Nat}
    (room : max a.length b.length+j+1≤s) :
    (atM a b j).2≤atBudget s ∧ Short s (atM a b j).1 := by
  have aluLen (q : Bool) (a b : Word) : (alu q a b).1.length ≤ max a.length b.length+1 := by
    rw [(alu_spec ..).1]; cases q <;> simp only [if_true,Bool.false_eq_true,if_false,plus_len]
    · exact Nat.le_refl _
    · have := minus_len a b; omega
  have lowOK (q : Bool) (x y : Word) (fit : max x.length y.length+j+1≤s) :
      (low q x y j).2≤6*s+8 ∧ (low q x y j).1.length≤s := by
    have A := (alu_spec q x y).2
    have L := aluLen q x y
    have D := down_spec j (alu q x y).1
    simp only [low,next,D.2.1]
    exact ⟨by omega,by have := D.2.2; omega⟩
  have highOK (q rev : Bool) (x y : Word) (fit : max x.length y.length+j+1≤s) :
      (high q rev x y j).2≤6*s+8 ∧ (high q rev x y j).1.length≤s := by
    have U := up_spec j x
    let z := (upM j x).1
    have hz : z.length=j+x.length := U.2.2
    have c1 := (alu_spec q z y).2; have c2 := (alu_spec q y z).2
    have l1 := aluLen q z y; have l2 := aluLen q y z
    cases rev <;> simp only [high,next,U.2.1,if_true,Bool.false_eq_true,if_false]
    all_goals change _ ≤ _ ∧ _ ≤ _; dsimp [z] at *; constructor <;> omega
  have swap : max b.length a.length+j+1≤s := by simpa [Nat.max_comm] using room
  have every (m) (mem : m∈ops a b j) : m.2≤6*s+8 ∧ m.1.length≤s := by
    simp only [ops,List.mem_cons,List.mem_nil_iff,or_false] at mem
    rcases mem with e|e|e|e|e|e|e|e|e <;> subst m <;> first | apply lowOK; assumption | apply highOK; assumption
  refine ⟨?_,?_⟩
  · exact seq_cost (ops a b j) (6*s+8) (fun m hm => (every m hm).1)
  · intro x hx
    rw [atM,seq_spec] at hx
    obtain ⟨m,mem,rfl⟩ := List.mem_map.mp hx
    exact (every _ mem).2

end R02BitCandidates
#print axioms R02BitCandidates.at_spec
#print axioms R02BitCandidates.at_bounds
