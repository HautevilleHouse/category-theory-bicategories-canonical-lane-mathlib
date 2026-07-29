import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryObjects

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryConstruction where
  objType : Type u
  homType : objType → objType → Type v
  compositionAssociative : Prop
  identityLaws : Prop
  constructionEvidence : compositionAssociative ∧ identityLaws

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
