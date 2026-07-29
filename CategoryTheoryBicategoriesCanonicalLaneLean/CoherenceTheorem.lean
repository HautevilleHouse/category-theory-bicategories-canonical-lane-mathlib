import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryDefs

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure CoherencePackage (B : BicategoryObject) where
  maclaneCoherence : Prop
  strictificationExists : Prop
  coherenceTheoremProved : Prop
  strictificationExistsTerm : strictificationExists
  maclaneCoherenceTerm : maclaneCoherence
  coherenceTheoremProvedTerm : coherenceTheoremProved

structure CoherenceEvidence {B : BicategoryObject} (C : CoherencePackage B) where
  maclaneCoherenceClosed : C.maclaneCoherence
  strictificationExistsClosed : C.strictificationExists
  coherenceTheoremProvedClosed : C.coherenceTheoremProved

def CoherenceClosed {B : BicategoryObject} (C : CoherencePackage B) : Prop :=
  C.maclaneCoherence ∧ C.strictificationExists ∧ C.coherenceTheoremProved

theorem coherence_closed_from_evidence {B : BicategoryObject} (C : CoherencePackage B)
    (E : CoherenceEvidence C) : CoherenceClosed C := by
  exact And.intro E.maclaneCoherenceClosed
    (And.intro E.strictificationExistsClosed E.coherenceTheoremProvedClosed)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
