import R02Decision
namespace R02Certificate
open MCM

theorem target_count {T : List Nat} {k : Nat} (nd : T.Nodup) (nt : 1∉T)
    (fit : Fits unbounded T k) : T.length≤k := by
  obtain ⟨xs,le,_,all⟩ := fit
  have sub : T ⊆ xs := by
    intro t mt
    exact (List.mem_cons.mp (all t mt)).resolve_left (fun eq => nt (eq ▸ mt))
  exact Nat.le_trans (R06Graph.card_le _ _ nd sub) le

theorem zero_complete {T : List Nat} (nd : T.Nodup) (nt : 1∉T)
    (fit : Fits unbounded T T.length) : R06Closure.accepts T []=true := by
  obtain ⟨xs,v,_,cover,_,cnt⟩ := R06Graph.extract (r:=0) nd nt (by simpa using fit)
  apply R06Closure.complete v (fun t ht => List.mem_cons_of_mem _ (cover ht))
  intro t mt
  by_cases yes : t∈T
  · simpa using (List.mem_cons_of_mem 1 yes)
  · have mem : t ∈ xs.filter (· ∉ T) := List.mem_filter.mpr ⟨mt,by simpa using yes⟩
    have pos := List.length_pos_of_mem mem
    omega

def nodes : List (Nat × Nat × Nat) → List Nat := List.map Prod.fst

def circuit : List Nat → List (Nat × Nat × Nat) → Bool
  | _, [] => true
  | ys, (t,a,b)::gs => decide (a∈1::ys ∧ b∈1::ys ∧ t%2=1 ∧ Gate a b t) && circuit (t::ys) gs

theorem circuit_sound {ys : List Nat} {gs} (valid : Valid unbounded ys)
    (ok : circuit ys gs=true) : Valid unbounded ((nodes gs).reverse++ys) := by
  induction gs generalizing ys with
  | nil => simpa [nodes] using valid
  | cons g gs ih =>
    obtain ⟨t,a,b⟩ := g
    simp only [circuit,Bool.and_eq_true,decide_eq_true_eq] at ok
    have gate := (makes_iff ys t).mpr ⟨a,ok.1.1,b,ok.1.2.1,ok.1.2.2.2⟩
    have next := ih (ys:=t::ys) ⟨valid,ok.1.2.2.1,trivial,gate⟩ ok.2
    simpa [nodes,List.append_assoc] using next

def covers (T : List Nat) (gs : List (Nat × Nat × Nat)) :=
  T.all (fun t => decide (t∈1::nodes gs))

theorem upper {T gs} (ok : circuit [] gs=true) (all : covers T gs=true) :
    Fits unbounded T gs.length := by
  refine ⟨(nodes gs).reverse,by simp [nodes],by simpa using circuit_sound (ys:=[]) trivial ok,?_⟩
  intro t ht
  simpa using of_decide_eq_true (List.all_eq_true.mp all t ht)

theorem one_lower {T : List Nat} {k : Nat} (nd : T.Nodup) (nt : 1∉T)
    (no : R06Closure.accepts T []=false) (fit : Fits unbounded T k) : T.length+1≤k := by
  obtain ⟨xs,le,hv,hc⟩ := fit
  apply Classical.byContradiction
  intro h
  have yes := zero_complete nd nt ⟨xs,by omega,hv,hc⟩
  simp_all

theorem two_lower {T : List Nat} {k : Nat} (nd : T.Nodup) (nt : 1∉T)
    (no : R02Decision.decideAt T (2*R06Polynomial.width T)=false) (fit : Fits unbounded T k) :
    T.length+2≤k := by
  obtain ⟨xs,le,hv,hc⟩ := fit
  apply Classical.byContradiction
  intro h
  have yes := (R02Decision.correct nd nt).mpr ⟨xs,by omega,hv,hc⟩
  simp_all
end R02Certificate
#print axioms R02Certificate.target_count
#print axioms R02Certificate.upper
#print axioms R02Certificate.one_lower
#print axioms R02Certificate.two_lower
