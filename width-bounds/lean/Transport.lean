import Pump
import Signs
namespace MCMWidthTransport
open MCMWidthPump

private def interval (radius : Nat) : List Int :=
  (List.range (2*radius+1)).map fun (n:Nat) => (n:Int)-(radius:Int)

private theorem interval_mem {n : Nat} {z : Int} (lo : -(n:Int)≤z) (hi : z≤(n:Int)) :
    z∈interval n := by
  let t:=(z+(n:Int)).toNat
  have e : (t:Int)=z+n := Int.toNat_of_nonneg (by omega)
  apply List.mem_map.mpr
  refine ⟨t,List.mem_range.mpr ?_,?_⟩ <;> omega

private theorem interval_bounds {n : Nat} {z : Int} (m : z∈interval n) :
    -(n:Int)≤z ∧ z≤(n:Int) := by
  unfold interval at m
  obtain ⟨t,ht,eq⟩:=List.mem_map.mp m
  have y:=List.mem_range.mp ht
  subst z
  omega

private def boxes : List Row := (interval 4).flatMap fun a=>
  (interval 1).flatMap fun b=>(interval 13).map fun c=>Row.mk a b c

private theorem box_mem (r : Row) (a : -4≤r.a ∧ r.a≤4) (b : limited r 1 13) : r∈boxes := by
  obtain ⟨A,B,C⟩:=r
  obtain ⟨h1,h2⟩:=a
  obtain ⟨h3,h4,h5,h6⟩:=b
  exact List.mem_flatMap.mpr ⟨A,interval_mem h1 h2,List.mem_flatMap.mpr
      ⟨B,interval_mem h3 h4,List.mem_map.mpr ⟨C,interval_mem h5 h6,rfl⟩⟩⟩

private theorem box_small (r) (m : r∈boxes) : limited r 1 13 := by
  obtain ⟨_,_,h⟩:=List.mem_flatMap.mp m
  obtain ⟨_,hb,h⟩:=List.mem_flatMap.mp h
  obtain ⟨_,hc,rfl⟩:=List.mem_map.mp h
  have b:=interval_bounds hb;have c:=interval_bounds hc
  exact ⟨b.1,b.2,c.1,c.2⟩

private def group (k j p : Int) : Group :=
  ⟨boxes.filter (fun r=>decide (val r k j≤p)),boxes.filter (fun r=>decide (p≤val r k j))⟩

private theorem small_group (k j p : Int) : smallGroup (group k j p) := by
  intro r m
  rcases List.mem_append.mp m with m|m <;> exact box_small _ (List.mem_filter.mp m).1

private theorem held_group (k j p : Int) : held (group k j p) k j p :=
  ⟨fun _ m=>of_decide_eq_true (List.mem_filter.mp m).2,
   fun _ m=>of_decide_eq_true (List.mem_filter.mp m).2⟩

/-- For any local inequality with bounded coefficients, a single common
direction retains the inequality. A private shift p denotes either s or t. -/
def preserves (k j p dj dp : Int) := ∀ a b c d : Int,
  -4≤a → a≤4 → -1≤b → b≤1 → -1≤c → c≤1 → -13≤d → d≤13 →
  0≤a*k+b*j+c*p+d → 0≤a*2+b*dj+c*dp

private theorem lift_dir {k j p dj dp}
    (base : ∀ r∈boxes,0≤val r k j → 0≤dir r dj) (g : slopes (group k j p) dj dp) :
    preserves k j p dj dp := by
  intro a b c d al ah bl bh cl ch dl dh old
  have cases_ : c=0 ∨ c=1 ∨ c= -1 := by omega
  rcases cases_ with rfl|rfl|rfl
  · have h:=base ⟨a,b,d⟩ (box_mem _ ⟨al,ah⟩ ⟨bl,bh,dl,dh⟩) (by simpa [val] using old)
    simpa [dir] using h
  · let r:Row:=⟨-a,-b,-d⟩
    have mem:r∈boxes := box_mem _ (by dsimp [r];omega) (by dsimp [limited,r];omega)
    have le:val r k j≤p := by simp [r,val,Int.neg_mul];simp at old;omega
    have m:r∈(group k j p).lower := List.mem_filter.mpr ⟨mem,decide_eq_true le⟩
    have h:=g.1 r m
    simp [r,dir,Int.neg_mul] at h; simp;omega
  · let r:Row:=⟨a,b,d⟩
    have mem:r∈boxes := box_mem _ ⟨al,ah⟩ ⟨bl,bh,dl,dh⟩
    have le:p≤val r k j := by simp [r,val,Int.neg_mul];simp at old;omega
    have m:r∈(group k j p).upper := List.mem_filter.mpr ⟨mem,decide_eq_true le⟩
    have h:=g.2 r m
    simp [r,dir] at h;simp;omega

theorem choose {k j s t : Int} (large : 104<k) :
    ∃ dj ds dt : Int,preserves k j s dj ds ∧ preserves k j t dj dt := by
  let base:=boxes.filter (fun r=>decide (0≤val r k j))
  obtain ⟨dj,ds,dt,bd,sg,sh⟩:=pump base (group k j s) (group k j t) large
    (fun _ m=>box_small _ (List.mem_filter.mp m).1) (small_group k j s) (small_group k j t)
    (fun _ m=>of_decide_eq_true (List.mem_filter.mp m).2) (held_group k j s) (held_group k j t)
  have baseDir (r) (mem:r∈boxes) (v:0≤val r k j) := bd r (List.mem_filter.mpr ⟨mem,decide_eq_true v⟩)
  exact ⟨dj,ds,dt,lift_dir baseDir sg,lift_dir baseDir sh⟩

/-- Every permitted affine inequality still holds after n steps. -/
theorem later {k j p dj dp : Int} (keep : preserves k j p dj dp)
    (n : Int) (hn : 0≤n) {a b c d : Int}
    (al : -4≤a) (ah : a≤4) (bl : -1≤b) (bh : b≤1) (cl : -1≤c) (ch : c≤1)
    (dl : -13≤d) (dh : d≤13) (old : 0≤a*k+b*j+c*p+d) :
    0≤a*(k+2*n)+b*(j+dj*n)+c*(p+dp*n)+d := by
  have rate:=keep a b c d al ah bl bh cl ch dl dh old
  have grow:=Int.mul_nonneg rate hn
  have identity : a*(k+2*n)+b*(j+dj*n)+c*(p+dp*n)+d =
      (a*k+b*j+c*p+d)+(a*2+b*dj+c*dp)*n := by
    simp only [Int.mul_add,Int.add_mul,Int.mul_assoc]
    ac_rfl
  rw [identity]
  omega

structure Exp where
  a : Int
  b : Int
  c : Int
  deriving DecidableEq,Repr

def expVal (e : Exp) (k j p : Int) := e.a*k+e.b*j+e.c*p
def bounded (e : Exp) := 0≤e.a ∧ e.a≤4 ∧ 0≤e.b ∧ e.b≤1 ∧ 0≤e.c ∧ e.c≤1

theorem difference {k j p dj dp : Int} (keep : preserves k j p dj dp)
    (n : Int) (hn : 0≤n) {a b : Exp} (ba : bounded a) (bb : bounded b) {d : Int}
    (dl : -13≤d) (dh : d≤13) (old : expVal a k j p+d≤expVal b k j p) :
    expVal a (k+2*n) (j+dj*n) (p+dp*n)+d≤expVal b (k+2*n) (j+dj*n) (p+dp*n) := by
  unfold bounded at ba bb
  have original : 0≤(b.a-a.a)*k+(b.b-a.b)*j+(b.c-a.c)*p+-d := by
    simp only [Int.sub_mul,expVal] at *;omega
  have moved:=later keep n hn (a:=b.a-a.a) (b:=b.b-a.b) (c:=b.c-a.c) (d:= -d)
    (by omega) (by omega) (by omega) (by omega) (by omega) (by omega) (by omega) (by omega) original
  simp only [Int.sub_mul,expVal] at moved ⊢
  omega

structure Term where
  coeff : Int
  exponent : Exp
  deriving DecidableEq,Repr

def pair (k j p K J P : Int) (z : Term) : R06Cancellation.Term :=
  ⟨z.coeff,(expVal z.exponent k j p).toNat,(expVal z.exponent K J P).toNat⟩

theorem nonnegExp {e : Exp} (small : bounded e) {k j p : Int} (K : 0≤k) (J : 0≤j) (P : 0≤p) :
    0≤expVal e k j p := by
  exact Int.add_nonneg (Int.add_nonneg (Int.mul_nonneg small.1 K) (Int.mul_nonneg small.2.2.1 J))
    (Int.mul_nonneg small.2.2.2.2.1 P)

/-- Signed sparse sums on one private shift retain both strict sign and zero. -/
theorem polynomial {k j p dj dp : Int} (keep : preserves k j p dj dp)
    (n : Int) (hn : 0≤n) (ts : List Term) (K : 0≤k) (J : 0≤j) (P : 0≤p)
    (small : ∀ z∈ts,bounded z.exponent)
    (M : R06Cancellation.mass
      (ts.map (pair k j p (k+2*n) (j+dj*n) (p+dp*n)))≤2^12) :
    let xs:=ts.map (pair k j p (k+2*n) (j+dj*n) (p+dp*n))
    MCMWidthSigns.signs (R06Cancellation.sum R06Cancellation.Term.e xs)
        (R06Cancellation.sum R06Cancellation.Term.f xs) := by
  let f:=pair k j p (k+2*n) (j+dj*n) (p+dp*n)
  let xs:=ts.map f
  apply MCMWidthSigns.transfer xs M
  have D1:=keep 0 1 0 0 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by simpa using J)
  have D2:=keep 0 0 1 0 (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
    (by decide) (by decide) (by simpa using P)
  simp only [Int.zero_mul,Int.one_mul,Int.zero_add,Int.add_zero] at D1 D2
  have newJ:=Int.add_nonneg J (Int.mul_nonneg D1 hn)
  have newP:=Int.add_nonneg P (Int.mul_nonneg D2 hn)
  intro a ma b mb before
  obtain ⟨u,mu,rfl⟩:=List.mem_map.mp ma
  obtain ⟨v,mv,rfl⟩:=List.mem_map.mp mb
  let E:=fun z:Term=>expVal z.exponent k j p
  let F:=fun z:Term=>expVal z.exponent (k+2*n) (j+dj*n) (p+dp*n)
  change (E v).toNat≤(E u).toNat at before
  change (F v).toNat≤(F u).toNat ∧ _ ∧ _
  have e1:=nonnegExp (small u mu) K J P
  have e2:=nonnegExp (small v mv) K J P
  have f1:=nonnegExp (small u mu) (show 0≤k+2*n by omega) newJ newP
  have f2:=nonnegExp (small v mv) (show 0≤k+2*n by omega) newJ newP
  change 0≤E u at e1;change 0≤E v at e2;change 0≤F u at f1;change 0≤F v at f2
  have transfer' (x y : Term) (mx:x∈ts) (my:y∈ts) (d:Int) (h1: -13≤d) (h2:d≤13)
      (old:E x+d≤E y) : F x+d≤F y := difference keep n hn (small x mx) (small y my) h1 h2 old
  have mono:=transfer' v u mv mu 0 (by decide) (by decide) (by omega)
  refine ⟨by omega,?_,?_⟩
  · change (E u).toNat≤(E v).toNat+12 → (F u).toNat+(E v).toNat=(F v).toNat+(E u).toNat
    intro close
    have h:=transfer' v u mv mu (E u-E v) (by omega) (by omega) (by omega)
    have g:=transfer' u v mu mv (E v-E u) (by omega) (by omega) (by omega)
    omega
  · change (E v).toNat+12<(E u).toNat → (F v).toNat+12<(F u).toNat
    intro far
    have h:=transfer' v u mv mu 13 (by decide) (by decide) (by omega)
    omega

end MCMWidthTransport
#print axioms MCMWidthTransport.choose
#print axioms MCMWidthTransport.polynomial
