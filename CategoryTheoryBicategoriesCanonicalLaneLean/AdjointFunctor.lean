import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure AdjointFunctorPackage where
  categoryA : Type u
  categoryB : Type v
  leftAdjoint : Type w
  rightAdjoint : Type x
  adjunctionDefined : Prop
  unitCounitCoherence : Prop
  universalProperty : Prop

structure AdjointFunctorEvidence (A : AdjointFunctorPackage) where
  adjunctionDefinedClosed : A.adjunctionDefined
  unitCounitCoherenceClosed : A.unitCounitCoherence
  universalPropertyClosed : A.universalProperty

def AdjointFunctorClosed (A : AdjointFunctorPackage) : Prop :=
  A.adjunctionDefined ∧ A.unitCounitCoherence ∧ A.universalProperty

theorem adjoint_functor_closed_from_evidence (A : AdjointFunctorPackage) (E : AdjointFunctorEvidence A) : AdjointFunctorClosed A := by
  exact And.intro E.adjunctionDefinedClosed (And.intro E.unitCounitCoherenceClosed E.universalPropertyClosed)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse