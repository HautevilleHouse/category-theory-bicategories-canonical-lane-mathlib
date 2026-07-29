import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryDefs

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure AdjointEquivalencePackage (B : BicategoryObject) where
  leftAdjoint : Type u
  rightAdjoint : Type u
  unitMorphism : Prop
  counitMorphism : Prop
  triangleIdentities : Prop
  equivalenceData : Prop
  leftAdjointTerm : leftAdjoint
  rightAdjointTerm : rightAdjoint
  unitMorphismTerm : unitMorphism
  counitMorphismTerm : counitMorphism
  triangleIdentitiesTerm : triangleIdentities
  equivalenceDataTerm : equivalenceData

structure AdjointEquivalenceEvidence {B : BicategoryObject} (A : AdjointEquivalencePackage B) where
  unitMorphismClosed : A.unitMorphism
  counitMorphismClosed : A.counitMorphism
  triangleIdentitiesClosed : A.triangleIdentities
  equivalenceDataClosed : A.equivalenceData

def AdjointEquivalenceClosed {B : BicategoryObject} (A : AdjointEquivalencePackage B) : Prop :=
  A.unitMorphism ∧ A.counitMorphism ∧ A.triangleIdentities ∧ A.equivalenceData

theorem adjoint_equivalence_closed_from_evidence {B : BicategoryObject}
    (A : AdjointEquivalencePackage B) (E : AdjointEquivalenceEvidence A) :
    AdjointEquivalenceClosed A := by
  exact And.intro E.unitMorphismClosed
    (And.intro E.counitMorphismClosed
      (And.intro E.triangleIdentitiesClosed E.equivalenceDataClosed))

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
