import AllWidths
import R02Width

namespace MCMWidthEnvelope
open MCM

/-- Distinct non-source targets whose largest value has bit length exactly w.
    Feasibility below supplies oddness of every target in the normalized model. -/
def AtWidth (T : List Nat) (w : Nat) : Prop :=
  T.Nodup ∧ 1∉T ∧ (∀ t∈T, t<2^w) ∧ ∃ t∈T, 2^(w-1)≤t

def Realizable (T : List Nat) (b : Nat) : Prop :=
  Fits (fun v => v<2^b) T (T.length+1)

def Sufficient (w b : Nat) : Prop :=
  ∀ T, AtWidth T w → Fits unbounded T (T.length+1) → Realizable T b

private theorem changeCap {p q : Nat → Prop} (le : ∀ v, p v → q v)
    {T n} (h : Fits p T n) : Fits q T n := by
  have convert (xs : List Nat) (v : Valid p xs) : Valid q xs := by
    induction xs with
    | nil => trivial
    | cons t xs ih => exact ⟨ih v.1,v.2.1,le t v.2.2.1,v.2.2.2⟩
  obtain ⟨xs,len,valid,cover⟩ := h
  exact ⟨xs,len,convert xs valid,cover⟩

private theorem widen {T a b} (le : a≤b) (h : Realizable T a) : Realizable T b :=
  changeCap (fun _ v => Nat.lt_of_lt_of_le v (Nat.pow_le_pow_right (by decide) le)) h

theorem twice (w : Nat) : Sufficient w (2*w) := by
  intro T shape fit
  exact R02Width.twice_width shape.1 shape.2.1 shape.2.2.1 fit

private theorem least {p : Nat → Prop} (n : Nat) (hn : p n) :
    ∃ d, p d ∧ ∀ c, p c → d≤c := by
  classical
  induction n using Nat.strongRecOn with
  | ind n ih =>
    by_cases smaller : ∃ j, j<n ∧ p j
    · obtain ⟨j,hj,hp⟩ := smaller
      exact ih j hj hp
    · refine ⟨n,hn,?_⟩
      intro j hj
      apply Classical.byContradiction
      intro h
      exact smaller ⟨j,by omega,hj⟩

private theorem existsWorst (w : Nat) :
    ∃ b, Sufficient w b ∧ ∀ c, Sufficient w c → b≤c :=
  least (2*w) (twice w)

/-- The least coefficient width sufficient for every feasible input at width w. -/
noncomputable def W (w : Nat) : Nat := Classical.choose (existsWorst w)

theorem spec (w : Nat) : Sufficient w (W w) ∧ ∀ c, Sufficient w c → W w≤c :=
  Classical.choose_spec (existsWorst w)

theorem sharp (w : Nat) (hw : 16≤w) : 2*w-9≤W w ∧ W w≤2*w := by
  let k:=w-9
  have wk : k+9=w := by dsimp [k]; omega
  have all:=MCMWidthFinal.all_widths k (by dsimp [k]; omega)
  unfold MCMWidthAll.familyExact at all
  simp only [wk] at all
  obtain ⟨len,nd,hi,lo,_,yes,no⟩:=all
  let T:=R02NearFamily.targets k
  have shape : AtWidth T w := ⟨nd,(R02NearFamily.target_shape k).2.1,hi,lo⟩
  have fit : Fits unbounded T (T.length+1) := by
    change Fits unbounded (R02NearFamily.targets k) ((R02NearFamily.targets k).length+1)
    rw [len]
    exact changeCap (fun _ _ => trivial) yes
  refine ⟨?_,(spec w).2 _ (twice w)⟩
  apply Classical.byContradiction
  intro small
  have impossible:=widen (show W w≤2*w-10 by omega) ((spec w).1 T shape fit)
  unfold Realizable T at impossible
  rw [len] at impossible
  exact no impossible

/-- For these nonempty width classes the uniform threshold is a maximum of
    instance minima, attained by an actual target list. -/
theorem attained (w : Nat) (hw : 16≤w) :
    ∃ T, AtWidth T w ∧ Fits unbounded T (T.length+1) ∧ Realizable T (W w) ∧
         ∀ c, Realizable T c → W w≤c := by
  classical
  have pos : 0<W w := by have h:=(sharp w hw).1; omega
  have failed : ¬Sufficient w (W w-1) := by
    intro h
    have bound:=(spec w).2 _ h
    omega
  unfold Sufficient at failed
  simp only [Classical.not_forall, Classical.not_imp] at failed
  obtain ⟨T,shape,fit,unable⟩:=failed
  refine ⟨T,shape,fit,(spec w).1 T shape fit,?_⟩
  intro c hc
  apply Classical.byContradiction
  intro h
  exact unable (widen (by omega) hc)

end MCMWidthEnvelope
#print axioms MCMWidthEnvelope.sharp
#print axioms MCMWidthEnvelope.attained
