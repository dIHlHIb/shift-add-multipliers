import R02Certificate
namespace R02Cut
open MCM R06Candidates

def pt (n z : Nat) :=
  decide (0<z ∧ 2*z≤n ∧ n%z=0) && decide (2^(logFuel (n/z) (n/z))*z=n)
theorem pt_iff (n z : Nat) : pt n z=true ↔ PowerTimes n z := by
  simp only [pt,Bool.and_eq_true,decide_eq_true_eq,powerTimes_iff,logFuel_spec _ _ (Nat.le_refl _)]
  constructor
  · rintro ⟨⟨pos,lo,_⟩,eq⟩
    have j : 0<(n/z).log2 := by
      apply Classical.byContradiction
      intro hb
      have zero : (n/z).log2=0 := by omega
      rw [zero,Nat.pow_zero,Nat.one_mul] at eq
      omega
    exact ⟨pos,_,j,eq.symm⟩
  · rintro ⟨pos,j,hj,rfl⟩
    have l:=Nat.mul_le_mul_right z (show 2^1≤2^j from Nat.pow_le_pow_right (by decide : 0<2) hj)
    exact ⟨⟨pos,l,by simp⟩,by simp [Nat.mul_div_cancel _ pos,Nat.log2_two_pow]⟩
def orient (a b t : Nat) := pt (a+b) t || pt (a-b) t || pt (b-a) t
def test (a b t : Nat) := orient a b t || orient a t b || orient b t a
theorem test_iff (a b t : Nat) : test a b t=true ↔ Gate a b t := by
  simp [test,orient,pt_iff,Gate,Oriented,or_assoc]

def derives (xs : List Nat) (t : Nat) := (1::xs).any (fun a => (1::xs).any (fun b => test a b t))
theorem derives_eq (xs : List Nat) (t : Nat) : derives xs t=makes xs t := by
  apply Bool.eq_iff_iff.mpr
  simp [derives,makes_iff,List.any_eq_true,test_iff]

/-- Grant the cut at the start. No target beyond it can be the next gate. -/
def closed (T S : List Nat) := T.all (fun t => decide (t∈1::S) || !derives S t)
def misses (T S : List Nat) := T.any (fun t => decide (t∉1::S))
private theorem blocked {T S a b t} (cl : closed T S=true) (mt : t∈T)
    (notin : t∉1::S) (ma : a∈1::S) (mb : b∈1::S) : ¬Gate a b t := by
  intro g
  have m := (makes_iff S t).mpr ⟨a,ma,b,mb,g⟩
  have z := List.all_eq_true.mp cl t mt
  simp [notin,derives_eq,m] at z

private theorem outside {T S xs : List Nat} (cover : T⊆xs) (miss : misses T S=true) :
    ¬xs⊆1::S := by
  obtain ⟨t,mem,neg⟩:=List.any_eq_true.mp miss
  exact fun sub => (of_decide_eq_true neg) (sub (cover mem))

def viable (S : List Nat) (B h : Nat) :=
  decide (1<h ∧ h<2^B ∧ h%2=1) && derives S h

/-- One unrestricted solution gives a bounded helper from the granted cut.
The same single helper must cross any proposed follow-up cut. -/
theorem reject {T S : List Nat} {B : Nat} (nd : T.Nodup) (nt : 1∉T)
    (width : ∀ t∈T,t<2^B) (small : ∀ z∈1::S,z<2^(2*B))
    (cl : closed T S=true) (miss : misses T S=true)
    (nogo : ∀ h∈children (2*B) (1::S), viable S (2*B) h=true → h∉T →
       ∃ D : List Nat,h∈1::D ∧ closed T D=true ∧ misses T D=true) :
    ¬Fits unbounded T (T.length+1) := by
  intro f
  have narrow:=R02Width.twice_width nd nt width f
  obtain ⟨xs,valid,clean,cover,_,cnt⟩ := R06Graph.extract nd nt narrow
  obtain ⟨h,mem,notin,a,ma,b,mb,g⟩ := R06Graph.escape valid List.mem_cons_self (outside cover miss)
  have foreign : h∉T := fun mt => blocked cl mt notin ma mb g
  have actual_parent {ys : List Nat} (v : Valid (· < 2^(2*B)) ys) {z : Nat} (mz : z∈ys) :
      z<2^(2*B) ∧ z%2=1 := by
    induction ys with
    | nil => contradiction
    | cons a ys ih => rcases List.mem_cons.mp mz with rfl|m; exact ⟨v.2.2.1,v.2.1⟩; exact ih v.1 m
  have hh:=actual_parent valid mem
  have inh:=child_mem ma mb (small _ ma) (small _ mb) hh.1 g
  have ne : h≠1 := fun e => notin (e ▸ List.mem_cons_self)
  have live : viable S (2*B) h=true := by
    have mk := (makes_iff S h).mpr ⟨a,ma,b,mb,g⟩
    simp [viable,derives_eq,mk,hh,show 1<h by omega]
  obtain ⟨D,dh,clD,miD⟩ := nogo h inh live foreign
  obtain ⟨q,mq,nq,x,mx,y,my,gq⟩ := R06Graph.escape valid List.mem_cons_self (outside cover miD)
  have qforeign : q∉T := fun mt => blocked clD mt nq mx my gq
  have fm (z) (m : z∈xs) (nf : z∉T) : z∈xs.filter (· ∉ T) := List.mem_filter.mpr ⟨m,by simpa using nf⟩
  have hm:=fm h mem foreign
  have qm:=fm q mq qforeign
  generalize xs.filter (· ∉ T)=ys at cnt hm qm
  cases ys with
  | nil => contradiction
  | cons head ys =>
    have e : ys=[] := List.length_eq_zero_iff.mp (by simp only [List.length_cons] at cnt; omega)
    simp [e] at hm qm
    exact nq ((qm.trans hm.symm).symm ▸ dh)

def cutFor (S : List Nat) (cases : List (Nat × List Nat)) (h : Nat) :=
   h::((cases.lookup h).getD S)
def candidates (S : List Nat) (B : Nat) := (Std.TreeSet.ofList (children (2*B) (1::S))).toList
def mixedList (T S : List Nat) (B : Nat) :=
  (T.filter (fun t => decide (t∉1::S))).flatMap fun t => (1::S).flatMap fun c => pair (2*B) c t
def mayRepeat (h t : Nat) :=
  decide (h≤t ∨ h%2≠1 ∨ t%2≠1) && test h h t
theorem mayRepeat_iff (h t : Nat) : mayRepeat h t=true ↔ Gate h h t := by
  simp only [mayRepeat,Bool.and_eq_true,decide_eq_true_eq,test_iff]
  constructor
  · exact And.right
  · intro g
    refine ⟨?_,g⟩
    by_cases oh : h%2=1
    · by_cases ot : t%2=1
      · exact Or.inl (R02Arithmetic.repeated oh ot g)
      · exact Or.inr (Or.inr ot)
    · exact Or.inr (Or.inl oh)
def activated (T S : List Nat) (M : Std.TreeSet Nat) (h : Nat) :=
  M.contains h || T.any (fun t => decide (t∉1::S) && mayRepeat h t)

private theorem default_closed {T S : List Nat} {B h : Nat} (cl : closed T S=true)
    (tw : ∀ t∈T,t<2^(2*B)) (sw : ∀ t∈1::S,t<2^(2*B)) (hw : h<2^(2*B))
    (no : activated T S (Std.TreeSet.ofList (mixedList T S B)) h=false) : closed T (h::S)=true := by
  apply List.all_eq_true.mpr
  intro t mt
  by_cases base : t∈1::S
  · have mem : t∈1::h::S := by simp only [List.mem_cons] at *; grind
    simp [mem]
  · have mixed (c) (mc : c∈1::S) (g : Gate h c t) : False := by
      have mem : h∈mixedList T S B := List.mem_flatMap.mpr
        ⟨t,List.mem_filter.mpr ⟨mt,by simp [base]⟩,List.mem_flatMap.mpr
          ⟨c,mc,covers (sw c mc) (tw t mt) hw ((gate_cycle ..).mp g)⟩⟩
      have yes : (Std.TreeSet.ofList (mixedList T S B)).contains h=true := by simpa [Std.TreeSet.contains_ofList] using mem
      simp [activated,yes] at no
    have noGate : derives (h::S) t=false := by
      rw [derives_eq]; apply Bool.eq_false_iff.mpr
      intro yes
      obtain ⟨a,ma,b,mb,g⟩ := (makes_iff ..).mp yes
      have splitP (z) (m : z∈1::h::S) : z=h ∨ z∈1::S := by simp only [List.mem_cons] at *; grind
      rcases splitP a ma with rfl|ma <;> rcases splitP b mb with eq|mb
      · subst b
        have yes : T.any (fun t => decide (t∉1::S) && mayRepeat a t)=true :=
          List.any_eq_true.mpr ⟨t,mt,by simp [base,(mayRepeat_iff ..).mpr g]⟩
        unfold activated at no
        rw [yes,Bool.or_true] at no
        contradiction
      · exact mixed _ mb g
      · subst b; exact mixed _ ma ((gate_swap ..).mp g)
      · exact blocked cl mt base ma mb g
    simp [noGate]

