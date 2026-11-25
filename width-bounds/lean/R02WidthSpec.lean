import R02Screen
import R02FilterData
namespace R02Rigidity
open R02Residue R02Screen R02FilterData
set_option maxRecDepth 131072
set_option maxHeartbeats 0

def both (h : Int) := (filter00 h && filter11 h) || (filter10 h && filter01 h)
def signature (phase : Nat) (C : Slot) (r : Row) :=
  r.b==C && r.phase==phase &&
    (if phase==10 then r.tag==⟨.right,true,false⟩ else r.tag==⟨.out,false,true⟩)
def mayAt (z : Int) : Result → Bool
  | .empty => false | .any => true | .single n => z==n

def firstCheck (phase : Nat) (T C : Slot) :=
  let z:=red ((pow phase+1)*262139)
  used.all (fun B => (rowList helper B T).all (fun r => !mayAt z r.result || signature phase C r))
theorem first_signature {phase T C B tag j h a t} (checked : firstCheck phase T C=true)
    (phaseEq : red (h:Nat)=red ((pow phase+1)*262139)) (mem : B∈used)
    (ra : represents h a B) (rt : represents h t T) (eq : mix tag (pow j) h a t=0) :
    signature phase C (Row.mk helper B T tag (j%31))=true := by
  let r := Row.mk helper B T tag (j%31)
  have seq : r∈rowList helper B T := List.mem_flatMap.mpr ⟨tag,tag_mem _,List.mem_map.mpr
    ⟨_,List.mem_range.mpr (Nat.mod_lt _ (by decide)),rfl⟩⟩
  have test := List.all_eq_true.mp (List.all_eq_true.mp checked B mem) r seq
  have real := row_sound (h:=h) (A:=helper) (by simp [represents,value,helper]) ra rt eq
  change holds r.result h at real
  have yes : mayAt (red ((pow phase+1)*262139)) r.result=true := by
    cases f : r.result <;> rw [f] at real <;> simp_all [holds,mayAt]
  simpa [yes] using test
structure Audit where
  first0 : checkPool used end0 filter00=true
  first1 : checkPool used end1 filter10=true
  last0 : checkPool (end1::used) end0 filter01=true
  last1 : checkPool (end0::used) end1 filter11=true
  birth : (rows start helper).all (birthSafe both)=true
  zero0 : filter00 0=false
  zero1 : filter10 0=false
  shapes :
    firstCheck 10 end0 (fixed 262105)=true ∧ firstCheck 10 end1 (fixed 261995)=true ∧
    firstCheck 21 end0 (fixed 262105)=true ∧ firstCheck 21 end1 (fixed 261995)=true
end R02Rigidity
#print axioms R02Rigidity.first_signature
