import R02NearLower
namespace R02Tight
open MCM R02NearFamily R02Rigidity
/-- Eight distinct targets and infinitely many input widths. Nine gates attain
the optimum, and their smallest possible maximum bit length is exactly 2w−9. -/
def ExactAt (n : Nat) : Prop :=
    let k:=31*n+10
    let w:=k+9
    let T:=targets k
    T.length=8 ∧ T.Nodup ∧ (∀ t∈T,t<2^w) ∧ (∃ t∈T,2^(w-1)≤t) ∧
    ¬Fits unbounded T 8 ∧ Fits (· < 2^(2*w-9)) T 9 ∧ ¬Fits (· < 2^(2*w-10)) T 9

theorem from_audit (audit : Audit) (n : Nat) : ExactAt n := by
  unfold ExactAt
  dsimp only
  let k:=31*n+10
  have pk : k%31=10 := by dsimp [k]; omega
  obtain ⟨lo,hi,maxi,loH,hiH⟩ := R02NearUpper.sizes k
  have s9 : 2*(k+9)-9=k+k+9 := by omega
  have s8 : 2*(k+9)-10=k+k+8 := by omega
  change (targets k).length=8 ∧ _
  refine ⟨rfl,(target_shape k).1,fun t ht => Nat.lt_of_le_of_lt (maxi _ ht) hi,
    ⟨v k,by change v k∈targets k; simp [targets],?_⟩,R02NearLower.not_eight audit pk,?_,?_⟩
  · exact lo
  · change Fits (· < 2^(2*(k+9)-9)) (targets k) 9
    rw [s9]; exact R02NearUpper.build pk
  · change ¬Fits (· < 2^(2*(k+9)-10)) (targets k) 9
    rw [s8]; exact fun fit => (Nat.not_lt_of_ge loH) (R02NearLower.cap_needed audit pk fit)
end R02Tight
#print axioms R02Tight.from_audit
