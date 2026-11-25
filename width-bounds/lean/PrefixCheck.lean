import AllLarge
import R02Cut
import R06Candidates
namespace MCMWidthPrefix
open MCM R02NearFamily R02NearPlan MCMWidthLift R06Candidates

def exactDiv (n q : Nat) := if n%q=0 then n/q else 0
private theorem exact_mul (q z : Nat) (p : 0<q) : exactDiv (q*z) q=z := by
  simp [exactDiv,Nat.mul_div_cancel_left _ p]

def block (a b j : Nat) : List Nat :=
  let q:=2^j
  [exactDiv (a+b) q,exactDiv (a-b) q,exactDiv (b-a) q,
   q*b-a,a-q*b,a+q*b,q*a-b,b-q*a,b+q*a]

def mixed (B a b : Nat) := (List.range (B+1)).flatMap (block a b)

theorem mixed_covers {B a b h : Nat} (ha : a<2^B) (hb : b<2^B) (hh : h<2^B)
    (g : Gate a b h) : h∈mixed B a b := by
  have mem (j) (hj : j≤B) (m : h∈block a b j) : h∈mixed B a b :=
    List.mem_flatMap.mpr ⟨j,List.mem_range.mpr (by omega),m⟩
  rcases g with (g|g|g)|(g|g|g)|(g|g|g)
  · obtain ⟨j,_,l,e⟩:=pt_bound ha hb (Nat.le_refl _) g
    exact mem _ l (by simp only [block,e,exact_mul _ _ (Nat.two_pow_pos _)];simp)
  · obtain ⟨j,_,l,e⟩:=pt_bound ha hb (by omega) g
    exact mem _ l (by simp only [block,e,exact_mul _ _ (Nat.two_pow_pos _)];simp)
  · obtain ⟨j,_,l,e⟩:=pt_bound ha hb (by omega) g
    exact mem _ l (by simp only [block,e,exact_mul _ _ (Nat.two_pow_pos _)];simp)
  · obtain ⟨j,_,l,e⟩:=pt_bound ha hh (by omega) g
    exact mem _ l (by simp only [block,List.mem_cons,List.mem_nil_iff,or_false];omega)
  · obtain ⟨j,_,l,e⟩:=pt_bound ha hh (by omega) g
    have p:=Nat.mul_pos (Nat.two_pow_pos j) ((powerTimes_iff ..).mp g).1
    exact mem _ l (by simp only [block,List.mem_cons,List.mem_nil_iff,or_false];omega)
  · obtain ⟨j,_,l,e⟩:=pt_bound ha hh (by omega) g
    have p:=Nat.mul_pos (Nat.two_pow_pos j) ((powerTimes_iff ..).mp g).1
    exact mem _ l (by simp only [block,List.mem_cons,List.mem_nil_iff,or_false];omega)
  · obtain ⟨j,_,l,e⟩:=pt_bound hb hh (by omega) g
    exact mem _ l (by simp only [block,List.mem_cons,List.mem_nil_iff,or_false];omega)
  · obtain ⟨j,_,l,e⟩:=pt_bound hb hh (by omega) g
    have p:=Nat.mul_pos (Nat.two_pow_pos j) ((powerTimes_iff ..).mp g).1
    exact mem _ l (by simp only [block,List.mem_cons,List.mem_nil_iff,or_false];omega)
  · obtain ⟨j,_,l,e⟩:=pt_bound hb hh (by omega) g
    have p:=Nat.mul_pos (Nat.two_pow_pos j) ((powerTimes_iff ..).mp g).1
    exact mem _ l (by simp only [block,List.mem_cons,List.mem_nil_iff,or_false];omega)

def repeatedPool (B t : Nat) := t::(List.range (B+1)).flatMap fun j =>
    [exactDiv t (2^j-1),exactDiv t (2^j+1)]

theorem repeats {B h t : Nat} (hb : h<2^B) (tb : t<2^B)
    (oh : h%2=1) (ot : t%2=1) (g : Gate h h t) : h∈repeatedPool B t := by
  have le:=R02Arithmetic.repeated oh ot g
  have take (j) (l : j≤B) (m : h=exactDiv t (2^j-1) ∨ h=exactDiv t (2^j+1)) :
      h∈repeatedPool B t := List.mem_cons_of_mem _ (List.mem_flatMap.mpr
        ⟨j,List.mem_range.mpr (by omega),by simpa only [List.mem_cons,List.mem_nil_iff,or_false] using m⟩)
  have i (v : Oriented h t h) : h∈repeatedPool B t := by
    rcases v with v|v|v
    · obtain ⟨j,pos,l,e⟩:=pt_bound hb tb (Nat.le_refl _) v
      have p:=Nat.pow_le_pow_right (by decide : 0<2) (show 1≤j by omega)
      have eq : t=(2^j-1)*h := by rw [Nat.sub_mul,Nat.one_mul];omega
      exact take j l (Or.inl (by rw [eq,exact_mul _ _ (by omega)]))
    · obtain ⟨_,j,_,e⟩:=(powerTimes_iff ..).mp v
      have p:=Nat.mul_pos (Nat.two_pow_pos j) (show 0<h by omega)
      omega
    · obtain ⟨j,_,l,e⟩:=pt_bound hb tb (by omega) v
      have eq : t=(2^j+1)*h := by rw [Nat.add_mul,Nat.one_mul];omega
      exact take j l (Or.inr (by rw [eq,exact_mul _ _ (Nat.succ_pos _)]))
  rcases g with (g|g|g)|g|g
  · obtain ⟨_,j,_,e⟩:=(powerTimes_iff ..).mp g
    have eq:=R02Arithmetic.odd_unique oh ot 1 j (by simpa [Nat.two_mul] using e)
    exact eq ▸ List.mem_cons_self
  · obtain ⟨_,j,_,e⟩:=(powerTimes_iff ..).mp g
    have p:=Nat.mul_pos (Nat.two_pow_pos j) (show 0<t by omega)
    omega
  · obtain ⟨_,j,_,e⟩:=(powerTimes_iff ..).mp g
    have p:=Nat.mul_pos (Nat.two_pow_pos j) (show 0<t by omega)
    omega
  · exact i g
  · exact i g

def used (B : Nat) (S : List Nat) (t : Nat) :=
  (repeatedPool B t ++ S.flatMap (fun z=>mixed B z t)).filter fun h=>decide (h%2=1 ∧ h<2^B)

theorem used_mem {B S h t} (closed : ¬step S t) (s : step (h::S) t)
    (sw : ∀ z∈S,z<2^B) (hb : h<2^B) (tb : t<2^B) (oh : h%2=1) (ot : t%2=1) :
    h∈used B S t := by
  apply List.mem_filter.mpr
  refine ⟨?_,decide_eq_true ⟨oh,hb⟩⟩
  obtain ⟨a,ma,b,mb,g⟩:=s
  have one {b} (m:b∈S) (g : Gate h b t) : h∈S.flatMap (fun z=>mixed B z t) :=
    List.mem_flatMap.mpr ⟨b,m,mixed_covers (sw _ m) tb hb ((gate_cycle ..).mp g)⟩
  rcases List.mem_cons.mp ma with aeq|am <;> rcases List.mem_cons.mp mb with beq|bm
  · subst a;subst b;exact List.mem_append_left _ (repeats hb tb oh ot g)
  · subst a;exact List.mem_append_right _ (one bm g)
  · subst b;exact List.mem_append_right _ (one am ((gate_swap ..).mp g))
  · exact (closed ⟨_,am,_,bm,g⟩).elim

def can (S : List Nat) (t : Nat) := S.any fun a=>S.any fun b=>R02Cut.test a b t
theorem can_iff (S : List Nat) (t : Nat) : can S t=true ↔ step S t := by
  simp [can,step,List.any_eq_true,R02Cut.test_iff]

/-- Testing a closed cut before and after each endpoint order leaves a single
intersection of possible helpers. Every survivor is checked against its birth. -/
def scanOrder (B : Nat) (S : List Nat) (t v : Nat) :=
  let V:=Std.TreeSet.ofList (used B (t::S) v)
  (used B S t).all fun h=> !V.contains h || !can S h

theorem scan_blocks {B S h t v} (test : scanOrder B S t v=true) (fh : h∈used B S t)
    (sh : h∈used B (t::S) v) (birth : step S h) : False := by
  have b:=List.all_eq_true.mp test _ fh
  have m : (Std.TreeSet.ofList (used B (t::S) v)).contains h=true := by simpa [Std.TreeSet.contains_ofList] using sh
  simp [m,(can_iff S h).mpr birth] at b

def width (k : Nat) := k+k+8
def check (k : Nat) :=
  let S:=core k
  let U:=u k
  let V:=v k
  !can S U && !can S V && !can (U::S) V && !can (V::S) U &&
    scanOrder (width k) S U V && scanOrder (width k) S V U

theorem sound {k : Nat} (p : 0<k) (ok : check k=true) : MCMWidthAll.familyExact k := by
  simp only [check,Bool.and_eq_true,Bool.not_eq_true'] at ok
  obtain ⟨⟨⟨⟨⟨nu,nv⟩,nuv⟩,nvu⟩,first⟩,last⟩:=ok
  have N {S t} (v : can S t=false) : ¬step S t := by rw [←can_iff,v];decide
  apply MCMWidthAll.assemble p (MCMWidthAll.no_eight (N nu) (N nv))
  intro fit
  have sw (a : MCMWidthGate.Label) : MCMWidthGate.number k a<2^(width k) := by
    have z:=MCMWidthGate.fixed_bound a k
    have pow:=Nat.pow_le_pow_right (by decide : 0<2) (show 1≤k by omega)
    change _<2^(k+k+8)
    rw [Nat.pow_add,Nat.pow_add,Nat.mul_assoc]
    have b : 400<2^k*256 := by omega
    exact Nat.lt_of_le_of_lt z (by simpa [Nat.mul_comm 400] using Nat.mul_lt_mul_of_pos_left b (Nat.two_pow_pos k))
  have pool (z : Nat) (m : z∈core k) : z<2^(width k) := by
    rw [←MCMWidthOrder.core_names] at m
    obtain ⟨a,_,rfl⟩:=List.mem_map.mp m;exact sw a
  have extend {t} (sm : t<2^(width k)) : ∀ z∈t::core k,z<2^(width k) := by
    intro z hz;rcases List.mem_cons.mp hz with rfl|m;exact sm;exact pool _ m
  obtain ⟨xs,len,vv,cover⟩:=fit
  have strengthened {ys : List Nat} (v : Valid (· < cap k) ys) : Valid (fun z=>z%2=1 ∧ z<cap k) ys := by
    induction ys with
    | nil => trivial
    | cons a ys ih => exact ⟨ih v.1,v.2.1,⟨v.2.1,v.2.2.1⟩,v.2.2.2⟩
  obtain ⟨h,⟨odd,hb⟩,born,order⟩:=plan (cap:=fun z=>z%2=1 ∧ z<cap k) ⟨xs,len,strengthened vv,cover⟩ (N nu) (N nv)
  have OU:=MCMWidthGate.fixed_odd .u k
  have OV:=MCMWidthGate.fixed_odd .v k
  rcases order with ⟨a,b⟩|⟨a,b⟩
  · have stepLast : step (h::u k::core k) (v k) := by
      obtain ⟨x,mx,y,my,g⟩:=b
      exact ⟨x,(List.Perm.swap ..).mem_iff.mp mx,y,(List.Perm.swap ..).mem_iff.mp my,g⟩
    exact scan_blocks first (used_mem (N nu) a pool hb (sw .u) odd OU)
      (used_mem (N nuv) stepLast (extend (sw .u)) hb (sw .v) odd OV) born
  · have stepLast : step (h::v k::core k) (u k) := by
      obtain ⟨x,mx,y,my,g⟩:=b
      exact ⟨x,(List.Perm.swap ..).mem_iff.mp mx,y,(List.Perm.swap ..).mem_iff.mp my,g⟩
    exact scan_blocks last (used_mem (N nv) a pool hb (sw .v) odd OV)
      (used_mem (N nvu) stepLast (extend (sw .v)) hb (sw .u) odd OU) born

end MCMWidthPrefix
#print axioms MCMWidthPrefix.sound
