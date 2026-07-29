import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure StochasticCalculusPackage {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} (B : MartingaleBridgePackage M) where
  itoIntegral : Type u
  quadraticVariation : Type v
  sdeWellPosedness : Prop
  strongSolution : Prop
  weakSolution : Prop

structure StochasticCalculusEvidence {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} {B : MartingaleBridgePackage M}
    (S : StochasticCalculusPackage B) where
  sdeWellPosednessClosed : S.sdeWellPosedness
  strongSolutionClosed : S.strongSolution
  weakSolutionClosed : S.weakSolution

def StochasticCalculusClosed {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} {B : MartingaleBridgePackage M}
    (S : StochasticCalculusPackage B) : Prop :=
  S.sdeWellPosedness ∧ S.strongSolution ∧ S.weakSolution

theorem stochastic_calculus_closed_from_evidence
    {C : CharacterizationStructurePackage}
    {M : MultivariateConvergencePackage C} {B : MartingaleBridgePackage M}
    (S : StochasticCalculusPackage B) (E : StochasticCalculusEvidence S) :
    StochasticCalculusClosed S := by
  exact And.intro E.sdeWellPosednessClosed
    (And.intro E.strongSolutionClosed E.weakSolutionClosed)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse
