import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BicategoryGraph

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure YonedaEmbedding {G : BicategoryGraph} where
  functorConstruction : Prop
  fullFaithfulness : Prop
  embeddingIntoPresheaves : Prop
  universalProperty : Prop
  functorConstructionTerm : functorConstruction
  fullFaithfulnessTerm : fullFaithfulness
  embeddingIntoPresheavesTerm : embeddingIntoPresheaves
  universalPropertyTerm : universalProperty

structure YonedaEmbeddingEvidence {G : BicategoryGraph} (Y : YonedaEmbedding {G := G}) where
  functorConstructionClosed : Y.functorConstruction
  fullFaithfulnessClosed : Y.fullFaithfulness
  embeddingIntoPresheavesClosed : Y.embeddingIntoPresheaves
  universalPropertyClosed : Y.universalProperty

def YonedaEmbeddingClosed {G : BicategoryGraph} (Y : YonedaEmbedding {G := G}) : Prop :=
  Y.functorConstruction ∧ Y.fullFaithfulness ∧ Y.embeddingIntoPresheaves ∧ Y.universalProperty

theorem yoneda_embedding_closed_from_evidence {G : BicategoryGraph}
    (Y : YonedaEmbedding {G := G}) (E : YonedaEmbeddingEvidence Y) :
    YonedaEmbeddingClosed Y := by
  exact And.intro E.functorConstructionClosed
    (And.intro E.fullFaithfulnessClosed
      (And.intro E.embeddingIntoPresheavesClosed E.universalPropertyClosed))

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse