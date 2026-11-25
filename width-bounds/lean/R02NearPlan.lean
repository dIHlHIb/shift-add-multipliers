import R02NearFamily
namespace R02NearPlan
set_option maxRecDepth 8192
open MCM R02NearFamily

def step (S : List Nat) (t : Nat) := ∃ a∈S,∃ b∈S, Gate a b t

/-- Arbitrarily grant all requested labels except two. If neither remaining
label is initially available, the unique foreign gate must precede both. -/
theorem plan_two {T S : List Nat} {u v : Nat} {cap : Nat → Prop}
    (fit : Fits cap T (T.length+1)) (nd : T.Nodup) (nt : 1∉T)
    (source : 1∈S) (memberU : u∈T) (memberV : v∈T)
    (nu : u∉S) (nv : v∉S) (ne : u≠v)
    (outside : ∀ z∈T,z∈S ∨ z=u ∨ z=v) (noU : ¬step S u) (noV : ¬step S v) :
    ∃ h, cap h ∧ step S h ∧
      ((step (h::S) u ∧ step (u::h::S) v) ∨
       (step (h::S) v ∧ step (v::h::S) u)) := by
  obtain ⟨xs,valid,_,cover,_,cnt⟩ := R06Graph.extract (r:=1) nd nt fit
  have mu : u∈xs := cover memberU
  have mv : v∈xs := cover memberV
  obtain ⟨h,mh,nh,birth⟩ := R06Graph.escape valid source (fun sub => nu (sub mu))
  have hu : h≠u := fun eq => noU (eq ▸ birth)
  have hv : h≠v := fun eq => noV (eq ▸ birth)
  have foreign : h∉T := by
    intro ht; rcases outside _ ht with bad|bad|bad <;> contradiction
  have mem_filtered (z) (mem : z∈xs) (nf : z∉T) : z∈xs.filter (· ∉ T) :=
    List.mem_filter.mpr ⟨mem,by simpa using nf⟩
  have only (z) (mem : z∈xs) : z=h ∨ z∈S ∨ z=u ∨ z=v := by
    by_cases y : z∈T
    · exact Or.inr (outside _ y)
    · have zm := mem_filtered z mem y
      have hm := mem_filtered h mh foreign
      generalize xs.filter (· ∉ T)=ys at cnt zm hm
      cases ys with
      | nil => contradiction
      | cons head tail =>
        have et : tail=[] := List.length_eq_zero_iff.mp (by simp only [List.length_cons] at cnt; omega)
        simp [et] at zm hm
        exact Or.inl (zm.trans hm.symm)
  have cap_mem {ys : List Nat} (vv : Valid cap ys) {z : Nat} (mem : z∈ys) : cap z := by
    induction ys with
    | nil => contradiction
    | cons a ys ih => rcases List.mem_cons.mp mem with rfl|q; exact vv.2.2.1; exact ih vv.1 q
  refine ⟨h,cap_mem valid mh,birth,?_⟩
  have first (z) (nz : z∉S) (hz : h≠z) : z∉h::S := by simp [Ne.symm hz,nz]
  have bu := first _ nu hu
  have bv := first _ nv hv
  obtain ⟨t,mt,miss,g⟩ := R06Graph.escape valid (List.mem_cons_of_mem h source) (fun sub => bu (sub mu))
  have last (a b : Nat) (ma : a∈xs) (nn : a∉h::S) (ab : a≠b)
      (cases_ : ∀ y∈xs,y=h ∨ y∈S ∨ y=a ∨ y=b) : step (b::h::S) a := by
    obtain ⟨y,my,ny,g⟩ := R06Graph.escape valid (List.mem_cons_of_mem b (List.mem_cons_of_mem h source))
      (fun sub => (by simp [ab,nn] : a∉b::h::S) (sub ma))
    rcases cases_ y my with eq|m|eq|eq
    · subst y; simp at ny
    · exact (ny (by simp [m])).elim
    · exact eq ▸ g
    · subst y; simp at ny
  rcases only t mt with eq|m|eq|eq
  · subst t; simp at miss
  · exact (miss (List.mem_cons_of_mem _ m)).elim
  · subst t
    exact Or.inl ⟨g,last _ _ mv bv (Ne.symm ne) (fun y m => by have := only y m; grind)⟩
  · subst t
    exact Or.inr ⟨g,last _ _ mu bu ne only⟩

theorem plan {k : Nat} {cap : Nat → Prop} (fit : Fits cap (targets k) 9)
    (noU : ¬step (core k) (u k)) (noV : ¬step (core k) (v k)) :
    ∃ h, cap h ∧ step (core k) h ∧
      ((step (h::core k) (u k) ∧ step (u k::h::core k) (v k)) ∨
       (step (h::core k) (v k) ∧ step (v k::h::core k) (u k))) := by
  obtain ⟨nd,nt,nu,nv,ne⟩ := target_shape k
  apply plan_two fit nd nt List.mem_cons_self (by simp [targets]) (by simp [targets]) nu nv ne _ noU noV
  intro z m
  simp only [targets,core,List.mem_cons,List.mem_nil_iff,or_false] at *; grind
end R02NearPlan
#print axioms R02NearPlan.plan
