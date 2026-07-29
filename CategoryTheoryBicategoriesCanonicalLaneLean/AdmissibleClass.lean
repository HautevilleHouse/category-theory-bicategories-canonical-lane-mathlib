import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure AdmissibleClass where
  object : BicategoryAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BicategoryWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
