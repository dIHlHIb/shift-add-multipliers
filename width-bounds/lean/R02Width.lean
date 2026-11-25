import R02Arithmetic
import R06Graph
namespace R02Width
open MCM R02Arithmetic

private theorem available_odd {xs : List Nat} {cap : Nat → Prop} (ok : Valid cap xs)
    (v : Nat) (m : v∈1::xs) : v%2=1 := by
  induction xs with
  | nil => simp only [List.mem_singleton] at m; omega
  | cons t xs ih =>
    by_cases eq : v=t
    · exact eq ▸ ok.2.1
    · exact ih ok.1 (by simp only [List.mem_cons] at m ⊢; grind)

private theorem parents {xs : List Nat} {cap : Nat → Prop} (ok : Valid cap xs)
    (nd : xs.Nodup) (h : Nat) (mh : h∈xs) :
    ∃ a∈1::xs, ∃ b∈1::xs, a≠h ∧ b≠h ∧ Gate a b h ∨ h=1 := by
  induction xs with
  | nil => simp at mh
  | cons t xs ih =>
    have ⟨fresh,nt⟩ := List.nodup_cons.mp nd
    have grow {z} (m : z∈1::xs) : z∈1::t::xs := by simp only [List.mem_cons] at *; grind
    rcases List.mem_cons.mp mh with eq|mh
    · subst t
      obtain ⟨a,ma,b,mb,g⟩ := (makes_iff ..).mp ok.2.2.2
      refine ⟨a,grow ma,b,grow mb,?_⟩
      by_cases source : h=1
      · exact Or.inr source
      · exact Or.inl ⟨by intro e; subst a; rcases List.mem_cons.mp ma with e|e <;> contradiction,
          by intro e; subst b; rcases List.mem_cons.mp mb with e|e <;> contradiction,g⟩
    · obtain ⟨a,ma,b,mb,w⟩ := ih ok.1 nt mh
      exact ⟨a,grow ma,b,grow mb,w⟩

private def UniqueForeign (T xs : List Nat) :=
  ∀ a∈xs, ∀ b∈xs, a∉T → b∉T → a=b

private theorem unique_of_count {T xs : List Nat} (h : (xs.filter (· ∉ T)).length≤1) :
    UniqueForeign T xs := by
  intro a ha b hb fa fb
  let H := xs.filter (· ∉ T)
  have ma : a∈H := List.mem_filter.mpr ⟨ha,by simpa using fa⟩
  have mb : b∈H := List.mem_filter.mpr ⟨hb,by simpa using fb⟩
  change H.length≤1 at h
  cases eqH : H with
  | nil => simp [eqH] at ma
  | cons z zs =>
    rw [eqH] at h ma mb
    have zz : zs=[] := List.length_eq_zero_iff.mp (by simp only [List.length_cons] at h; omega)
    simp_all

private theorem parent_bound {T xs : List Nat} {v h c w : Nat}
    (valid : Valid unbounded xs) (nd : (1::v::xs).Nodup) (uniq : UniqueForeign T (v::xs))
    (mw : ∀ a∈1::T, a≤2^w-1) (mh : h∈1::xs) (mc : c∈1::xs)
    (ht : 2^w-1<h) (ov : v%2=1) (use : Gate h c v) : h<2^(2*w) := by
  have one := mw _ List.mem_cons_self
  have notsource : h≠1 := by omega
  have hm : h∈xs := (List.mem_cons.mp mh).resolve_left notsource
  have hn : h∉T := fun m => (Nat.not_le_of_lt ht) (mw _ (List.mem_cons_of_mem _ m))
  have ⟨fresh,nxs⟩ := List.nodup_cons.mp (List.nodup_cons.mp nd).2
  have diff : v≠h := fun e => fresh (e ▸ hm)
  have foreign (z) (mz : z∈1::v::xs) (dif : z≠h) : z≤2^w-1 := by
    rcases List.mem_cons.mp mz with rfl|mz
    · exact one
    · by_cases tz : z∈T
      · exact mw _ (List.mem_cons_of_mem _ tz)
      · exact (dif (uniq z mz h (List.mem_cons_of_mem _ hm) tz hn)).elim
  have inprev {a} (m : a∈1::xs) : a∈1::v::xs := by simp only [List.mem_cons] at *; grind
  have vt := foreign v (by simp) diff
  by_cases same : c=h
  · subst c
    have := repeated (available_odd valid h mh) ov use
    omega
  · obtain ⟨a,ma,b,mb,ab⟩ := parents valid nxs h hm
    rcases ab with ⟨na,nb,birth⟩|impossible
    · have vf : v≠1 := by intro z; subst v; simpa using (List.nodup_cons.mp nd).1
      have prior (z) (mem : z∈1::xs) : v≠z := by
        intro eq; subst z; exact (List.mem_cons.mp mem).elim vf fresh
      exact two_relations (foreign _ (inprev ma) na) (foreign _ (inprev mb) nb)
        (foreign _ (inprev mc) same) vt (available_odd valid _ ma) (available_odd valid _ mb)
        (available_odd valid _ mc) ov (prior _ ma) (prior _ mb) ht birth ((gate_cycle ..).mp use)
    · contradiction

private theorem trim_valid {T xs : List Nat} {w : Nat}
    (mw : ∀ a∈1::T,a≤2^w-1) (valid : Valid unbounded xs) (nd : (1::xs).Nodup)
    (uniq : UniqueForeign T xs) :
    Valid (fun x => x<2^(2*w)) (xs.filter (· < 2^(2*w))) := by
  induction xs with
  | nil => trivial
  | cons v xs ih =>
    have one := mw _ List.mem_cons_self
    have small : 2^w≤2^(2*w) := Nat.pow_le_pow_right (by decide) (by omega)
    have drop : (1::xs).Nodup :=
      List.nodup_cons.mpr ⟨fun m => (List.nodup_cons.mp nd).1 (List.mem_cons_of_mem _ m),
        (List.nodup_cons.mp (List.nodup_cons.mp nd).2).2⟩
    have uq : UniqueForeign T xs := fun a ma b mb => uniq _ (List.mem_cons_of_mem _ ma) _ (List.mem_cons_of_mem _ mb)
    have previous := ih valid.1 drop uq
    by_cases keep : v<2^(2*w)
    · simp only [List.filter_cons,decide_eq_true keep,if_true]
      obtain ⟨a,ma,b,mb,gate⟩ := (makes_iff ..).mp valid.2.2.2
      have lift (h c) (mh : h∈1::xs) (mc : c∈1::xs) (g : Gate h c v) :
          h∈1::(xs.filter (· < 2^(2*w))) := by
        have bound : h<2^(2*w) := by
          by_cases wide : 2^w-1<h
          · exact parent_bound valid.1 nd uniq mw mh mc wide valid.2.1 g
          · omega
        rcases List.mem_cons.mp mh with eq|hm
        · exact List.mem_cons.mpr (Or.inl eq)
        · exact List.mem_cons_of_mem _ (List.mem_filter.mpr ⟨hm,decide_eq_true bound⟩)
      exact ⟨previous,valid.2.1,keep,(makes_iff ..).mpr
        ⟨a,lift _ _ ma mb gate,b,lift _ _ mb ma ((gate_swap ..).mp gate),gate⟩⟩
    · simpa [List.filter_cons,keep] using previous

/-- The sharp-width clause of Theorem 1, including empty targets and width zero. -/
theorem twice_width {T : List Nat} {w : Nat} (distinct : T.Nodup) (nontrivial : 1∉T)
    (width : ∀ t∈T,t<2^w) (fit : Fits unbounded T (T.length+1)) :
    Fits (fun v => v<2^(2*w)) T (T.length+1) := by
  obtain ⟨xs,valid,nd,sub,len,h⟩ := R06Graph.extract distinct nontrivial fit
  by_cases wz : w=0
  · subst w
    have empty : T=[] := by
      cases T with
      | nil => rfl
      | cons a ts =>
        have ma := sub (List.mem_cons_self (a:=a))
        have small := width a List.mem_cons_self
        have odd := available_odd valid a (List.mem_cons_of_mem _ ma)
        simp at small; omega
    subst T; exact ⟨[],by simp,trivial,by simp⟩
  · have wm : ∀ a∈1::T,a≤2^w-1 := by
      intro a ha
      rcases List.mem_cons.mp ha with rfl|ha
      · have := Nat.one_lt_two_pow wz; omega
      · have := width a ha; omega
    refine ⟨xs.filter (· <2^(2*w)), Nat.le_trans (List.length_filter_le ..) len,
      trim_valid wm valid nd (unique_of_count h),?_⟩
    intro t ht
    apply List.mem_cons_of_mem
    exact List.mem_filter.mpr ⟨sub ht,decide_eq_true (Nat.lt_of_lt_of_le (width t ht)
      (Nat.pow_le_pow_right (by decide) (by omega)))⟩

end R02Width
#print axioms R02Width.twice_width
