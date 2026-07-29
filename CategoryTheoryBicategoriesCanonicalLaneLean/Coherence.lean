import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure CoherenceTheoremPackage (B : BicategoryStructurePackage) where
  existsStrictification : Prop
  equivalenceToStrict : Prop
  coherenceConditionsHeld : Prop

structure CoherenceTheoremEvidence {B : BicategoryStructurePackage} (C : CoherenceTheoremPackage B) where
  existsStrictificationClosed : C.existsStrictification
  equivalenceToStrictClosed : C.equivalenceToStrict
  coherenceConditionsHeldClosed : C.coherenceConditionsHeld

def CoherenceTheoremClosed {B : BicategoryStructurePackage} (C : CoherenceTheoremPackage B) : Prop :=
  C.existsStrictification ∧ C.equivalenceToStrict ∧ C.coherenceConditionsHeld

theorem coherence_theorem_closed_from_evidence {B : BicategoryStructurePackage} (C : CoherenceTheoremPackage B) (E : CoherenceTheoremEvidence C) : CoherenceTheoremClosed C := by
  exact And.intro E.existsStrictificationClosed (And.intro E.equivalenceToStrictClosed E.coherenceConditionsHeldClosed)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse