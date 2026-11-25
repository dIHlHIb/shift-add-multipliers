import R02Residue
namespace R02Screen
open MCM R02Residue
structure Row where
  a : Slot
  b : Slot
  t : Slot
  tag : Tag
  phase : Nat
  deriving DecidableEq, Repr

def Row.result (r : Row) := solve (line r.tag (pow r.phase) r.a r.b r.t)
def rowList (a b t : Slot) :=
  tags.flatMap fun tag => (List.range 31).map fun j => Row.mk a b t tag j
def rows (P : List Slot) (t : Slot) :=
  P.flatMap fun a => P.flatMap fun b => rowList a b t
theorem mem_rows {P a b t} (ma : a∈P) (mb : b∈P) (tag : Tag) (j : Nat) :
    Row.mk a b t tag (j%31)∈rows P t := by
  exact List.mem_flatMap.mpr ⟨a,ma,List.mem_flatMap.mpr ⟨b,mb,List.mem_flatMap.mpr
    ⟨tag,tag_mem _,List.mem_map.mpr ⟨_,List.mem_range.mpr (Nat.mod_lt _ (by decide)),rfl⟩⟩⟩⟩

def represents (h z : Nat) (a : Slot) := red z=red (value a h)
theorem row_sound {h a b t : Nat} {A B T : Slot} {tag j}
    (ma : represents h a A) (mb : represents h b B) (mt : represents h t T)
    (realEq : mix tag (pow j) a b t=0) :
    holds (Row.mk A B T tag (j%31)).result h := by
  apply solve_sound
  rw [linear]
  exact ((red_mix tag (periodic j) ma mb mt).symm.trans (by rw [realEq]; rfl))

def permits (f : Int → Bool) : Result → Bool
  | .empty => true
  | .any => false
  | .single z => f z
theorem permits_sound {f r h} (safe : permits f r=true) (ok : holds r h) : f (red h)=true := by
  cases r with
  | any => contradiction
  | empty => contradiction
  | single z => change red h=z at ok; rwa [ok]

def checkPool (P : List Slot) (t : Slot) (f : Int → Bool) :=
  (rows P t).all (fun r => permits f r.result)

theorem pool_sound {P T f h a b t} (safe : checkPool P T f=true)
    (ma : ∃ A∈P,represents h a A) (mb : ∃ B∈P,represents h b B) (mt : represents h t T)
    (g : Gate a b t) : f (red h)=true := by
  obtain ⟨A,i,ma⟩ := ma
  obtain ⟨B,i',mb⟩ := mb
  obtain ⟨tag,j,_,eq⟩ := gate g
  exact permits_sound (List.all_eq_true.mp safe _ (mem_rows i i' tag j)) (row_sound ma mb mt eq)

def base : List Slot := [262143,262139,262107,262011,262105,261995].map fixed
def start := fixed 1 :: base
def end0 := fixed 296955
def end1 := fixed 409595
def used := helper::start
def goodShape (r : Row) :=
  r.a==fixed 262139 && r.b==fixed 262139 && (r.phase==10 || r.phase==21) &&
  (match r.tag.pos with | .left => r.tag.e | .right => r.tag.f | .out => false)

def birthSafe (f : Int → Bool) (r : Row) :=
  match r.result with
  | .empty => true
  | .any => false
  | .single z => !f z || goodShape r

theorem shape_sound {f r h} (audit : birthSafe f r=true) (ok : holds r.result h)
    (passes : f (red h)=true) : goodShape r=true := by
  unfold birthSafe at audit
  cases e : r.result with
  | empty => rw [e] at ok; contradiction
  | any => simp [e] at audit
  | single z =>
    rw [e] at ok; change red h=z at ok
    simpa [e,←ok,passes] using audit

end R02Screen
#print axioms R02Screen.pool_sound
#print axioms R02Screen.shape_sound
