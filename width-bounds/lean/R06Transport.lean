import R06Cancellation
import R06Paths
namespace R06Transport
open R06Paths

def AtZero {A : Type} (ts : List A) (c exp : A → Int) :=
  ∃ K : Int, ∀ z : Int, K≤z → sigma (fun a => c a*power (z+exp a)) ts=0

private def lift {A} (c o n : A → Int) (z : Int) (a : A) : R06Cancellation.Term :=
  ⟨c a,(z+o a).toNat,(z+n a).toNat⟩

private theorem sample_old {A} (c o n : A → Int) (z) (ts : List A) :
    R06Cancellation.sum R06Cancellation.Term.e (ts.map (lift c o n z)) =
      sigma (fun a => c a*power (z+o a)) ts := by
  induction ts with
  | nil => rfl
  | cons a ts ih => simp only [List.map_cons,R06Cancellation.sum,sigma,ih,lift,power]

private theorem sample_new {A} (c o n : A → Int) (z) (ts : List A) :
    R06Cancellation.sum R06Cancellation.Term.f (ts.map (lift c o n z)) =
      sigma (fun a => c a*power (z+n a)) ts := by
  induction ts with
  | nil => rfl
  | cons a ts ih => simp only [List.map_cons,R06Cancellation.sum,sigma,ih,lift,power]

private theorem mass_lift {A} (c o n : A → Int) (z) (ts : List A) :
    R06Cancellation.mass (ts.map (lift c o n z))=mass c ts := by
  induction ts with
  | nil => rfl
  | cons a ts ih => simp only [List.map_cons,R06Cancellation.mass,mass,ih,lift]

theorem floor_exists {A} (f : A → Int) (ts : List A) : ∃ b : Int, ∀ a∈ts, b≤f a := by
  induction ts with
  | nil => exact ⟨0,by simp⟩
  | cons a ts ih =>
    obtain ⟨b,hb⟩ := ih
    refine ⟨min b (f a),?_⟩
    intro c hc
    rcases List.mem_cons.mp hc with rfl|hc
    · omega
    · have := hb c hc; omega

theorem transfer {A : Type} (ts : List A) (c old new : A → Int) (k : Nat)
    (mc : mass c ts ≤ 2^k) (ho : AtZero ts c old)
    (eq : ∀ a∈ts, ∀ b∈ts, (old b-old a).natAbs≤k → new b-new a=old b-old a) :
    AtZero ts c new := by
  obtain ⟨K,oldzero⟩ := ho
  obtain ⟨lo,hlo⟩ := floor_exists old ts
  obtain ⟨ln,hln⟩ := floor_exists new ts
  refine ⟨max K (max (-lo) (-ln)),?_⟩
  intro z hz
  let f := lift c old new z
  have near : R06Cancellation.Nearby k (ts.map f) := by
    intro a ha b hb
    obtain ⟨s,hs,rfl⟩ := List.mem_map.mp ha
    obtain ⟨t,ht,rfl⟩ := List.mem_map.mp hb
    simp only [f,lift]
    have := hlo s hs; have := hlo t ht; have := hln s hs; have := hln t ht
    intro le close
    have := eq s hs t ht (by omega)
    omega
  rw [←sample_new c old new]
  apply R06Cancellation.transfer _ k _ _ near
  · rw [sample_old]; exact oldzero _ (by omega)
  · rwa [mass_lift]

end R06Transport
#print axioms R06Transport.transfer
