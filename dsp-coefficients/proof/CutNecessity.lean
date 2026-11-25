import OrbitProjection

namespace MCMCuts
open MCM MCMOrbit

/-- A particular choice of parents can produce a member of the cut. -/
def Cross (p : Nat) (m : Int) (C A : Int → Prop) : Prop :=
  ∃ t, C t ∧ ∃ a, A a ∧ ∃ b, A b ∧ successor p m a b t

/-- Select the first target from C in execution order. Neither of its parents
    belongs to C. The source is available before any computed node. -/
theorem first_entry {p : Nat} {m : Int} (C : Int → Prop) (source : ¬ C (project p m 1))
    (xs : List Int) (valid : validQ p m xs) (hit : ∃ x ∈ xs, C x) :
    Cross p m C (fun x => x ∈ project p m 1 :: xs ∧ ¬ C x) := by
  classical
  induction xs with
  | nil => simp at hit
  | cons x xs ih =>
    obtain ⟨prev,a,ma,b,mb,gate⟩ := valid
    have lift (w : Int) (hw : w ∈ project p m 1 :: xs) : w ∈ project p m 1 :: x :: xs := by
      rcases List.mem_cons.mp hw with eq|mem
      · exact List.mem_cons.mpr (Or.inl eq)
      · exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ mem)
    by_cases earlier : ∃ v ∈ xs, C v
    · obtain ⟨t,tc,u,⟨mu,nu⟩,v,⟨mv,nv⟩,ok⟩ := ih prev earlier
      exact ⟨t,tc,u,⟨lift _ mu,nu⟩,v,⟨lift _ mv,nv⟩,ok⟩
    · obtain ⟨t,mt,ht⟩ := hit
      have xC : C x := by
        rcases List.mem_cons.mp mt with eq|mem
        · simpa [eq] using ht
        · exact (earlier ⟨t,mem,ht⟩).elim
      have outside (w : Int) (hw : w ∈ project p m 1 :: xs) : ¬ C w := by
        rcases List.mem_cons.mp hw with eq|mem
        · simpa [eq] using source
        · exact fun h => earlier ⟨w,mem,h⟩
      exact ⟨x,xC,a,⟨lift _ ma,outside _ ma⟩,b,⟨lift _ mb,outside _ mb⟩,gate⟩

/-- Any genuine unbounded integer solution with r spare gates supplies a single
    list of at most r projected helpers that can break every nonempty target cut.
    The same list works for all cuts, including cuts with several targets. -/
theorem all_integer_cuts {p r : Nat} {T : List Nat} (hp : 0<p)
    (distinct : T.Nodup) (nontrivial : 1∉T) (fits : Fits unbounded T (T.length+r)) :
    let m := (2:Int)^p-1
    let labels := T.map (project p m)
    ∃ H : List Int, H.length ≤ r ∧ ∀ C : Int → Prop,
      (∃ x ∈ labels, C x) → ¬ C (project p m 1) →
      Cross p m C (fun x => (x = project p m 1 ∨ x ∈ labels ∨ x ∈ H) ∧ ¬ C x) := by
  classical
  dsimp only
  let m := (2:Int)^p-1
  let labels := T.map (project p m)
  obtain ⟨xs,valid,contains,_,small⟩ := surplus_projection hp distinct nontrivial fits
  refine ⟨xs.filter (fun x => x ∉ labels),small,?_⟩
  intro C hit source
  obtain ⟨v,hv,vC⟩ := hit
  obtain ⟨t,tC,a,⟨ma,na⟩,b,⟨mb,nb⟩,gate⟩ := first_entry C source xs valid ⟨v,contains hv,vC⟩
  have classify (x : Int) (h : x ∈ project p m 1 :: xs) :
      x = project p m 1 ∨ x ∈ labels ∨ x ∈ xs.filter (fun y => y ∉ labels) := by
    rcases List.mem_cons.mp h with eq|inxs
    · exact Or.inl eq
    · by_cases target : x ∈ labels
      · exact Or.inr (Or.inl target)
      · exact Or.inr (Or.inr (List.mem_filter.mpr ⟨inxs,by simpa using target⟩))
  exact ⟨t,tC,a,⟨classify _ ma,na⟩,b,⟨classify _ mb,nb⟩,gate⟩

def Mixed (p : Nat) (m u v : Int) (C : Int → Prop) : Prop :=
  ∃ t, C t ∧ (successor p m u v t ∨ successor p m v u t)

/-- With two helpers left, an eligible cut crossing uses the old parents and u,
    or the old parents and v, or u and v together. This includes repeated parents. -/
theorem two_helper_split {p : Nat} {m u v : Int} {C A : Int → Prop}
    (h : Cross p m C (fun x => A x ∨ x=u ∨ x=v)) :
    Cross p m C (fun x => A x ∨ x=u) ∨
    Cross p m C (fun x => A x ∨ x=v) ∨ Mixed p m u v C := by
  obtain ⟨t,ht,a,ha,b,hb,g⟩ := h
  rcases ha with ha|rfl|rfl <;> rcases hb with hb|rfl|rfl
  · exact Or.inl ⟨t,ht,_,Or.inl ha,_,Or.inl hb,g⟩
  · exact Or.inl ⟨t,ht,_,Or.inl ha,_,Or.inr rfl,g⟩
  · exact Or.inr (Or.inl ⟨t,ht,_,Or.inl ha,_,Or.inr rfl,g⟩)
  · exact Or.inl ⟨t,ht,_,Or.inr rfl,_,Or.inl hb,g⟩
  · exact Or.inl ⟨t,ht,_,Or.inr rfl,_,Or.inr rfl,g⟩
  · exact Or.inr (Or.inr ⟨t,ht,Or.inl g⟩)
  · exact Or.inr (Or.inl ⟨t,ht,_,Or.inr rfl,_,Or.inl hb,g⟩)
  · exact Or.inr (Or.inr ⟨t,ht,Or.inr g⟩)
  · exact Or.inr (Or.inl ⟨t,ht,_,Or.inr rfl,_,Or.inr rfl,g⟩)

theorem joint_crossing_required {p : Nat} {m u v : Int} {C A : Int → Prop}
    (ok : Cross p m C (fun x => A x ∨ x=u ∨ x=v))
    (noU : ¬ Cross p m C (fun x => A x ∨ x=u))
    (noV : ¬ Cross p m C (fun x => A x ∨ x=v)) : Mixed p m u v C := by
  rcases two_helper_split ok with h|h|h
  · exact (noU h).elim
  · exact (noV h).elim
  · exact h

#print axioms all_integer_cuts
#print axioms joint_crossing_required
end MCMCuts
