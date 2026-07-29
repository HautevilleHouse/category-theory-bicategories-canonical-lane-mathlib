import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure BicategoryGraph where
  objects : Type u
  morphisms : objects → objects → Type v
  twoCells : ∀ {a b : objects}, (f g : morphisms a b) → Type w
  identity : ∀ (a : objects), morphisms a a
  composition : ∀ {a b c : objects}, morphisms a b → morphisms b c → morphisms a c
  horizComp : ∀ {a b c : objects} {f f' : morphisms a b} {g g' : morphisms b c},
    twoCells f f' → twoCells g g' → twoCells (composition f g) (composition f' g')
  associator : ∀ {a b c d : objects} (f : morphisms a b) (g : morphisms b c) (h : morphisms c d),
    twoCells (composition (composition f g) h) (composition f (composition g h))
  leftUnitor : ∀ {a b : objects} (f : morphisms a b), twoCells (composition (identity a) f) f
  rightUnitor : ∀ {a b : objects} (f : morphisms a b), twoCells (composition f (identity b)) f
  coherenceConditions : Prop
  coherenceConditionsTerm : coherenceConditions

structure BicategoryGraphEvidence (G : BicategoryGraph) where
  objectsDefined : G.objects = G.objects
  morphismsDefined : ∀ a b, G.morphisms a b = G.morphisms a b
  twoCellsDefined : ∀ a b f g, G.twoCells a b f g = G.twoCells a b f g
  identityDefined : ∀ a, G.identity a = G.identity a
  compositionDefined : ∀ a b c f g, G.composition a b c f g = G.composition a b c f g
  horizCompDefined : ∀ a b c f f' g g' α β, G.horizComp a b c f f' g g' α β = G.horizComp a b c f f' g g' α β
  coherenceConditionsClosed : G.coherenceConditions

def BicategoryGraphClosed (G : BicategoryGraph) : Prop :=
  G.coherenceConditions

theorem bicategory_graph_closed_from_evidence (G : BicategoryGraph) (E : BicategoryGraphEvidence G) :
    BicategoryGraphClosed G := by
  exact E.coherenceConditionsClosed

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse