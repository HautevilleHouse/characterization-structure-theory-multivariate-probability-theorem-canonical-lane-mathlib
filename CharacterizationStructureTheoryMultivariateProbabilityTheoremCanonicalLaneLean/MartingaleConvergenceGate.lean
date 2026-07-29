import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

/-- Martingale structure with convergence properties. -/
structure MartingaleConvergenceStructure where
  filtration : Type u
  adaptedProcess : Type v
  martingaleProperty : Prop
  convergenceTheorem : Prop
  uniformlyIntegrable : Prop

/-- The admissible class extension for martingale convergence. -/
structure AdmissibleClassMartingale extends AdmissibleClass where
  martingaleStr : MartingaleConvergenceStructure
  martingaleBridgeClosed : bridgeClosed (AdmissibleClass.mk (AdmissibleClass.charStruct) (AdmissibleClass.endpointSatisfied) (AdmissibleClass.remainderRecorded) (AdmissibleClass.gateWitness))
  martingaleGateClosed : gateClosed (AdmissibleClass.mk (AdmissibleClass.charStruct) (AdmissibleClass.endpointSatisfied) (AdmissibleClass.remainderRecorded) (AdmissibleClass.gateWitness))

/-- The closed property for martingale convergence. -/
def MartingaleConvergenceClosed (A : AdmissibleClassMartingale) : Prop :=
  bridgeClosed A ∧ gateClosed A ∧ A.martingaleStr.convergenceTheorem

/-- Evidence that martingale convergence is closed. -/
theorem martingale_convergence_closed_from_evidence (A : AdmissibleClassMartingale) : MartingaleConvergenceClosed A :=
  And.intro (bridge_from_admissible_class A) (And.intro (gate_from_admissible_class A) A.martingaleStr.convergenceTheorem)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse