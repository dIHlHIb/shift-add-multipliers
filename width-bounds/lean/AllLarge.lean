import OrderLift
namespace MCMWidthAll
open MCM R02NearFamily R02NearPlan MCMWidthGate MCMWidthOrder MCMWidthLift

def familyExact (k : Nat) : Prop :=
  let w:=k+9
  let T:=targets k
  T.length=8 ∧ T.Nodup ∧ (∀ t∈T,t<2^w) ∧ (∃ t∈T,2^(w-1)≤t) ∧
    ¬Fits unbounded T 8 ∧ Fits (· < 2^(2*w-9)) T 9 ∧ ¬Fits (· < 2^(2*w-10)) T 9

private theorem positive_valid {P : Nat → Prop} {xs : List Nat} (v : Valid P xs) :
    Valid (fun z=>0<z ∧ P z) xs := by
  induction xs with
  | nil => trivial
  | cons a xs ih =>
    have odd:=v.2.1
    exact ⟨ih v.1,odd,⟨by omega,v.2.2.1⟩,v.2.2.2⟩

theorem no_eight {k : Nat} (nu : ¬step (core k) (u k)) (nv : ¬step (core k) (v k)) :
    ¬Fits unbounded (targets k) 8 := by
  intro fit
  obtain ⟨nd,nt,notU,_,_⟩:=target_shape k
  obtain ⟨xs,valid,_,cover,_,cnt⟩:=R06Graph.extract (r:=0) nd nt fit
  obtain ⟨h,mh,f,g⟩:=R06Graph.escape valid (show 1∈core k from List.mem_cons_self)
    (fun sub=>notU (sub (cover (by simp [targets]))))
  by_cases mt : h∈targets k
  · have alt : h=u k ∨ h=v k := by
      simp only [core,targets,List.mem_cons,List.mem_nil_iff,or_false] at mt f
      grind
    rcases alt with rfl|rfl
    · exact nu g
    · exact nv g
  · have q:=List.length_pos_of_mem (List.mem_filter.mpr ⟨mh,by simpa using mt⟩ :
         h∈xs.filter (· ∉ targets k))
    omega

theorem assemble {k : Nat} (pos : 0<k) (zero : ¬Fits unbounded (targets k) 8)
    (bad : ¬Fits (· < cap k) (targets k) 9) : familyExact k := by
  obtain ⟨lo,hi,largest,_,_⟩:=R02NearUpper.sizes k
  have high : 2*(k+9)-9=k+k+9 := by omega
  have low : 2*(k+9)-10=k+k+8 := by omega
  exact ⟨rfl,(target_shape k).1,fun t m=>Nat.lt_of_le_of_lt (largest _ m) hi,
    ⟨v k,by simp [targets],lo⟩,zero,high ▸ R02NearUpper.build_positive pos,low ▸ bad⟩

/-- Every k above the explicit cutoff is covered, including all 31 residues. -/
theorem all_large (k : Nat) (large : 104<k) : familyExact k := by
  let K:=k+2*phaseN k
  have pk : K%31=10 := phase k
  have base:=R02NearLower.no_base R02Rigidity.checked pk
  have nu : ¬step (core k) (u k) := fun s=>base.1 (bare (l:=.u) large s)
  have nv : ¬step (core k) (v k) := fun s=>base.2 (bare (l:=.v) large s)
  apply assemble (by omega) (no_eight nu nv)
  rintro ⟨xs,len,valid,cover⟩
  have fit : Fits (fun z=>0<z ∧ z<cap k) (targets k) 9 := ⟨xs,len,positive_valid valid,cover⟩
  obtain ⟨h,⟨pos,narrow⟩,born,order⟩:=plan fit nu nv
  have lo : cap K≤wide K := (R02NearUpper.sizes K).2.2.2.1
  rcases order with ⟨a,b⟩|⟨a,b⟩
  · obtain ⟨H,c,birth,A,B⟩:=ordered large pos narrow born .u .v a b
    exact (Nat.not_lt_of_ge lo) (R02NearLower.order_forces R02Rigidity.checked pk c birth (Or.inl ⟨A,B⟩))
  · obtain ⟨H,c,birth,A,B⟩:=ordered large pos narrow born .v .u a b
    exact (Nat.not_lt_of_ge lo) (R02NearLower.order_forces R02Rigidity.checked pk c birth (Or.inr ⟨A,B⟩))

end MCMWidthAll
#print axioms MCMWidthAll.all_large
