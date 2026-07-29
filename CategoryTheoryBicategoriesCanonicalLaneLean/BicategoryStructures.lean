import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryPackage where
  objects : Type u
  oneCells : objects → objects → Type v
  twoCells : ∀ {a b : objects}, oneCells a b → oneCells a b → Type w
  compositionOne : ∀ {a b c : objects}, oneCells b c → oneCells a b → oneCells a c
  identityOne : ∀ (a : objects), oneCells a a
  compositionTwo : ∀ {a b : objects} {f g h : oneCells a b}, twoCells g h → twoCells f g → twoCells f h
  identityTwo : ∀ {a b : objects} (f : oneCells a b), twoCells f f
  associator : ∀ {a b c d : objects} (h : oneCells c d) (g : oneCells b c) (f : oneCells a b), twoCells (compositionOne h (compositionOne g f)) (compositionOne (compositionOne h g) f)
  leftUnitor : ∀ {a b : objects} (f : oneCells a b), twoCells (compositionOne (identityOne b) f) f
  rightUnitor : ∀ {a b : objects} (f : oneCells a b), twoCells (compositionOne f (identityOne a)) f
  pentagonCondition : ∀ {a b c d e : objects} (k : oneCells d e) (h : oneCells c d) (g : oneCells b c) (f : oneCells a b), twoCells (compositionTwo (associator k h (compositionOne g f)) (compositionTwo (associator (compositionOne k h) g f) (compositionTwo (compositionTwo (identityTwo k) (associator h g f)) (associator k (compositionOne h g) f)))) (associator (compositionOne k h) g f)
  triangleCondition : ∀ {a b c : objects} (g : oneCells b c) (f : oneCells a b), twoCells (compositionTwo (rightUnitor g) (compositionTwo (associator g (identityOne b) f) (compositionTwo (leftUnitor f) (identityTwo g)))) (compositionTwo (identityTwo g) (rightUnitor f))

structure BicategoryEvidence (B : BicategoryPackage) where
  pentagonConditionClosed : B.pentagonCondition
  triangleConditionClosed : B.triangleCondition

def BicategoryClosed (B : BicategoryPackage) : Prop :=
  B.pentagonCondition ∧ B.triangleCondition

theorem bicategory_closed_from_evidence (B : BicategoryPackage) (E : BicategoryEvidence B) : BicategoryClosed B :=
  And.intro E.pentagonConditionClosed E.triangleConditionClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse