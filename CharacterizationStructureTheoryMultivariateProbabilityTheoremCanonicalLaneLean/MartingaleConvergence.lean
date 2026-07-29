import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure Martingale (Ω : ProbabilitySpace) where
  filtration : ℕ → Set (Set Ω.carrier)
  adaptedSequence : ℕ → (Ω.carrier → ℝ)
  integrableSequence : ℕ → Prop
  martingaleProperty : ∀ n, integrableSequence n ∧ (∀ A ∈ filtration n, ∫ x in A, adaptedSequence (n+1) x dΩ.probabilityMeasure = ∫ x in A, adaptedSequence n x dΩ.probabilityMeasure)

structure MartingaleConvergencePackage (M : Martingale Ω) where
  boundednessCondition : Prop
  almostSureConvergence : Prop
  limitRandomVariable : Ω.carrier → ℝ
  convergenceTheorem : boundednessCondition → almostSureConvergence

structure MartingaleConvergenceEvidence {M : Martingale Ω} (C : MartingaleConvergencePackage M) where
  boundednessConditionClosed : C.boundednessCondition
  almostSureConvergenceClosed : C.almostSureConvergence
  convergenceTheoremClosed : C. convergenceTheorem C.boundednessCondition = C.almostSureConvergence

def MartingaleConvergenceClosed {M : Martingale Ω} (C : MartingaleConvergencePackage M) : Prop :=
  C.boundednessCondition ∧ C.almostSureConvergence

theorem martingale_convergence_closed_from_evidence {M : Martingale Ω} (C : MartingaleConvergencePackage M) (E : MartingaleConvergenceEvidence C) : MartingaleConvergenceClosed C := by
  exact And.intro E.boundednessConditionClosed E.almostSureConvergenceClosed

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse