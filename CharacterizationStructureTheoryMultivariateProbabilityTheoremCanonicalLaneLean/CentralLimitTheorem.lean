import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure IIDSequence (Ω : ProbabilitySpace) where
  randomVariables : ℕ → (Ω.carrier → ℝ)
  independent : Prop
  identicallyDistributed : Prop
  commonMean : ℝ
  commonVariance : ℝ
  finiteVariance : commonVariance < ∞

structure CentralLimitTheoremPackage {Ω : ProbabilitySpace} (X : IIDSequence Ω) where
  sampleMean : ℕ → (Ω.carrier → ℝ)
  normalizedSum : ℕ → (Ω.carrier → ℝ)
  convergenceInDistribution : Prop
  limitingNormal : Ω.carrier → ℝ
  varianceNormalized : Prop
  CLTTheorem : convergenceInDistribution ∧ varianceNormalized

structure CentralLimitTheoremEvidence {Ω : ProbabilitySpace} {X : IIDSequence Ω} (C : CentralLimitTheoremPackage X) where
  convergenceInDistributionClosed : C.convergenceInDistribution
  varianceNormalizedClosed : C.varianceNormalized
  CLTTheoremClosed : C.convergenceInDistribution ∧ C.varianceNormalized

def CentralLimitTheoremClosed {Ω : ProbabilitySpace} {X : IIDSequence Ω} (C : CentralLimitTheoremPackage X) : Prop :=
  C.convergenceInDistribution ∧ C.varianceNormalized

theorem central_limit_theorem_closed_from_evidence {Ω : ProbabilitySpace} {X : IIDSequence Ω} (C : CentralLimitTheoremPackage X) (E : CentralLimitTheoremEvidence C) : CentralLimitTheoremClosed C := by
  exact And.intro E.convergenceInDistributionClosed E.varianceNormalizedClosed

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse