import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryDefs

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure YonedaPackage (B : BicategoryObject) where
  yonedaEmbedding : Prop
  naturalIsomorphism : Prop
  yonedaLemmaStatement : Prop
  representablePresheaves : Prop
  yonedaEmbeddingTerm : yonedaEmbedding
  naturalIsomorphismTerm : naturalIsomorphism
  yonedaLemmaStatementTerm : yonedaLemmaStatement
  representablePresheavesTerm : representablePresheaves

structure YonedaEvidence {B : BicategoryObject} (Y : YonedaPackage B) where
  yonedaEmbeddingClosed : Y.yonedaEmbedding
  naturalIsomorphismClosed : Y.naturalIsomorphism
  yonedaLemmaStatementClosed : Y.yonedaLemmaStatement
  representablePresheavesClosed : Y.representablePresheaves

def YonedaClosed {B : BicategoryObject} (Y : YonedaPackage B) : Prop :=
  Y.yonedaEmbedding ∧ Y.naturalIsomorphism ∧ Y.yonedaLemmaStatement ∧ Y.representablePresheaves

theorem yoneda_closed_from_evidence {B : BicategoryObject} (Y : YonedaPackage B)
    (E : YonedaEvidence Y) : YonedaClosed Y := by
  exact And.intro E.yonedaEmbeddingClosed
    (And.intro E.naturalIsomorphismClosed
      (And.intro E.yonedaLemmaStatementClosed E.representablePresheavesClosed))

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
