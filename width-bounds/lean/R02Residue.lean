import McmAudit
import R02Inverse
namespace R02Residue
open MCM
def M : Int := 2147483647
def red (v : Int) := v%M
def pow (j : Nat) : Int := (2:Int)^j

theorem pow_sum (a b : Nat) : pow (a+b)=pow a*pow b := by
  induction b with
  | zero => simp [pow]
  | succ b ih =>
    change (2:Int)^(a+b+1)=pow a*(2:Int)^(b+1)
    rw [Int.pow_succ,Int.pow_succ]
    change pow (a+b)*2=pow a*(pow b*2)
    rw [ih,Int.mul_assoc]

theorem periodic (j : Nat) : red (pow j) = red (pow (j%31)) := by
  induction j using Nat.strongRecOn with
  | ind j ih =>
    by_cases small : j<31
    · rw [Nat.mod_eq_of_lt small]
    · have eq : j=(j-31)+31 := by omega
      have step : red (pow j)=red (pow (j-31)) := by
        calc
          red (pow j)=red (pow ((j-31)+31)) := congrArg (fun n => red (pow n)) eq
          _=red (pow (j-31)) := by
            rw [pow_sum]
            unfold red
            rw [Int.mul_emod]
            change (((2:Int)^(j-31))%M * 1)%M=_
            rw [Int.mul_one,Int.emod_emod]
            rfl
      have rem : (j-31)%31=j%31 := by omega
      exact step.trans ((ih (j-31) (by omega)).trans (by rw [rem]))

inductive Pos | left | right | out deriving DecidableEq, Repr
structure Tag where
  pos : Pos
  e : Bool
  f : Bool
  deriving DecidableEq, Repr

def sig (b : Bool) : Int := if b then 1 else -1
def mix (s : Tag) (q a b t : Int) : Int :=
  match s.pos with
  | .left => q*a+sig s.e*b+sig s.f*t
  | .right => q*b+sig s.e*t+sig s.f*a
  | .out => q*t+sig s.e*a+sig s.f*b

private theorem oriented {a b z : Nat} (h : Oriented a b z) :
    ∃ j : Nat, 0<j ∧ ∃ e f : Bool, pow j*z+sig e*a+sig f*b=0 := by
  rcases h with h|h|h
  all_goals
    obtain ⟨pos,j,hj,eq⟩ := (powerTimes_iff ..).mp h
    have pn := Nat.mul_pos (Nat.two_pow_pos j) pos
    have cast : ((2^j*z:Nat):Int)=pow j*z := by simp [pow,Int.natCast_pow]
  · exact ⟨j,hj,false,false,by simp [sig]; omega⟩
  · exact ⟨j,hj,false,true,by simp [sig]; omega⟩
  · exact ⟨j,hj,true,false,by simp [sig]; omega⟩

theorem gate {a b t : Nat} (h : Gate a b t) :
    ∃ tag j, 0<j ∧ mix tag (pow j) a b t=0 := by
  rcases h with h|h|h
  · obtain ⟨j,hj,e,f,eq⟩ := oriented h
    exact ⟨⟨.out,e,f⟩,j,hj,eq⟩
  · obtain ⟨j,hj,e,f,eq⟩ := oriented h
    exact ⟨⟨.right,f,e⟩,j,hj,by change pow j*b+sig f*t+sig e*a=0; omega⟩
  · obtain ⟨j,hj,e,f,eq⟩ := oriented h
    exact ⟨⟨.left,e,f⟩,j,hj,eq⟩

def tags := [Pos.left, .right, .out].flatMap fun p =>
  [true,false].flatMap fun e => [true,false].map fun f => Tag.mk p e f
theorem tag_mem (s : Tag) : s∈tags := by
  obtain ⟨p,e,f⟩ := s
  cases p <;> cases e <;> cases f <;> decide

theorem red_add {a b a' b' : Int} (x : red a=red a') (y : red b=red b') :
    red (a+b)=red (a'+b') := by
  unfold red at *; rw [Int.add_emod a b,Int.add_emod a' b',x,y]
theorem red_mul {a b a' b' : Int} (x : red a=red a') (y : red b=red b') :
    red (a*b)=red (a'*b') := by
  unfold red at *; rw [Int.mul_emod a b,Int.mul_emod a' b',x,y]

theorem red_mix (s : Tag) {q a b t Q A B T : Int}
    (hq : red q=red Q) (ha : red a=red A) (hb : red b=red B) (ht : red t=red T) :
    red (mix s q a b t)=red (mix s Q A B T) := by
  cases s with
  | mk pos e f =>
    cases pos <;> simp only [mix] <;>
      exact red_add (red_add (red_mul hq (by assumption)) (red_mul rfl (by assumption)))
        (red_mul rfl (by assumption))

structure Slot where
  slope : Int
  offset : Int
  deriving DecidableEq, Repr
def fixed (z : Int) : Slot := ⟨0,z⟩
def helper : Slot := ⟨1,0⟩
def value (s : Slot) (h : Int) := s.slope*h+s.offset
def line (s : Tag) (q : Int) (a b t : Slot) : Slot :=
  ⟨mix s q a.slope b.slope t.slope,mix s q a.offset b.offset t.offset⟩
theorem linear (s : Tag) (q h : Int) (a b t : Slot) :
    value (line s q a b t) h = mix s q (value a h) (value b h) (value t h) := by
  cases s with
  | mk p e f =>
    cases p <;> simp only [value,line,mix,Int.add_mul,Int.mul_add,Int.mul_assoc] <;> ac_rfl

inductive Result | any | empty | single (z : Int) deriving DecidableEq, Repr
def holds (r : Result) (h : Int) : Prop :=
  match r with | .any => True | .empty => False | .single z => red h=z
def inverse (a : Int) := R02Inverse.proposal a
def solve (l : Slot) : Result :=
  if red l.slope=0 then (if red l.offset=0 then .any else .empty)
  else let i:=inverse l.slope
       if red (i*l.slope)=1 then .single (red (-(i*l.offset))) else .any

theorem solve_sound (l : Slot) (h : Int) (ok : red (value l h)=0) : holds (solve l) h := by
  unfold solve
  split
  next zero =>
    have z : red (l.slope*h)=red 0 := by
      simpa using red_mul (b:=h) (b':=h) (a':=0) zero rfl
    have off : red (value l h)=red l.offset := by simpa [value] using red_add (b:=l.offset) z rfl
    simp [←off,ok,holds]
  next nz =>
    let i:=inverse l.slope
    dsimp only
    split
    next inv =>
      change red h=red (-(i*l.offset))
      have prod : red (i*value l h)=red (i*0) := red_mul rfl ok
      have sub : red ((i*l.slope)*h)=red (1*h) := red_mul inv rfl
      have zero : red (h+i*l.offset)=red 0 := by
        rw [value,Int.mul_add,←Int.mul_assoc] at prod
        simpa using (red_add (b:=i*l.offset) sub.symm rfl).trans prod
      have shifted := red_add (b:= -(i*l.offset)) zero rfl
      simpa [Int.add_assoc,Int.add_right_neg] using shifted
    next bad => trivial

end R02Residue
#print axioms R02Residue.gate
#print axioms R02Residue.solve_sound
