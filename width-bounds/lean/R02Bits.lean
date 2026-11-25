import McmAudit
namespace R02Bits
abbrev Word := List Bool
def bit : Bool → Nat | false => 0 | true => 1
def val : Word → Nat | [] => 0 | h::t => bit h+2*val t
def pad (a b : Word) : List (Bool × Bool) :=
  match a,b with
  | [],bs => bs.map (fun x => (false,x))
  | x::xs,[] => (x,false)::pad xs []
  | x::xs,y::ys => (x,y)::pad xs ys

theorem pad_len (a b : Word) : (pad a b).length=max a.length b.length := by
  induction a generalizing b with
  | nil => simp [pad]
  | cons x xs ih => cases b <;> simp [pad,ih,Nat.succ_max_succ]

theorem pad_val (a b : Word) :
    val ((pad a b).map Prod.fst)=val a ∧ val ((pad a b).map Prod.snd)=val b := by
  induction a generalizing b with
  | nil =>
    induction b with
    | nil => decide
    | cons y ys ih => simp_all [pad,val,bit,List.map_map,Function.comp_def]
  | cons x xs ih =>
    cases b with
    | nil => obtain ⟨l,r⟩ := ih []; simp [pad,val,bit,l,r]
    | cons y ys => obtain ⟨l,r⟩ := ih ys; simp [pad,val,l,r]

private def carry (x y z : Bool) := (x && y) || (x && z) || (y && z)
def nextCarry (sub x y z : Bool) := carry (if sub then !x else x) y z
def ripple (sub : Bool) : List (Bool × Bool) → Bool → Word × Bool
  | [],c => ([],c)
  | (x,y)::xs,c =>
    let r := ripple sub xs (nextCarry sub x y c)
    (xor (xor x y) c :: r.1,r.2)
private theorem full_add (a b c : Bool) :
    bit a+bit b+bit c=bit (xor (xor a b) c)+2*bit (nextCarry false a b c) := by
  cases a <;> cases b <;> cases c <;> decide
private theorem full_sub (a b c : Bool) :
    bit a+2*bit (nextCarry true a b c)=bit b+bit c+bit (xor (xor a b) c) := by
  cases a <;> cases b <;> cases c <;> decide

theorem ripple_len (s : Bool) (xs : List (Bool × Bool)) (c : Bool) :
    (ripple s xs c).1.length=xs.length := by
  induction xs generalizing c with
  | nil => rfl
  | cons a xs ih => simp [ripple,ih]

private theorem ripple_add (xs : List (Bool × Bool)) (c : Bool) :
    val (xs.map Prod.fst)+val (xs.map Prod.snd)+bit c =
    val (ripple false xs c).1+2^xs.length*bit (ripple false xs c).2 := by
  induction xs generalizing c with
  | nil => simp [val,ripple]
  | cons pair xs ih =>
    obtain ⟨a,b⟩ := pair
    have t := ih (nextCarry false a b c)
    have f := full_add a b c
    simp only [List.map_cons,val,ripple,List.length_cons,Nat.pow_succ,Nat.mul_right_comm _ 2]
    omega

private theorem ripple_sub (xs : List (Bool × Bool)) (c : Bool) :
    val (xs.map Prod.fst)+2^xs.length*bit (ripple true xs c).2 =
    val (xs.map Prod.snd)+bit c+val (ripple true xs c).1 := by
  induction xs generalizing c with
  | nil => simp [val,ripple]
  | cons pair xs ih =>
    obtain ⟨a,b⟩ := pair
    have t := ih (nextCarry true a b c)
    have f := full_sub a b c
    simp only [List.map_cons,val,ripple,List.length_cons,Nat.pow_succ,Nat.mul_right_comm _ 2]
    omega

theorem val_lt (a : Word) : val a<2^a.length := by
  induction a with
  | nil => decide
  | cons b a ih => cases b <;> simp only [val,bit,List.length_cons,Nat.pow_succ] <;> omega

private theorem high (a : Word) (b : Bool) : val (a++[b])=val a+2^a.length*bit b := by
  induction a with
  | nil => simp [val]
  | cons h a ih => simp only [List.cons_append,val,ih,List.length_cons,Nat.pow_succ,Nat.mul_right_comm _ 2]; omega

def plus (a b : Word) : Word :=
  let r := ripple false (pad a b) false
  r.1++[r.2]
def minus (a b : Word) : Word :=
  let r := ripple true (pad a b) false
  if r.2 then [] else r.1
theorem plus_val (a b : Word) : val (plus a b)=val a+val b := by
  have eq := ripple_add (pad a b) false
  rw [(pad_val a b).1,(pad_val a b).2] at eq
  simpa [plus,high,ripple_len,bit] using eq.symm
theorem minus_val (a b : Word) : val (minus a b)=val a-val b := by
  have eq := ripple_sub (pad a b) false
  rw [(pad_val a b).1,(pad_val a b).2] at eq
  have small := val_lt (ripple true (pad a b) false).1
  rw [ripple_len] at small
  cases f : (ripple true (pad a b) false).2 <;> simp [minus,f,bit,val] at eq ⊢ <;> omega
theorem plus_len (a b : Word) : (plus a b).length = max a.length b.length+1 := by
  simp [plus,ripple_len,pad_len]
theorem minus_len (a b : Word) : (minus a b).length ≤ max a.length b.length := by
  dsimp only [minus]; split <;> simp [ripple_len,pad_len]

def isZero (w : Word) := w.all (!·)
theorem zero_iff (w : Word) : isZero w=true ↔ val w=0 := by
  induction w with
  | nil => decide
  | cons b w ih => cases b <;> simp_all [isZero,val,bit] <;> omega

def equal (a b : Word) := isZero (minus a b) && isZero (minus b a)
theorem equal_iff (a b : Word) : equal a b=true ↔ val a=val b := by
  simp only [equal,Bool.and_eq_true,zero_iff,minus_val]; omega

def down : Nat → Word → Word
  | 0,a => a
  | j+1,a => down j a.tail
def up (j : Nat) (a : Word) : Word := List.replicate j false ++ a

private theorem half (a : Word) : val a.tail = val a/2 := by
  cases a with
  | nil => decide
  | cons h a => cases h <;> simp [val,bit] <;> omega
theorem down_val (j : Nat) (a : Word) : val (down j a)=val a/2^j := by
  induction j generalizing a with
  | zero => simp [down]
  | succ j ih => rw [down,ih,half,Nat.div_div_eq_div_mul,Nat.pow_succ,Nat.mul_comm 2]
theorem up_val (j : Nat) (a : Word) : val (up j a)=2^j*val a := by
  induction j with
  | zero => simp [up]
  | succ j ih =>
    change val ((List.replicate (j+1) false)++a)=_
    rw [List.replicate_succ]; change 0+2*val (up j a)=_
    rw [ih,Nat.pow_succ,Nat.mul_comm _ 2,Nat.mul_assoc]; omega

def walk (z : Word) : Word → Bool
  | [] => false
  | true::_ => false
  | false::t => equal t z || walk z t
def times (n z : Word) := !isZero z && walk z n

private theorem walk_iff (z n : Word) (pos : 0<val z) :
    walk z n=true ↔ ∃ j : Nat, 0<j ∧ val n=2^j*val z := by
  induction n with
  | nil =>
    simp only [walk,Bool.false_eq_true,val,false_iff,not_exists,not_and]
    intro j _ h
    have := Nat.mul_pos (Nat.two_pow_pos j) pos; omega
  | cons b n ih =>
    cases b with
    | true =>
      simp only [walk,Bool.false_eq_true,val,bit,false_iff,not_exists,not_and]
      rintro (_|j) p h
      · omega
      · rw [Nat.pow_succ,Nat.mul_right_comm _ 2] at h; omega
    | false =>
      simp only [walk,Bool.or_eq_true,equal_iff,ih,val,bit,Nat.zero_add]
      constructor
      · rintro (eq|⟨j,hj,eq⟩)
        · exact ⟨1,by decide,by simp [eq]⟩
        · exact ⟨j+1,by omega,by rw [eq,Nat.pow_succ,Nat.mul_right_comm _ 2]; omega⟩
      · rintro ⟨_|j,p,h⟩
        · omega
        · rw [Nat.pow_succ,Nat.mul_right_comm _ 2] at h
          by_cases z0 : j=0
          · subst j; simp at h; exact Or.inl (by omega)
          · exact Or.inr ⟨j,by omega,by omega⟩

theorem times_iff (n z : Word) : times n z=true ↔ MCM.PowerTimes (val n) (val z) := by
  rw [MCM.powerTimes_iff]
  by_cases pos : 0<val z
  · have nz : isZero z=false := by cases h : isZero z <;> simp_all [zero_iff]
    simp [times,nz,walk_iff _ _ pos,pos]
  · have ze := (zero_iff z).mpr (show val z=0 by omega)
    simp [times,ze,pos]

def oriented (a b t : Word) :=
  times (plus a b) t || times (minus a b) t || times (minus b a) t
def gate (a b t : Word) := oriented a b t || oriented a t b || oriented b t a
theorem gate_iff (a b t : Word) : gate a b t=true ↔ MCM.Gate (val a) (val b) (val t) := by
  simp only [gate,oriented,Bool.or_eq_true,times_iff,plus_val,minus_val,MCM.Gate,MCM.Oriented,or_assoc]

end R02Bits
#print axioms R02Bits.gate_iff
