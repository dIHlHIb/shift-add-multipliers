import PrefixCheck
namespace MCMWidthColor
open MCM MCMWidthPrefix R02NearFamily R02NearPlan MCMWidthLift R06Candidates

/-- Untrusted numeric separators; every use is justified by the two explicit
endpoint covers and a checked rejection of each shared exception. -/
inductive Excluded where
  | empty
  | key (x : Nat)
  | branch (x : Nat) (left right : Excluded)
def Excluded.has : Excluded → Nat → Bool
  | .empty,_ => false
  | .key a,h => a==h
  | .branch a l r,h => if h<a then l.has h else if a<h then r.has h else true

structure Color where
  maskA : Nat
  maskB : Nat
  excluded : Excluded
  shared : List Nat

def hit (mask period h : Nat) := (mask/2^(h%period))%2==1
def color (c : Color) (h : Nat) := hit c.maskA 8191 h && hit c.maskB 4093 h && !c.excluded.has h
def fitsSide (c : Color) (cap : Nat) (want : Bool) (h : Nat) :=
  h%2!=1 || decide (cap≤h) || c.shared.contains h || (color c h == want)
def row (_B : Nat) (S : List Nat) (t j : Nat) (f : Nat→Bool) :=
  let n:=2^j
  f (exactDiv t (n-1)) && f (exactDiv t (n+1)) &&
    S.all (fun a=>(block a t j).all f)

def certified (B : Nat) (S : List Nat) (t : Nat) (c : Color) (want : Bool) :=
  let f:=fitsSide c (2^B) want
  f t=true ∧ ∀ j≤B,row B S t j f=true

theorem side {B S t c want h} (ok : certified B S t c want) (m : h∈used B S t) :
    h∈c.shared ∨ color c h=want := by
  let f:=fitsSide c (2^B) want
  have ⟨mem,good⟩:=List.mem_filter.mp m
  have info : h%2=1 ∧ h<2^B := of_decide_eq_true good
  have passed : f h=true := by
    rcases List.mem_append.mp mem with self|fixed
    · rcases List.mem_cons.mp self with rfl|more
      · exact ok.1
      obtain ⟨j,mj,byj⟩:=List.mem_flatMap.mp more
      have hj:=List.mem_range.mp mj
      have tested:=ok.2 j (by omega)
      simp only [row,Bool.and_eq_true] at tested
      simp only [List.mem_cons,List.mem_nil_iff,or_false] at byj
      rcases byj with eq|eq
      · exact eq ▸ tested.1.1
      · exact eq ▸ tested.1.2
    · obtain ⟨a,ma,n⟩:=List.mem_flatMap.mp fixed
      obtain ⟨j,mj,mh⟩:=List.mem_flatMap.mp n
      have hj:=List.mem_range.mp mj
      have tested:=ok.2 j (by omega)
      simp only [row,Bool.and_eq_true] at tested
      exact List.all_eq_true.mp (List.all_eq_true.mp tested.2 _ ma) _ mh
  simpa [f,fitsSide,info.1,show ¬2^B≤h by omega] using passed

theorem disjoint {B S u v h c} (a : certified B S u c true) (b : certified B (u::S) v c false)
    (miss : c.shared.all (fun x=> !can S x)=true) (birth : step S h)
    (left : h∈used B S u) (right : h∈used B (u::S) v) : False := by
  have no (m : h∈c.shared) : False := by
    have e:=List.all_eq_true.mp miss _ m
    simp [(can_iff S h).mpr birth] at e
  rcases side a left with m|x
  · exact no m
  rcases side b right with m|y
  · exact no m
  · simp [x] at y

def targetsOK (k : Nat) :=
  !can (core k) (u k) && !can (core k) (v k) &&
  !can (u k::core k) (v k) && !can (v k::core k) (u k)

theorem from_colors {k : Nat} (p : 0<k) {c d : Color} (base : targetsOK k=true)
    (a : certified (width k) (core k) (u k) c true)
    (b : certified (width k) (u k::core k) (v k) c false)
    (e : certified (width k) (core k) (v k) d true)
    (f : certified (width k) (v k::core k) (u k) d false)
    (sc : c.shared.all (fun h=> !can (core k) h)=true)
    (sd : d.shared.all (fun h=> !can (core k) h)=true) : MCMWidthAll.familyExact k := by
  apply sound p
  have scan {S u v B c} (r : certified B S u c true) (t : certified B (u::S) v c false)
      (m : c.shared.all (fun h=> !can S h)=true) : scanOrder B S u v=true := by
    apply List.all_eq_true.mpr
    intro h mh
    by_cases member : h∈used B (u::S) v
    · have n : can S h=false := Bool.eq_false_iff.mpr (fun ok=>disjoint r t m ((can_iff ..).mp ok) mh member)
      simp [n]
    · have n : (Std.TreeSet.ofList (used B (u::S) v)).contains h=false := by
        simp [Std.TreeSet.contains_ofList,member]
      simp [n]
  simpa only [check,targetsOK,scan a b sc,scan e f sd,Bool.and_true] using base

/-- Split a checked index range without relying on kernel reduction of a long
list. Leaves can be computed and independently replayed as small proof terms. -/
def interval (f : Nat→Bool) (lo n : Nat) := (List.range n).all fun j=>f (lo+j)
theorem join {f lo n m} (a : interval f lo n=true) (b : interval f (lo+n) m=true) :
    interval f lo (n+m)=true := by
  apply List.all_eq_true.mpr
  intro j hj
  have top:=List.mem_range.mp hj
  by_cases first : j<n
  · exact List.all_eq_true.mp a j (List.mem_range.mpr first)
  · have v:=List.all_eq_true.mp b (j-n) (List.mem_range.mpr (by omega))
    simpa only [show lo+n+(j-n)=lo+j by omega] using v
theorem finished {B S t c want} (start : fitsSide c (2^B) want t=true)
    (span : interval (fun j=>row B S t j (fitsSide c (2^B) want)) 0 (B+1)=true) :
    certified B S t c want := ⟨start,fun j hj=>by
      simpa using List.all_eq_true.mp span j (List.mem_range.mpr (show j<B+1 by omega))⟩
end MCMWidthColor
#print axioms MCMWidthColor.from_colors
