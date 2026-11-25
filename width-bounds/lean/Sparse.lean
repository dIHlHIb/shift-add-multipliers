import Transport
import R02Residue
namespace MCMWidthSparse
open MCMWidthTransport

/-- Exponents are affine in the width parameter and two gate shifts. -/
structure Monomial where
  coefficient : Int
  width : Nat
  shared : Nat
  privateShift : Nat
  deriving Repr, DecidableEq

abbrev Poly := List Monomial
def atPoint (k j p : Nat) (m : Monomial) := m.width*k+m.shared*j+m.privateShift*p
def eval (k j p : Nat) : Poly → Int
  | [] => 0
  | a::rest => a.coefficient*2^(atPoint k j p a)+eval k j p rest
def weight : Poly → Nat
  | [] => 0
  | a::rest => a.coefficient.natAbs+weight rest
def box (A B C : Nat) (f : Poly) := ∀ z∈f, z.width≤A ∧ z.shared≤B ∧ z.privateShift≤C
def asTerm (a : Monomial) : Term := ⟨a.coefficient,⟨a.width,a.shared,a.privateShift⟩⟩
def minus (f : Poly) : Poly := f.map fun a=>{a with coefficient:= -a.coefficient}
def shift (j p : Nat) (f : Poly) : Poly :=
  f.map fun a=>{a with shared:=j+a.shared,privateShift:=p+a.privateShift}
def plus := List.append (α:=Monomial)
def signed (s : Bool) (f : Poly) := if s then f else minus f

theorem eval_plus (f g : Poly) (k j p) :
    eval k j p (plus f g)=eval k j p f+eval k j p g := by
  induction f with
  | nil => simp [plus,eval]
  | cons a xs ih => change _+eval k j p (plus xs g)=_; rw [ih];simp [eval,Int.add_assoc]

theorem eval_minus (f : Poly) (k j p) : eval k j p (minus f)= -eval k j p f := by
  induction f with
  | nil => simp [minus,eval]
  | cons a xs ih =>
    change (-a.coefficient)*2^_+eval k j p (minus xs)=_
    rw [ih]; simp [eval,atPoint,Int.neg_mul];omega

theorem eval_signed (s : Bool) (f : Poly) (k j p) :
    eval k j p (signed s f)=R02Residue.sig s*eval k j p f := by
  cases s <;> simp [signed,R02Residue.sig,eval_minus]

theorem eval_shift (u v : Nat) (f : Poly) (k j p) :
    eval k j p (shift u v f)=(2:Int)^(u*j+v*p)*eval k j p f := by
  induction f with
  | nil => simp [eval,shift]
  | cons a xs ih =>
    have e : atPoint k j p {a with shared:=u+a.shared,privateShift:=v+a.privateShift} =
        (u*j+v*p)+atPoint k j p a := by simp only [atPoint,Nat.add_mul];omega
    change a.coefficient*2^(atPoint k j p {a with shared:=_,privateShift:=_})+eval k j p (shift u v xs)=_
    rw [e,ih]
    have power:=R02Residue.pow_sum (u*j+v*p) (atPoint k j p a)
    simp only [R02Residue.pow] at power
    rw [power]
    simp only [eval,Int.mul_add]
    ac_rfl

theorem weight_plus (f g : Poly) : weight (plus f g)=weight f+weight g := by
  induction f with
  | nil => simp [plus,weight]
  | cons a xs ih => change _+weight (plus xs g)=_;rw [ih];simp [weight,Nat.add_assoc]
theorem weight_minus (f : Poly) : weight (minus f)=weight f := by
  induction f with
  | nil => rfl
  | cons a xs ih => change (-a.coefficient).natAbs+weight (minus xs)=_;rw [ih];simp [weight]
theorem weight_signed (s : Bool) (f : Poly) : weight (signed s f)=weight f := by
  cases s <;> simp [signed,weight_minus]
theorem weight_shift (u v : Nat) (f : Poly) : weight (shift u v f)=weight f := by
  induction f with
  | nil => rfl
  | cons a xs ih => change _+weight (shift u v xs)=_;rw [ih];rfl

theorem box_plus {A B C} {f g : Poly} (hf : box A B C f) (hg : box A B C g) :
    box A B C (plus f g) := by
  intro z m;rcases List.mem_append.mp m with e|e;exact hf _ e;exact hg _ e
theorem box_signed {A B C} (s : Bool) {f : Poly} (hf : box A B C f) :
    box A B C (signed s f) := by
  cases s with
  | true => exact hf
  | false =>
    intro z h;obtain ⟨a,ma,rfl⟩:=List.mem_map.mp h
    exact hf a ma
theorem box_shift {A B C} (u v : Nat) {f : Poly} (hf : box A B C f) :
    box A (u+B) (v+C) (shift u v f) := by
  intro z m;obtain ⟨a,ma,rfl⟩:=List.mem_map.mp m
  obtain ⟨x,y,z⟩:=hf a ma
  exact ⟨x,Nat.add_le_add_left y _,Nat.add_le_add_left z _⟩
theorem box_weaken {A B C a b c} {f : Poly} (hf : box a b c f) (x:a≤A) (y:b≤B) (z:c≤C) :
    box A B C f := fun _ m=> ⟨Nat.le_trans (hf _ m).1 x,Nat.le_trans (hf _ m).2.1 y,
      Nat.le_trans (hf _ m).2.2 z⟩

private theorem point (e : Monomial) (k j p : Nat) :
    (expVal (asTerm e).exponent k j p).toNat=atPoint k j p e := by
  simp [expVal,asTerm,atPoint,←Int.natCast_mul,←Int.natCast_add]

/-- One direction works for every eligible polynomial, regardless of how many
edge identities use the same two private shifts. -/
theorem all_polynomials {k j s t : Nat} (large : 104<k) (n : Nat) :
    ∃ J S T : Nat, ∀ f : Poly, box 4 1 1 f → weight f≤4096 →
      MCMWidthSigns.signs (eval k j s f) (eval (k+2*n) J S f) ∧
      MCMWidthSigns.signs (eval k j t f) (eval (k+2*n) J T f) := by
  obtain ⟨dj,ds,dt,hs,ht⟩:=choose (k:=(k:Int)) (j:=(j:Int)) (s:=(s:Int)) (t:=(t:Int)) (by exact_mod_cast large)
  have directions {p : Nat} {dp : Int} (h : preserves k j p dj dp) : 0≤dj ∧ 0≤dp := by
    have a:=h 0 1 0 0 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by simp)
    have b:=h 0 0 1 0 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
      (by decide) (by decide) (by simp)
    simpa using And.intro a b
  obtain ⟨hj,hds⟩:=directions hs
  have hdt:=(directions ht).2
  refine ⟨j+dj.toNat*n,s+ds.toNat*n,t+dt.toNat*n,?_⟩
  intro f small mass
  have one {p : Nat} {dp : Int} (h : preserves k j p dj dp) (hp : 0≤dp) :
      MCMWidthSigns.signs (eval k j p f) (eval (k+2*n) (j+dj.toNat*n) (p+dp.toNat*n) f) := by
    let K:=k+2*n;let J:=j+dj.toNat*n;let P:=p+dp.toNat*n
    let convert:=fun m:Monomial => pair k j p K J P (asTerm m)
    have exK : (k:Int)+2*n=K := by simp [K]
    have exJ : (j:Int)+dj*n=J := by simp [J,Int.toNat_of_nonneg hj]
    have exP : (p:Int)+dp*n=P := by simp [P,Int.toNat_of_nonneg hp]
    have bounds z (m : z∈f.map asTerm) : bounded z.exponent := by
      obtain ⟨a,ma,rfl⟩:=List.mem_map.mp m
      obtain ⟨a1,a2,a3⟩:=small _ ma
      simp [asTerm,bounded];omega
    have mass_eq (xs : Poly) : R06Cancellation.mass (xs.map convert)=weight xs := by
      induction xs with
      | nil => rfl
      | cons a xs ih => change a.coefficient.natAbs+_=a.coefficient.natAbs+_;rw [ih]
    have sum_eq (xs : Poly) :
        R06Cancellation.sum R06Cancellation.Term.e (xs.map convert)=eval k j p xs ∧
        R06Cancellation.sum R06Cancellation.Term.f (xs.map convert)=eval K J P xs := by
      induction xs with
      | nil => exact ⟨rfl,rfl⟩
      | cons a xs ih =>
        simp only [List.map_cons,R06Cancellation.sum,eval,convert,pair,point,asTerm] at ih ⊢
        exact ⟨congrArg (_+·) ih.1,congrArg (_+·) ih.2⟩
    have z:=polynomial h (n:Int) (by omega) (f.map asTerm) (by omega) (by omega) (by omega) bounds
    rw [exK,exJ,exP,List.map_map] at z
    change R06Cancellation.mass (f.map convert)≤_ → _ at z
    obtain ⟨e1,e2⟩:=sum_eq f
    have result:=z ((mass_eq f).symm ▸ mass)
    change MCMWidthSigns.signs (R06Cancellation.sum _ (f.map convert)) (R06Cancellation.sum _ (f.map convert)) at result
    rwa [e1,e2] at result
  exact ⟨one hs hds,one ht hdt⟩

end MCMWidthSparse
#print axioms MCMWidthSparse.all_polynomials
