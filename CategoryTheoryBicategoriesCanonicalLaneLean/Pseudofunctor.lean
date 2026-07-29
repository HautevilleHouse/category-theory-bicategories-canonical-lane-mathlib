import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryStructure

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure PseudofunctorPackage (B C : BicategoryStructurePackage) where
  onObjects : B.objects → C.objects
  onOneCells : ∀ {a b : B.objects}, B.oneCells a b → C.oneCells (onObjects a) (onObjects b)
  onTwoCells : ∀ {a b : B.objects} {f g : B.oneCells a b}, B.twoCells f g → C.twoCells (onOneCells f) (onOneCells g)
  structureIsotr : Prop
  unitCoherence : Prop
  compositionCoherence : Prop

structure PseudofunctorEvidence {B C : BicategoryStructurePackage} (P : PseudofunctorPackage B C) where
  structureIsotrClosed : P.structureIsotr
  unitCoherenceClosed : P.unitCoherence
  compositionCoherenceClosed : P.compositionCoherence

def PseudofunctorClosed {B C : BicategoryStructurePackage} (P : PseudofunctorPackage B C) : Prop :=
  P.structureIsotr ∧ P.unitCoherence ∧ P.compositionCoherence

theorem pseudofunctor_closed_from_evidence {B C : BicategoryStructurePackage} (P : PseudofunctorPackage B C) (E : PseudofunctorEvidence P) : PseudofunctorClosed P := by
  exact And.intro E.structureIsotrClosed (And.intro E.unitCoherenceClosed E.compositionCoherenceClosed)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse