import Std.Tactic
namespace MCMWidthPump

/-- The finite interval criterion, allowing either list to be empty. -/
theorem sandwich (lo hi : List Int) (ok : ∀ a∈lo, ∀ b∈hi, a≤b) :
    ∃ z : Int, (∀ a∈lo, a≤z) ∧ (∀ b∈hi, z≤b) := by
  induction lo with
  | nil =>
    have lower (ys : List Int) : ∃ z : Int, ∀ b∈ys, z≤b := by
      induction ys with
      | nil => exact ⟨0,by simp⟩
      | cons b ys ih =>
        obtain ⟨z,h⟩ := ih
        refine ⟨min b z,?_⟩
        intro x hx
        rcases List.mem_cons.mp hx with rfl|hx
        · exact Int.min_le_left ..
        · exact Int.le_trans (Int.min_le_right ..) (h x hx)
    obtain ⟨z,h⟩ := lower hi
    exact ⟨z,by simp,h⟩
  | cons a as ih =>
    obtain ⟨z,L,U⟩ := ih (fun x m => ok x (List.mem_cons_of_mem _ m))
    refine ⟨max a z,?_,?_⟩
    · intro x m
      rcases List.mem_cons.mp m with rfl|m
      · exact Int.le_max_left ..
      · exact Int.le_trans (L x m) (Int.le_max_right ..)
    · intro b m
      have := ok a List.mem_cons_self b m
      have := U b m
      omega

structure Row where
  a : Int
  b : Int
  c : Int
  deriving Repr, DecidableEq

def val (r : Row) (k j : Int) := r.a*k+r.b*j+r.c
def dir (r : Row) (j : Int) := r.a*2+r.b*j
def limited (r : Row) (q d : Int) := -q≤r.b ∧ r.b≤q ∧ -d≤r.c ∧ r.c≤d

private theorem slope {z k c : Int} (hk : 104<k) (hc : c≤104)
    (h : 0≤z*k+c) : 0≤z := by
  apply Classical.byContradiction
  intro bad
  have nz : z≤ -1 := by omega
  have bound:=Int.mul_le_mul_of_nonneg_right nz (show 0≤k by omega)
  simp at bound
  omega

def low (r : Row) := if r.b=1 then -(2*r.a) else -r.a
def high (r : Row) := if r.b= -1 then 2*r.a else r.a

private theorem ordered {l u : Row} {k j : Int} (hk : 104<k)
    (hl : limited l 2 26) (hu : limited u 2 26)
    (vl : 0≤val l k j) (vu : 0≤val u k j) (pl : 0<l.b) (nu : u.b<0) :
    low l≤high u := by
  obtain ⟨a,b,c⟩:=l
  obtain ⟨d,e,f⟩:=u
  simp only [limited,val] at *
  change 0<b at pl
  change e<0 at nu
  have bb : b=1 ∨ b=2 := by omega
  have ee : e= -1 ∨ e= -2 := by omega
  rcases bb with rfl|rfl <;> rcases ee with rfl|rfl
  · have z : 0≤a+d := slope hk (c:=c+f) (by omega) (by rw [Int.add_mul]; omega)
    simp [low,high]; omega
  · have z : 0≤a+a+d := slope hk (c:=c+c+f) (by omega) (by simp only [Int.add_mul]; omega)
    simp [low,high]; omega
  · have z : 0≤a+d+d := slope hk (c:=c+f+f) (by omega) (by simp only [Int.add_mul]; omega)
    simp [low,high]; omega
  · have z : 0≤a+d := slope hk (c:=c+f) (by omega) (by rw [Int.add_mul]; omega)
    simp [low,high]; omega

theorem shared (rows : List Row) {k j : Int} (hk : 104<k)
    (lim : ∀ r∈rows,limited r 2 26) (old : ∀ r∈rows,0≤val r k j) :
    ∃ dj : Int, ∀ r∈rows,0≤dir r dj := by
  let L := (rows.filter (fun r=>decide (0<r.b))).map low
  let U := (rows.filter (fun r=>decide (r.b<0))).map high
  have ok : ∀ x∈L,∀ y∈U,x≤y := by
    intro x mx y my
    obtain ⟨l,ml,rfl⟩:=List.mem_map.mp mx
    obtain ⟨u,mu,rfl⟩:=List.mem_map.mp my
    obtain ⟨ml,pl⟩:=List.mem_filter.mp ml
    obtain ⟨mu,nu⟩:=List.mem_filter.mp mu
    exact ordered hk (lim l ml) (lim u mu) (old l ml) (old u mu) (of_decide_eq_true pl) (of_decide_eq_true nu)
  obtain ⟨dj,lo,hi⟩:=sandwich L U ok
  refine ⟨dj,?_⟩
  intro r mr
  have lm:=lim r mr
  have v:=old r mr
  by_cases pos : 0<r.b
  · have m : low r∈L := List.mem_map.mpr ⟨r,List.mem_filter.mpr ⟨mr,decide_eq_true pos⟩,rfl⟩
    have g:=lo _ m
    have ab : r.b=1 ∨ r.b=2 := by unfold limited at lm;omega
    rcases ab with e|e <;> simp [low,dir,e] at * <;> omega
  by_cases neg : r.b<0
  · have m : high r∈U := List.mem_map.mpr ⟨r,List.mem_filter.mpr ⟨mr,decide_eq_true neg⟩,rfl⟩
    have g:=hi _ m
    have ab : r.b= -1 ∨ r.b= -2 := by unfold limited at lm;omega
    rcases ab with e|e <;> simp [high,dir,e] at * <;> omega
  have zero : r.b=0 := by omega
  have v' : 0≤r.a*k+r.c := by simpa [val,zero] using v
  have z:=slope hk (show r.c≤104 by unfold limited at lm;omega) v'
  simp [dir,zero];omega

structure Group where
  lower : List Row
  upper : List Row

def diff (u l : Row) : Row := ⟨u.a-l.a,u.b-l.b,u.c-l.c⟩
def pairs (g : Group) := g.lower.flatMap fun l => g.upper.map fun u => diff u l
def held (g : Group) (k j h : Int) :=
  (∀ r∈g.lower,val r k j≤h) ∧ (∀ r∈g.upper,h≤val r k j)
def slopes (g : Group) (dj dh : Int) :=
  (∀ r∈g.lower,dir r dj≤dh) ∧ (∀ r∈g.upper,dh≤dir r dj)
def smallGroup (g : Group) := ∀ r∈g.lower++g.upper,limited r 1 13

private theorem in_pairs {g x} (mem : x∈pairs g) :
    ∃ l∈g.lower, ∃ u∈g.upper,x=diff u l := by
  obtain ⟨l,ml,rest⟩:=List.mem_flatMap.mp mem
  obtain ⟨u,mu,eq⟩:=List.mem_map.mp rest
  exact ⟨l,ml,u,mu,eq.symm⟩

private theorem pair_small {g r} (small : smallGroup g) (mem : r∈pairs g) :
    limited r 2 26 := by
  obtain ⟨l,ml,u,mu,rfl⟩:=in_pairs mem
  have a:=small l (List.mem_append_left _ ml)
  have b:=small u (List.mem_append_right _ mu)
  simp only [limited,diff] at *
  omega

private theorem pair_old {g r k j h} (valid : held g k j h) (mem : r∈pairs g) :
    0≤val r k j := by
  obtain ⟨l,ml,u,mu,rfl⟩:=in_pairs mem
  have a:=valid.1 l ml
  have b:=valid.2 u mu
  simp only [val,diff,Int.sub_mul] at *
  omega

private theorem private_dir {g dj} (ok : ∀ r∈pairs g,0≤dir r dj) :
    ∃ dh,slopes g dj dh := by
  have cross : ∀ a∈g.lower.map (fun r=>dir r dj),∀ b∈g.upper.map (fun r=>dir r dj),a≤b := by
    intro a ha b hb
    obtain ⟨l,ml,rfl⟩:=List.mem_map.mp ha
    obtain ⟨u,mu,rfl⟩:=List.mem_map.mp hb
    have yes:=ok (diff u l) (List.mem_flatMap.mpr ⟨l,ml,List.mem_map.mpr ⟨u,mu,rfl⟩⟩)
    simp only [dir,diff,Int.sub_mul] at *
    omega
  obtain ⟨dh,lo,hi⟩:=sandwich _ _ cross
  exact ⟨dh,fun r m=>lo _ (List.mem_map.mpr ⟨r,m,rfl⟩),
      fun r m=>hi _ (List.mem_map.mpr ⟨r,m,rfl⟩)⟩

/-- Every sparse comparison cell with a point at k>104 has an integer
recession direction whose k increment is exactly two.  The groups are the
independent inequalities on the endpoint shifts s and t. -/
theorem pump (base : List Row) (g h : Group) {k j s t : Int}
    (large : 104<k) (small : ∀ r∈base,limited r 1 13)
    (sg : smallGroup g) (sh : smallGroup h)
    (good : ∀ r∈base,0≤val r k j) (og : held g k j s) (oh : held h k j t) :
    ∃ dj ds dt : Int, (∀ r∈base,0≤dir r dj) ∧ slopes g dj ds ∧ slopes h dj dt := by
  let rows:=base++(pairs g++pairs h)
  have cases_ (r) (m : r∈rows) : r∈base ∨ r∈pairs g ∨ r∈pairs h := by
    simpa [rows,List.mem_append] using m
  have ls (r) (m : r∈rows) : limited r 2 26 := by
    rcases cases_ _ m with v|v|v
    · have hv:=small r v; unfold limited at *; omega
    · exact pair_small sg v
    · exact pair_small sh v
  have os (r) (m : r∈rows) : 0≤val r k j := by
    rcases cases_ _ m with v|v|v
    · exact good r v
    · exact pair_old og v
    · exact pair_old oh v
  obtain ⟨dj,c⟩:=shared rows large ls os
  obtain ⟨ds,dg⟩:=private_dir (g:=g) (fun r m=>c r (by simp [rows,m]))
  obtain ⟨dt,dh⟩:=private_dir (g:=h) (fun r m=>c r (by simp [rows,m]))
  exact ⟨dj,ds,dt,fun r m=>c r (by simp [rows,m]),dg,dh⟩

end MCMWidthPump
#print axioms MCMWidthPump.pump
