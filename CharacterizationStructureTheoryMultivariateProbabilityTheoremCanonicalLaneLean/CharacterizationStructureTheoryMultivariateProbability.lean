import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean

structure CharacterizationStructureTheoryMultivariateProbabilityAdmittedObject where
  probabilitySpace : Type u
  sigmaAlgebra : Type v
  randomVariable : Type w
  distribution : Type x
  characterizationCondition : Prop
  conclusion : characterizationCondition

def characterization_witness_closed (O : CharacterizationStructureTheoryMultivariateProbabilityAdmittedObject) : Prop :=
  O.characterizationCondition

end CharacterizationStructureTheoryMultivariateProbabilityCanonicalLaneLean
end HautevilleHouse