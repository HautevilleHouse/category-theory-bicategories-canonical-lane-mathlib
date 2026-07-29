import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryAdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

def bridgeClosed (A : BicategoryAdmissibleClass) : Prop :=
  A.B.strictAssoc ∧ A.B.leftUnit ∧ A.B.rightUnit

theorem bridge_from_admissible_class (A : BicategoryAdmissibleClass) :
    bridgeClosed A := by
  exact A.strictlyAdmits.strictAssoc, A.strictlyAdmits.strictLeftUnit, A.strictlyAdmits.strictRightUnit

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
