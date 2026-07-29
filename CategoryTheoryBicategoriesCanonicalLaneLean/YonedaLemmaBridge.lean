import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

structure YonedaEmbedding (C : Type u) [Category C] where
  yoneda : C ⥤ (Cᵒᵖ ⥤ Type v)
  fullyFaithful : ∀ (X Y : C), (yoneda.map : (X ⟶ Y) → ((yoneda.obj X) ⟶ (yoneda.obj Y))) ≃ (X ⟶ Y)

def isRepresentable (C : Type u) [Category C] (F : Cᵒᵖ ⥤ Type v) : Prop :=
  ∃ (X : C) (u : F.obj (op X)), ∀ (Y : C), Function.Bijective (λ (f : Y ⟶ X) => F.map f.op u)

structure YonedaEvidence (C : Type u) [Category C] (Y : YonedaEmbedding C) where
  fullyFaithfulClosed : Y.fullyFaithful
  representableCondition : ∀ (F : Cᵒᵖ ⥤ Type v), isRepresentable C F ↔ ∃ (X : C), Y.yoneda.obj X ≅ F

def YonedaClosed (C : Type u) [Category C] (Y : YonedaEmbedding C) : Prop :=
  Y.fullyFaithful ∧ ∀ (F : Cᵒᵖ ⥤ Type v), isRepresentable C F ↔ ∃ (X : C), Y.yoneda.obj X ≅ F

theorem yoneda_closed_from_evidence (C : Type u) [Category C] (Y : YonedaEmbedding C) (E : YonedaEvidence C Y) : YonedaClosed C Y :=
  And.intro E.fullyFaithfulClosed E.representableCondition

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse