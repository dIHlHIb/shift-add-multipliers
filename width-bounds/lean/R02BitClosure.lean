import R02BitCost
import R06Closure
namespace R02BitClosure
open R02Bits R02Meter R02BitCost MCM

abbrev Words := List Word
def nums (xs : Words) := xs.map val
def Short (d : Nat) (xs : Words) := ∀ a∈xs,a.length≤d
def one : Word := [true]

private theorem odd_bit (x : Word) : x.headD false=true ↔ val x%2=1 := by
  cases x with
  | nil => decide
  | cons b xs => cases b <;> simp [val,bit] <;> omega

def test (ys : Words) (v : Word) : M Bool :=
  if v.headD false then
    let pool := one::ys
    anyM (fun a => anyM (fun b => gateM a b v) pool) pool
  else ret false

theorem test_spec (ys : Words) (v : Word) : (test ys v).1=R06Closure.ready (nums ys) (val v) := by
  apply Bool.eq_iff_iff.mpr
  simp only [R06Closure.ready,Bool.and_eq_true,beq_iff_eq,MCM.makes_iff]
  by_cases odd : v.headD false=true
  · have oh := (odd_bit v).mp odd
    simp only [test,odd,if_true,any_spec,List.any_eq_true,gate_spec,oh,true_and]
    change (∃ a∈one::ys, ∃ b∈one::ys,Gate (val a) (val b) (val v)) ↔ _
    have eq : 1::nums ys = (one::ys).map val := rfl
    rw [eq]
    simp only [List.mem_map]
    constructor
    · rintro ⟨a,ha,b,hb,g⟩; exact ⟨_,⟨a,ha,rfl⟩,_,⟨b,hb,rfl⟩,g⟩
    · rintro ⟨_,⟨a,ha,rfl⟩,_,⟨b,hb,rfl⟩,g⟩; exact ⟨a,ha,b,hb,g⟩
  · have no := fun h => odd ((odd_bit v).mpr h)
    simp only [test,if_neg odd,ret,Bool.false_eq_true,false_iff]; exact fun h => no h.1

def testBudget (s : Nat) := 1+s*(3+s*(gateBudget s+2))
theorem test_cost {ys : Words} {v : Word} {s : Nat} (ly : ys.length+1≤s) (wy : Short s ys)
    (wv : v.length≤s) : (test ys v).2≤testBudget s := by
  let pool := one::ys
  have lp : pool.length≤s := ly
  have wp : Short s pool := by
    intro a ha
    rcases List.mem_cons.mp ha with rfl|h
    · change 1≤s; omega
    · exact wy _ h
  have inner (a) (ha : a∈pool) : (anyM (fun b => gateM a b v) pool).2≤1+s*(gateBudget s+2) :=
    Nat.le_trans (any_cost _ _ _ (fun b hb => gate_cost a b v s (wp _ ha) (wp _ hb) wv))
      (Nat.add_le_add_left (Nat.mul_le_mul_right _ lp) _)
  have outer := any_cost _ pool _ inner
  have mul := Nat.mul_le_mul_right (1+s*(gateBudget s+2)+2) lp
  unfold test; split
  · change (anyM (fun a => anyM (fun b => gateM a b v) pool) pool).2≤1+s*(3+s*(gateBudget s+2))
    rw [show 3+s*(gateBudget s+2)=1+s*(gateBudget s+2)+2 by omega]
    omega
  · simp [ret,testBudget]

def eraseW (v : Word) : Words → M Words
  | [] => ret []
  | a::xs => next (eqW a v) (fun eq => if eq then ret xs else mapM (a::·) (eraseW v xs))
theorem erase_spec (v : Word) (P : Words) :
    nums (eraseW v P).1=(nums P).erase (val v) ∧ (eraseW v P).1 ⊆ P := by
  induction P with
  | nil => exact ⟨rfl,fun _ h=>h⟩
  | cons a xs ih =>
    cases eq : (eqW a v).1
    · have ne : val a≠val v := fun e => by have := (eq_spec ..).mpr e; simp_all
      simp only [eraseW,next,eq,Bool.false_eq_true,if_false,mapM]
      constructor
      · simp [nums,List.erase_cons,ne,ih.1,show (eraseW v xs).1.map val=(xs.map val).erase (val v) from ih.1]
      · intro z hz; rcases List.mem_cons.mp hz with e|h
        · exact List.mem_cons.mpr (Or.inl e)
        · exact List.mem_cons_of_mem _ (ih.2 h)
    · have e := (eq_spec ..).mp eq
      simp [eraseW,next,eq,ret,nums,List.erase_cons,e]

theorem erase_cost (P : Words) (v : Word) (s : Nat) (sh : Short s P) (sv : v.length≤s) :
    (eraseW v P).2≤1+P.length*(4*s+9) := by
  induction P with
  | nil => simp [eraseW,ret]
  | cons a xs ih =>
    have a0 := sh a List.mem_cons_self
    have prev := ih (fun z h => sh z (List.mem_cons_of_mem _ h))
    have comp := eq_cost a v
    cases eq : (eqW a v).1 <;> simp only [eraseW,next,eq,if_true,Bool.false_eq_true,if_false,
      ret,mapM,List.length_cons,Nat.succ_mul xs.length] <;> omega

def run : Nat → Words → Words → M Words
  | 0,_,ys => ret ys
  | n+1,P,ys => next (findM (test ys) P) (fun f =>
    match f with
    | none => ret ys
    | some a => next (eraseW a P) (fun rest => run n rest (a::ys)))

private theorem map_find (f : Nat → Bool) (P : Words) :
    (P.find? (fun a => f (val a))).map val = (nums P).find? f := by
  induction P with
  | nil => rfl
  | cons a as ih => cases q : f (val a) <;> simp_all [nums,List.find?_cons]

theorem found (ys P : Words) : ((findM (test ys) P).1).map val=(nums P).find? (R06Closure.ready (nums ys)) := by
  rw [find_spec]; simp only [test_spec]; apply map_find

theorem run_spec (n : Nat) (P ys : Words) :
    nums (run n P ys).1=R06Closure.run n (nums P) (nums ys) := by
  induction n generalizing P ys with
  | zero => rfl
  | succ n ih =>
    simp only [run,next,R06Closure.run,←found]
    cases h : (findM (test ys) P).1 with
    | none => rfl
    | some a => simp only [Option.map_some]; rw [ih,(erase_spec ..).1]; rfl

def passBudget (s : Nat) := 8+s*(testBudget s+2)+s*(4*s+9)
theorem run_cost (n : Nat) (P ys : Words) (s : Nat) (sz : P.length+ys.length+1≤s)
    (sp : Short s P) (sy : Short s ys) :
    (run n P ys).2≤1+n*(passBudget s) := by
  induction n generalizing P ys with
  | zero => simp [run,ret]
  | succ n ih =>
    have pf := find_cost (test ys) P (testBudget s) (fun a ha => test_cost (by omega) sy (sp _ ha))
    have fbound := Nat.mul_le_mul_right (testBudget s+2) (show P.length≤s by omega)
    cases f : (findM (test ys) P).1 with
    | none =>
      simp only [run,next,f,ret,List.length_cons,Nat.succ_mul n,passBudget]
      omega
    | some a =>
      have mem : a∈P := List.mem_of_find?_eq_some (by rwa [←find_spec] : P.find? (fun a => (test ys a).1)=some a)
      have ea := erase_spec a P
      have er := erase_cost P a s sp (sp _ mem)
      have eb := Nat.mul_le_mul_right (4*s+9) (show P.length≤s by omega)
      have ml : val a∈nums P := List.mem_map.mpr ⟨a,mem,rfl⟩
      have count := congrArg List.length ea.1
      rw [List.length_erase_of_mem ml] at count
      simp only [nums,List.length_map] at count
      have nonempty := List.length_pos_of_mem mem
      have recurse := ih (eraseW a P).1 (a::ys) (by simp only [List.length_cons]; omega)
        (fun z hz => sp _ (ea.2 hz)) (fun z hz => (List.mem_cons.mp hz).elim (fun zz => zz ▸ sp _ mem) (sy _))
      simp only [run,next,f,Nat.succ_mul n]
      unfold passBudget at recurse ⊢
      omega

end R02BitClosure
#print axioms R02BitClosure.run_spec
#print axioms R02BitClosure.run_cost
