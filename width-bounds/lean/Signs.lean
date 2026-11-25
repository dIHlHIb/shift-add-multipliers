import R06Cancellation
import Std.Tactic
namespace MCMWidthSigns
open R06Cancellation

def aligned (xs : List Term) : Prop := ∀ a∈xs,∀ b∈xs,b.e≤a.e →
  b.f≤a.f ∧ (a.e≤b.e+12 → a.f+b.e=b.f+a.e) ∧ (b.e+12<a.e → b.f+12<a.f)
def signs (x y : Int) := (0<x ↔ 0<y) ∧ (x=0 ↔ y=0)

private theorem powAbs (e : Nat) : ((2:Int)^e).natAbs=2^e := by
  change (((2:Nat):Int)^e).natAbs=_
  rw [←Int.natCast_pow]
  rfl

private theorem pAdd (a b : Nat) : (2:Int)^(a+b)=2^a*2^b := by
  simpa only [Int.natCast_pow,Int.natCast_mul] using congrArg (fun n:Nat=>(n:Int)) (Nat.pow_add 2 a b)

theorem magnitude (f : Term→Nat) (xs : List Term) (e : Nat) (small : ∀ t∈xs,f t≤e) :
    (sum f xs).natAbs≤mass xs*2^e := by
  induction xs with
  | nil => simp [sum,mass]
  | cons a xs ih =>
    have h:=ih (fun t m=>small t (List.mem_cons_of_mem _ m))
    have pow:=Nat.pow_le_pow_right (by decide : 0<2) (small a List.mem_cons_self)
    apply Nat.le_trans (Int.natAbs_add_le _ _)
    simp only [mass,Int.natAbs_mul,powAbs,Nat.add_mul]
    exact Nat.add_le_add (Nat.mul_le_mul_left _ pow) h

private theorem less {p q : Nat} (gap : q+12<p) {xs : List Term} (f : Term→Nat)
    (massBound : mass xs≤2^12) (small : ∀ t∈xs,f t≤q) :
    (sum f xs).natAbs<((2:Int)^p).natAbs := by
  rw [powAbs]
  have h:=Nat.le_trans (magnitude f xs q small) (Nat.mul_le_mul_right _ massBound)
  rw [←Nat.pow_add] at h
  exact Nat.lt_of_le_of_lt h (Nat.pow_lt_pow_of_lt (by decide) (by omega))

private theorem posDominates {s : Int} {p : Nat} (h : s.natAbs<((2:Int)^p).natAbs) {q : Int}
    (pos : 0<q) : 0<q*2^p+s := by
  have P:=Int.pow_pos (m:=p) (by decide : (0:Int)<2)
  have L:=Int.mul_le_mul_of_nonneg_right (show 1≤q by omega) (show 0≤(2:Int)^p by omega)
  simp at L
  omega

private theorem negDominates {s : Int} {p : Nat} (h : s.natAbs<((2:Int)^p).natAbs) {q : Int}
    (neg : q<0) : q*2^p+s<0 := by
  have P:=Int.pow_pos (m:=p) (by decide : (0:Int)<2)
  have L:=Int.mul_le_mul_of_nonneg_right (show q≤ -1 by omega) (show 0≤(2:Int)^p by omega)
  simp at L
  omega

private theorem sorted (xs : List Term) (p : Term) (q : Int)
    (massBound : mass xs≤2^12) (order : (p::xs).Pairwise (fun a b=>b.e≤a.e))
    (rel : aligned (p::xs)) :
    signs (q*2^p.e + sum Term.e xs) (q*2^p.f + sum Term.f xs) := by
  induction xs generalizing p q with
  | nil =>
    simp only [sum,Int.add_zero]
    have ep:=Int.pow_pos (m:=p.e) (by decide : (0:Int)<2)
    have fp:=Int.pow_pos (m:=p.f) (by decide : (0:Int)<2)
    by_cases pos : 0<q
    · have e:=Int.mul_pos pos ep;have f:=Int.mul_pos pos fp; simp [signs];omega
    by_cases neg : q<0
    · have e:=Int.mul_neg_of_neg_of_pos neg ep;have f:=Int.mul_neg_of_neg_of_pos neg fp
      simp [signs];omega
    have eq : q=0 := by omega
    simp [signs,eq]
  | cons b xs ih =>
    have tail:=(List.pairwise_cons.mp order).2
    have down:=(List.pairwise_cons.mp order).1 b List.mem_cons_self
    have shape:=rel p List.mem_cons_self b (by simp) down
    have sub : aligned (b::xs) := fun a m z n=>rel a (List.mem_cons_of_mem _ m) z (List.mem_cons_of_mem _ n)
    have bound : mass xs≤2^12 := by simp [mass] at massBound;omega
    by_cases near : p.e≤b.e+12
    · let d:=p.e-b.e
      have e : p.e=d+b.e := by dsimp [d];omega
      have y:=shape.2.1 near
      have f : p.f=d+b.f := by dsimp [d];omega
      have next:=ih b (q*2^d+b.c) bound tail sub
      simp only [sum,e,f,pAdd,Int.add_mul,Int.mul_assoc,Int.add_assoc] at next ⊢
      exact next
    by_cases zero : q=0
    · simpa only [zero,Int.zero_mul,Int.zero_add,sum] using ih b b.c bound tail sub
    have allOld (z) (m : z∈b::xs) : z.e≤b.e := by
      rcases List.mem_cons.mp m with rfl|m
      · omega
      · exact (List.pairwise_cons.mp tail).1 _ m
    have ee:=less (p:=p.e) (q:=b.e) (by omega) Term.e massBound allOld
    have ff:=less (p:=p.f) (q:=b.f) (shape.2.2 (by omega)) Term.f massBound
        (fun z m=>(sub b List.mem_cons_self z m (allOld z m)).1)
    by_cases pos : 0<q
    · have E:=posDominates ee pos;have F:=posDominates ff pos
      unfold signs;omega
    · have E:=negDominates ee (show q<0 by omega);have F:=negDominates ff (show q<0 by omega)
      unfold signs;omega

private theorem permSum {xs ys : List Term} (p : xs.Perm ys) (f : Term→Nat) :
    sum f xs=sum f ys := by
  induction p with
  | nil => rfl
  | cons _ _ ih => simp [sum,ih]
  | swap => simp only [sum];omega
  | trans _ _ a b => exact a.trans b

private theorem permMass {xs ys : List Term} (p : xs.Perm ys) : mass xs=mass ys := by
  induction p with
  | nil => rfl
  | cons _ _ ih => simp [mass,ih]
  | swap => simp only [mass];omega
  | trans _ _ a b => exact a.trans b

theorem transfer (xs : List Term) (massBound : mass xs≤2^12) (rel : aligned xs) :
    signs (sum Term.e xs) (sum Term.f xs) := by
  let le (a b : Term) := decide (b.e≤a.e)
  let ys:=xs.mergeSort le
  have perm : ys.Perm xs := List.mergeSort_perm xs le
  have order : ys.Pairwise (fun a b=>b.e≤a.e) := by
    simpa [ys,le] using List.sorted_mergeSort (le:=le) (by simp [le];omega) (by simp [le];omega) xs
  rw [←permSum perm Term.e,←permSum perm Term.f]
  have bound:mass ys≤2^12 := (permMass perm) ▸ massBound
  have shape : aligned ys := fun a m b n=>rel a (perm.mem_iff.mp m) b (perm.mem_iff.mp n)
  cases eq : ys with
  | nil => simp [sum,signs]
  | cons p ts =>
    rw [eq] at order shape bound
    exact sorted _ p p.c (by simp [mass] at bound;omega) order shape

end MCMWidthSigns
#print axioms MCMWidthSigns.transfer
