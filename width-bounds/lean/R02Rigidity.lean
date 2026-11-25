import R02RowsFirst0
import R02RowsFirst1
import R02RowsLast0
import R02RowsLast1
import R02RowsBirth

import R02RowsUse
namespace R02Rigidity
open R02Residue R02Screen R02FilterData
set_option maxRecDepth 32768
set_option maxHeartbeats 0
def checked : Audit where
  first0 := R02RowsFirst0.first0
  first1 := R02RowsFirst1.first1
  last0 := R02RowsLast0.last0
  last1 := R02RowsLast1.last1
  birth := R02RowsBirth.birth
  zero0 := by decide +kernel
  zero1 := by decide +kernel
  shapes := ⟨R02RowsUse.s10_0,R02RowsUse.s10_1,R02RowsUse.s21_0,R02RowsUse.s21_1⟩
end R02Rigidity
#print axioms R02Rigidity.checked
