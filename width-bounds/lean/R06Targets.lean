import R06System
namespace R06Targets
open R06Expansion R06Paths R06Trace R06System McmSmall R06Transport

def tag (s : Slot) (neg : Bool) (t : Path) : Term := ⟨⟨signed neg t.c,t.mask⟩,s⟩

def terms (e : TargetEq) : List Term :=
  ⟨⟨-(e.t:Int),fun _ => 0⟩,.base⟩ ::
    ((paths e.a).map (tag .left e.negA) ++ (paths e.b).map (tag .right e.negB))

private theorem signed_times (s : Bool) (a b : Int) : signed s a*b=signed s (a*b) := by
  cases s <;> simp [signed,Int.neg_mul]

private theorem tag_sum (s : Slot) (neg : Bool) (as : List Path) (n x p q z) :
    sigma (fun t : Term => t.c*power (z+exponent n x p q t)) (as.map (tag s neg)) =
      signed neg (sigma (pathval n x (z+potential p q s)) as) := by
  rw [sigma_map,←sigma_signed]
  apply sigma_ext
  intro a _
  simp only [tag,exponent,signed_times,pathval]
  rw [show z+(dot n a.mask x+potential p q s)=z+potential p q s+dot n a.mask x by omega]

theorem flatten {e : TargetEq} {T h} (hs : e.ScopedAt T h) (n) (hn : 2*h≤n) (x p q) :
    Equation x e.negA e.negB e.a e.b p q e.t ↔
      AtZero (terms e) (fun t => t.c) (exponent n x p q) := by
  have atScale (z : Int) : sigma (fun t : Term => t.c*power (z+exponent n x p q t)) (terms e) =
        -(e.t:Int)*power z + branch x e.negA e.negB e.a e.b p q z := by
    rw [terms,sigma,sigma_append,tag_sum,tag_sum]
    simp only [exponent,dot_zero,potential,
      Int.add_zero,expand hs.2.1 n hn,expand hs.2.2 n hn,branch]
  constructor
  · rintro ⟨K,ok⟩
    exact ⟨K,fun z hz => by rw [atScale,ok z hz]; simp only [power,Int.neg_mul]; omega⟩
  · rintro ⟨K,ok⟩
    refine ⟨K,fun z hz => ?_⟩
    have eq := ok z hz
    rw [atScale,Int.neg_mul] at eq
    unfold power at eq
    omega

private theorem tag_mass (slot neg) (ps : List Path) :
    mass (fun t : Term => t.c) (ps.map (tag slot neg))=mass Path.c ps := by
  rw [mass_map]
  induction ps with
  | nil => rfl
  | cons a xs ih => cases neg <;> simp_all [mass,tag,signed]

private theorem mass_cap {e : TargetEq} {T h w} (hs : e.ScopedAt T h)
    (cap : ∀ t∈1::T, t≤2^w) : mass (fun t => t.c) (terms e) ≤ 2^((h+2)*(w+1)) := by
  rw [terms,mass,mass_append,tag_mass,tag_mass]
  simp only [Int.natAbs_neg,Int.natAbs_ofNat]
  have a := mass_bound hs.2.1 w cap
  have b := mass_bound hs.2.2 w cap
  have t := cap _ (List.mem_cons_of_mem _ hs.1)
  have pow : 2^w ≤ 2^h*2^w := Nat.le_mul_of_pos_left _ (Nat.pow_pos (by decide))
  have expo : h+w+2 ≤ (h+2)*(w+1) := by simp only [Nat.add_mul,Nat.mul_add,Nat.mul_one]; omega
  have up := Nat.pow_le_pow_right (by decide : 0<2) expo
  rw [Nat.pow_add 2 (h+w) 2,Nat.pow_add] at up
  omega

private theorem mask_binary {e : TargetEq} {T h} (hs : e.ScopedAt T h)
    (t : Term) (ht : t∈terms e) (j) : t.mask j=0 ∨ t.mask j=1 := by
  rcases List.mem_cons.mp ht with rfl|ht
  · exact Or.inl rfl
  · rcases List.mem_append.mp ht with ht|ht
    · obtain ⟨a,ha,rfl⟩ := List.mem_map.mp ht
      exact (binary hs.2.1 _ ha).1 j
    · obtain ⟨a,ha,rfl⟩ := List.mem_map.mp ht
      exact (binary hs.2.2 _ ha).1 j

def shiftFactor (r : Nat) := factor (2*r) 3 (3*(r+2))
theorem bounded_equations {T : List Nat} {eqs : List TargetEq} {r w : Nat} {x : Vec}
    (cap : ∀ t∈1::T, t≤2^w)
    (sys : ∀ e∈eqs, TargetEq.ScopedAt e T r ∧ e.Holds x) :
    ∃ y, Within (2*r) (shiftFactor r*(w+1)) y ∧ ∀ e∈eqs, TargetEq.Holds e y := by
  classical
  let G := {e : TargetEq // e ∈ eqs}
  have witness (g : G) := (sys _ g.property).2
  let p (g : G) := Classical.choose (witness g)
  let q (g : G) := Classical.choose (Classical.choose_spec (witness g))
  have zero (g : G) : AtZero (terms g.val) (fun t => t.c) (exponent (2*r) x (p g) (q g)) :=
    (flatten (sys _ g.property).1 _ (Nat.le_refl _) ..).mp
      (Classical.choose_spec (Classical.choose_spec (witness g)))
  obtain ⟨y,small,works⟩ := R06System.compress (G:=G) (2*r) (r+2) (w+1) (by omega)
    (fun g => terms g.val) x p q (fun g => mask_binary (sys _ g.property).1)
    (fun g => mass_cap (sys _ g.property).1 cap) zero
  refine ⟨y,small,?_⟩
  intro e he
  obtain ⟨a,b,eq⟩ := works ⟨e,he⟩
  exact ⟨a,b,(flatten (sys _ he).1 _ (Nat.le_refl _) ..).mpr eq⟩

/-- Actual unrestricted witnesses yield a topology and bounded shared shifts
whose target equations all evaluate to the prescribed integers at large scales. -/
theorem from_fits {T : List Nat} {r w : Nat} (nd : T.Nodup) (nontrivial : 1∉T)
    (cap : ∀ t∈1::T, t≤2^w) (fit : MCM.Fits MCM.unbounded T (T.length+r)) :
    ∃ xs h env eqs y, xs.length≤T.length+r ∧ (1::xs).Nodup ∧ T ⊆ xs ∧ h≤r ∧
      Trace T xs h env eqs ∧ Within (2*r) (shiftFactor r*(w+1)) y ∧
      ∀ e∈eqs, TargetEq.Holds e y := by
  obtain ⟨xs,h,env,eqs,x,len,ndx,sub,hr,tr,_,ok⟩ := R06Trace.from_fits nd nontrivial fit
  have sys e he := (ok e he)
  obtain ⟨y,small,works⟩ := bounded_equations (r:=r) cap (x:=x) (eqs:=eqs) (by
    intro e he
    obtain ⟨⟨ht,ha,hb⟩,hold⟩ := sys e he
    exact ⟨⟨ht,scoped_mono ha hr,scoped_mono hb hr⟩,hold⟩)
  exact ⟨xs,h,env,eqs,y,len,ndx,sub,hr,tr,small,works⟩

end R06Targets
#print axioms R06Targets.from_fits
