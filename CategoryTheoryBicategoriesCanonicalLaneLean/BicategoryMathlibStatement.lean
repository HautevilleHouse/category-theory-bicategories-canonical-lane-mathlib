import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CategoryTheoryBicategoriesCanonicalLaneLean.BicategoryFinalTheorem

namespace HautevilleHouse
namespace CategoryTheoryBicategoriesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation :=
  { sourceKey := sourceRepository,
    theoremObject := sourceDescription,
    commonCoreImported := true,
    theoremSpecificDefinitionsNative := true,
    theoremSpecificBridgeNative := true,
    theoremSpecificAdmittedClosureNative := true,
    unrestrictedClassicalClosureNative := false,
    carriedGap := "theorem-specific Mathlib endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
  }

def theoremSpecificEndgamePilotClosed : Prop :=
  forall A : AdmissibleClass, ConstrainedBicategoryClosure A

theorem theorem_specific_endgame_pilot_checked :
    theoremSpecificEndgamePilotClosed := by
  intro A
  exact constrained_bicategory_endgame A

end CategoryTheoryBicategoriesCanonicalLaneLean
end HautevilleHouse
