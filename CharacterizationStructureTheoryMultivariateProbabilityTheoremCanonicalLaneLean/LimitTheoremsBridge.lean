import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

/-- The limit theorem structure: includes weak law of large numbers and central limit theorem components. -/
structure LimitTheoremStructure where
  sampleMean : MultivariateProbabilitySpace → Type u
  distributionConvergence : Prop
  characteristicFunction : Type v
  levyContinuity : Prop
  centalLimitTheorem : Prop

/-- The admissible class extension for limit theorems. -/
structure AdmissibleClassLimit extends AdmissibleClass where
  limitStr : LimitTheoremStructure
  limitBridgeClosed : bridgeClosed (AdmissibleClass.mk (AdmissibleClass.charStruct) (AdmissibleClass.endpointSatisfied) (AdmissibleClass.remainderRecorded) (AdmissibleClass.gateWitness))
  limitGateClosed : gateClosed (AdmissibleClass.mk (AdmissibleClass.charStruct) (AdmissibleClass.endpointSatisfied) (AdmissibleClass.remainderRecorded) (AdmissibleClass.gateWitness))

/-- The closed property for limit theorems. -/
def LimitTheoremClosed (A : AdmissibleClassLimit) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ A.limitStr.distributionConvergence

/-- Evidence that limit theorems are closed. -/
theorem limit_theorem_closed_from_evidence (A : AdmissibleClassLimit) : LimitTheoremClosed A :=
  And.intro (bridge_from_admissible_class A) (And.intro (gate_from_admissible_class A) A.limitStr.distributionConvergence)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse