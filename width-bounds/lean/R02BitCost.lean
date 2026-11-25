import R02Meter
namespace R02BitCost
open R02Bits R02Meter

def align : Word → Word → M (List (Bool × Bool))
  | [],bs => mapL (fun b => (false,b)) bs
  | a::as,[] => mapM ((a,false)::·) (align as [])
  | a::as,b::bs => mapM ((a,b)::·) (align as bs)
theorem align_spec (a b : Word) : (align a b).1=pad a b ∧ (align a b).2=max a.length b.length+1 := by
  induction a generalizing b with
  | nil => simpa [align,pad] using mapL_spec (fun b => (false,b)) b
  | cons a as ih =>
    cases b with
    | nil => obtain ⟨ha,hb⟩ := ih []; simp [align,pad,mapM,ha,hb,Nat.add_comm]
    | cons b bs => obtain ⟨ha,hb⟩ := ih bs; simp [align,pad,mapM,ha,hb,Nat.succ_max_succ,Nat.add_comm]

def rip (s : Bool) : List (Bool × Bool) → Bool → M (Word × Bool)
  | [],c => ret ([],c)
  | (x,y)::xs,c => mapM (fun r => (xor (xor x y) c::r.1,r.2)) (rip s xs (nextCarry s x y c))
theorem rip_spec (s : Bool) (as : List (Bool × Bool)) (c) :
    (rip s as c).1=ripple s as c ∧ (rip s as c).2=as.length+1 := by
  induction as generalizing c with
  | nil => exact ⟨rfl,rfl⟩
  | cons a xs ih =>
    obtain ⟨x,y⟩ := a
    obtain ⟨h,l⟩ := ih (nextCarry s x y c)
    simp [rip,ripple,mapM,h,l,Nat.add_comm]

def alu (s : Bool) (a b : Word) : M Word :=
  next (align a b) (fun p => next (rip s p false) (fun r =>
    if s then ret (if r.2 then [] else r.1) else append r.1 [r.2]))
theorem alu_spec (s : Bool) (a b : Word) :
    (alu s a b).1=(if s then minus a b else plus a b) ∧
    (alu s a b).2 ≤ 3*(max a.length b.length)+5 := by
  have A := align_spec a b
  have R := rip_spec s (pad a b) false
  constructor
  · cases s <;> simp only [alu,next,A.1,ret,(rip_spec ..).1,if_true,Bool.false_eq_true,if_false,
      (append_spec ..).1,plus,minus]
  · cases s <;> simp only [alu,next,A.1,A.2,(rip_spec ..).1,(rip_spec ..).2,ret,Bool.false_eq_true,
      if_true,if_false,(append_spec ..).2,ripple_len,pad_len] <;> omega

def eqW (a b : Word) : M Bool :=
  next (align a b) (fun p => mapM Bool.not (anyM (fun (x,y) => ret (xor x y)) p))
private theorem mismatch (p : List (Bool × Bool)) : p.any (fun (x,y) => xor x y)=false ↔
    val (p.map Prod.fst)=val (p.map Prod.snd) := by
  induction p with
  | nil => decide
  | cons a p ih =>
    obtain ⟨x,y⟩ := a
    cases x <;> cases y <;> simp [val,bit,ih] <;> omega

theorem eq_spec (a b : Word) : (eqW a b).1=true ↔ val a=val b := by
  have eq := mismatch (pad a b)
  rw [(R02Bits.pad_val a b).1,(R02Bits.pad_val a b).2] at eq
  simpa [eqW,next,mapM,(align_spec ..).1,any_spec,ret] using eq

theorem eq_cost (a b : Word) : (eqW a b).2≤4*(max a.length b.length)+6 := by
  simp only [eqW,next,mapM,(align_spec ..).1,(align_spec ..).2]
  have := any_cost (fun (p : Bool × Bool) => ret (xor p.1 p.2)) (pad a b) 1 (by intros; exact Nat.le_refl _)
  rw [pad_len] at this
  omega

def walkM (z : Word) : Word → M Bool
  | [] => ret false
  | true::_ => ret false
  | false::xs => next (eqW xs z) (fun b => if b then ret true else walkM z xs)
theorem walk_value (n z : Word) : (walkM z n).1=walk z n := by
  induction n with
  | nil => rfl
  | cons b xs ih =>
    cases b
    · have eq : (eqW xs z).1=equal xs z := Bool.eq_iff_iff.mpr ((eq_spec ..).trans (equal_iff ..).symm)
      cases v : equal xs z <;> simp [walkM,walk,next,ret,eq,v,ih]
    · rfl

theorem walk_cost (n z : Word) (d : Nat) (hn : n.length≤d) (hz : z.length≤d) :
    (walkM z n).2 ≤ 1+n.length*(4*d+9) := by
  induction n with
  | nil => simp [walkM,ret]
  | cons b xs ih =>
    have l : xs.length≤d := by simp only [List.length_cons] at hn; omega
    have c := eq_cost xs z
    have t := ih l
    cases b
    · cases hb : (eqW xs z).1 <;> simp only [walkM,next,hb,if_true,Bool.false_eq_true,if_false,ret,List.length_cons,Nat.succ_mul xs.length] <;> omega
    · simp [walkM,ret]

def pt (n z : Word) : M Bool :=
  next (anyM (fun b => ret b) z) (fun nz => if nz then walkM z n else ret false)
theorem pt_spec (n z : Word) : (pt n z).1=true ↔ MCM.PowerTimes (val n) (val z) := by
  rw [←times_iff]
  have nz : z.any id= !isZero z := by
    induction z with
    | nil => rfl
    | cons b z ih => cases b <;> simp_all [isZero]
  have check : (anyM (fun b => ret b) z).1 = !isZero z := (any_spec ..).trans nz
  unfold pt next
  rw [check]
  cases h : isZero z <;> simp [h,ret,times,walk_value]

def ptBudget (d : Nat) := 6+d*3+d*(4*d+9)
theorem pt_cost (n z : Word) (d) (hn : n.length≤d) (hz : z.length≤d) :
    (pt n z).2≤ptBudget d := by
  have a := any_cost (fun b => ret b) z 1 (by intros; exact Nat.le_refl _)
  have w := walk_cost n z d hn hz
  have m := Nat.mul_le_mul_right (4*d+9) hn
  simp only [pt,next,ptBudget]
  split
  · omega
  · change 1+(anyM (fun b => ret b) z).2+1≤_; omega

def trial (sub : Bool) (a b z : Word) := next (alu sub a b) (fun u => pt u z)
def checks (a b t : Word) : List (Bool × Word × Word × Word) :=
  [(false,a,b,t),(true,a,b,t),(true,b,a,t),(false,a,t,b),(true,a,t,b),
   (true,t,a,b),(false,b,t,a),(true,b,t,a),(true,t,b,a)]
def gateM (a b t : Word) := anyM (fun (s,x,y,z) => trial s x y z) (checks a b t)
theorem gate_spec (a b t : Word) : (gateM a b t).1=true ↔ MCM.Gate (val a) (val b) (val t) := by
  simp only [gateM,any_spec,checks,List.any_cons,List.any_nil,Bool.or_eq_true,Bool.false_eq_true,
    or_false,trial,next,(alu_spec ..).1,if_true,if_false,pt_spec,plus_val,minus_val,
    MCM.Gate,MCM.Oriented,or_assoc]

def trialBudget (d : Nat) := 1+(3*d+5)+ptBudget (d+1)
def gateBudget (d : Nat) := 1+9*(trialBudget d+2)
theorem gate_cost (a b t : Word) (d : Nat) (ha : a.length≤d) (hb : b.length≤d) (ht : t.length≤d) :
    (gateM a b t).2≤gateBudget d := by
  have trialBound (s : Bool) (a b z : Word) (ha : a.length≤d) (hb : b.length≤d) (hz : z.length≤d) :
      (trial s a b z).2 ≤ trialBudget d := by
    have ab := alu_spec s a b
    have len : (alu s a b).1.length≤d+1 := by
      rw [ab.1]; cases s <;> simp only [Bool.false_eq_true,if_false,if_true,plus_len]
      · omega
      · have := minus_len a b; omega
    have check := pt_cost _ z (d+1) len (by omega)
    simp only [trial,next,trialBudget]; omega
  apply any_cost _ _ (trialBudget d)
  intro u hu
  simp only [checks,List.mem_cons,List.mem_nil_iff,or_false] at hu
  rcases hu with h|h|h|h|h|h|h|h|h <;> subst u <;> apply trialBound <;> assumption

end R02BitCost
#print axioms R02BitCost.gate_spec
#print axioms R02BitCost.gate_cost
