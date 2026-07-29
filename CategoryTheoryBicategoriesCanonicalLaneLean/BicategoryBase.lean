import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryLike where
  Obj : Type u
  Hom : Obj → Obj → Type v
  comp : {A B C : Obj} → Hom A B → Hom B C → Hom A C
  id : (A : Obj) → Hom A A
  assoc : Prop
  leftUnit : Prop
  rightUnit : Prop

structure StrictBicategory (B : BicategoryLike) where
  strictAssoc : B.assoc
  strictLeftUnit : B.leftUnit
  strictRightUnit : B.rightUnit

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
