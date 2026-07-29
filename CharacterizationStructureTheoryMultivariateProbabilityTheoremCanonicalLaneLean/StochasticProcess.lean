import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure StochasticProcess (Ω : ProbabilitySpace) where
  indexSet : Type
  process : indexSet → (Ω.carrier → ℝ)
  measurable : ∀ t, Measurable (process t)
  adapted : ∀ t, Measurable (process t) with respect to some filtration

structure BrownianMotion (Ω : ProbabilitySpace) extends StochasticProcess Ω where
  indexSet := ℝ≥0
  continuousPaths : Prop
  independentIncrements : Prop
  stationaryIncrements : Prop
  gaussianIncrements : Prop
  zeroAtZero : process 0 = λ ω => 0

structure ItoCalculusPackage (B : BrownianMotion Ω) where
  itoIntegral : (Ω.carrier → ℝ) → (Ω.carrier → ℝ)
  itoFormula : Prop
  quadraticVariation : Prop
  maruyamaRepresentation : Prop

structure ItoCalculusEvidence (I : ItoCalculusPackage B) where
  itoFormulaClosed : I.itoFormula
  quadraticVariationClosed : I.quadraticVariation
  maruyamaRepresentationClosed : I.maruyamaRepresentation

def ItoCalculusClosed (I : ItoCalculusPackage B) : Prop :=
  I.itoFormula ∧ I.quadraticVariation ∧ I.maruyamaRepresentation

theorem ito_calculus_closed_from_evidence (I : ItoCalculusPackage B) (E : ItoCalculusEvidence I) : ItoCalculusClosed I := by
  exact And.intro E.itoFormulaClosed (And.intro E.quadraticVariationClosed E.maruyamaRepresentationClosed)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse