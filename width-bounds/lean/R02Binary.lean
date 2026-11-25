import R02BitCandidates
import R02Decision
namespace R02Binary
open R02Bits R02Meter R02BitCost R02BitClosure R02BitCandidates

def scanJ (f : Nat → M Bool) : Nat → M Bool
  | 0 => f 0
  | n+1 => next (f (n+1)) (fun x => if x then ret true else scanJ f n)
theorem scanJ_spec (f : Nat → M Bool) (n : Nat) : (scanJ f n).1=true ↔ ∃ j≤n,(f j).1=true := by
  induction n with
  | zero => simp [scanJ]
  | succ n ih =>
    cases h : (f (n+1)).1 <;> simp only [scanJ,next,h,Bool.false_eq_true,if_false,if_true,ret]
    · rw [ih]; constructor
      · rintro ⟨j,le,ok⟩; exact ⟨j,by omega,ok⟩
      · rintro ⟨j,le,ok⟩; exact ⟨j,by by_cases e : j=n+1; subst j; simp_all; omega,ok⟩
    · exact ⟨fun _ => ⟨n+1,Nat.le_refl _,h⟩,fun _ => trivial⟩
theorem scanJ_cost (f : Nat → M Bool) (n c : Nat) (h : ∀ j≤n,(f j).2≤c) :
    (scanJ f n).2 ≤ (n+1)*(c+2) := by
  induction n with
  | zero => have := h 0 (Nat.le_refl _); simp [scanJ]; omega
  | succ n ih =>
    have cur := h _ (Nat.le_refl _)
    have prev := ih (fun j hj => h j (by omega))
    rw [scanJ]; simp only [next,Nat.succ_mul (n+1)]
    split <;> try simp only [ret]
    all_goals omega

def eligible (T : Words) (B : Nat) (v : Word) :=
  next (downM B v) (fun high => next (anyM (fun bit => ret bit) high)
    (fun large => if large then ret false else R02Pools.accepts T [v]))

theorem eligible_value (T : Words) (B : Nat) (v : Word) :
    (eligible T B v).1 = (decide (val v<2^B) && R06Closure.accepts (nums T) [val v]) := by
  have nonzero (a : Word) : (anyM (fun b => ret b) a).1=false ↔ val a=0 := by
    rw [any_spec]
    induction a with
    | nil => decide
    | cons b a ih => cases b <;> simp_all [ret,val,bit] <;> omega
  have zero := nonzero (down B v)
  rw [down_val,Nat.div_eq_zero_iff_lt (Nat.two_pow_pos B)] at zero
  simp only [eligible,next,(down_spec ..).1]
  cases large : (anyM (fun bit => ret bit) (down B v)).1
  · have small : val v<2^B := by have := zero.mp large; omega
    simp only [Bool.false_eq_true,if_false,R02Pools.accepts_spec,decide_eq_true small,Bool.true_and]; rfl
  · have big : ¬val v<2^B := by intro sm; have := zero.mpr sm; simp_all
    simp [ret,big]

def eligibleBudget (s : Nat) := 8+2*s+3*s+R02Pools.acceptBudget s
theorem eligible_cost (T : Words) (B s : Nat) (v : Word) (nv : v.length≤s) (nb : B≤s)
    (m : T.length+2≤s) (wt : Short s T) : (eligible T B v).2≤eligibleBudget s := by
  have d := down_spec B v
  have q := any_cost (fun bit : Bool => ret bit) (downM B v).1 1 (by intros; exact Nat.le_refl _)
  have a := R02Pools.accepts_cost T [v] s (by simpa using m) wt (by
    intro z hz; simp only [List.mem_singleton] at hz; exact hz ▸ nv)
  simp only [eligible,next]; split
  · change 1+(downM B v).2+(1+(anyM (fun bit => ret bit) (downM B v).1).2+1) ≤ _
    unfold eligibleBudget; have := d.2.1; have := d.2.2; omega
  · unfold eligibleBudget; have := d.2.1; have := d.2.2; omega

def checkAt (T : Words) (B : Nat) (a b : Word) (j : Nat) :=
  next (atM a b j) (anyM (eligible T B))
def solveAt (T : Words) (B : Nat) : M Bool :=
  next (R02Pools.accepts T []) (fun free => if free then ret true else
    anyM (fun a => anyM (fun b => scanJ (checkAt T B a b) B) (one::T)) (one::T))

theorem solveAt_spec (T : Words) (B : Nat) :
    (solveAt T B).1=R02Decision.decideAt (nums T) B := by
  let P := one::T
  have pmap : 1::nums T=P.map val := rfl
  have atJ (a b : Word) (j : Nat) : (checkAt T B a b j).1=true ↔
      ∃ h∈R06Candidates.atShift (val a) (val b) j,(decide (h<2^B) && R06Closure.accepts (nums T) [h])=true := by
    simp only [checkAt,next,any_spec,List.any_eq_true,eligible_value]
    rw [←at_spec]; simp only [nums,List.map_cons,List.map_nil,List.mem_map]
    constructor
    · rintro ⟨a,ha,ok⟩; exact ⟨_,⟨a,ha,rfl⟩,ok⟩
    · rintro ⟨_,⟨a,ha,rfl⟩,ok⟩; exact ⟨a,ha,ok⟩
  have pair (a b : Word) : (scanJ (checkAt T B a b) B).1=true ↔
      ∃ h∈R06Candidates.pair B (val a) (val b), (decide (h<2^B) && R06Closure.accepts (nums T) [h])=true := by
    rw [scanJ_spec]; simp only [atJ,R06Candidates.pair,List.mem_flatMap,List.mem_range]
    constructor
    · rintro ⟨j,le,h,mem,ok⟩; exact ⟨h,⟨j,by omega,mem⟩,ok⟩
    · rintro ⟨h,⟨j,le,mem⟩,ok⟩; exact ⟨j,by omega,h,mem,ok⟩
  apply Bool.eq_iff_iff.mpr
  simp only [solveAt,next,R02Decision.decideAt,R02Pools.accepts_spec,nums,List.map_nil]
  cases hit : R06Closure.accepts (T.map val) []
  · simp only [Bool.false_eq_true,if_false,Bool.false_or,any_spec,List.any_eq_true,pair,
      R06Candidates.children,List.mem_flatMap]
    change (∃ a∈P,∃ b∈P,_) ↔ _
    change _ ↔ ∃ h,(∃ a∈(1::nums T), ∃ b∈(1::nums T), h∈R06Candidates.pair B a b) ∧ _
    rw [pmap]; simp only [List.mem_map]
    constructor
    · rintro ⟨a,ma,b,mb,h,mh,ok⟩
      exact ⟨h,⟨_,⟨a,ma,rfl⟩,_,⟨b,mb,rfl⟩,mh⟩,ok⟩
    · rintro ⟨h,⟨_,⟨a,ma,rfl⟩,_,⟨b,mb,rfl⟩,mh⟩,ok⟩
      exact ⟨a,ma,b,mb,h,mh,ok⟩
  · simp [ret]

def shiftBudget (s : Nat) := 2+atBudget s+9*(eligibleBudget s+2)
def pairBudget (s : Nat) := (s+1)*(shiftBudget s+2)
def solveBudget (s : Nat) := 4+R02Pools.acceptBudget s+s*(3+s*(pairBudget s+2))

theorem solveAt_cost (T : Words) (B s : Nat) (m : T.length+2≤s)
    (room : ∀ a∈one::T,a.length+B+1≤s) : (solveAt T B).2≤solveBudget s := by
  let P := one::T
  have lp : P.length≤s := by dsimp [P]; omega
  have wt : Short s T := fun a ha => by have := room a (List.mem_cons_of_mem _ ha); omega
  have bs : B≤s := by have := room one List.mem_cons_self; omega
  have each (a) (ma : a∈P) (b) (mb : b∈P) (j) (le : j≤B) : (checkAt T B a b j).2≤shiftBudget s := by
    have wa := room a ma; have wb := room b mb
    have ⟨cost,short⟩ := at_bounds (a:=a) (b:=b) (j:=j) (s:=s) (by omega)
    have ac (v) (mv : v∈(atM a b j).1) : (eligible T B v).2≤eligibleBudget s :=
      eligible_cost T B s v (short _ mv) bs m wt
    have all := any_cost _ _ _ ac
    have count : (atM a b j).1.length=9 := by rw [atM,seq_spec,List.length_map]; rfl
    rw [count] at all
    simp only [checkAt,next,shiftBudget]; omega
  have pair (a) (ma : a∈P) (b) (mb : b∈P) :
      (scanJ (checkAt T B a b) B).2≤pairBudget s :=
    Nat.le_trans (scanJ_cost _ _ _ (each a ma b mb)) (Nat.mul_le_mul_right _ (by omega))
  have inner (a) (ma : a∈P) :
      (anyM (fun b => scanJ (checkAt T B a b) B) P).2≤1+s*(pairBudget s+2) :=
    Nat.le_trans (any_cost _ _ _ (pair a ma))
      (Nat.add_le_add_left (Nat.mul_le_mul_right _ lp) _)
  have both := any_cost _ _ _ inner
  have mult := Nat.mul_le_mul_right (1+s*(pairBudget s+2)+2) lp
  have base := R02Pools.accepts_cost T [] s (by simp; omega) wt (by simp [Short])
  simp only [solveAt,next]; split
  · change 1+(R02Pools.accepts T []).2+1≤_
    unfold solveBudget; omega
  · change 1+(R02Pools.accepts T []).2+(anyM (fun a => anyM (fun b => scanJ (checkAt T B a b) B) P) P).2≤_
    unfold solveBudget
    rw [show 3+s*(pairBudget s+2)=1+s*(pairBudget s+2)+2 by omega]; omega

end R02Binary
#print axioms R02Binary.solveAt_spec
#print axioms R02Binary.solveAt_cost
