import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure RandomProcessLimitTheoremsPackage {P : ProbabilitySpaceCharacterizationPackage}
    {M : MartingaleConvergencePackage P} {S : StochasticCalculusIntegrationPackage M} where
  weakConvergenceDefined : Prop
  centralLimitTheoremProved : Prop
  functionalCLTProved : Prop
  largeDeviationsPrinciple : Prop
  stableLimitClassification : Prop

structure RandomProcessLimitTheoremsEvidence {P : ProbabilitySpaceCharacterizationPackage}
    {M : MartingaleConvergencePackage P} {S : StochasticCalculusIntegrationPackage M}
    (L : RandomProcessLimitTheoremsPackage S) where
  weakConvergenceDefinedClosed : L.weakConvergenceDefined
  centralLimitTheoremProvedClosed : L.centralLimitTheoremProved
  functionalCLTProvedClosed : L.functionalCLTProved
  largeDeviationsPrincipleClosed : L.largeDeviationsPrinciple
  stableLimitClassificationClosed : L.stableLimitClassification

def RandomProcessLimitTheoremsClosed {P : ProbabilitySpaceCharacterizationPackage}
    {M : MartingaleConvergencePackage P} {S : StochasticCalculusIntegrationPackage M}
    (L : RandomProcessLimitTheoremsPackage S) : Prop :=
  L.weakConvergenceDefined ∧ L.centralLimitTheoremProved ∧ L.functionalCLTProved ∧
  L.largeDeviationsPrinciple ∧ L.stableLimitClassification

theorem random_process_limit_theorems_closed_from_evidence
    {P : ProbabilitySpaceCharacterizationPackage} {M : MartingaleConvergencePackage P}
    {S : StochasticCalculusIntegrationPackage M} (L : RandomProcessLimitTheoremsPackage S)
    (E : RandomProcessLimitTheoremsEvidence L) : RandomProcessLimitTheoremsClosed L := by
  exact And.intro E.weakConvergenceDefinedClosed
    (And.intro E.centralLimitTheoremProvedClosed
      (And.intro E.functionalCLTProvedClosed
        (And.intro E.largeDeviationsPrincipleClosed E.stableLimitClassificationClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse