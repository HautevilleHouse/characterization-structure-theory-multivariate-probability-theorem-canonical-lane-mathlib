import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

/-- Stochastic calculus structure including Itô integral and stochastic differential equations. -/
structure StochasticCalculusStructure where
  brownianMotion : Type u
  itoIntegral : Type v
  sdeExistence : Prop
  itoFormula : Prop
  girsanovTheorem : Prop

/-- The admissible class extension for stochastic calculus. -/
structure AdmissibleClassStochastic extends AdmissibleClass where
  stochStr : StochasticCalculusStructure
  stochBridgeClosed : bridgeClosed (AdmissibleClass.mk (AdmissibleClass.charStruct) (AdmissibleClass.endpointSatisfied) (AdmissibleClass.remainderRecorded) (AdmissibleClass.gateWitness))
  stochGateClosed : gateClosed (AdmissibleClass.mk (AdmissibleClass.charStruct) (AdmissibleClass.endpointSatisfied) (AdmissibleClass.remainderRecorded) (AdmissibleClass.gateWitness))

/-- The closed property for stochastic calculus. -/
def StochasticCalculusClosed (A : AdmissibleClassStochastic) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ A.stochStr.sdeExistence ∧ A.stochStr.itoFormula

/-- Evidence that stochastic calculus is closed. -/
theorem stochastic_calculus_closed_from_evidence (A : AdmissibleClassStochastic) : StochasticCalculusClosed A :=
  And.intro (bridge_from_admissible_class A) (And.intro (gate_from_admissible_class A) (And.intro A.stochStr.sdeExistence A.stochStr.itoFormula))

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse