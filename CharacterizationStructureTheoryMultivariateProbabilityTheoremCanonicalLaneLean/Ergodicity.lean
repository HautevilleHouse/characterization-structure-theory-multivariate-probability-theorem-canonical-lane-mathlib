import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure ErgodicityPackage {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} {B : MartingaleBridgePackage M}
    (S : StochasticCalculusPackage B) where
  invariantMeasure : Type u
  ergodicTheorem : Prop
  convergenceToInvariant : Prop
  mixingProperties : Prop

structure ErgodicityEvidence {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} {B : MartingaleBridgePackage M}
    {S : StochasticCalculusPackage B} (E : ErgodicityPackage S) where
  ergodicTheoremClosed : E.ergodicTheorem
  convergenceToInvariantClosed : E.convergenceToInvariant
  mixingPropertiesClosed : E.mixingProperties

def ErgodicityClosed {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} {B : MartingaleBridgePackage M}
    {S : StochasticCalculusPackage B} (E : ErgodicityPackage S) : Prop :=
  E.ergodicTheorem ∧ E.convergenceToInvariant ∧ E.mixingProperties

theorem ergodicity_closed_from_evidence
    {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} {B : MartingaleBridgePackage M}
    {S : StochasticCalculusPackage B} (E : ErgodicityPackage S)
    (Ev : ErgodicityEvidence E) : ErgodicityClosed E := by
  exact And.intro Ev.ergodicTheoremClosed
    (And.intro Ev.convergenceToInvariantClosed Ev.mixingPropertiesClosed)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