def check (T S : List Nat) (B : Nat) (cases : List (Nat × List Nat)) :=
  let M:=Std.TreeSet.ofList (mixedList T S B)
  (candidates S B).all (fun h => !(decide (1<h ∧ h<2^(2*B) ∧ h%2=1)) || !activated T S M h || !viable S (2*B) h ||
    (closed T (cutFor S cases h) && misses T (cutFor S cases h)))

theorem lower {T S : List Nat} {B : Nat} {cases} (nd : T.Nodup) (nt : 1∉T)
    (tw : T.all (· < 2^B)=true) (sw : (1::S).all (· < 2^(2*B))=true)
    (cl : closed T S=true) (miss : misses T S=true)
    (ok : check T S B cases=true) {k : Nat} (fit : Fits unbounded T k) : T.length+2≤k := by
  apply Classical.byContradiction
  intro small
  obtain ⟨xs,len,v,tc⟩ := fit
  apply reject nd nt (fun t mt => of_decide_eq_true (List.all_eq_true.mp tw t mt))
    (fun s ms => of_decide_eq_true (List.all_eq_true.mp sw s ms)) cl miss _ ⟨xs,by omega,v,tc⟩
  intro h mh lived foreign
  have hm : h∈(candidates S B) := by simpa [candidates,Std.TreeSet.mem_toList,Std.TreeSet.mem_ofList] using mh
  have yes:=List.all_eq_true.mp ok h hm
  by_cases act : activated T S (Std.TreeSet.ofList (mixedList T S B)) h=true
  · have eligible : decide (1<h ∧ h<2^(2*B) ∧ h%2=1)=true :=
      (by simpa only [viable,Bool.and_eq_true] using lived : decide _=true ∧ _).1
    simp [lived,act,eligible] at yes
    exact ⟨_,List.mem_cons_of_mem 1 (List.mem_cons_self (a:=h)),yes.1,yes.2⟩
  · have ww (t) (mt : t∈T) : t<2^(2*B) := Nat.lt_of_lt_of_le
          (of_decide_eq_true (List.all_eq_true.mp tw t mt)) (Nat.pow_le_pow_right (by decide) (by omega))
    have info : 1<h ∧ h<2^(2*B) ∧ h%2=1 := by
      simpa only [viable,Bool.and_eq_true,decide_eq_true_eq] using (show decide (1<h ∧ h<2^(2*B) ∧ h%2=1)=true from (by simpa only [viable,Bool.and_eq_true] using lived : decide _=true ∧ _).1)
    refine ⟨h::S,by simp,default_closed cl ww (fun s ms => of_decide_eq_true (List.all_eq_true.mp sw s ms)) info.2.1
      (Bool.eq_false_iff.mpr act),?_⟩
    obtain ⟨t,m,neg⟩:=List.any_eq_true.mp miss
    apply List.any_eq_true.mpr; refine ⟨t,m,?_⟩
    have dif : t≠h := fun eq => foreign (eq ▸ m)
    have n := of_decide_eq_true neg
    simp only [List.mem_cons] at n ⊢; simp_all
end R02Cut
#print axioms R02Cut.lower
