import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure CoherencePackage (B : BicategoryPackage) where
  maclaneCoherence : Prop
  strictified : Prop
  coherenceTheorem : Prop

structure CoherenceEvidence (B : BicategoryPackage) (C : CoherencePackage B) where
  maclaneCoherenceClosed : C.maclaneCoherence
  strictifiedClosed : C.strictified
  coherenceTheoremClosed : C.coherenceTheorem

def CoherenceClosed (B : BicategoryPackage) (C : CoherencePackage B) : Prop :=
  C.maclaneCoherence ∧ C.strictified ∧ C.coherenceTheorem

theorem coherence_closed_from_evidence (B : BicategoryPackage) (C : CoherencePackage B) (E : CoherenceEvidence B C) : CoherenceClosed B C := by
  exact And.intro E.maclaneCoherenceClosed (And.intro E.strictifiedClosed E.coherenceTheoremClosed)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse