import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean

structure CharacteristicFunction (X : Ω.carrier → ℝ) where
  domain : Set ℝ
  defn : ℝ → ℂ
  formula : ∀ t ∈ domain, defn t = ∫ x, exp (I * t * X x) dΩ.probabilityMeasure

structure InversionTheoremPackage {X : Ω.carrier → ℝ} (φ : CharacteristicFunction X) where
  inversionFormula : Prop
  uniqueness : Prop
  continuityTheorem : Prop

structure InversionTheoremEvidence {X : Ω.carrier → ℝ} {φ : CharacteristicFunction X} (I : InversionTheoremPackage φ) where
  inversionFormulaClosed : I.inversionFormula
  uniquenessClosed : I.uniqueness
  continuityTheoremClosed : I.continuityTheorem

def InversionTheoremClosed {X : Ω.carrier → ℝ} {φ : CharacteristicFunction X} (I : InversionTheoremPackage φ) : Prop :=
  I.inversionFormula ∧ I.uniqueness ∧ I.continuityTheorem

theorem inversion_theorem_closed_from_evidence {X : Ω.carrier → ℝ} {φ : CharacteristicFunction X} (I : InversionTheoremPackage φ) (E : InversionTheoremEvidence I) : InversionTheoremClosed I := by
  exact And.intro E.inversionFormulaClosed (And.intro E.uniquenessClosed E.continuityTheoremClosed)

end CharacterizationStructureTheoryMultivariateProbabilityTheoremCanonicalLaneLean
end HautevilleHouse