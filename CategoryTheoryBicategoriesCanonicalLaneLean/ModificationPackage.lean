import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.LaxFunctorPackage

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure ModificationPackage (B C : BicategoryPackage) (F G : LaxFunctorPackage B C) where
  component : ∀ (a : B.obj), C.twoCell (F.objMap a) (G.objMap a)
  naturalityCondition : Prop

structure ModificationEvidence (B C : BicategoryPackage) (F G : LaxFunctorPackage B C) (M : ModificationPackage B C F G) where
  naturalityConditionClosed : M.naturalityCondition

def ModificationClosed (B C : BicategoryPackage) (F G : LaxFunctorPackage B C) (M : ModificationPackage B C F G) : Prop :=
  M.naturalityCondition

theorem modification_closed_from_evidence (B C : BicategoryPackage) (F G : LaxFunctorPackage B C) (M : ModificationPackage B C F G) (E : ModificationEvidence B C F G M) : ModificationClosed B C F G M := by
  exact E.naturalityConditionClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse