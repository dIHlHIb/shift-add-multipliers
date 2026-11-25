import McmAudit
namespace R06Closure
open MCM

def ready (ys : List Nat) (v : Nat) : Bool := v%2==1 && makes ys v

/-- Consume an available member of the gate pool at each successful pass. -/
def run : Nat → List Nat → List Nat → List Nat
  | 0, _, ys => ys
  | n+1, pending, ys =>
    match pending.find? (ready ys) with
    | none => ys
    | some v => run n (pending.erase v) (v::ys)

theorem spec (n : Nat) (pool ys : List Nat) (hn : pool.length≤n) (hv : Valid unbounded ys) :
    let zs := run n pool ys
    Valid unbounded zs ∧ zs.length≤ys.length+pool.length ∧ ys ⊆ zs ∧
      ∀ v∈pool, ready zs v=true → v∈zs := by
  induction n generalizing pool ys with
  | zero =>
    have hp : pool=[] := List.length_eq_zero_iff.mp (by omega)
    subst pool
    exact ⟨hv,by simp [run],fun _ h => h,by simp⟩
  | succ n ih =>
    simp only [run]
    split
    next eq =>
      exact ⟨hv,by omega,fun _ h => h,fun v h ok => ((List.find?_eq_none.mp eq) v h ok).elim⟩
    next v eq =>
      have inP := List.mem_of_find?_eq_some eq
      have rd := List.find?_some eq
      have info : v%2=1 ∧ makes ys v=true := by simpa [ready] using rd
      have ne := List.length_pos_of_mem inP
      have len := List.length_erase_of_mem inP
      obtain ⟨valid,maxlen,inc,closed⟩ := ih (pool.erase v) (v::ys) (by omega)
        ⟨hv,info.1,trivial,info.2⟩
      refine ⟨valid,by simp only [List.length_cons] at maxlen; omega,fun _ h => inc (List.mem_cons_of_mem _ h),?_⟩
      intro a ha ra
      by_cases same : a=v
      · subst a; exact inc List.mem_cons_self
      · exact closed _ ((List.mem_erase_of_ne same).mpr ha) ra

def accepts (T H : List Nat) : Bool :=
  let pool := T++H
  let result := run pool.length pool []
  T.all (fun t => decide (t∈1::result))

theorem sound {T H} (ok : accepts T H=true) : Fits unbounded T (T.length+H.length) := by
  let pool := T++H
  obtain ⟨hv,len,_,_⟩ := spec pool.length pool [] (Nat.le_refl _) trivial
  exact ⟨_,by simpa [pool] using len,hv,fun t ht => of_decide_eq_true (List.all_eq_true.mp ok t ht)⟩

theorem complete {T H xs : List Nat} {cap : Nat → Prop} (valid : Valid cap xs)
    (cover : ∀ t∈T, t∈1::xs) (pool : ∀ t∈xs,t∈1::(T++H)) : accepts T H=true := by
  let allowed := T++H
  let out := run allowed.length allowed []
  obtain ⟨_,_,_,stable⟩ := spec allowed.length allowed [] (Nat.le_refl _) trivial
  have inside (ys : List Nat) (v : Valid cap ys) (hp : ∀ t∈ys,t∈1::allowed) : ys ⊆ 1::out := by
    induction ys with
    | nil => simp
    | cons a ys ih =>
      have sub := ih v.1 (fun z hz => hp _ (List.mem_cons_of_mem _ hz))
      have av (z) (hz : z∈1::ys) : z∈1::out := by
        rcases List.mem_cons.mp hz with rfl|hz
        · exact List.mem_cons_self
        · exact sub hz
      obtain ⟨b,mb,c,mc,g⟩ := (makes_iff ..).mp v.2.2.2
      have ok : ready out a=true := by
        simp only [ready,Bool.and_eq_true,beq_iff_eq]
        exact ⟨v.2.1,(makes_iff ..).mpr ⟨b,av _ mb,c,av _ mc,g⟩⟩
      intro z hz
      rcases List.mem_cons.mp hz with rfl|hz
      · rcases List.mem_cons.mp (hp _ List.mem_cons_self) with eq|mem
        · exact List.mem_cons.mpr (Or.inl eq)
        · exact List.mem_cons_of_mem _ (stable _ mem ok)
      · exact sub hz
  apply List.all_eq_true.mpr
  intro t ht; apply decide_eq_true
  rcases List.mem_cons.mp (cover t ht) with rfl|mem
  · exact List.mem_cons_self
  · exact inside xs valid pool mem

end R06Closure
#print axioms R06Closure.complete
#print axioms R06Closure.sound
