import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure LaxFunctorPackage (B : BicategoryStructuresPackage) where
  source : BicategoryStructuresPackage
  target : BicategoryStructuresPackage
  objMap : source.objects → target.objects
  oneCellMap : source.oneCells → target.oneCells
  compositionConstraint : Prop
  unitConstraint : Prop

structure LaxFunctorEvidence {B : BicategoryStructuresPackage} (F : LaxFunctorPackage B) where
  compositionConstraintClosed : F.compositionConstraint
  unitConstraintClosed : F.unitConstraint

def LaxFunctorClosed {B : BicategoryStructuresPackage} (F : LaxFunctorPackage B) : Prop :=
  F.compositionConstraint ∧ F.unitConstraint

theorem lax_functor_closed_from_evidence {B : BicategoryStructuresPackage}
    (F : LaxFunctorPackage B) (E : LaxFunctorEvidence F) : LaxFunctorClosed F :=
  And.intro E.compositionConstraintClosed E.unitConstraintClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse