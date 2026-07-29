import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure PseudofunctorPackage (B : BicategoryStructuresPackage) (F : LaxFunctorPackage B) where
  associatorIso : Prop
  unitorIso : Prop
  coherenceCondition : Prop

structure PseudofunctorEvidence {B : BicategoryStructuresPackage} {F : LaxFunctorPackage B}
    (P : PseudofunctorPackage B F) where
  associatorIsoClosed : P.associatorIso
  unitorIsoClosed : P.unitorIso
  coherenceConditionClosed : P.coherenceCondition

def PseudofunctorClosed {B : BicategoryStructuresPackage} {F : LaxFunctorPackage B}
    (P : PseudofunctorPackage B F) : Prop :=
  P.associatorIso ∧ P.unitorIso ∧ P.coherenceCondition

theorem pseudofunctor_closed_from_evidence {B : BicategoryStructuresPackage} {F : LaxFunctorPackage B}
    (P : PseudofunctorPackage B F) (E : PseudofunctorEvidence P) : PseudofunctorClosed P :=
  And.intro E.associatorIsoClosed (And.intro E.unitorIsoClosed E.coherenceConditionClosed)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse