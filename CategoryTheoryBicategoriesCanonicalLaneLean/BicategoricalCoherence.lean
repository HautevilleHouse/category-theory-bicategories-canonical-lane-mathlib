import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoricalCoherencePackage where
  bicategory : Type u
  coherenceLaws : Prop
  pentagonIdentity : Prop
  triangleIdentity : Prop
  associatorNatural : Prop
  unitorsNatural : Prop

structure BicategoricalCoherenceEvidence (B : BicategoricalCoherencePackage) where
  coherenceLawsClosed : B.coherenceLaws
  pentagonIdentityClosed : B.pentagonIdentity
  triangleIdentityClosed : B.triangleIdentity
  associatorNaturalClosed : B.associatorNatural
  unitorsNaturalClosed : B.unitorsNatural

def BicategoricalCoherenceClosed (B : BicategoricalCoherencePackage) : Prop :=
  B.coherenceLaws ∧ B.pentagonIdentity ∧ B.triangleIdentity ∧ B.associatorNatural ∧ B.unitorsNatural

theorem bicategorical_coherence_closed_from_evidence (B : BicategoricalCoherencePackage) (E : BicategoricalCoherenceEvidence B) : BicategoricalCoherenceClosed B := by
  exact And.intro E.coherenceLawsClosed (And.intro E.pentagonIdentityClosed (And.intro E.triangleIdentityClosed (And.intro E.associatorNaturalClosed E.unitorsNaturalClosed)))

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse