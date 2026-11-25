import R02TightStatement
import R02Rigidity
namespace R02Tight
theorem near_tight (n : Nat) : ExactAt n := from_audit R02Rigidity.checked n
end R02Tight
#print axioms R02Tight.near_tight
