import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure ProbabilitySpace where
  carrier : Type
  sigmaAlgebra : Set (Set carrier)
  probabilityMeasure : (Set carrier) → ℝ
  measureCompatible : Prop
  totalMassOne : probabilityMeasure (Set.univ) = 1
  sigmaAdditive : ∀ (E : ℕ → Set carrier), (∀ n m, n ≠ m → E n ∩ E m = ∅) → probabilityMeasure (⋃ n, E n) = ∑' n, probabilityMeasure (E n)

structure ProbabilitySpaceEvidence (Ω : ProbabilitySpace) where
  measureCompatibleClosed : Ω.measureCompatible
  totalMassOneClosed : Ω.totalMassOne
  sigmaAdditiveClosed : Ω.sigmaAdditive

def ProbabilitySpaceClosed (Ω : ProbabilitySpace) : Prop :=
  Ω.measureCompatible ∧ Ω.totalMassOne ∧ Ω.sigmaAdditive

theorem probability_space_closed_from_evidence (Ω : ProbabilitySpace) (E : ProbabilitySpaceEvidence Ω) : ProbabilitySpaceClosed Ω := by
  exact And.intro E.measureCompatibleClosed (And.intro E.totalMassOneClosed E.sigmaAdditiveClosed)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse