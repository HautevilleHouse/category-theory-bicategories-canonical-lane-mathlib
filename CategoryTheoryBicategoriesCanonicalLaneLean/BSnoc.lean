import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoricalYonedaPackage where
  bicategory : Type u
  categoryOfPseudoFunctors : Type v
  yonedaEmbeddingFullFaithful : Prop
  yonedaEmbeddingPreserveLimits : Prop
  yonedaLemma : Prop

structure BicategoricalYonedaEvidence (Y : BicategoricalYonedaPackage) where
  yonedaEmbeddingFullFaithfulClosed : Y.yonedaEmbeddingFullFaithful
  yonedaEmbeddingPreserveLimitsClosed : Y.yonedaEmbeddingPreserveLimits
  yonedaLemmaClosed : Y.yonedaLemma

def BicategoricalYonedaClosed (Y : BicategoricalYonedaPackage) : Prop :=
  Y.yonedaEmbeddingFullFaithful ∧ Y.yonedaEmbeddingPreserveLimits ∧ Y.yonedaLemma

theorem bicategorical_yoneda_closed_from_evidence (Y : BicategoricalYonedaPackage) (E : BicategoricalYonedaEvidence Y) : BicategoricalYonedaClosed Y := by
  exact And.intro E.yonedaEmbeddingFullFaithfulClosed (And.intro E.yonedaEmbeddingPreserveLimitsClosed E.yonedaLemmaClosed)

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse