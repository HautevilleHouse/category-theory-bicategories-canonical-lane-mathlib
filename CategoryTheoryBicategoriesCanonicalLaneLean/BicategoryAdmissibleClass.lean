import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryBase

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryAdmissibleClass where
  B : BicategoryLike
  strictlyAdmits : StrictBicategory B
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

structure BicategoryAdmittedObject where
  B : BicategoryLike
  strictlyAdmits : StrictBicategory B
  conclusion : B.strictAssoc ∧ B.leftUnit ∧ B.rightUnit
  bridgeConclusion : conclusion
  gateConclusion : B.strictAssoc ∨ B.leftUnit ∨ B.rightUnit

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
