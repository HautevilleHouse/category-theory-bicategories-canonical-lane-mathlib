import canonicalLaneMathlib.AdmissibleClass
import CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryBase

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure CoherenceLaws (B : BicategoryLike) where
  pentagon : Prop
  triangle : Prop
  pentagonHolds : pentagon
  triangleHolds : triangle

structure MacLaneCoherence (B : BicategoryLike) (C : CoherenceLaws B) where
  allDiagramsCommute : Prop
  proof : allDiagramsCommute

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
