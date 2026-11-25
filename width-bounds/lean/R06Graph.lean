import McmAudit
namespace R06Graph
open MCM

/-- Keep the first occurrence in forward execution order; the source is already live. -/
def clean : List Nat → List Nat
  | [] => []
  | t::xs => if t ∈ 1::xs then clean xs else t :: clean xs

theorem clean_available (xs : List Nat) (t : Nat) :
    t ∈ 1::clean xs ↔ t ∈ 1::xs := by
  induction xs with
  | nil => rfl
  | cons a xs ih =>
    simp only [clean]
    split <;> rename_i h
    · constructor
      · intro m
        have := ih.mp m
        simp_all only [List.mem_cons]; grind
      · intro m
        apply ih.mpr
        simp_all only [List.mem_cons]; grind
    · simp only [List.mem_cons] at *
      grind

theorem clean_length (xs : List Nat) : (clean xs).length ≤ xs.length := by
  induction xs with
  | nil => simp [clean]
  | cons a xs ih => simp only [clean,List.length_cons];split <;> simp_all <;> omega

theorem clean_nodup (xs : List Nat) : (1::clean xs).Nodup := by
  induction xs with
  | nil => simp [clean]
  | cons a xs ih =>
    simp only [clean];split <;> rename_i h
    · exact ih
    · have hf : a ∉ 1::clean xs := fun m => h ((clean_available xs a).mp m)
      simp only [List.nodup_cons, List.mem_cons] at *
      grind

theorem clean_valid {cap : Nat → Prop} {xs : List Nat} (h : Valid cap xs) :
    Valid cap (clean xs) := by
  induction xs with
  | nil => trivial
  | cons t xs ih =>
    rcases h with ⟨hv, ho, hc, hg⟩
    simp only [clean]
    split
    · exact ih hv
    · obtain ⟨a,ha,b,hb,gate⟩ := (makes_iff _ _).mp hg
      exact ⟨ih hv,ho,hc,(makes_iff _ _).mpr
        ⟨a,(clean_available xs a).mpr ha,b,(clean_available xs b).mpr hb,gate⟩⟩

theorem card_le {α : Type} [DecidableEq α] (xs ys : List α) (nd : xs.Nodup)
    (sub : xs ⊆ ys) : xs.length ≤ ys.length := by
  induction xs generalizing ys with
  | nil => simp
  | cons a as ih =>
    obtain ⟨fresh,tail_nd⟩ := List.nodup_cons.mp nd
    have ha : a ∈ ys := sub (by simp)
    have tail : as ⊆ ys.erase a := by
      intro b hb
      have ne : b ≠ a := by intro h; subst b; exact fresh hb
      exact (List.mem_erase_of_ne ne).mpr (sub (List.mem_cons_of_mem _ hb))
    have bound := ih (ys.erase a) tail_nd tail
    have hlen := List.length_erase_of_mem ha
    cases ys with
    | nil => simp at ha
    | cons b bs => simp_all only [List.length_cons]; omega

private theorem split_length (T xs : List Nat) :
    (xs.filter (· ∈ T)).length + (xs.filter (· ∉ T)).length = xs.length := by
  induction xs with
  | nil => simp
  | cons a xs ih => by_cases h : a∈T <;> simp [h,List.filter_cons, decide_not] at * <;> omega

/-- Extract a duplicate-free original gate schedule and bound the actual number
of non-target gates, for arbitrary target count, surplus and cap. -/
theorem extract {T : List Nat} {r : Nat} {cap : Nat → Prop}
    (nd : T.Nodup) (nontrivial : 1 ∉ T) (h : Fits cap T (T.length+r)) :
    ∃ ys, Valid cap ys ∧ (1::ys).Nodup ∧ T ⊆ ys ∧ ys.length ≤ T.length+r ∧
      (ys.filter (· ∉ T)).length ≤ r := by
  obtain ⟨xs,hlen,hv,covers⟩ := h
  let ys := clean xs
  have cover : T ⊆ ys := by
    intro t ht
    have available := (clean_available xs t).mpr (covers _ ht)
    rcases List.mem_cons.mp available with h|h
    · subst t; exact (nontrivial ht).elim
    · exact h
  have length := Nat.le_trans (clean_length xs) hlen
  have sub : T ⊆ ys.filter (· ∈ T) := by
    intro t ht
    exact List.mem_filter.mpr ⟨cover ht,by simpa using ht⟩
  have cnt := card_le _ _ nd sub
  have partition := split_length T ys
  exact ⟨ys,clean_valid hv,clean_nodup xs,cover,length,by change ys.length ≤ _ at length; omega⟩
/-- If an emitted label leaves a granted set then some actual gate
with both parents in the granted set crosses its boundary. -/
theorem escape {xs S : List Nat} {cap : Nat → Prop} (valid : Valid cap xs)
    (source : 1∈S) (outside : ¬xs ⊆ S) :
    ∃ t∈xs, t∉S ∧ ∃ a∈S, ∃ b∈S, Gate a b t := by
  induction xs with
  | nil => exact (outside (by simp)).elim
  | cons t xs ih =>
    by_cases prev : xs⊆S
    · have nt : t∉S := fun ht => outside (List.cons_subset.mpr ⟨ht,prev⟩)
      obtain ⟨a,ha,b,hb,g⟩ := (makes_iff ..).mp valid.2.2.2
      have inside {z : Nat} (m : z∈1::xs) : z∈S := (List.mem_cons.mp m).elim (fun eq => eq ▸ source) (fun x => prev x)
      exact ⟨t,List.mem_cons_self,nt,a,inside ha,b,inside hb,g⟩
    · obtain ⟨y,m,rest⟩ := ih valid.1 prev
      exact ⟨y,List.mem_cons_of_mem _ m,rest⟩

end R06Graph
#print axioms R06Graph.extract
