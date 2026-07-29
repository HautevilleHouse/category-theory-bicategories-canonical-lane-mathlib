import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryBridgeLemmas

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

def gateClosed (A : BicategoryAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : BicategoryAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
