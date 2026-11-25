import R06Graph

namespace MCMOrbit
open MCM
def C (m x y : Int) := x%m=y%m
theorem reflC (m x : Int) : C m x x := rfl
theorem addC {m a b c d : Int} (h : C m a b) (k : C m c d) : C m (a+c) (b+d) := by
  unfold C at *; rw [Int.add_emod a c,Int.add_emod b d,h,k]
theorem mulC {m a b c d : Int} (h : C m a b) (k : C m c d) : C m (a*c) (b*d) := by
  unfold C at *; rw [Int.mul_emod a c,Int.mul_emod b d,h,k]
theorem negC {m a b : Int} (h : C m a b) : C m (-a) (-b) := by
  simpa using mulC (reflC m (-1)) h

def power (u : Int) : Prop := ∃ j : Nat, u=(2:Int)^j ∨ u= -((2:Int)^j)
theorem onePower : power 1 := ⟨0,Or.inl rfl⟩
theorem powPower (j : Nat) : power ((2:Int)^j) := ⟨j,Or.inl rfl⟩
theorem negPower {u : Int} (h : power u) : power (-u) := by
  obtain ⟨j,h|h⟩ := h
  · exact ⟨j,Or.inr (congrArg Neg.neg h)⟩
  · exact ⟨j,Or.inl (by rw [h,Int.neg_neg])⟩

theorem powProd (a b : Nat) : (2:Int)^a * 2^b=2^(a+b) := by
  induction b with
  | zero => simp
  | succ b ih =>
    calc
      _ = (2:Int)^a * (2^b * 2) := rfl
      _ = ((2:Int)^a * 2^b) * 2 := (Int.mul_assoc ..).symm
      _ = (2:Int)^(a+b) * 2 := by rw [ih]
      _ = (2:Int)^(a+b.succ) := rfl

theorem mulPower {u v : Int} (hu : power u) (hv : power v) : power (u*v) := by
  obtain ⟨a,h|h⟩ := hu <;> obtain ⟨b,k|k⟩ := hv <;> refine ⟨a+b,?_⟩ <;>
    simp [h,k,Int.neg_mul,Int.mul_neg,powProd]

theorem period {p : Nat} {m : Int} (hp : p>0) (cycle : C m (2^p) 1) (j : Nat) :
    C m (2^j) (2^(j%p)) := by
  induction j using Nat.strongRecOn with
  | ind j ih =>
    by_cases small : j<p
    · rw [Nat.mod_eq_of_lt small]; rfl
    · let k:=j-p
      have eq : j=k+p := by dsimp [k];omega
      have lt : k<j := by omega
      have step := mulC (reflC m ((2:Int)^k)) cycle
      rw [powProd,Int.mul_one,←eq] at step
      have rec := ih k lt
      change _%m=_%m at step rec ⊢
      rw [step,rec]
      rw [eq,Nat.add_mod_right]

theorem inversePower {p : Nat} {m u : Int} (hp : p>0) (cycle : C m (2^p) 1) (h : power u) :
    ∃ v, power v ∧ C m (v*u) 1 := by
  obtain ⟨j,sign⟩:=h
  let b:=p-j%p
  have eq : b+j%p=p := Nat.sub_add_cancel (Nat.le_of_lt (Nat.mod_lt _ hp))
  have aux := mulC (reflC m ((2:Int)^b)) (period hp cycle j)
  rw [powProd b (j%p),eq] at aux
  have pos : C m (2^b*(2:Int)^j) 1 := Eq.trans aux cycle
  rcases sign with h|h
  · exact ⟨(2:Int)^b,powPower b,by simpa only [h] using pos⟩
  · exact ⟨-((2:Int)^b),negPower (powPower b),by simpa [h,Int.neg_mul,Int.mul_neg] using pos⟩

def orbit (m x a : Int) : Prop := ∃ u, power u ∧ C m x (u*a)
theorem orbit_symm {p : Nat} {m x a : Int} (hp : 0<p) (cycle : C m (2^p) 1)
    (h : orbit m x a) : orbit m a x := by
  obtain ⟨u,hu,h⟩:=h
  obtain ⟨v,hv,inv⟩:=inversePower hp cycle hu
  have one := mulC inv (reflC m a)
  have scale := mulC (reflC m v) h
  rw [←Int.mul_assoc] at scale
  exact ⟨v,hv,by simpa using Eq.symm (Eq.trans scale one)⟩

def balanced (m a b t : Int) : Prop :=
  ∃ u v w, power u ∧ power v ∧ power w ∧ C m (w*t) (u*a+v*b)

theorem swap (m a b t : Int) (h : balanced m a b t) : balanced m b a t := by
  obtain ⟨u,v,w,hu,hv,hw,e⟩:=h
  exact ⟨v,u,w,hv,hu,hw,by simpa only [Int.add_comm (v*b)] using e⟩

theorem flip (m a b t : Int) (h : balanced m a t b) : balanced m a b t := by
  obtain ⟨u,v,w,hu,hv,hw,e⟩:=h
  have eq:=addC (reflC m (-(u*a))) e
  have cancel : -(u*a)+(u*a+v*t)=v*t := by omega
  rw [cancel] at eq
  exact ⟨-u,w,v,negPower hu,hw,hv,by simpa only [Int.neg_mul] using Eq.symm eq⟩

private theorem orientedInt (m : Int) {a b t : Nat} (h : Oriented a b t) :
    balanced m a b t := by
  rcases h with h|h|h
  · obtain ⟨_,j,_,eq⟩ := (powerTimes_iff ..).mp h
    have e := congrArg (fun n : Nat => (n:Int)) eq
    simp only [Int.natCast_add,Int.natCast_mul,Int.natCast_pow,Int.cast_ofNat_Int] at e
    exact ⟨1,1,2^j,onePower,onePower,powPower j,by simp only [Int.one_mul,←e];rfl⟩
  · obtain ⟨pos,j,_,eq⟩ := (powerTimes_iff ..).mp h
    have positive : 0<2^j*t := Nat.mul_pos (Nat.two_pow_pos j) pos
    have whole : a=b+2^j*t := by omega
    have e:=congrArg (fun n : Nat => (n:Int)) whole
    simp only [Int.natCast_add,Int.natCast_mul,Int.natCast_pow,Int.cast_ofNat_Int] at e
    have diff : (2:Int)^j*t=a+ -(b:Int) := by omega
    exact ⟨1,-1,2^j,onePower,negPower onePower,powPower j,by simpa [diff] using reflC m ((a:Int)+ -(b:Int))⟩
  · obtain ⟨pos,j,_,eq⟩ := (powerTimes_iff ..).mp h
    have positive : 0<2^j*t := Nat.mul_pos (Nat.two_pow_pos j) pos
    have whole : b=a+2^j*t := by omega
    have e:=congrArg (fun n : Nat => (n:Int)) whole
    simp only [Int.natCast_add,Int.natCast_mul,Int.natCast_pow,Int.cast_ofNat_Int] at e
    have diff : (2:Int)^j*t= -(a:Int)+b := by omega
    exact ⟨-1,1,2^j,negPower onePower,onePower,powPower j,by simpa [diff] using reflC m (-(a:Int)+b)⟩

theorem gateInt (m : Int) {a b t : Nat} (h : Gate a b t) : balanced m a b t := by
  rcases h with h|h|h
  · exact orientedInt m h
  · exact flip m a b t (orientedInt m h)
  · exact swap m b a t (flip m b a t (orientedInt m h))

theorem substitute {m a b t A B T : Int} (h : balanced m a b t) (ha : orbit m a A)
    (hb : orbit m b B) (ht : orbit m t T) : balanced m A B T := by
  obtain ⟨u,v,w,hu,hv,hw,eq⟩:=h
  obtain ⟨x,hx,ea⟩:=ha;obtain ⟨y,hy,eb⟩:=hb;obtain ⟨z,hz,et⟩:=ht
  have lhs:=mulC (reflC m w) et
  have rhs:=addC (mulC (reflC m u) ea) (mulC (reflC m v) eb)
  exact ⟨u*x,v*y,w*z,mulPower hu hx,mulPower hv hy,mulPower hw hz,
    by simpa only [Int.mul_assoc] using Eq.trans (Eq.symm lhs) (Eq.trans eq rhs)⟩

/-- This is the arithmetic enumerated by signed rotation search: one relative shift. -/
def child (p : Nat) (m a b t : Int) : Prop :=
  ∃ j<p, orbit m t (a+2^j*b) ∨ orbit m t (a-2^j*b)

theorem child_of_balanced {p : Nat} {m a b t : Int} (hp : p>0) (cycle : C m (2^p) 1)
    (h : balanced m a b t) : child p m a b t := by
  obtain ⟨u,v,w,hu,hv,hw,eq⟩:=h
  obtain ⟨wi,hwi,invW⟩:=inversePower hp cycle hw
  obtain ⟨ui,hui,invU⟩:=inversePower hp cycle hu
  have left:=mulC invW (reflC m t)
  have both:=mulC (reflC m wi) eq
  have invU' : C m (u*ui) 1 := by simpa only [Int.mul_comm u ui] using invU
  have right := mulC invU' (reflC m (v*b))
  have fact : C m (u*(a+(ui*v)*b)) (u*a+v*b) := by
    rw [Int.mul_add]
    have := addC (reflC m (u*a)) right
    simpa only [Int.one_mul,Int.mul_assoc] using this
  have factor:=mulC (reflC m wi) fact
  have out : C m t ((wi*u)*(a+(ui*v)*b)) := by
    have lhs : C m (wi*(w*t)) t := by simpa only [Int.mul_assoc,Int.one_mul] using left
    simpa only [Int.mul_assoc] using Eq.trans (Eq.symm lhs) (Eq.trans both (Eq.symm factor))
  obtain ⟨j,sign⟩:=mulPower hui hv
  have s:=period hp cycle j
  refine ⟨j%p,Nat.mod_lt _ hp,?_⟩
  rcases sign with e|e
  · left;refine ⟨wi*u,mulPower hwi hu,?_⟩
    rw [e] at out
    exact Eq.trans out (mulC (reflC m (wi*u)) (addC (reflC m a) (mulC s (reflC m b))))
  · right;refine ⟨wi*u,mulPower hwi hu,?_⟩
    rw [e,Int.neg_mul] at out
    have last:=mulC (reflC m (wi*u)) (addC (reflC m a) (negC (mulC s (reflC m b))))
    simpa only [Int.sub_eq_add_neg] using Eq.trans out last

/-- Minimum of all signed shifts modulo m. The duplicated unshifted candidate is harmless. -/
def representative (p : Nat) (m n : Int) : Int :=
  ((List.range p).flatMap (fun j => [((2:Int)^j*n)%m,(-((2:Int)^j*n))%m])).foldl min (n%m)

private theorem representative_orbit (p : Nat) (m n : Int) : orbit m (representative p m n) n := by
  have base : orbit m (n%m) n := ⟨1,onePower,by simp [C]⟩
  have fold (xs : List Int) (ini : Int) (initial : orbit m ini n)
      (each : ∀ x∈xs, orbit m x n) : orbit m (xs.foldl min ini) n := by
    induction xs generalizing ini with
    | nil => exact initial
    | cons x xs ih =>
      have curr : orbit m (min ini x) n := by
        by_cases le : ini≤x
        · simpa [Int.min_eq_left le] using initial
        · simpa [Int.min_eq_right (by omega : x≤ini)] using each x (by simp)
      exact ih _ curr (fun z hz => each z (by simp [hz]))
  refine fold _ _ base ?_
  intro x hx
  obtain ⟨j,_,belongs⟩:=List.mem_flatMap.mp hx
  simp only [List.mem_cons,List.not_mem_nil,or_false] at belongs
  rcases belongs with rfl|rfl
  · exact ⟨2^j,powPower j,by simp [C]⟩
  · exact ⟨-(2^j),negPower (powPower j),by simp [C,Int.neg_mul]⟩

theorem canonical_gate {p : Nat} (hp : 0<p) {m : Int} (cycle : C m (2^p) 1)
    {a b t : Nat} (h : Gate a b t) :
    child p m (representative p m a) (representative p m b) (representative p m t) :=
  child_of_balanced hp cycle (substitute (gateInt m h)
    (orbit_symm hp cycle (representative_orbit p m a))
    (orbit_symm hp cycle (representative_orbit p m b))
    (orbit_symm hp cycle (representative_orbit p m t)))

#print axioms canonical_gate

private theorem transOrbit {m x y z : Int} (a : orbit m x y) (b : orbit m y z) :
    orbit m x z := by
  obtain ⟨u,hu,e⟩:=a;obtain ⟨v,hv,f⟩:=b
  refine ⟨u*v,mulPower hu hv,?_⟩
  simpa only [Int.mul_assoc] using Eq.trans e (mulC (reflC m u) f)

private theorem min_bounds (xs : List Int) (ini : Int) :
    xs.foldl min ini ≤ ini ∧ ∀ x∈xs, xs.foldl min ini ≤ x := by
  induction xs generalizing ini with
  | nil => simp
  | cons z zs ih =>
    obtain ⟨head,tail⟩:=ih (min ini z)
    refine ⟨Int.le_trans head (Int.min_le_left ..),?_⟩
    intro x hx
    rcases List.mem_cons.mp hx with rfl|inTail
    · exact Int.le_trans head (Int.min_le_right ..)
    · exact tail x inTail

private theorem rep_reduced (p : Nat) (m n : Int) :
    representative p m n % m = representative p m n := by
  have fold (xs : List Int) (ini : Int) (base : ini%m=ini)
      (each : ∀ x∈xs,x%m=x) : xs.foldl min ini %m=xs.foldl min ini := by
    induction xs generalizing ini with
    | nil => exact base
    | cons x xs ih =>
      apply ih
      · by_cases le : ini≤x
        · simpa [Int.min_eq_left le] using base
        · simpa [Int.min_eq_right (by omega : x≤ini)] using each x (by simp)
      · exact fun y h => each y (by simp [h])
  refine fold _ _ (by simp) ?_
  intro x hx
  obtain ⟨j,_,h⟩:=List.mem_flatMap.mp hx
  simp only [List.mem_cons,List.not_mem_nil,or_false] at h
  rcases h with rfl|rfl <;> simp

private theorem rep_le {p : Nat} {m x y : Int} (hp : 0<p) (cycle : C m (2^p) 1)
    (h : orbit m x y) : representative p m y ≤ x%m := by
  obtain ⟨u,⟨j,sign⟩,eq⟩:=h
  have k:=period hp cycle j
  have mem : j%p ∈ List.range p := List.mem_range.mpr (Nat.mod_lt _ hp)
  unfold representative
  apply (min_bounds ..).2
  apply List.mem_flatMap.mpr
  refine ⟨j%p,mem,?_⟩
  rcases sign with e|e
  · rw [e] at eq
    exact List.mem_cons.mpr (Or.inl (Eq.trans eq (mulC k (reflC m y))))
  · rw [e,Int.neg_mul] at eq
    exact List.mem_cons_of_mem _ (List.mem_singleton.mpr (Eq.trans eq (negC (mulC k (reflC m y)))))

theorem equal_representatives {p : Nat} {m a b : Int} (hp : 0<p) (cycle : C m (2^p) 1)
    (h : orbit m a b) : representative p m a=representative p m b := by
  have left:=rep_le hp cycle (transOrbit (representative_orbit p m b) (orbit_symm hp cycle h))
  have right:=rep_le hp cycle (transOrbit (representative_orbit p m a) h)
  rw [rep_reduced] at left right
  exact Int.le_antisymm left right

def successor (p : Nat) (m a b t : Int) : Prop := ∃ j<p,
    t=representative p m (a+2^j*b) ∨ t=representative p m (a-2^j*b)

theorem successor_of_gate {p : Nat} (hp : 0<p) {m : Int} (cycle : C m (2^p) 1)
    {a b t : Nat} (h : Gate a b t) :
    successor p m (representative p m a) (representative p m b) (representative p m t) := by
  obtain ⟨j,jp,sign⟩:=canonical_gate hp cycle h
  have fixed:=equal_representatives hp cycle (representative_orbit p m t)
  refine ⟨j,jp,?_⟩
  rcases sign with h|h
  · exact Or.inl (Eq.trans (Eq.symm fixed) (equal_representatives hp cycle h))
  · exact Or.inr (Eq.trans (Eq.symm fixed) (equal_representatives hp cycle h))

def project (p : Nat) (m : Int) (n : Nat) : Int := representative p m n
def validQ (p : Nat) (m : Int) : List Int → Prop
  | [] => True
  | t::xs => validQ p m xs ∧ ∃ a∈project p m 1::xs, ∃ b∈project p m 1::xs, successor p m a b t

private theorem projectValid {p : Nat} {m : Int} (hp : 0<p) (cycle : C m (2^p) 1)
    (xs : List Nat) (v : Valid unbounded xs) : validQ p m (xs.map (project p m)) := by
  induction xs with
  | nil => trivial
  | cons t xs ih =>
    obtain ⟨prev,_,_,ok⟩:=v
    obtain ⟨a,ha,b,hb,h⟩:=(makes_iff ..).mp ok
    have mapped {x : Nat} (hx : x∈1::xs) : project p m x ∈ project p m 1::xs.map (project p m) :=
      List.mem_map.mpr ⟨x,hx,rfl⟩
    exact ⟨ih prev,_,mapped ha,_,mapped hb,successor_of_gate hp cycle h⟩

private theorem helperCount (f : Nat→Int) (xs T : List Nat) :
    ((xs.map f).filter (fun x => x∉T.map f)).length ≤ (xs.filter (fun x => x∉T)).length := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    simp only [List.map_cons,List.filter_cons,decide_eq_true_eq]
    by_cases mem : x∈T
    · have h : f x∈T.map f := List.mem_map.mpr ⟨x,mem,rfl⟩
      rw [if_neg (not_not_intro h),if_neg (not_not_intro mem)];exact ih
    · by_cases image : f x∈T.map f
      · rw [if_neg (not_not_intro image),if_pos mem,List.length_cons];omega
      · rw [if_pos image,if_pos mem,List.length_cons,List.length_cons];omega

/-- Every unrestricted integer witness projects to a schedule in the precise finite successor
    relation used by the searches, without increasing its length or its non-target budget. -/
theorem surplus_projection {p r : Nat} {T : List Nat} (hp : 0<p)
    (distinct : T.Nodup) (nontrivial : 1∉T) (h : Fits unbounded T (T.length+r)) :
    let m := (2:Int)^p-1
    let f := project p m
    ∃ xs : List Int, validQ p m xs ∧ T.map f ⊆ xs ∧ xs.length ≤ T.length+r ∧
      (xs.filter (fun x => x∉T.map f)).length ≤ r := by
  dsimp only
  let m:=(2:Int)^p-1
  have cycle : C m (2^p) 1 := by
    have eq : (2:Int)^p=1+m := by dsimp [m];omega
    change ((2:Int)^p)%m=1%m
    exact Eq.trans (congrArg (fun x : Int => x%m) eq) (by simp)
  obtain ⟨ys,v,_,sub,len,count⟩:=R06Graph.extract distinct nontrivial h
  refine ⟨ys.map (project p m),projectValid hp cycle ys v,?_,by simpa using len,?_⟩
  · intro t ht
    obtain ⟨u,hu,rfl⟩:=List.mem_map.mp ht
    exact List.mem_map.mpr ⟨u,sub hu,rfl⟩
  · exact Nat.le_trans (helperCount (project p m) ys T) count

#print axioms successor_of_gate
#print axioms surplus_projection
end MCMOrbit
