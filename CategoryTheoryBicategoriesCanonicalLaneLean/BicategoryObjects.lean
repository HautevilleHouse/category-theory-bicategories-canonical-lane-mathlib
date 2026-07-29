import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure Bicategory where
  Obj : Type u
  Hom : Obj → Obj → Type v
  Id : (X : Obj) → Hom X X
  Comp : {X Y Z : Obj} → Hom X Y → Hom Y Z → Hom X Z
  Assoc : {X Y Z W : Obj} (f : Hom X Y) (g : Hom Y Z) (h : Hom Z W) → Comp (Comp f g) h = Comp f (Comp g h)
  LeftId : {X Y : Obj} (f : Hom X Y) → Comp (Id X) f = f
  RightId : {X Y : Obj} (f : Hom X Y) → Comp f (Id Y) = f

structure BicategoryAdmittedObject where
  bicat : Bicategory
  strict : Prop
  strictProof : strict

def BicategoryWitnessClosed (O : BicategoryAdmittedObject) : Prop :=
  O.strict

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
