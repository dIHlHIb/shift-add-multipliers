import McmAudit

namespace MCMResidues
open MCM

/-- Reduce even very large shifts to the declared period, without a size restriction on z. -/
theorem scale_period {p m : Nat} (hp : 0 < p) (cycle : 2^p % m = 1 % m) (j z : Nat) :
    (2^j*z)%m = (2^(j%p)*z)%m := by
  have loop (k : Nat) : (2^(k+p)*z)%m=(2^k*z)%m := by
    calc
      _ = (2^p*(2^k*z))%m := by rw [Nat.pow_add]; ac_rfl
      _ = ((2^p%m)*(2^k*z))%m := (Nat.mod_mul_mod ..).symm
      _ = (2^k*z)%m := by rw [cycle]; simp
  induction j using Nat.strongRecOn with
  | ind j ih =>
    by_cases small : j<p
    · rw [Nat.mod_eq_of_lt small]
    · let k := j-p
      have eq : j=k+p := by dsimp [k]; omega
      have lt : k<j := by omega
      calc
        _ = (2^(k+p)*z)%m := by rw [←eq]
        _ = (2^k*z)%m := loop k
        _ = (2^(k%p)*z)%m := ih k lt
        _ = (2^(j%p)*z)%m := by rw [eq,Nat.add_mod_right]

def orientedMod (p m x y z : Nat) : Prop :=
  ∃ k < p, (x+y)%m=(2^k*z)%m ∨
    x%m=(y+2^k*z)%m ∨ y%m=(x+2^k*z)%m

def gateMod (p m a b t : Nat) : Prop :=
  orientedMod p m a b t ∨ orientedMod p m a t b ∨ orientedMod p m b t a

private theorem oriented_image {p m x y z : Nat} (hp : 0<p) (cycle : 2^p%m=1%m)
    (h : Oriented x y z) : orientedMod p m (x%m) (y%m) (z%m) := by
  have scaled (j : Nat) : (2^(j%p)*(z%m))%m=(2^j*z)%m := by
    rw [Nat.mul_mod_mod]; exact (scale_period hp cycle j z).symm
  have addscaled (a j : Nat) : (a%m+2^(j%p)*(z%m))%m=(a+2^j*z)%m := by
    rw [Nat.mod_add_mod, Nat.add_mod a (2^(j%p)*(z%m)) m, scaled,
      ←Nat.add_mod]
  rcases h with h|h|h
  · obtain ⟨_,j,_,eq⟩ := (powerTimes_iff ..).mp h
    exact ⟨j%p,Nat.mod_lt _ hp,Or.inl (by rw [Nat.add_mod_mod,Nat.mod_add_mod,scaled,eq])⟩
  · obtain ⟨pos,j,_,eq⟩ := (powerTimes_iff ..).mp h
    have positive : 0<2^j*z := Nat.mul_pos (Nat.two_pow_pos j) pos
    have full : x=y+2^j*z := by omega
    exact ⟨j%p,Nat.mod_lt _ hp,Or.inr (Or.inl (by rw [Nat.mod_mod,addscaled,full]))⟩
  · obtain ⟨pos,j,_,eq⟩ := (powerTimes_iff ..).mp h
    have positive : 0<2^j*z := Nat.mul_pos (Nat.two_pow_pos j) pos
    have full : y=x+2^j*z := by omega
    exact ⟨j%p,Nat.mod_lt _ hp,Or.inr (Or.inr (by rw [Nat.mod_mod,addscaled,full]))⟩

theorem gate_image {p m a b t : Nat} (hp : 0<p) (cycle : 2^p%m=1%m)
    (h : Gate a b t) : gateMod p m (a%m) (b%m) (t%m) := by
  rcases h with h|h|h
  · exact Or.inl (oriented_image hp cycle h)
  · exact Or.inr (Or.inl (oriented_image hp cycle h))
  · exact Or.inr (Or.inr (oriented_image hp cycle h))

def validMod (p m : Nat) : List Nat → Prop
  | [] => True
  | t::xs => validMod p m xs ∧ t<m ∧
    ∃ a ∈ (1%m)::xs, ∃ b ∈ (1%m)::xs, gateMod p m a b t

def fitsMod (p m : Nat) (T : List Nat) (budget : Nat) : Prop :=
  ∃ xs : List Nat, xs.length≤budget ∧ validMod p m xs ∧ ∀ t∈T, t ∈ (1%m)::xs

private theorem in_image {x m : Nat} {xs : List Nat} (h : x∈1::xs) :
    x%m ∈ (1%m)::xs.map (·%m) := by
  change x%m ∈ (1::xs).map (fun n => n%m)
  exact List.mem_map.mpr ⟨x,h,rfl⟩

theorem valid_image {p m : Nat} {cap : Nat→Prop} (hp : 0<p) (hm : 0<m)
    (cycle : 2^p%m=1%m) (xs : List Nat) (h : Valid cap xs) :
    validMod p m (xs.map (·%m)) := by
  induction xs with
  | nil => trivial
  | cons t xs ih =>
    obtain ⟨hv,_,_,mk⟩ := h
    obtain ⟨a,ha,b,hb,gate⟩ := (makes_iff ..).mp mk
    exact ⟨ih hv,Nat.mod_lt _ hm,a%m,in_image ha,b%m,in_image hb,gate_image hp cycle gate⟩

theorem fits_image {p m budget : Nat} {T : List Nat} (hp : 0<p) (hm : 0<m)
    (cycle : 2^p%m=1%m) (h : Fits unbounded T budget) :
    fitsMod p m (T.map (·%m)) budget := by
  obtain ⟨xs,len,v,cover⟩ := h
  refine ⟨xs.map (·%m),by simpa using len,valid_image hp hm cycle xs v,?_⟩
  intro t ht
  obtain ⟨u,hu,rfl⟩ := List.mem_map.mp ht
  exact in_image (cover u hu)

theorem mersenne_exclusion {p budget : Nat} {T : List Nat} (hp : 1<p)
    (absent : ¬ fitsMod p (2^p-1) (T.map (·%(2^p-1))) budget) :
    ¬ Fits unbounded T budget := by
  have big : 2^2 ≤ 2^p := Nat.pow_le_pow_right (by decide) hp
  have pos : 0<2^p-1 := by omega
  have eq : 2^p = 1+(2^p-1) := by omega
  have cycle : 2^p%(2^p-1)=1%(2^p-1) := by
    calc
      _ = (1+(2^p-1))%(2^p-1) := congrArg (fun x => x%(2^p-1)) eq
      _ = _ := Nat.add_mod_right ..
  exact fun h => absent (fits_image (by omega) pos cycle h)

#print axioms gate_image
#print axioms mersenne_exclusion
end MCMResidues
