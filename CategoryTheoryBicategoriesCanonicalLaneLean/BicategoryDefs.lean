import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryObject where
  carrier : Type u
  twoCategoryStructure : Prop
  verticalComposition : Prop
  horizontalComposition : Prop
  associator : Prop
  leftUnit : Prop
  rightUnit : Prop
  pentagonAxiom : Prop
  triangleAxiom : Prop
  verticalCompositionTerm : verticalComposition
  horizontalCompositionTerm : horizontalComposition
  associatorTerm : associator
  leftUnitTerm : leftUnit
  rightUnitTerm : rightUnit
  pentagonAxiomTerm : pentagonAxiom
  triangleAxiomTerm : triangleAxiom

structure BicategoryEvidence (B : BicategoryObject) where
  verticalCompositionClosed : B.verticalComposition
  horizontalCompositionClosed : B.horizontalComposition
  associatorClosed : B.associator
  leftUnitClosed : B.leftUnit
  rightUnitClosed : B.rightUnit
  pentagonAxiomClosed : B.pentagonAxiom
  triangleAxiomClosed : B.triangleAxiom

def BicategoryClosed (B : BicategoryObject) : Prop :=
  B.verticalComposition ∧ B.horizontalComposition ∧ B.associator ∧
  B.leftUnit ∧ B.rightUnit ∧ B.pentagonAxiom ∧ B.triangleAxiom

theorem bicategory_closed_from_evidence (B : BicategoryObject) (E : BicategoryEvidence B) :
    BicategoryClosed B := by
  exact And.intro E.verticalCompositionClosed
    (And.intro E.horizontalCompositionClosed
      (And.intro E.associatorClosed
        (And.intro E.leftUnitClosed
          (And.intro E.rightUnitClosed
            (And.intro E.pentagonAxiomClosed E.triangleAxiomClosed)))))

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
