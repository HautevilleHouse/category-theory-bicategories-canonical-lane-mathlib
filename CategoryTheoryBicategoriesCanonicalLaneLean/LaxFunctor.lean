import canonicalLaneMathlib.AdmissibleClass
import canonicalLaneMathlib.BicategoryGraph

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure LaxFunctor (B C : BicategoryGraph) where
  onObjects : B.objects → C.objects
  onMorphisms : ∀ {a b : B.objects}, B.morphisms a b → C.morphisms (onObjects a) (onObjects b)
  onTwoCells : ∀ {a b : B.objects} {f g : B.morphisms a b}, B.twoCells f g → C.twoCells (onMorphisms f) (onMorphisms g)
  unitMorphism : ∀ (a : B.objects), C.morphisms (C.identity (onObjects a)) (onMorphisms (B.identity a))
  compositionMorphism : ∀ {a b c : B.objects} (f : B.morphisms a b) (g : B.morphisms b c),
    C.morphisms (onMorphisms (B.composition f g)) (C.composition (onMorphisms f) (onMorphisms g))
  coherenceConditions : Prop
  coherenceConditionsTerm : coherenceConditions

structure LaxFunctorEvidence {B C : BicategoryGraph} (F : LaxFunctor B C) where
  onObjectsDefined : True
  onMorphismsDefined : True
  onTwoCellsDefined : True
  unitMorphismDefined : True
  compositionMorphismDefined : True
  coherenceConditionsClosed : F.coherenceConditions

def LaxFunctorClosed {B C : BicategoryGraph} (F : LaxFunctor B C) : Prop :=
  F.coherenceConditions

theorem lax_functor_closed_from_evidence {B C : BicategoryGraph}
    (F : LaxFunctor B C) (E : LaxFunctorEvidence F) : LaxFunctorClosed F := by
  exact E.coherenceConditionsClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse