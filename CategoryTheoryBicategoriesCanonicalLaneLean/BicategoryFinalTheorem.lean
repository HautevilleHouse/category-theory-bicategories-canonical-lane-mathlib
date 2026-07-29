import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryGateLemmas

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

def ConstrainedBicategoryClosure (A : BicategoryAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bicategory_endgame (A : BicategoryAdmissibleClass) :
    ConstrainedBicategoryClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
