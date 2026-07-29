import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryBase

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure AdjunctionInBicategory (B : BicategoryLike) (A C : B.Obj) where
  leftAdjoint : B.Hom A C
  rightAdjoint : B.Hom C A
  unit : B.Hom A A
  counit : B.Hom C C
  triangleLeft : Prop
  triangleRight : Prop
  triangleLeftHolds : triangleLeft
  triangleRightHolds : triangleRight

structure Biequivalence (B : BicategoryLike) (X Y : B.Obj) where
  adj : AdjunctionInBicategory B X Y
  fullyFaithful : Prop
  essentiallySurjective : Prop
  biequivalenceHolds : fullyFaithful ∧ essentiallySurjective

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
