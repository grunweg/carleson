import Mathlib

open MeasureTheory Metric
open scoped NNReal ENNReal
variable {X : Type*} [MetricSpace X] [MeasureSpace X]

-- real definition is an expression involving R, t, x and y.
noncomputable def cutoff (R t : ℝ) (x y : X) : ℝ≥0 := ⟨37, by positivity⟩

variable {R t : ℝ} {hR : 0 < R} {ht : 0 < t} {ht': t ≤ 1} {x y : X}

include hR ht in
lemma aux_8_0_5 (h : y ∈ ball x (2 ^ (-1: ℝ) * t * R)) : 2 ^ (-1 : ℝ) ≤ cutoff R t x y := by sorry

theorem lintegral_monoOn {α : Type*} {m : MeasurableSpace α} {μ : Measure α}
    {s : Set α} ⦃f g : α → ℝ≥0∞⦄ (hfg : ∀ x : s, f x ≤ g x) :
    ∫⁻ a in s, f a ∂μ ≤ ∫⁻ a in s, g a ∂μ := by sorry

lemma no_errors (h : y ∈ ball x (2 ^ (-1: ℝ) * t * R)) :
    (2 ^ (-1: ℝ)) * volume (ball x (2 ^ (-1: ℝ) * t * R)) ≤ ∫⁻ y, (cutoff R t x y) := by sorry

lemma errors (h : y ∈ ball x (2 ^ (-1: ℝ) * t * R)) :
    (2 ^ (-1: ℝ)) * volume (ball x (2 ^ (-1: ℝ) * t * R)) ≤ ∫⁻ y in (ball x (2 ^ (-1: ℝ) * t * R)), (cutoff R t x y) := by
  calc (2 ^ (-1: ℝ)) * volume (ball x (2 ^ (-1: ℝ) * t * R))
    _ = ∫⁻ y in ((ball x (2 ^ (-1: ℝ) * t * R))), (2 ^ (-1: ℝ)) :=
      (setLIntegral_const _ _).symm
    _ ≤ ∫⁻ y in (ball x (2 ^ (-1: ℝ) * t * R)), (cutoff R t x y) := by
      -- as expected, Lean complains about unsolved goals
      apply lintegral_monoOn fun ⟨y', hy'⟩ ↦ ?_
      -- error: Lean complains about "no goals to be solved" on the sorry
      sorry

      -- removing the "sorry" leads to a goal state I would expect
      /-      unsolved goals
      X : Type u_1
      inst✝¹ : MetricSpace X
      inst✝ : MeasureSpace X
      R t : ℝ
      x y : X
      h : y ∈ ball x (2 ^ (-1) * t * R)
      x✝ : ↑(ball x (2 ^ (-1) * t * R))
      y' : X
      hy' : y' ∈ ball x (2 ^ (-1) * t * R)
      ⊢ 2 ^ (-1) ≤ ↑(cutoff R t x ↑⟨y', hy'⟩) -/
