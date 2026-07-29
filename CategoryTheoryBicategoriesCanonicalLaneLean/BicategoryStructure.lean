import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryStructurePackage where
  objects : Type u
  oneCells : objects → objects → Type v
  twoCells : ∀ {a b : objects}, oneCells a b → oneCells a b → Type w
  idOneCell : ∀ (a : objects), oneCells a a
  compOneCell : ∀ {a b c : objects}, oneCells b c → oneCells a b → oneCells a c
  idTwoCell : ∀ {a b : objects} (f : oneCells a b), twoCells f f
  vertComp : ∀ {a b : objects} {f g h : oneCells a b}, twoCells g h → twoCells f g → twoCells f h
  horizComp : ∀ {a b c : objects} {f g : oneCells a b} {h k : oneCells b c}, twoCells f g → twoCells h k → twoCells (compOneCell h f) (compOneCell k g)
  associator : ∀ {a b c d : objects} (f : oneCells a b) (g : oneCells b c) (h : oneCells c d), twoCells (compOneCell (compOneCell h g) f) (compOneCell h (compOneCell g f))
  leftUnitor : ∀ {a b : objects} (f : oneCells a b), twoCells (compOneCell (idOneCell b) f) f
  rightUnitor : ∀ {a b : objects} (f : oneCells a b), twoCells (compOneCell f (idOneCell a)) f
  pentagonAxiom : Prop
  triangleAxiom : Prop
  associatorNaturality : Prop
  leftUnitorNaturality : Prop
  rightUnitorNaturality : Prop

structure BicategoryStructureEvidence (B : BicategoryStructurePackage) where
  pentagonAxiomClosed : B.pentagonAxiom
  triangleAxiomClosed : B.triangleAxiom
  associatorNaturalityClosed : B.associatorNaturality
  leftUnitorNaturalityClosed : B.leftUnitorNaturality
  rightUnitorNaturalityClosed : B.rightUnitorNaturality

def BicategoryStructureClosed (B : BicategoryStructurePackage) : Prop :=
  B.pentagonAxiom ∧ B.triangleAxiom ∧ B.associatorNaturality ∧ B.leftUnitorNaturality ∧ B.rightUnitorNaturality

theorem bicategory_structure_closed_from_evidence (B : BicategoryStructurePackage) (E : BicategoryStructureEvidence B) : BicategoryStructureClosed B := by
  exact And.intro E.pentagonAxiomClosed (And.intro E.triangleAxiomClosed (And.intro E.associatorNaturalityClosed (And.intro E.leftUnitorNaturalityClosed E.rightUnitorNaturalityClosed)))

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse