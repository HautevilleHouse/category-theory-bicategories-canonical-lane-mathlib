import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

def ConstrainedBicategoryClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_bicategory_endgame (A : AdmissibleClass) : ConstrainedBicategoryClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse