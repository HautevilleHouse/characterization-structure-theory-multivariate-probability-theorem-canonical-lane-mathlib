import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure MultivariateConvergencePackage (C : CharacterizationStructurePackage) where
  sampleSize : ℕ
  convergenceRate : Prop
  limitingDistribution : Type x
  convergenceInLaw : Prop
  uniformIntegrability : Prop

structure MultivariateConvergenceEvidence {C : CharacterizationStructurePackage}
    (M : MultivariateConvergencePackage C) where
  convergenceRateClosed : M.convergenceRate
  convergenceInLawClosed : M.convergenceInLaw
  uniformIntegrabilityClosed : M.uniformIntegrability

def MultivariateConvergenceClosed {C : CharacterizationStructurePackage}
    (M : MultivariateConvergencePackage C) : Prop :=
  M.convergenceRate ∧ M.convergenceInLaw ∧ M.uniformIntegrability

theorem multivariate_convergence_closed_from_evidence
    {C : CharacterizationStructurePackage}
    (M : MultivariateConvergencePackage C) (E : MultivariateConvergenceEvidence M) :
    MultivariateConvergenceClosed M := by
  exact And.intro E.convergenceRateClosed
    (And.intro E.convergenceInLawClosed E.uniformIntegrabilityClosed)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
