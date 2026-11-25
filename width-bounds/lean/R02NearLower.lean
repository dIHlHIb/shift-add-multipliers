import R02NearPlan
import R02NearUpper
import R02WidthSpec
namespace R02NearLower
open MCM R02Residue R02Screen R02Rigidity R02NearFamily R02NearPlan
set_option maxRecDepth 8192
set_option maxHeartbeats 1000000

private theorem used_repr {k h z : Nat} (p : k%31=10) (m : z∈h::core k) :
    ∃ A∈used,represents h z A ∧ names k z A := by
  rcases List.mem_cons.mp m with rfl|mem
  · exact ⟨helper,List.mem_cons_self,by simp [represents,value,helper],by simp [names,helper,fixed]⟩
  · obtain ⟨A,ma,rep,names⟩ := represent_core _ p _ mem
    exact ⟨A,List.mem_cons_of_mem _ ma,rep,names⟩

private theorem extended {h z y : Nat} {A : Slot} {P : List Slot} {S : List Nat}
    (rep : represents h y A) (rest : ∀ z∈S, ∃ B∈P,represents h z B)
    (m : z∈y::S) : ∃ B∈A::P,represents h z B := by
  rcases List.mem_cons.mp m with rfl|m
  · exact ⟨A,List.mem_cons_self,rep⟩
  · obtain ⟨B,b,y⟩ := rest _ m; exact ⟨B,List.mem_cons_of_mem _ b,y⟩

private theorem hit {h t : Nat} {S : List Nat} {P : List Slot} {T : Slot} {f}
    (safe : checkPool P T f=true) (rep : represents h t T)
    (all : ∀ z∈S,∃ A∈P,represents h z A) (s : step S t) : f (red h)=true := by
  obtain ⟨a,ma,b,mb,g⟩ := s
  exact pool_sound safe (all a ma) (all b mb) rep g

theorem no_base (audit : Audit) {k : Nat} (phase : k%31=10) :
    ¬step (core k) (u k) ∧ ¬step (core k) (v k) := by
  have small (z) (m : z∈core k) : ∃ A∈used,represents 0 z A := by
    obtain ⟨A,ma,rep,_⟩ := represent_core _ phase 0 m
    exact ⟨A,List.mem_cons_of_mem _ ma,rep⟩
  obtain ⟨eu,ev⟩ := end_repr k phase 0
  constructor
  · intro s
    have yes := hit audit.first0 eu small s
    change R02FilterData.filter00 0=true at yes
    rw [audit.zero0] at yes
    contradiction
  · intro s
    have yes := hit audit.first1 ev small s
    change R02FilterData.filter10 0=true at yes
    rw [audit.zero1] at yes
    contradiction

private theorem birth_form (audit : Audit) {k h : Nat} (phase : k%31=10)
    (g : step (core k) h) (passes : both (red h)=true) :
    ∃ j : Nat, (j%31=10 ∨ j%31=21) ∧ h=2^j*b k+b k := by
  obtain ⟨a,ma,z,mz,g⟩ := g
  obtain ⟨A,ia,ra,na⟩ := represent_core _ phase h ma
  obtain ⟨Z,iz,rz,nz⟩ := represent_core _ phase h mz
  obtain ⟨tag,j,hj,eq⟩ := gate g
  have rr := row_sound (T:=helper) ra rz (by simp [represents,value,helper]) eq
  have sh := shape_sound (List.all_eq_true.mp audit.birth _ (mem_rows ia iz tag j)) rr passes
  simp only [goodShape,Bool.and_eq_true,Bool.or_eq_true,beq_iff_eq] at sh
  obtain ⟨⟨⟨ai,zi⟩,ph⟩,orient⟩ := sh
  have aa := na.1 ai
  have zz := nz.1 zi
  subst a; subst z
  have cast : ((2^j*b k:Nat):Int)=pow j*(b k:Nat) := by simp [pow,Int.natCast_pow]
  have nonzero : b k>0 := by have := x_pos k; simp [b]; omega
  refine ⟨j,ph,?_⟩
  obtain ⟨pos,e,f⟩ := tag
  cases pos <;> cases e <;> cases f <;> simp [mix,sig] at eq orient <;> omega

private theorem first_use {S : List Nat} {h t : Nat} (no : ¬step S t)
    (s : step (h::S) t) : ∃ z∈h::S,Gate h z t := by
  obtain ⟨a,ma,b,mb,g⟩ := s
  rcases List.mem_cons.mp ma with rfl|ma
  · exact ⟨b,mb,g⟩
  rcases List.mem_cons.mp mb with rfl|mb
  · exact ⟨a,by assumption,(gate_swap ..).mp g⟩
  · exact (no ⟨a,ma,b,mb,g⟩).elim

private theorem lift_first {k h j t e delta : Nat} {T C : Slot}
    (pk : k%31=10) (ph : j%31=10 ∨ j%31=21) (hh : h=2^j*b k+b k)
    (cert : firstCheck (j%31) T C=true) (rep : represents h t T)
    (identify : ∀ z A, names k z A → A=C → z=e) (no : ¬step (core k) t)
    (made : step (h::core k) t) (ec : e+delta=b k) (tt : t=b k+x k*delta)
    (oe : e%2=1) (nz : delta%32≠0) : k≤j := by
  obtain ⟨a,m,g⟩ := first_use no made
  obtain ⟨B,bel,ra,na⟩ := used_repr pk m
  obtain ⟨tag,s,_,eq⟩ := gate g
  have rb : red (b k:Nat)=red (262139:Int) := by
    have := x_pos k; exact affine pk 256 5 (by simp [b]; omega)
  have rq : red (h:Nat)=red ((pow (j%31)+1)*262139) := by
    rw [hh,Int.natCast_add,Int.natCast_mul,Int.natCast_pow]
    simpa only [Int.add_mul,Int.one_mul] using red_add (red_mul (periodic j) rb) rb
  have sig := first_signature cert rq bel ra rep eq
  simp only [signature,Bool.and_eq_true,beq_iff_eq] at sig
  obtain ⟨⟨bc,sp⟩,form⟩ := sig
  have ae := identify _ _ na bc
  subst a
  have ob : b k%2=1 := by have := x_pos k; simp [b]; omega
  have pδ : 0<delta := by omega
  have scale (n z : Nat) : ((2^n*z:Nat):Int)=pow n*(z:Nat) := by simp [pow,Int.natCast_pow]
  rcases ph with ph|ph
  · simp [ph] at form
    subst tag
    simp [mix,R02Residue.sig] at eq
    have cs := scale s e
    apply R02NearFamily.forward (s:=s) ob oe ec pδ
    change 2^j*b k=2^s*e+x k*delta; omega
  · simp [ph] at form
    subst tag
    simp [mix,R02Residue.sig] at eq
    have cs := scale s t
    exact (R02NearFamily.reverse ph (sp.trans ph) nz (show 2^s*t=2^j*b k+delta by omega)).elim

theorem order_forces (audit : Audit) {k B h : Nat} (pk : k%31=10) (cap : h<B)
    (birth : step (core k) h)
    (order : (step (h::core k) (u k) ∧ step (u k::h::core k) (v k)) ∨
      (step (h::core k) (v k) ∧ step (v k::h::core k) (u k))) : wide k<B := by
  obtain ⟨nu,nv⟩ := no_base audit pk
  obtain ⟨ru,rv⟩ := end_repr k pk h
  have all (z) (m : z∈h::core k) : ∃ A∈used,represents h z A := by
    obtain ⟨A,ma,rep,_⟩ := used_repr pk m; exact ⟨A,ma,rep⟩
  have bothSeen : both (red h)=true := by
    rcases order with o|o
    · simp [both,hit audit.first0 ru all o.1,hit audit.last1 rv (fun _ => extended ru all) o.2]
    · simp [both,hit audit.first1 rv all o.1,hit audit.last0 ru (fun _ => extended rv all) o.2]
  obtain ⟨j,phase,eq⟩ := birth_form audit pk birth bothSeen
  have xp:=x_pos k
  have upper : k≤j := by
    rcases order with o|o
    · apply lift_first (e:=c k) (delta:=34) (T:=end0) (C:=fixed 262105) pk phase eq _ ru
        (fun _ _ nm => nm.2.1) nu o.1
      all_goals first | (rcases phase with ph|ph; exact ph ▸ audit.shapes.1; exact ph ▸ audit.shapes.2.2.1)
                      | decide | (dsimp [c,b,u]; omega)
    · apply lift_first (e:=d k) (delta:=144) (T:=end1) (C:=fixed 261995) pk phase eq _ rv
        (fun _ _ nm => nm.2.2) nv o.1
      all_goals first | (rcases phase with ph|ph; exact ph ▸ audit.shapes.2.1; exact ph ▸ audit.shapes.2.2.2)
                      | decide | (dsimp [d,b,v]; omega)
  have le := Nat.mul_le_mul_right (b k) (Nat.pow_le_pow_right (by decide : 0<2) upper)
  change (x k+1)*b k<B
  rw [Nat.add_mul,Nat.one_mul]
  change 2^k*b k+b k<B
  omega

theorem cap_needed (audit : Audit) {k B : Nat} (pk : k%31=10) (fit : Fits (· < B) (targets k) 9) :
    wide k<B := by
  obtain ⟨nu,nv⟩ := no_base audit pk
  obtain ⟨h,cap,birth,order⟩ := plan fit nu nv
  exact order_forces audit pk cap birth order

theorem not_eight (audit : Audit) {k : Nat} (pk : k%31=10) : ¬Fits unbounded (targets k) 8 := by
  intro fit
  obtain ⟨nd,nt,nu,nv,ne⟩ := target_shape k
  obtain ⟨xs,valid,_,cover,_,cnt⟩ := R06Graph.extract (r:=0) nd nt fit
  obtain ⟨nu0,nv0⟩ := no_base audit pk
  have mu : u k∈xs := cover (by simp [targets])
  obtain ⟨h,m,foreign,g⟩ := R06Graph.escape valid (show 1∈core k from List.mem_cons_self) (fun sub => nu (sub mu))
  by_cases ins : h∈targets k
  · have e : h=u k ∨ h=v k := by
      simp only [targets,core,List.mem_cons,List.mem_nil_iff,or_false] at ins foreign; grind
    rcases e with e|e
    · exact nu0 (e ▸ g)
    · exact nv0 (e ▸ g)
  · have fm : h∈xs.filter (· ∉ targets k) := List.mem_filter.mpr ⟨m,by simpa using ins⟩
    have := List.length_pos_of_mem fm
    omega

end R02NearLower
#print axioms R02NearLower.cap_needed
