import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure StochasticCalculusIntegrationPackage {P : ProbabilitySpaceCharacterizationPackage}
    {M : MartingaleConvergencePackage P} where
  itoIntegralDefined : Prop
  quadraticVariationDefined : Prop
  itoFormulaProved : Prop
  semimartingaleDecomposition : Prop
  stochasticExponentialDefined : Prop
  girsanovTransformProved : Prop

structure StochasticCalculusIntegrationEvidence {P : ProbabilitySpaceCharacterizationPackage}
    {M : MartingaleConvergencePackage P} (S : StochasticCalculusIntegrationPackage M) where
  itoIntegralDefinedClosed : S.itoIntegralDefined
  quadraticVariationDefinedClosed : S.quadraticVariationDefined
  itoFormulaProvedClosed : S.itoFormulaProved
  semimartingaleDecompositionClosed : S.semimartingaleDecomposition
  stochasticExponentialDefinedClosed : S.stochasticExponentialDefined
  girsanovTransformProvedClosed : S.girsanovTransformProved

def StochasticCalculusIntegrationClosed {P : ProbabilitySpaceCharacterizationPackage}
    {M : MartingaleConvergencePackage P} (S : StochasticCalculusIntegrationPackage M) : Prop :=
  S.itoIntegralDefined ∧ S.quadraticVariationDefined ∧ S.itoFormulaProved ∧
  S.semimartingaleDecomposition ∧ S.stochasticExponentialDefined ∧ S.girsanovTransformProved

theorem stochastic_calculus_integration_closed_from_evidence
    {P : ProbabilitySpaceCharacterizationPackage} {M : MartingaleConvergencePackage P}
    (S : StochasticCalculusIntegrationPackage M) (E : StochasticCalculusIntegrationEvidence S) :
    StochasticCalculusIntegrationClosed S := by
  exact And.intro E.itoIntegralDefinedClosed
    (And.intro E.quadraticVariationDefinedClosed
      (And.intro E.itoFormulaProvedClosed
        (And.intro E.semimartingaleDecompositionClosed
          (And.intro E.stochasticExponentialDefinedClosed E.girsanovTransformProvedClosed))))

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse