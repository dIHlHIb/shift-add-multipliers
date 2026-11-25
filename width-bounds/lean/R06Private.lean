import SmallSystem
import Surplus

namespace R06Private
open McmSmall

structure Row where
  coeff : Vec
  offset : Int

def Row.val (n : Nat) (x : Vec) (u : Row) := dot n u.coeff x + u.offset
def Row.Bounded (n k c : Nat) (u : Row) := Within n k u.coeff ∧ u.offset.natAbs ≤ c

private def zero : Row := ⟨fun _ => 0, 0⟩
private def combine (a b c : Row) : Row :=
  ⟨fun j => a.coeff j+b.coeff j-c.coeff j, a.offset+b.offset-c.offset⟩

private theorem zero_val (n : Nat) (x : Vec) : zero.val n x=0 := by
  induction n with
  | zero => rfl
  | succ n ih => simpa [Row.val,zero,dot] using ih

private theorem dot_combine (n : Nat) (x : Vec) (a b c : Row) :
    dot n (combine a b c).coeff x = dot n a.coeff x + dot n b.coeff x - dot n c.coeff x := by
  induction n with
  | zero => rfl
  | succ n ih =>
    simp only [dot]
    rw [ih]
    simp only [combine,Int.sub_mul,Int.add_mul]
    omega

private theorem combine_val (n : Nat) (x : Vec) (a b c : Row) :
    (combine a b c).val n x = a.val n x + b.val n x - c.val n x := by
  unfold Row.val
  rw [dot_combine]
  simp only [combine]; omega

private theorem triple_abs (a b c : Int) :
    (a+b-c).natAbs ≤ a.natAbs+b.natAbs+c.natAbs := by
  have h := Int.natAbs_add_le (a+b) (-c)
  have hh := Int.natAbs_add_le a b
  simp only [Int.natAbs_neg] at h
  simpa only [Int.sub_eq_add_neg] using (Nat.le_trans h (Nat.add_le_add_right hh _))

private theorem combine_bounded {n k c : Nat} {u v z : Row}
    (hu : u.Bounded n k c) (hv : v.Bounded n k c) (hz : z.Bounded n k c) :
    (combine u v z).Bounded n (3*k) (3*c) := by
  constructor
  · intro j hj
    exact Nat.le_trans (triple_abs _ _ _) (by
      have := hu.1 j hj; have := hv.1 j hj; have := hz.1 j hj; omega)
  · exact Nat.le_trans (triple_abs _ _ _) (by
      have := hu.2; have := hv.2; have := hz.2; omega)

inductive Edge where
  | loop | left | right | across

def delta (p q : Int) : Edge → Int
  | .loop => 0
  | .left => p
  | .right => q
  | .across => q-p

/-- Each group has two private integer shifts in addition to the shared vector.
All four oriented edge families (including loops) are allowed, even if empty.
The bound on the replacement shared vector is independent of the number of groups
and edges. The existential private shifts may take different values for each group. -/
theorem compress {G : Type} (n k h l : Nat) (hl : 0<l) (x : Vec)
    (edges : G → Edge → Row → Prop)
    (bounds : ∀ g t u, edges g t u → u.Bounded n k (h*l))
    (old : ∀ g, ∃ p q, ∀ t u, edges g t u → u.val n x=delta p q t) :
    ∃ y, Within n (factor n (3*k) (3*h)*l) y ∧
      ∀ g, ∃ p q, ∀ t u, edges g t u → u.val n y=delta p q t := by
  let I := {u : Row // u.Bounded n (3*k) ((3*h)*l) ∧ u.val n x=0}
  obtain ⟨y,small,keep⟩ := small_solution (ι:=I) n (3*k) (3*h) l hl
    (fun u => u.val.coeff) x (fun u => u.property.1.1) (by
      intro u
      have hz := u.property.2
      have hb := u.property.1.2
      simp only [Row.val] at hz
      have eq : dot n u.val.coeff x = -u.val.offset := by omega
      simpa only [eq,Int.natAbs_neg] using hb)
  have relation (a b c : Row) (ha : a.Bounded n k (h*l)) (hb : b.Bounded n k (h*l))
      (hc : c.Bounded n k (h*l)) (eq : a.val n x+b.val n x=c.val n x) :
      a.val n y+b.val n y=c.val n y := by
    have h0 : (combine a b c).val n x=0 := by rw [combine_val,eq]; omega
    let i : I := ⟨combine a b c,by simpa only [Nat.mul_assoc] using combine_bounded ha hb hc,h0⟩
    have he := keep i
    change dot n (combine a b c).coeff y=dot n (combine a b c).coeff x at he
    have h1 : (combine a b c).val n y=0 := by
      unfold Row.val at *; rw [he]; exact h0
    rw [combine_val] at h1
    omega
  have zb : zero.Bounded n k (h*l) := ⟨fun j hj => Nat.zero_le _, Nat.zero_le _⟩
  refine ⟨y,small,?_⟩
  intro g
  obtain ⟨p,q,ok⟩ := old g
  let values (t : Edge) (v : Int) := ∃ u, edges g t u ∧ v=u.val n y
  have sv (t : Edge) : AuditSurplus.SingleValued (values t) := by
    rintro _ _ ⟨a,ha,rfl⟩ ⟨c,hc,rfl⟩
    have eq := relation a zero c (bounds _ _ _ ha) zb (bounds _ _ _ hc)
      (by rw [zero_val,ok _ _ ha,ok _ _ hc]; omega)
    rwa [zero_val,Int.add_zero] at eq
  obtain ⟨p',q',left,right,across⟩ := (AuditSurplus.three_potentials
    (values .left) (values .right) (values .across)).mpr ⟨sv _,sv _,sv _,by
      rintro _ _ _ ⟨a,ha,rfl⟩ ⟨b,hb,rfl⟩ ⟨c,hc,rfl⟩
      apply relation a c b (bounds _ _ _ ha) (bounds _ _ _ hc) (bounds _ _ _ hb)
      rw [ok _ _ ha,ok _ _ hc,ok _ _ hb]; simp only [delta]; omega⟩
  refine ⟨p',q',?_⟩
  intro t u hu
  cases t with
  | loop =>
    have eq := relation u zero zero (bounds _ _ _ hu) zb zb (by rw [ok _ _ hu]; simp [delta])
    simpa [delta,zero_val] using eq
  | left => exact left _ ⟨u,hu,rfl⟩
  | right => exact right _ ⟨u,hu,rfl⟩
  | across => exact across _ ⟨u,hu,rfl⟩

end R06Private
#print axioms R06Private.compress
