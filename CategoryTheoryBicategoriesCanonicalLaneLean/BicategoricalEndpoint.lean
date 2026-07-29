import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BicategoryGraph
import canonicalLaneMathlib.YonedaEmbedding

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoricalEndpoint {G : BicategoryGraph} {Y : YonedaEmbedding {G := G}} where
  targetCategory : BicategoryGraph
  targetIsCartesian : Prop
  yonedaEmbeddingExists : Prop
  endofunctorRecognized : Prop
  equivalenceExists : Prop
  endpointSatisfied : targetIsCartesian ∧ yonedaEmbeddingExists ∧ endofunctorRecognized ∧ equivalenceExists

structure BicategoricalEndpointEvidence {G : BicategoryGraph} {Y : YonedaEmbedding {G := G}}
    (E : BicategoricalEndpoint {G := G} {Y := Y}) where
  targetIsCartesianClosed : E.targetIsCartesian
  yonedaEmbeddingExistsClosed : E.yonedaEmbeddingExists
  endofunctorRecognizedClosed : E.endofunctorRecognized
  equivalenceExistsClosed : E.equivalenceExists

def BicategoricalEndpointClosed {G : BicategoryGraph} {Y : YonedaEmbedding {G := G}}
    (E : BicategoricalEndpoint {G := G} {Y := Y}) : Prop :=
  E.targetIsCartesian ∧ E.yonedaEmbeddingExists ∧ E.endofunctorRecognized ∧ E.equivalenceExists

theorem bicategorical_endpoint_closed_from_evidence
    {G : BicategoryGraph} {Y : YonedaEmbedding {G := G}}
    (E : BicategoricalEndpoint {G := G} {Y := Y}) (Ev : BicategoricalEndpointEvidence E) :
    BicategoricalEndpointClosed E := by
  exact And.intro Ev.targetIsCartesianClosed
    (And.intro Ev.yonedaEmbeddingExistsClosed
      (And.intro Ev.endofunctorRecognizedClosed Ev.equivalenceExistsClosed))

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse