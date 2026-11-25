import R02BitClosure
namespace R02Pools
open R02Bits R02Meter R02BitCost R02BitClosure

private theorem run_sub (n : Nat) (P Y : Words) : (run n P Y).1 ⊆ P++Y := by
  induction n generalizing P Y with
  | zero => exact fun _ h => List.mem_append.mpr (Or.inr h)
  | succ n ih =>
    cases f : (findM (test Y) P).1 with
    | none =>
      simp only [run,next,f,ret]
      exact fun _ h => List.mem_append.mpr (Or.inr h)
    | some a =>
      have ma := List.mem_of_find?_eq_some (by rwa [←find_spec] : P.find? (fun z => (test Y z).1)=some a)
      intro z hz
      simp only [run,next,f] at hz
      rcases List.mem_append.mp (ih _ _ hz) with inE|inY
      · exact List.mem_append.mpr (Or.inl ((erase_spec a P).2 inE))
      · rcases List.mem_cons.mp inY with eq|inY
        · exact List.mem_append.mpr (Or.inl (eq ▸ ma))
        · exact List.mem_append.mpr (Or.inr inY)

def missing (Y : Words) (v : Word) := mapM Bool.not (anyM (eqW v) (one::Y))
def accepts (T H : Words) :=
  next (append T H) (fun P => next (len P) (fun n => next (run n P []) (fun Y =>
    mapM Bool.not (anyM (missing Y) T))))

private theorem missing_spec (Y : Words) (v : Word) :
    (missing Y v).1=false ↔ val v∈1::nums Y := by
  simp only [missing,mapM,Bool.not_eq_false',any_spec,List.any_eq_true,eq_spec]
  change (∃ a∈one::Y,val v=val a) ↔ val v∈(one::Y).map val
  simp only [List.mem_map]
  constructor <;> rintro ⟨a,m,e⟩ <;> exact ⟨a,m,e.symm⟩

theorem accepts_spec (T H : Words) : (accepts T H).1=R06Closure.accepts (nums T) (nums H) := by
  apply Bool.eq_iff_iff.mpr
  simp only [accepts,next,mapM,(append_spec ..).1,(len_spec ..).1,any_spec,Bool.not_eq_true',
    List.any_eq_false,Bool.not_eq_true,missing_spec,R06Closure.accepts,List.all_eq_true,decide_eq_true_eq]
  have eq := run_spec (T++H).length (T++H) []
  simp only [nums,List.map_append,List.map_nil] at eq
  simp only [List.length_append,List.length_map,nums,List.mem_map] at *
  rw [eq]
  constructor
  · intro f z hz; obtain ⟨a,ha,rfl⟩ := hz; exact f _ ha
  · intro f a ha; exact f _ ⟨a,ha,rfl⟩

def memberBudget (s : Nat) := 2+s*(4*s+8)
def acceptBudget (s : Nat) := 12+2*s+s*passBudget s+s*(memberBudget s+2)
theorem accepts_cost (T H : Words) (s : Nat) (num : T.length+H.length+1≤s)
    (wt : Short s T) (wh : Short s H) : (accepts T H).2≤acceptBudget s := by
  let P := T++H
  let Y := (run P.length P []).1
  have pn : P.length+1≤s := by simpa [P] using num
  have wp : Short s P := fun a ha => (List.mem_append.mp ha).elim (wt _) (wh _)
  have wc := run_cost P.length P [] s (by simpa using pn) wp (by simp [Short])
  have wy : Short s Y := by
    intro a ha; apply wp; simpa using run_sub P.length P [] ha
  have yl : Y.length≤P.length := by
    have z := congrArg List.length (run_spec P.length P [])
    have q := (R06Closure.spec P.length (nums P) [] (by simp [nums]) trivial).2.1
    simp only [nums,List.map_nil,List.length_map,List.length_nil,Nat.zero_add] at z q
    dsimp [Y]; omega
  have mem (v) (mv : v∈T) : (missing Y v).2≤memberBudget s := by
    have w (a) (ma : a∈one::Y) : a.length≤s := by
      rcases List.mem_cons.mp ma with rfl|ma
      · change 1≤s; omega
      · exact wy _ ma
    have ask := any_cost (eqW v) (one::Y) (4*s+6) (fun a ha => by
      have h := eq_cost v a; have := w _ ha; have := wt _ mv; omega)
    have le := Nat.mul_le_mul_right (4*s+8) (show (one::Y).length≤s by simp; omega)
    unfold missing mapM memberBudget
    have fix : 4*s+6+2=4*s+8 := by omega
    rw [fix] at ask; omega
  have query := any_cost (missing Y) T (memberBudget s) mem
  have lm := Nat.mul_le_mul_right (memberBudget s+2) (show T.length≤s by omega)
  have rm := Nat.mul_le_mul_right (passBudget s) (show P.length≤s by omega)
  simp only [accepts,next,mapM,(append_spec ..).1,(append_spec ..).2,(len_spec ..).1,(len_spec ..).2]
  change 1+(T.length+1)+(1+(P.length+1)+(1+(run P.length P []).2+(1+(anyM (missing Y) T).2)))≤_
  unfold acceptBudget
  omega

end R02Pools
#print axioms R02Pools.accepts_spec
#print axioms R02Pools.accepts_cost
