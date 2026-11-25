import R02RowChunks
namespace R02RowsLast1
open R02Residue R02Screen R02FilterData R02Rigidity
set_option Elab.async false
set_option maxRecDepth 16384
set_option maxHeartbeats 0
private theorem r0_0 : (rowList end0 end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_1 : (rowList end0 helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_2 : (rowList end0 (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_3 : (rowList end0 (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_4 : (rowList end0 (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_5 : (rowList end0 (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_6 : (rowList end0 (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_7 : (rowList end0 (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r0_8 : (rowList end0 (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_0 : (rowList helper end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_1 : (rowList helper helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_2 : (rowList helper (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_3 : (rowList helper (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_4 : (rowList helper (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_5 : (rowList helper (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_6 : (rowList helper (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_7 : (rowList helper (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r1_8 : (rowList helper (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_0 : (rowList (fixed 1) end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_1 : (rowList (fixed 1) helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_2 : (rowList (fixed 1) (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_3 : (rowList (fixed 1) (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_4 : (rowList (fixed 1) (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_5 : (rowList (fixed 1) (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_6 : (rowList (fixed 1) (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_7 : (rowList (fixed 1) (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r2_8 : (rowList (fixed 1) (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_0 : (rowList (fixed 262143) end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_1 : (rowList (fixed 262143) helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_2 : (rowList (fixed 262143) (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_3 : (rowList (fixed 262143) (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_4 : (rowList (fixed 262143) (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_5 : (rowList (fixed 262143) (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_6 : (rowList (fixed 262143) (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_7 : (rowList (fixed 262143) (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r3_8 : (rowList (fixed 262143) (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_0 : (rowList (fixed 262139) end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_1 : (rowList (fixed 262139) helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_2 : (rowList (fixed 262139) (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_3 : (rowList (fixed 262139) (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_4 : (rowList (fixed 262139) (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_5 : (rowList (fixed 262139) (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_6 : (rowList (fixed 262139) (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_7 : (rowList (fixed 262139) (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r4_8 : (rowList (fixed 262139) (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_0 : (rowList (fixed 262107) end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_1 : (rowList (fixed 262107) helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_2 : (rowList (fixed 262107) (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_3 : (rowList (fixed 262107) (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_4 : (rowList (fixed 262107) (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_5 : (rowList (fixed 262107) (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_6 : (rowList (fixed 262107) (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_7 : (rowList (fixed 262107) (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r5_8 : (rowList (fixed 262107) (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_0 : (rowList (fixed 262011) end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_1 : (rowList (fixed 262011) helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_2 : (rowList (fixed 262011) (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_3 : (rowList (fixed 262011) (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_4 : (rowList (fixed 262011) (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_5 : (rowList (fixed 262011) (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_6 : (rowList (fixed 262011) (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_7 : (rowList (fixed 262011) (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r6_8 : (rowList (fixed 262011) (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_0 : (rowList (fixed 262105) end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_1 : (rowList (fixed 262105) helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_2 : (rowList (fixed 262105) (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_3 : (rowList (fixed 262105) (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_4 : (rowList (fixed 262105) (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_5 : (rowList (fixed 262105) (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_6 : (rowList (fixed 262105) (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_7 : (rowList (fixed 262105) (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r7_8 : (rowList (fixed 262105) (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_0 : (rowList (fixed 261995) end0 end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_1 : (rowList (fixed 261995) helper end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_2 : (rowList (fixed 261995) (fixed 1) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_3 : (rowList (fixed 261995) (fixed 262143) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_4 : (rowList (fixed 261995) (fixed 262139) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_5 : (rowList (fixed 261995) (fixed 262107) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_6 : (rowList (fixed 261995) (fixed 262011) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_7 : (rowList (fixed 261995) (fixed 262105) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem r8_8 : (rowList (fixed 261995) (fixed 261995) end1).all (fun r => permits filter11 r.result)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
theorem last1 : checkPool (end0::used) end1 filter11=true := by
  simp only [checkPool,rows,List.all_flatMap,used,start,base,List.map_cons,List.map_nil,List.all_cons,List.all_nil,
    r0_0,r0_1,r0_2,r0_3,r0_4,r0_5,r0_6,r0_7,r0_8,r1_0,r1_1,r1_2,r1_3,r1_4,r1_5,r1_6,r1_7,r1_8,r2_0,r2_1,r2_2,r2_3,r2_4,r2_5,r2_6,r2_7,r2_8,r3_0,r3_1,r3_2,r3_3,r3_4,r3_5,r3_6,r3_7,r3_8,r4_0,r4_1,r4_2,r4_3,r4_4,r4_5,r4_6,r4_7,r4_8,r5_0,r5_1,r5_2,r5_3,r5_4,r5_5,r5_6,r5_7,r5_8,r6_0,r6_1,r6_2,r6_3,r6_4,r6_5,r6_6,r6_7,r6_8,r7_0,r7_1,r7_2,r7_3,r7_4,r7_5,r7_6,r7_7,r7_8,r8_0,r8_1,r8_2,r8_3,r8_4,r8_5,r8_6,r8_7,r8_8,Bool.and_true]
end R02RowsLast1
#print axioms R02RowsLast1.last1
