import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure AdjointPair (C D : Type u) [Category C] [Category D] where
  leftAdjoint : C ⥤ D
  rightAdjoint : D ⥤ C
  unit : 𝟙 C ⟶ leftAdjoint ⋙ rightAdjoint
  counit : rightAdjoint ⋙ leftAdjoint ⟶ 𝟙 D
  triangleLeft : ∀ (X : C), (leftAdjoint.map (unit.app X)) ≫ (counit.app (leftAdjoint.obj X)) = 𝟙 (leftAdjoint.obj X)
  triangleRight : ∀ (Y : D), (unit.app (rightAdjoint.obj Y)) ≫ (rightAdjoint.map (counit.app Y)) = 𝟙 (rightAdjoint.obj Y)

structure AdjointEvidence (A : AdjointPair C D) where
  triangleLeftClosed : A.triangleLeft
  triangleRightClosed : A.triangleRight

def AdjointClosed (A : AdjointPair C D) : Prop :=
  A.triangleLeft ∧ A.triangleRight

theorem adjoint_closed_from_evidence (A : AdjointPair C D) (E : AdjointEvidence A) : AdjointClosed A :=
  And.intro E.triangleLeftClosed E.triangleRightClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse