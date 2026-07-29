import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure CentralLimitStructurePackage where
  independentSequence : Type
  finiteVariance : Prop
  centeringScaling : Prop
  limitingDistribution : Type
  convergenceInDistribution : Prop

def CentralLimitStructureClosed (C : CentralLimitStructurePackage) : Prop :=
  C.finiteVariance ∧ C.centeringScaling ∧ C.convergenceInDistribution

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse