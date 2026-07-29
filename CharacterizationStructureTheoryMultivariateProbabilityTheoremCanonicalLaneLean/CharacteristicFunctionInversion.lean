import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure CharacteristicFunctionInversionPackage where
  characteristicFunction : Type
  inversionFormula : Prop
  uniquenessTheorem : Prop
  continuityTheorem : Prop
  levyContinuityTheorem : Prop
  cramerWoldDevice : Prop
  multivariateExtension : Prop

structure CharacteristicFunctionInversionEvidence (C : CharacteristicFunctionInversionPackage) where
  inversionFormulaClosed : C.inversionFormula
  uniquenessTheoremClosed : C.uniquenessTheorem
  continuityTheoremClosed : C.continuityTheorem
  levyContinuityTheoremClosed : C.levyContinuityTheorem
  cramerWoldDeviceClosed : C.cramerWoldDevice
  multivariateExtensionClosed : C.multivariateExtension

def CharacteristicFunctionInversionClosed (C : CharacteristicFunctionInversionPackage) : Prop :=
  C.inversionFormula ∧ C.uniquenessTheorem ∧ C.continuityTheorem ∧
  C.levyContinuityTheorem ∧ C.cramerWoldDevice ∧ C.multivariateExtension

theorem characteristic_function_inversion_closed_from_evidence
    (C : CharacteristicFunctionInversionPackage) (E : CharacteristicFunctionInversionEvidence C) :
    CharacteristicFunctionInversionClosed C := by
  exact And.intro E.inversionFormulaClosed
    (And.intro E.uniquenessTheoremClosed
      (And.intro E.continuityTheoremClosed
        (And.intro E.levyContinuityTheoremClosed
          (And.intro E.cramerWoldDeviceClosed E.multivariateExtensionClosed))))

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse