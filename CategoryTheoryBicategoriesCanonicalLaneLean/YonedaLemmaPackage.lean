import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure YonedaLemmaPackage (B : BicategoryStructuresPackage) where
  yonedaEmbedding : Type u
  fullyFaithful : Prop
  representationTheorem : Prop

structure YonedaLemmaEvidence (Y : YonedaLemmaPackage) where
  fullyFaithfulClosed : Y.fullyFaithful
  representationTheoremClosed : Y.representationTheorem

def YonedaLemmaClosed (Y : YonedaLemmaPackage) : Prop :=
  Y.fullyFaithful ∧ Y.representationTheorem

theorem yoneda_lemma_closed_from_evidence (Y : YonedaLemmaPackage)
    (E : YonedaLemmaEvidence Y) : YonedaLemmaClosed Y :=
  And.intro E.fullyFaithfulClosed E.representationTheoremClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse