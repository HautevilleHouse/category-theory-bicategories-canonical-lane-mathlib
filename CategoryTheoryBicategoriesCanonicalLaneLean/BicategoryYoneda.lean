import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryBase
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryCoherence

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryYonedaPackage {B : BicategoryBasePackage} {Bclosed : BicategoryBaseClosed B}
  {C : BicategoryCoherencePackage Bclosed} (Cclosed : BicategoryCoherenceClosed C) where
  yonedaEmbeddingDefined : Prop
  yonedaLemmaProved : Prop

structure BicategoryYonedaEvidence {B : BicategoryBasePackage} {Bclosed : BicategoryBaseClosed B}
  {C : BicategoryCoherencePackage Bclosed} {Cclosed : BicategoryCoherenceClosed C}
  (Y : BicategoryYonedaPackage Cclosed) where
  yonedaEmbeddingDefinedClosed : Y.yonedaEmbeddingDefined
  yonedaLemmaProvedClosed : Y.yonedaLemmaProved

def BicategoryYonedaClosed {B : BicategoryBasePackage} {Bclosed : BicategoryBaseClosed B}
  {C : BicategoryCoherencePackage Bclosed} {Cclosed : BicategoryCoherenceClosed C}
  (Y : BicategoryYonedaPackage Cclosed) : Prop :=
  Y.yonedaEmbeddingDefined ∧ Y.yonedaLemmaProved

theorem bicategory_yoneda_closed_from_evidence {B : BicategoryBasePackage}
  {Bclosed : BicategoryBaseClosed B} {C : BicategoryCoherencePackage Bclosed}
  {Cclosed : BicategoryCoherenceClosed C} (Y : BicategoryYonedaPackage Cclosed)
  (E : BicategoryYonedaEvidence Y) : BicategoryYonedaClosed Y := by
  exact And.intro E.yonedaEmbeddingDefinedClosed E.yonedaLemmaProvedClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse