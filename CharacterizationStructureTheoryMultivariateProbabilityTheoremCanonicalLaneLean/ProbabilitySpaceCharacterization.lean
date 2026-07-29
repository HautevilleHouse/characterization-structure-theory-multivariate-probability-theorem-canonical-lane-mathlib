import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure ProbabilitySpaceCharacterizationPackage where
  sampleSpace : Type u
  sigmaAlgebra : Set (Set sampleSpace)
  probabilityMeasure : sampleSpace → ℝ
  sigmaAdditive : Prop
  probabilityOne : Prop
  jointDistributionDefined : Prop
  conditionalExpectationDefined : Prop
  regularVersionExists : Prop

structure ProbabilitySpaceCharacterizationEvidence (P : ProbabilitySpaceCharacterizationPackage) where
  sigmaAdditiveClosed : P.sigmaAdditive
  probabilityOneClosed : P.probabilityOne
  jointDistributionDefinedClosed : P.jointDistributionDefined
  conditionalExpectationDefinedClosed : P.conditionalExpectationDefined
  regularVersionExistsClosed : P.regularVersionExists

def ProbabilitySpaceCharacterizationClosed (P : ProbabilitySpaceCharacterizationPackage) : Prop :=
  P.sigmaAdditive ∧ P.probabilityOne ∧ P.jointDistributionDefined ∧ P.conditionalExpectationDefined ∧ P.regularVersionExists

theorem probability_space_characterization_closed_from_evidence
    (P : ProbabilitySpaceCharacterizationPackage) (E : ProbabilitySpaceCharacterizationEvidence P) :
    ProbabilitySpaceCharacterizationClosed P := by
  exact And.intro E.sigmaAdditiveClosed
    (And.intro E.probabilityOneClosed
      (And.intro E.jointDistributionDefinedClosed
        (And.intro E.conditionalExpectationDefinedClosed E.regularVersionExistsClosed)))

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse