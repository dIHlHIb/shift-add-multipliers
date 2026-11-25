import R02WidthSpec
namespace R02RowChunks
open R02Residue R02Screen

def pass (a b t : Slot) (f : Row → Bool) (s : Tag) :=
  (List.range 31).all fun j => f (Row.mk a b t s j)

theorem all_tags {a b t : Slot} {f : Row → Bool}
    (h0 : pass a b t f ⟨.left,true,true⟩=true)
    (h1 : pass a b t f ⟨.left,true,false⟩=true)
    (h2 : pass a b t f ⟨.left,false,true⟩=true)
    (h3 : pass a b t f ⟨.left,false,false⟩=true)
    (h4 : pass a b t f ⟨.right,true,true⟩=true)
    (h5 : pass a b t f ⟨.right,true,false⟩=true)
    (h6 : pass a b t f ⟨.right,false,true⟩=true)
    (h7 : pass a b t f ⟨.right,false,false⟩=true)
    (h8 : pass a b t f ⟨.out,true,true⟩=true)
    (h9 : pass a b t f ⟨.out,true,false⟩=true)
    (h10 : pass a b t f ⟨.out,false,true⟩=true)
    (h11 : pass a b t f ⟨.out,false,false⟩=true)
    : (rowList a b t).all f=true := by
  have eq : (rowList a b t).all f=tags.all (fun s=>pass a b t f s) := by
    simp [rowList,pass,List.all_flatMap,List.all_map,Function.comp_def]
  rw [eq]
  change (pass a b t f ⟨.left,true,true⟩ && (pass a b t f ⟨.left,true,false⟩ && (pass a b t f ⟨.left,false,true⟩ && (pass a b t f ⟨.left,false,false⟩ && (pass a b t f ⟨.right,true,true⟩ && (pass a b t f ⟨.right,true,false⟩ && (pass a b t f ⟨.right,false,true⟩ && (pass a b t f ⟨.right,false,false⟩ && (pass a b t f ⟨.out,true,true⟩ && (pass a b t f ⟨.out,true,false⟩ && (pass a b t f ⟨.out,false,true⟩ && (pass a b t f ⟨.out,false,false⟩ && true))))))))))))=true
  rw [h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11]
  rfl
end R02RowChunks
