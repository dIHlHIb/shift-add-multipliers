import R06Value
namespace R06Rebuild
open MCM McmSmall R06Expansion R06Trace R06Normalize R06Value R06Paths

private theorem two_signs (s t : Bool) (z : Int) : signed s (signed t z)=signed (xor s t) z := by
  cases s <;> cases t <;> simp [signed,xor]

private theorem clear (v : Nat) (k : Int) :
    (v:Int)*power k=((v*2^k.toNat:Nat):Int) := by simp [power,Int.natCast_pow]

theorem step {x : Vec} {a b : Expr} {v w t : Nat} (ha : Label x a v) (hb : Label x b w)
    (ht : t=0 ∨ t%2=1) (na nb : Bool) (p q : Int)
    (out : ∃ s : Bool, ∃ d K : Int, ∀ k : Int, K≤k →
      branch x na nb a b p q k=signed s ((t:Int)*power (k+d))) : Outcome v w t := by
  obtain ⟨cv,sa,da,Ka,A⟩ := ha
  obtain ⟨cw,sb,db,Kb,B⟩ := hb
  obtain ⟨sc,dc,Kc,C⟩ := out
  let k := max Kc (max (Ka-p) (Kb-q))
  have eq := C k (by dsimp [k]; omega)
  rw [branch,A _ (by dsimp [k]; omega),B _ (by dsimp [k]; omega),two_signs,two_signs,
    clear,clear,clear] at eq
  exact normalize cv cw ht _ _ _ _ _ _ eq

def live (ys : List Nat) (v : Nat) := v=0 ∨ v∈1::ys

private theorem place {ys : List Nat} {cap : Nat → Prop} {a b v : Nat} (valid : Valid cap ys)
    (la : live ys a) (lb : live ys b) (o : v=0 ∨ v%2=1) (bound : cap v)
    (action : Outcome a b v) :
    ∃ zs, Valid cap zs ∧ zs.length≤ys.length+1 ∧ (1::ys) ⊆ (1::zs) ∧ live zs v := by
  have reuse (old : live ys v) : ∃ zs, Valid cap zs ∧ zs.length≤ys.length+1 ∧ (1::ys) ⊆ (1::zs) ∧ live zs v :=
    ⟨ys,valid,by omega,fun _ h => h,old⟩
  cases action with
  | zero eq => exact reuse (Or.inl eq)
  | left eq => exact reuse (eq ▸ la)
  | right eq => exact reuse (eq ▸ lb)
  | gate oa ob g =>
    rcases o with h|odd
    · exact reuse (Or.inl h)
    · have ma : a∈1::ys := la.resolve_left (by omega)
      have mb : b∈1::ys := lb.resolve_left (by omega)
      refine ⟨v::ys,⟨valid,odd,bound,(makes_iff ..).mpr ⟨a,ma,b,mb,g⟩⟩,by simp,?_,Or.inr (by simp)⟩
      intro z hz
      rcases List.mem_cons.mp hz with rfl|hz
      · simp
      · simp [hz]

def widthExp (r w U : Nat) := r+w+2*((2*r)*U)
def bounded (r w U v : Nat) := v≤2^(widthExp r w U)
private theorem cap_target (r w U : Nat) (a : Nat) (h : a≤2^w) : bounded r w U a := by
  exact Nat.le_trans h (Nat.pow_le_pow_right (by decide) (by unfold widthExp; omega))

private theorem forward {T xs h env eqs} (tr : Trace T xs h env eqs) {r w U : Nat} {x : Vec}
    (hr : h≤r) (width : ∀ t∈1::T, t≤2^w) (odd : ∀ t∈1::T,t%2=1)
    (sm : Within (2*r) U x) (ok : ∀ e∈eqs, TargetEq.Holds e x) :
    ∃ ys, Valid (bounded r w U) ys ∧ ys.length≤xs.length ∧
      ∀ a∈1::xs, Scoped T h (env a) ∧
        ∃ v, live ys v ∧ Label x (env a) v ∧ (a∈T → v=a) := by
  induction tr with
  | start =>
    refine ⟨[],trivial,by simp,?_⟩
    intro a ha
    simp only [List.mem_singleton] at ha
    subst a
    exact ⟨by simp [Scoped],1,Or.inr (by simp),anchor_label _ _ (by decide),fun _ => rfl⟩
  | @helper xs h env es t a b na nb tr ha hb ht ih =>
    obtain ⟨ys,vy,ly,avail⟩ := ih (by omega) ok
    obtain ⟨sca,A,liveA,labA,_⟩ := avail a ha
    obtain ⟨scb,B,liveB,labB,_⟩ := avail b hb
    let e := Expr.join h na nb (env a) (env b)
    have sc : Scoped T (h+1) e := ⟨by omega,sca,scb⟩
    obtain ⟨v,lab,cap⟩ := bounded_label (scoped_mono sc hr) width sm
    have action := step labA labB lab.1 na nb (x (2*h)) (x (2*h+1)) lab.2
    obtain ⟨zs,vz,lz,carry,keep⟩ := place vy liveA liveB lab.1 cap action
    refine ⟨zs,vz,by simp only [List.length_cons]; omega,?_⟩
    intro z hz
    by_cases same : z=t
    · subst z
      simpa only [put,if_pos rfl] using
        (show Scoped T (h+1) e ∧ ∃ v', live zs v' ∧ Label x e v' ∧ (t∈T → v'=t) from
        ⟨sc,v,keep,lab,fun m => (ht m).elim⟩)
    · rw [put,if_neg same]
      have earlier : z∈1::xs := by simp only [List.mem_cons] at hz ⊢; grind
      obtain ⟨scz,vz',mem,lbl,tar⟩ := avail z earlier
      exact ⟨scoped_mono scz (by omega),vz',mem.imp_right (fun h => carry h),lbl,tar⟩
  | @target xs h env es t a b na nb tr ha hb ht ih =>
    obtain ⟨ys,vy,ly,avail⟩ := ih hr (fun e he => ok e (List.mem_cons_of_mem _ he))
    obtain ⟨_,A,liveA,labA,_⟩ := avail a ha
    obtain ⟨_,B,liveB,labB,_⟩ := avail b hb
    have memT : t∈1::T := List.mem_cons_of_mem _ ht
    obtain ⟨p,q,K,witness⟩ := ok _ List.mem_cons_self
    have out : ∃ s : Bool, ∃ d K : Int, ∀ k : Int, K≤k →
        branch x na nb (env a) (env b) p q k=signed s ((t:Int)*power (k+d)) :=
      ⟨false,0,K,fun k hk => by simpa [signed,power] using witness k hk⟩
    have canon := Or.inr (a:=t=0) (odd _ memT)
    have action := step labA labB canon na nb p q out
    obtain ⟨zs,vz,lz,carry,keep⟩ := place vy liveA liveB canon (cap_target r w U t (width _ memT)) action
    refine ⟨zs,vz,by simp only [List.length_cons]; omega,?_⟩
    intro z hz
    by_cases same : z=t
    · subst z
      simp only [put,if_pos rfl]
      exact ⟨memT,t,keep,anchor_label _ _ (odd _ memT),fun _ => rfl⟩
    · rw [put,if_neg same]
      have earlier : z∈1::xs := by simp only [List.mem_cons] at hz ⊢; grind
      obtain ⟨sc,v,m,lab,tar⟩ := avail z earlier
      exact ⟨sc,v,m.imp_right (fun h => carry h),lab,tar⟩

theorem reconstruct {T xs h env eqs} (tr : Trace T xs h env eqs) {r w U : Nat} {x : Vec}
    (sub : T ⊆ xs) (len : xs.length≤T.length+r) (hr : h≤r)
    (width : ∀ t∈1::T,t≤2^w) (odd : ∀ t∈1::T,t%2=1)
    (sm : Within (2*r) U x) (ok : ∀ e∈eqs, TargetEq.Holds e x) :
    Fits (bounded r w U) T (T.length+r) := by
  obtain ⟨ys,hv,hl,all⟩ := forward tr hr width odd sm ok
  refine ⟨ys,by omega,hv,?_⟩
  intro t ht
  obtain ⟨_,v,livev,_,eq⟩ := all t (List.mem_cons_of_mem _ (sub ht))
  have hh := odd t (List.mem_cons_of_mem _ ht)
  rw [eq ht] at livev
  exact livev.resolve_left (by omega)

end R06Rebuild
#print axioms R06Rebuild.reconstruct
