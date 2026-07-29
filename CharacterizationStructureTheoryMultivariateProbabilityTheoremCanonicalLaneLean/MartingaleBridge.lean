import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure MartingaleBridgePackage {C : CharacterizationStructurePackage}
    (M : MultivariateConvergencePackage C) where
  martingaleSequence : Type u
  martingaleProperty : Prop
  convergenceInProbability : Prop
  almostSureConvergence : Prop
  integralConstraints : Prop

structure MartingaleBridgeEvidence {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} (B : MartingaleBridgePackage M) where
  martingalePropertyClosed : B.martingaleProperty
  convergenceInProbabilityClosed : B.convergenceInProbability
  almostSureConvergenceClosed : B.almostSureConvergence
  integralConstraintsClosed : B.integralConstraints

def MartingaleBridgeClosed {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} (B : MartingaleBridgePackage M) : Prop :=
  B.martingaleProperty ∧ B.convergenceInProbability ∧
  B.almostSureConvergence ∧ B.integralConstraints

theorem martingale_bridge_closed_from_evidence
    {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} (B : MartingaleBridgePackage M)
    (E : MartingaleBridgeEvidence B) : MartingaleBridgeClosed B := by
  exact And.intro E.martingalePropertyClosed
    (And.intro E.convergenceInProbabilityClosed
      (And.intro E.almostSureConvergenceClosed E.integralConstraintsClosed))

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
