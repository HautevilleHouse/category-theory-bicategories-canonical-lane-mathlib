import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure AdjunctionPackage (B : BicategoryStructurePackage) (a b : B.objects) where
  leftAdjoint : B.oneCells a b
  rightAdjoint : B.oneCells b a
  unit : B.twoCells (B.compOneCell rightAdjoint leftAdjoint) (B.idOneCell a)
  counit : B.twoCells (B.compOneCell leftAdjoint rightAdjoint) (B.idOneCell b)
  triangle1 : Prop
  triangle2 : Prop

structure AdjunctionEvidence {B : BicategoryStructurePackage} {a b : B.objects} (A : AdjunctionPackage B a b) where
  triangle1Closed : A.triangle1
  triangle2Closed : A.triangle2

def AdjunctionClosed {B : BicategoryStructurePackage} {a b : B.objects} (A : AdjunctionPackage B a b) : Prop :=
  A.triangle1 ∧ A.triangle2

theorem adjunction_closed_from_evidence {B : BicategoryStructurePackage} {a b : B.objects} (A : AdjunctionPackage B a b) (E : AdjunctionEvidence A) : AdjunctionClosed A := by
  exact And.intro E.triangle1Closed E.triangle2Closed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse