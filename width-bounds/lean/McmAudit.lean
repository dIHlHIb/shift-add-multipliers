import Std
namespace MCM
def logFuel : Nat → Nat → Nat
  | 0,_ => 0
  | k+1,n => if n≥2 then logFuel k (n/2)+1 else 0
theorem logFuel_spec (f n : Nat) (h : n≤f) : logFuel f n = n.log2 := by
  induction f generalizing n with
  | zero => have : n=0 := by omega
            subst n; simp [logFuel, Nat.log2.eq_def]
  | succ k ih =>
    rw [Nat.log2.eq_def n]; simp only [logFuel]
    split <;> rename_i hsmall
    · rw [ih]; omega
    · rfl
def PowerTimes (n z : Nat) : Prop :=
  0 < z ∧ 0 < (logFuel (n/z) (n/z)) ∧ 2^(logFuel (n/z) (n/z)) * z = n
instance (n z : Nat) : Decidable (PowerTimes n z) := by unfold PowerTimes; infer_instance
theorem powerTimes_iff (n z : Nat) : PowerTimes n z ↔
    0 < z ∧ ∃ j : Nat, 0 < j ∧ n = 2^j*z := by
  unfold PowerTimes
  rw [logFuel_spec _ _ (Nat.le_refl _)]
  constructor
  · rintro ⟨hz,hj,h⟩
    exact ⟨hz,_,hj,h.symm⟩
  · rintro ⟨hz,j,hj,rfl⟩
    simp [PowerTimes, Nat.mul_div_cancel _ hz,Nat.log2_two_pow,hj,hz]
def Oriented (a b z : Nat) : Prop :=
  PowerTimes (a+b) z ∨ PowerTimes (a-b) z ∨ PowerTimes (b-a) z
instance (a b z : Nat) : Decidable (Oriented a b z) := by unfold Oriented; infer_instance
def Gate (a b t : Nat) : Prop :=
  Oriented a b t ∨ Oriented a t b ∨ Oriented b t a
instance (a b t : Nat) : Decidable (Gate a b t) := by unfold Gate; infer_instance
theorem oriented_comm (a b z : Nat) : Oriented a b z ↔ Oriented b a z := by
  simp only [Oriented,Nat.add_comm a b]
  simp only [or_comm,or_assoc,or_left_comm]
theorem gate_swap (a b t : Nat) : Gate a b t ↔ Gate b a t := by
  unfold Gate
  rw [oriented_comm a b t]
  simp only [or_comm,or_assoc,or_left_comm]
theorem gate_cycle (a b t : Nat) : Gate a b t ↔ Gate b t a := by
  unfold Gate
  rw [oriented_comm b a t,oriented_comm t a b]
  simp only [or_comm,or_assoc,or_left_comm]
def makes (xs : List Nat) (t : Nat) : Bool :=
  (1::xs).any fun a => (1::xs).any fun b => decide (Gate a b t)
theorem makes_iff (xs : List Nat) (t : Nat) : makes xs t = true ↔
    ∃ a ∈ 1::xs, ∃ b ∈ 1::xs, Gate a b t := by simp [makes,List.any_eq_true]
-- Newest gate is at the head. Parents can coincide. A target can be a parent.
def Valid (cap : Nat → Prop) : List Nat → Prop
  | [] => True
  | t::xs => Valid cap xs ∧ t%2=1 ∧ cap t ∧ makes xs t = true
def Fits (cap : Nat → Prop) (T : List Nat) (budget : Nat) : Prop :=
  ∃ xs : List Nat, xs.length ≤ budget ∧ Valid cap xs ∧ ∀ t ∈ T, t ∈ 1::xs
def unbounded (_ : Nat) : Prop := True
def fits9 (h : Nat) : Prop := h < 512
def testcase : List Nat := [385,497]
theorem r01_wide_graph : Fits unbounded testcase 3 := by
  refine ⟨[497,385,513],by decide,?_,?_⟩
  · simp only [Valid,unbounded,fits9]; decide +kernel
  · simp [testcase]
theorem r01_bounded_graph : Fits fits9 testcase 4 := by
  refine ⟨[497,385,31,3],by decide,?_,?_⟩
  · simp only [Valid,unbounded,fits9]; decide +kernel
  · simp [testcase]
def possibleTwo (h p q : Nat) : Bool :=
  makes [] h && ((makes [h] p && makes [p,h] q) || (makes [h] q && makes [q,h] p))
theorem cannot_first_p : makes [] 385 = false := by decide +kernel
theorem cannot_first_q : makes [] 497 = false := by decide +kernel
-- Small adjacent intervals allow kernel replay with a bounded unfolding budget.
private theorem interval0 : (List.range' 0 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval16 : (List.range' 16 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval32 : (List.range' 32 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval48 : (List.range' 48 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval64 : (List.range' 64 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval80 : (List.range' 80 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval96 : (List.range' 96 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval112 : (List.range' 112 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval128 : (List.range' 128 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval144 : (List.range' 144 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval160 : (List.range' 160 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval176 : (List.range' 176 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval192 : (List.range' 192 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval208 : (List.range' 208 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval224 : (List.range' 224 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval240 : (List.range' 240 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval256 : (List.range' 256 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval272 : (List.range' 272 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval288 : (List.range' 288 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval304 : (List.range' 304 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval320 : (List.range' 320 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval336 : (List.range' 336 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval352 : (List.range' 352 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval368 : (List.range' 368 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval384 : (List.range' 384 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval400 : (List.range' 400 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval416 : (List.range' 416 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval432 : (List.range' 432 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval448 : (List.range' 448 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval464 : (List.range' 464 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval480 : (List.range' 480 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem interval496 : (List.range' 496 16).all (fun h => !(possibleTwo h 385 497)) = true := by decide +kernel
private theorem at_interval (h k : Nat) (lo : k≤h) (hi : h<k+16)
  (proof : (List.range' k 16).all (fun v => !(possibleTwo v 385 497)) = true) : possibleTwo h 385 497=false := by
  simpa using (List.all_eq_true.mp proof h (List.mem_range'_1.mpr ⟨lo,hi⟩))
theorem no_small (h : Nat) (hh : h<512) : possibleTwo h 385 497=false := by
  by_cases b0 : h<16
  · exact at_interval _ 0 (by omega) (by omega) interval0
  by_cases b16 : h<32
  · exact at_interval _ 16 (by omega) (by omega) interval16
  by_cases b32 : h<48
  · exact at_interval _ 32 (by omega) (by omega) interval32
  by_cases b48 : h<64
  · exact at_interval _ 48 (by omega) (by omega) interval48
  by_cases b64 : h<80
  · exact at_interval _ 64 (by omega) (by omega) interval64
  by_cases b80 : h<96
  · exact at_interval _ 80 (by omega) (by omega) interval80
  by_cases b96 : h<112
  · exact at_interval _ 96 (by omega) (by omega) interval96
  by_cases b112 : h<128
  · exact at_interval _ 112 (by omega) (by omega) interval112
  by_cases b128 : h<144
  · exact at_interval _ 128 (by omega) (by omega) interval128
  by_cases b144 : h<160
  · exact at_interval _ 144 (by omega) (by omega) interval144
  by_cases b160 : h<176
  · exact at_interval _ 160 (by omega) (by omega) interval160
  by_cases b176 : h<192
  · exact at_interval _ 176 (by omega) (by omega) interval176
  by_cases b192 : h<208
  · exact at_interval _ 192 (by omega) (by omega) interval192
  by_cases b208 : h<224
  · exact at_interval _ 208 (by omega) (by omega) interval208
  by_cases b224 : h<240
  · exact at_interval _ 224 (by omega) (by omega) interval224
  by_cases b240 : h<256
  · exact at_interval _ 240 (by omega) (by omega) interval240
  by_cases b256 : h<272
  · exact at_interval _ 256 (by omega) (by omega) interval256
  by_cases b272 : h<288
  · exact at_interval _ 272 (by omega) (by omega) interval272
  by_cases b288 : h<304
  · exact at_interval _ 288 (by omega) (by omega) interval288
  by_cases b304 : h<320
  · exact at_interval _ 304 (by omega) (by omega) interval304
  by_cases b320 : h<336
  · exact at_interval _ 320 (by omega) (by omega) interval320
  by_cases b336 : h<352
  · exact at_interval _ 336 (by omega) (by omega) interval336
  by_cases b352 : h<368
  · exact at_interval _ 352 (by omega) (by omega) interval352
  by_cases b368 : h<384
  · exact at_interval _ 368 (by omega) (by omega) interval368
  by_cases b384 : h<400
  · exact at_interval _ 384 (by omega) (by omega) interval384
  by_cases b400 : h<416
  · exact at_interval _ 400 (by omega) (by omega) interval400
  by_cases b416 : h<432
  · exact at_interval _ 416 (by omega) (by omega) interval416
  by_cases b432 : h<448
  · exact at_interval _ 432 (by omega) (by omega) interval432
  by_cases b448 : h<464
  · exact at_interval _ 448 (by omega) (by omega) interval448
  by_cases b464 : h<480
  · exact at_interval _ 464 (by omega) (by omega) interval464
  by_cases b480 : h<496
  · exact at_interval _ 480 (by omega) (by omega) interval480
  exact at_interval _ 496 (by omega) hh interval496
theorem shape {cap : Nat → Prop} {xs : List Nat} (hv : Valid cap xs)
    (hp : 385 ∈ 1::xs) (hq : 497 ∈ 1::xs) (hl : xs.length≤3) :
    ∃ h, cap h ∧ possibleTwo h 385 497=true ∧ xs.length=3 := by
  cases xs with
  | nil => simp at hp
  | cons v xs =>
    cases xs with
    | nil => simp at hp hq; omega
    | cons u xs =>
      cases xs with
      | nil =>
        simp [Valid] at hv
        simp at hp hq
        rcases hp with h|h <;> rcases hq with f|f <;> subst_vars <;>
          simp_all [cannot_first_p,cannot_first_q]
      | cons h tail =>
        have hn : tail=[] := by
          cases tail <;> simp_all
        subst tail
        simp only [Valid] at hv
        obtain ⟨⟨⟨_,_,hc,hf⟩,_,_,hu⟩,_,_,hh⟩ := hv
        simp at hp hq
        refine ⟨h,hc,?_,rfl⟩
        rcases hp with H|H|H <;> rcases hq with F|F|F <;> subst_vars <;>
          simp_all [possibleTwo,cannot_first_p,cannot_first_q]
theorem r01_unbounded_lower : ¬ Fits unbounded testcase 2 := by
  rintro ⟨xs,hl,hv,ht⟩
  obtain ⟨_,_,_,hh⟩ := shape hv (ht 385 (by simp [testcase])) (ht 497 (by simp [testcase])) (by omega)
  omega
theorem r01_bounded_lower : ¬ Fits fits9 testcase 3 := by
  rintro ⟨xs,hl,hv,ht⟩
  obtain ⟨h,hc,hp,_⟩ := shape hv (ht 385 (by simp [testcase])) (ht 497 (by simp [testcase])) hl
  rw [no_small h hc] at hp
  contradiction
end MCM
#print axioms MCM.r01_unbounded_lower
#print axioms MCM.r01_bounded_lower
#print axioms MCM.r01_wide_graph
#print axioms MCM.r01_bounded_graph

