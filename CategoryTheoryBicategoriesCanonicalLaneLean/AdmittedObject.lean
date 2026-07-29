import canonicalLaneMathlib.BicategoryGraph

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategorySpace where
  carrier : Type
  graph : BicategoryGraph

structure AdmittedObject where
  space : BicategorySpace
  CartesianClosed : Prop
  YonedaEmbeddingExists : Prop
  biproductsExist : Prop
  conclusion : CartesianClosed ∧ YonedaEmbeddingExists ∧ biproductsExist

def BicategoryWitnessClosed (O : AdmittedObject) : Prop :=
  O.conclusion

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse