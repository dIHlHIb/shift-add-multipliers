import R02Binary
namespace R02Theorem
open R02Bits R02Meter R02BitCost R02BitClosure R02BitCandidates R02Binary

/-- Binary input with one separator per coefficient and an end marker. -/
def inputSize : Words → Nat
  | [] => 1
  | a::as => a.length+1+inputSize as
def inputWidth : Words → Nat
  | [] => 0
  | a::as => max a.length (inputWidth as)
private theorem inputs (T : Words) : 0<inputSize T ∧ T.length<inputSize T ∧
    inputWidth T≤inputSize T ∧ Short (inputWidth T) T := by
  induction T with
  | nil => simp [inputSize,inputWidth,Short]
  | cons a T ih =>
    obtain ⟨pos,sz,width,each⟩ := ih
    simp only [inputSize,inputWidth,List.length_cons]
    refine ⟨by omega,by omega,by omega,?_⟩
    intro b hb
    rcases List.mem_cons.mp hb with rfl|hb
    · omega
    · have := each b hb; omega

/-- The evaluator uses unary loop counters; comparing lengths consumes a cell
from each counter. Binary coefficient values are never decoded by the evaluator. -/
def maxU : Nat → Nat → M Nat
  | 0,b => ret b
  | a+1,0 => ret (a+1)
  | a+1,b+1 => mapM Nat.succ (maxU a b)
private theorem max_spec (a b : Nat) : (maxU a b).1=max a b ∧ (maxU a b).2≤a+1 := by
  induction a generalizing b with
  | zero => simp [maxU,ret]
  | succ a ih =>
    cases b with
    | zero => simp [maxU,ret]
    | succ b => have ⟨v,k⟩ := ih b; simp only [maxU,mapM,v,Nat.succ_max_succ]; exact ⟨trivial,by omega⟩

def measure : Words → M Nat
  | [] => ret 0
  | a::T => next (len a) (fun n => next (measure T) (maxU n))
private theorem measure_spec (T : Words) :
    (measure T).1=inputWidth T ∧ (measure T).2≤5*inputSize T := by
  induction T with
  | nil => decide
  | cons a T ih =>
    have mx := max_spec a.length (inputWidth T)
    simp only [measure,next,(len_spec ..).1,(len_spec ..).2,ih.1,mx.1,inputWidth,inputSize]
    have := ih.2; have := mx.2
    exact ⟨trivial,by omega⟩

def doubleU : Nat → M Nat
  | 0 => ret 0
  | n+1 => mapM (fun k => Nat.succ (Nat.succ k)) (doubleU n)
private theorem double_spec (n : Nat) : (doubleU n).1=2*n ∧ (doubleU n).2=n+1 := by
  induction n with
  | zero => decide
  | succ n ih => simp only [doubleU,mapM,ih.1,ih.2]; omega

def decideBinary (T : Words) : M Bool := next (measure T) (fun w => next (doubleU w) (solveAt T))
theorem correct (T : Words) (distinct : (nums T).Nodup) (nontrivial : 1∉nums T) :
    (decideBinary T).1=true ↔ MCM.Fits MCM.unbounded (nums T) ((nums T).length+1) := by
  simp only [decideBinary,next,(measure_spec ..).1,(double_spec ..).1,solveAt_spec]
  constructor
  · exact R02Decision.decideAt_sound
  · apply R02Decision.complete distinct nontrivial _ (Nat.le_refl _)
    intro t ht
    obtain ⟨a,ma,rfl⟩ := List.mem_map.mp ht
    exact Nat.lt_of_lt_of_le (val_lt a) (Nat.pow_le_pow_right (by decide) ((inputs T).2.2.2 a ma))

def timeBudget (N : Nat) := 4+6*N+solveBudget (4*(N+2))
theorem work_bound (T : Words) : (decideBinary T).2≤timeBudget (inputSize T) := by
  have ⟨p,m,w,short⟩ := inputs T
  let N := inputSize T
  let s := 4*(N+2)
  have room (a) (ma : a∈one::T) : a.length+2*inputWidth T+1≤s := by
    rcases List.mem_cons.mp ma with rfl|ma
    · change 1+2*inputWidth T+1≤4*(inputSize T+2); omega
    · have := short a ma
      change a.length+2*inputWidth T+1≤4*(inputSize T+2); omega
  have main := solveAt_cost T (2*inputWidth T) s (by change T.length+2≤4*(inputSize T+2); omega) room
  have front := (measure_spec T).2
  simp only [decideBinary,next,(measure_spec ..).1,(double_spec ..).1,(double_spec ..).2,timeBudget]
  change _≤4+6*inputSize T+solveBudget s
  omega

/-- This natural polynomial reifies every input-dependent loop budget in the
actual bit/list-cell evaluator, including measurement of the input widths. -/
def polynomial : P :=
  let n := P.X
  let s := 4*(n+2)
  let pt (d : P) := 6+d*3+d*(4*d+9)
  let trial (d : P) := 1+(3*d+5)+pt (d+1)
  let gate (d : P) := 1+9*(trial d+2)
  let test := 1+s*(3+s*(gate s+2))
  let pass := 8+s*(test+2)+s*(4*s+9)
  let member := 2+s*(4*s+8)
  let accept := 12+2*s+s*pass+s*(member+2)
  let cand := 1+9*(6*s+10)
  let eligible := 8+2*s+3*s+accept
  let shift := 2+cand+9*(eligible+2)
  let pair := (s+1)*(shift+2)
  4+6*n+(4+accept+s*(3+s*(pair+2)))
def degree : P → Nat
  | .X => 1 | .C _ => 0 | .add a b => max (degree a) (degree b) | .mul a b => degree a+degree b

theorem polynomial_cost (T : Words) : (decideBinary T).2≤ev (inputSize T) polynomial :=
  work_bound T

theorem polynomial_degree : degree polynomial=9 := by decide +kernel

/-- Theorem 1: the same unrestricted budget admits a twice-width witness,
and an executable binary-input decision procedure is correct with a fixed
polynomial bound in the input size. -/
theorem one_helper (T : Words) (distinct : (nums T).Nodup) (nontrivial : 1∉nums T) :
    ((decideBinary T).1=true ↔ MCM.Fits MCM.unbounded (nums T) ((nums T).length+1)) ∧
    (decideBinary T).2≤ev (inputSize T) polynomial ∧
    ∀ w, (∀ t∈nums T,t<2^w) → MCM.Fits MCM.unbounded (nums T) ((nums T).length+1) →
      MCM.Fits (fun v => v<2^(2*w)) (nums T) ((nums T).length+1) :=
  ⟨correct T distinct nontrivial,polynomial_cost T,fun _ => R02Width.twice_width distinct nontrivial⟩
end R02Theorem
#check R02Theorem.one_helper
#print axioms R02Theorem.one_helper
#print axioms R02Theorem.polynomial_degree
