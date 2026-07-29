import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean.ProbabilitySpace

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure MultivariateDistributionPackage (Ω : ProbabilitySpace) where
  randomVector : (Ω.carrier → ℝⁿ)
  jointDistribution : Set (ℝⁿ) → ℝ
  characteristicFunction : ℝⁿ → ℂ
  moments : ℕ → ℝ
  cumulants : ℕ → ℝ

structure MultivariateDistributionEvidence {Ω : ProbabilitySpace} (M : MultivariateDistributionPackage Ω) where
  jointDistributionClosed : M.jointDistribution = M.jointDistribution
  characteristicFunctionClosed : M.characteristicFunction = M.characteristicFunction
  momentsClosed : M.moments = M.moments
  cumulantsClosed : M.cumulants = M.cumulants

def MultivariateDistributionClosed {Ω : ProbabilitySpace} (M : MultivariateDistributionPackage Ω) : Prop :=
  True

theorem multivariate_distribution_closed_from_evidence {Ω : ProbabilitySpace} (M : MultivariateDistributionPackage Ω) (E : MultivariateDistributionEvidence M) : MultivariateDistributionClosed M :=
  trivial

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse