import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BicategoryWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse