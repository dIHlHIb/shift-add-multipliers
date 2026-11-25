import GateLift
import R02Tight
namespace MCMWidthOrder
open MCMWidthSparse MCMWidthGate MCMWidthLift MCM R02Residue

abbrev stable (k j p K J P : Nat) :=
  ∀ f : Poly, box 4 1 1 f → weight f≤4096 →
    MCMWidthSigns.signs (eval k j p f) (eval K J P f)

def val (k h : Nat) : Option Label → Nat
  | none => h
  | some l => number k l
def depth (r : Tag) (J d : Nat) : Option Label → Nat
  | none => d
  | some _ => denomShift r J

private theorem scaled_mix (r : Tag) (v q a b c : Int) :
    mix r q (v*a) (v*b) (v*c)=v*mix r q a b c := by
  cases r with | mk pos e f =>
    cases pos <;> simp only [mix,Int.mul_add] <;> ac_rfl

structure Edge (S : List (Option Label)) (t : Label) where
  left : Option Label
  right : Option Label
  ml : left∈S
  mr : right∈S
  tag : Tag
  shift : Nat

def Edge.exactly {S t} (e : Edge S t) (k h : Nat) :=
  mix e.tag (pow e.shift) (val k h e.left) (val k h e.right) (number k t)=0

theorem getEdge {k h S t} (s : R02NearPlan.step (S.map (val k h)) (number k t)) :
    ∃ e : Edge S t,e.exactly k h := by
  obtain ⟨a,ma,b,mb,g⟩:=s
  obtain ⟨l,ml,rfl⟩:=List.mem_map.mp ma
  obtain ⟨r,mr,rfl⟩:=List.mem_map.mp mb
  obtain ⟨tag,j,_,eq⟩:=gate g
  exact ⟨⟨l,r,ml,mr,tag,j⟩,eq⟩

private theorem same_value {r : Tag} {a b : Label} {k j p h : Nat}
    (eq : numVal r k j a b=(denom r j:Int)*h) (z : Option Label) :
    eval k j p (wire r a b z)=(denom r j:Int)*val k h z := by
  cases z with
  | none => exact (num_at ..).trans eq
  | some l => exact fixed_scaled_eval r l k j p

private theorem fact_value {r : Tag} {a b : Label} {k j p h d : Nat}
    (eq : numVal r k j a b=scale d h) (z : Option Label) :
    eval k j p (wire r a b z)=scale (depth r j d z) (val k h z) := by
  cases z with
  | none => exact (num_at ..).trans eq
  | some l => exact (fixed_scaled_eval r l k j p).trans (scale_fixed r k j l)

theorem shiftEdge {S t} (e : Edge S t) {r : Tag} {a b : Label} {k j K J P h H d : Nat}
    (eq : e.exactly k h) (old : numVal r k j a b=(denom r j:Int)*h)
    (keep : stable k j e.shift K J P) (newEq : numVal r K J a b=scale d H) (odd : H%2=1) :
    R02NearPlan.step (S.map (val K H)) (number K t) := by
  let W:=wire r a b
  let f:=gatePoly e.tag (W e.left) (W e.right) (W (some t))
  have ⟨bx,w⟩:=gate_size e.tag (wire_size r a b e.left) (wire_size r a b e.right) (wire_size r a b (some t))
  have nilOld : eval k j e.shift f=0 := by
    dsimp only [f,W]
    rw [gate_eval,same_value old,same_value old,same_value old,scaled_mix]
    change (denom r j:Int)*mix e.tag (pow e.shift) (val k h e.left) (val k h e.right) (number k t)=0
    rw [show mix e.tag (pow e.shift) _ _ _=0 from eq,Int.mul_zero]
  have nilNew:=(keep f bx w).2.mp nilOld
  unfold f W at nilNew
  rw [gate_eval,fact_value newEq,fact_value newEq,fact_value newEq] at nilNew
  have o (z : Option Label) : val K H z%2=1 := by cases z with
    | none => exact odd
    | some l => exact fixed_odd l K
  exact ⟨_,List.mem_map_of_mem e.ml,_,List.mem_map_of_mem e.mr,
    unscale (o _) (o _) (fixed_odd t K) _ _ _ P e.tag nilNew⟩

def phaseN (k : Nat) := 16*(41-k%31)
theorem phase (k : Nat) : (k+2*phaseN k)%31=10 := by unfold phaseN;omega

def coreLabels : List Label := [.source,.anchor,.base,.base32,.base128,.c,.d]
def coreWires := coreLabels.map some
theorem core_names (k : Nat) : coreLabels.map (number k)=R02NearFamily.core k := rfl
theorem core_values (k h : Nat) : coreWires.map (val k h)=R02NearFamily.core k := rfl

/-- Transfer even a sole gate out of the granted core to the obstructed phase. -/
theorem bare {k : Nat} (large : 104<k) {l : Label}
    (g : R02NearPlan.step (R02NearFamily.core k) (number k l)) :
    R02NearPlan.step (R02NearFamily.core (k+2*phaseN k)) (number (k+2*phaseN k) l) := by
  obtain ⟨a,ma,b,mb,q⟩:=g
  rw [←core_names] at ma mb
  obtain ⟨A,maL,rfl⟩:=List.mem_map.mp ma
  obtain ⟨B,mbL,rfl⟩:=List.mem_map.mp mb
  obtain ⟨s,p,_,eq⟩:=gate q
  obtain ⟨J,P,_,all⟩:=all_polynomials (j:=0) (s:=p) (t:=0) large (phaseN k)
  let K:=k+2*phaseN k
  let f:=gatePoly s (MCMWidthGate.fixed A) (MCMWidthGate.fixed B) (MCMWidthGate.fixed l)
  have sz (b : Label) : weight (MCMWidthGate.fixed b)≤1100 ∧ box 1 1 0 (MCMWidthGate.fixed b) :=
    ⟨Nat.le_trans (fixed_weight b) (by decide),box_weaken (fixed_box b) (by decide) (by decide) (by decide)⟩
  obtain ⟨bx,w⟩:=gate_size s (sz A) (sz B) (sz l)
  have z : eval k 0 p f=0 := by simpa [f,gate_eval,fixed_eval] using eq
  have h:=((all f bx w).1).2.mp z
  change eval K J P f=0 at h
  simp only [f,gate_eval,fixed_eval] at h
  rw [←core_names]
  exact ⟨_,List.mem_map_of_mem maL,_,List.mem_map_of_mem mbL,
    unscale (fixed_odd A K) (fixed_odd B K) (fixed_odd l K) 0 0 0 P s (by simpa [scale] using h)⟩

/-- Transport the shared helper and both endpoint gates using one common
parameter increment, including repeated parents and either endpoint order. -/
theorem ordered {k h : Nat} (large : 104<k) (hpos : 0<h) (narrow : h<cap k)
    (birth : R02NearPlan.step (R02NearFamily.core k) h) (l m : Label)
    (first : R02NearPlan.step (h::R02NearFamily.core k) (number k l))
    (last : R02NearPlan.step (number k l::h::R02NearFamily.core k) (number k m)) :
    let K:=k+2*phaseN k
    ∃ H, H<cap K ∧ R02NearPlan.step (R02NearFamily.core K) H ∧
      R02NearPlan.step (H::R02NearFamily.core K) (number K l) ∧
      R02NearPlan.step (number K l::H::R02NearFamily.core K) (number K m) := by
  let K:=k+2*phaseN k
  obtain ⟨a,ma,b,mb,g⟩:=birth
  rw [←core_names] at ma mb
  obtain ⟨A,mA,rfl⟩:=List.mem_map.mp ma
  obtain ⟨B,mB,rfl⟩:=List.mem_map.mp mb
  obtain ⟨r,j,_,eq⟩:=gate g
  have old : numVal r k j A B=(denom r j:Int)*h := num_birth r k j 0 h A B eq
  have posD : 0<denom r j := by unfold denom;split;exact Nat.two_pow_pos _;decide
  obtain ⟨e,he⟩:=getEdge (S:=none::coreWires) (h:=h) first
  obtain ⟨f,hf⟩:=getEdge (S:=some l::none::coreWires) (h:=h) last
  obtain ⟨J,S,T,out⟩:=all_polynomials (j:=j) (s:=e.shift) (t:=f.shift) large (phaseN k)
  have es : stable k j e.shift K J S := fun g b m=>(out g b m).1
  have fs : stable k j f.shift K J T := fun g b m=>(out g b m).2
  have ob : 0<(denom r j:Int)*h := Int.mul_pos (by omega) (by omega)
  have small := es (numerator r A B) (box_weaken (numerator_box r A B) (by decide) (by decide) (by decide))
    (Nat.le_trans (numerator_weight ..) (by decide))
  rw [num_at,num_at,old] at small
  have newpos:=small.1.mp ob
  have lsz:=limit_size r A B
  have limit:=es _ lsz.1 lsz.2
  rw [limit_eval,limit_eval,old] at limit
  have lt := Int.mul_lt_mul_of_pos_left (show (h:Int)<cap k by omega) (show 0<(denom r j:Int) by omega)
  have nb := limit.1.mp (by omega)
  let N:=(numVal r K J A B).toNat
  have cast : (N:Int)=numVal r K J A B := Int.toNat_of_nonneg (by omega)
  obtain ⟨H,d,odd,hfactor,le⟩:=R06Normalize.odd_factor N (by omega)
  have factor : numVal r K J A B=scale d H := by
    rw [←cast,hfactor];simp [scale,Int.natCast_pow,Int.mul_comm]
  have capH := cap_normalized r A B (K:=K) (J:=J) (h:=H) (by dsimp [K];omega) (by omega) (by omega)
  have born:=normalized_birth r K J A B odd factor
  refine ⟨H,capH,?_,shiftEdge e he old es factor odd,shiftEdge f hf old fs factor odd⟩
  rw [←core_names]
  exact ⟨_,List.mem_map_of_mem mA,_,List.mem_map_of_mem mB,born⟩

end MCMWidthOrder
#print axioms MCMWidthOrder.bare
#print axioms MCMWidthOrder.ordered
