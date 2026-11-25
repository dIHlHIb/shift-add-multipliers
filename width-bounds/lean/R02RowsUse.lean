import R02RowChunks
namespace R02RowsUse
open R02Residue R02Screen R02FilterData R02Rigidity
set_option Elab.async false
set_option maxRecDepth 16384
set_option maxHeartbeats 0
private theorem u10_0_0 : (rowList helper helper end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_0_1 : (rowList helper (fixed 1) end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_0_2 : (rowList helper (fixed 262143) end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_0_3 : (rowList helper (fixed 262139) end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_0_4 : (rowList helper (fixed 262107) end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_0_5 : (rowList helper (fixed 262011) end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_0_6 : (rowList helper (fixed 262105) end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_0_7 : (rowList helper (fixed 261995) end0).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
theorem s10_0 : firstCheck 10 end0 (fixed 262105)=true := by
  simp only [firstCheck,used,start,base,List.map_cons,List.map_nil,List.all_cons,List.all_nil,
    u10_0_0,u10_0_1,u10_0_2,u10_0_3,u10_0_4,u10_0_5,u10_0_6,u10_0_7,Bool.and_true]
private theorem u10_1_0 : (rowList helper helper end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_1_1 : (rowList helper (fixed 1) end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_1_2 : (rowList helper (fixed 262143) end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_1_3 : (rowList helper (fixed 262139) end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_1_4 : (rowList helper (fixed 262107) end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_1_5 : (rowList helper (fixed 262011) end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_1_6 : (rowList helper (fixed 262105) end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u10_1_7 : (rowList helper (fixed 261995) end1).all (fun r => !mayAt (red ((pow 10+1)*262139)) r.result || signature 10 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
theorem s10_1 : firstCheck 10 end1 (fixed 261995)=true := by
  simp only [firstCheck,used,start,base,List.map_cons,List.map_nil,List.all_cons,List.all_nil,
    u10_1_0,u10_1_1,u10_1_2,u10_1_3,u10_1_4,u10_1_5,u10_1_6,u10_1_7,Bool.and_true]
private theorem u21_0_0 : (rowList helper helper end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_0_1 : (rowList helper (fixed 1) end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_0_2 : (rowList helper (fixed 262143) end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_0_3 : (rowList helper (fixed 262139) end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_0_4 : (rowList helper (fixed 262107) end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_0_5 : (rowList helper (fixed 262011) end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_0_6 : (rowList helper (fixed 262105) end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_0_7 : (rowList helper (fixed 261995) end0).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 262105) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
theorem s21_0 : firstCheck 21 end0 (fixed 262105)=true := by
  simp only [firstCheck,used,start,base,List.map_cons,List.map_nil,List.all_cons,List.all_nil,
    u21_0_0,u21_0_1,u21_0_2,u21_0_3,u21_0_4,u21_0_5,u21_0_6,u21_0_7,Bool.and_true]
private theorem u21_1_0 : (rowList helper helper end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_1_1 : (rowList helper (fixed 1) end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_1_2 : (rowList helper (fixed 262143) end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_1_3 : (rowList helper (fixed 262139) end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_1_4 : (rowList helper (fixed 262107) end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_1_5 : (rowList helper (fixed 262011) end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_1_6 : (rowList helper (fixed 262105) end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
private theorem u21_1_7 : (rowList helper (fixed 261995) end1).all (fun r => !mayAt (red ((pow 21+1)*262139)) r.result || signature 21 (fixed 261995) r)=true := by
  apply R02RowChunks.all_tags <;> decide +kernel
theorem s21_1 : firstCheck 21 end1 (fixed 261995)=true := by
  simp only [firstCheck,used,start,base,List.map_cons,List.map_nil,List.all_cons,List.all_nil,
    u21_1_0,u21_1_1,u21_1_2,u21_1_3,u21_1_4,u21_1_5,u21_1_6,u21_1_7,Bool.and_true]
end R02RowsUse
