# Quiz: Synthetic Controls and Comparisons via Regression

This is a short check-in quiz, not a test. For each question, circle ALL
statements that are correct. Any number of options (zero, one, or more) may
be correct. About 7--8 minutes.

---

**1. Synthetic control weights.** The synthetic control method requires the
donor weights $w_j$ to be non-negative and to sum to one. Which of the
following statements about these two constraints are TRUE?

(a) Without the non-negativity constraint, the synthetic control could
    extrapolate outside the convex hull of the donor units.

(b) The sum-to-one constraint ensures the synthetic control has the same
    scale as an individual unit's outcome.

(c) Dropping the non-negativity constraint is equivalent to running OLS of
    the treated unit's pre-period outcomes on the donors.

(d) The two constraints together guarantee that the synthetic control
    exactly reproduces the treated unit's pre-treatment outcomes.

(e) Allowing negative weights would make it harder to interpret the
    synthetic control as a weighted average of real units.

**Answer key: (a), (b), (e).**

- (a) TRUE. Non-negativity plus sum-to-one confines the synthetic control
  to the convex hull of the donors. Without non-negativity, a donor with
  weight $-0.5$ could push the prediction below the minimum donor value.
- (b) TRUE. If the weights summed to, say, 2, the synthetic control's
  outcome would be roughly twice an individual state's outcome and would
  not be comparable to California's single trajectory.
- (c) FALSE. Dropping non-negativity alone still keeps sum-to-one; that is
  not the same as unconstrained OLS, which allows intercepts and any real
  coefficients. (OLS is what Abadie-style extensions or "synthetic DiD"
  relax toward, but not by removing only one constraint.)
- (d) FALSE. The weights minimize pre-treatment prediction error, but exact
  fit is not guaranteed --- and if it were guaranteed, it would often be a
  sign of overfitting rather than a good match.
- (e) TRUE. The interpretability argument --- "a weighted average of real
  states" --- depends on non-negative weights.

---

**2. The treatment effect in the California/Proposition 99 analysis.** For a
year $t$ after 1988, which of the following correctly describe how the
estimated treatment effect is computed?

(a) California's observed outcome in year $t$ minus the synthetic
    California's predicted outcome in year $t$.

(b) The average post-1988 outcome in California minus the average
    post-1988 outcome across all donor states, unweighted.

(c) The gap between the treated unit's trajectory and the weighted average
    of the donor units' trajectories, where weights were chosen to match
    pre-1988 features.

(d) The coefficient on a "treated $\times$ post" interaction in a two-way
    fixed effects regression using all 50 states.

(e) California's outcome in year $t$ minus California's outcome in 1988.

**Answer key: (a), (c).**

- (a) TRUE. This is the definition: observed minus synthetic, year by
  year.
- (b) FALSE. The donor units are not weighted equally --- most of them get
  weight zero. An unweighted average ignores the matching work the method
  does.
- (c) TRUE. This is the same definition in words: the gap between the
  treated trajectory and the donor-weighted trajectory.
- (d) FALSE. Synthetic control is not a TWFE regression. It constructs a
  weighted comparison unit rather than estimating a coefficient on a
  treatment-times-post interaction.
- (e) FALSE. This is a pre/post comparison within California, which
  confuses the treatment effect with secular time trends --- the very
  thing the synthetic control is built to net out.

---

**3. Placebo tests.** Suppose we run placebo synthetic controls by
pretending each donor state was treated in 1988. Which of the following
inferences from the placebo distribution are VALID?

(a) If several placebo states show post-1988 gaps as large as California's,
    we cannot confidently distinguish California's gap from noise.

(b) If California's gap is larger than every placebo gap, the effect is
    causally identified.

(c) The placebo distribution plays a role analogous to a reference
    distribution under the sharp null of no effect.

(d) Placebo states with poor pre-period fit should be down-weighted or
    excluded when comparing gap sizes.

(e) A large California gap proves Proposition 99 caused the decline in
    cigarette sales.

**Answer key: (a), (c), (d).**

- (a) TRUE. The placebo distribution is our yardstick for "how big a gap
  could arise even without treatment." If California's gap sits inside that
  distribution, we cannot rule out noise.
- (b) FALSE. A large gap relative to placebos is evidence, but
  identification rests on substantive assumptions (no interference, donor
  pool comparability, no other 1988 shock to California). The placebo
  exercise cannot, by itself, confer identification.
- (c) TRUE. Under the sharp null of no effect, any state's trajectory
  could have been the "treated" one; the placebo gaps approximate the
  distribution of the test statistic under that null. This is the
  randomization-inference framing we use throughout 531.
- (d) TRUE. A placebo with a bad pre-period fit does not give a fair read
  on what a "well-matched synthetic" looks like under the null, so Abadie
  et al. recommend trimming by pre-period MSPE or using the ratio of
  post-to-pre MSPE.
- (e) FALSE. Proof is too strong; the gap is evidence consistent with an
  effect, under identifying assumptions.

---

**4. OLS as calculator: `lm(l_homicide ~ post + state, data = castle)`.**
The coefficient on `post` is a weighted average of within-state differences
in means (post-treatment minus pre-treatment log homicide). Which statements
about the weights are TRUE?

(a) States with more total observations $n_s$ receive more weight.

(b) States where the share of post-treatment years $p_s$ is near 0.5
    receive more weight, because $p_s(1 - p_s)$ is maximized there.

(c) States where every year is post-treatment (or every year is
    pre-treatment) receive zero weight, because there is no within-state
    variation in `post`.

(d) All states are weighted equally, because `state` is a fixed effect.

(e) The weights are proportional to $n_s \cdot p_s(1 - p_s)$.

**Answer key: (b), (c), (e).**

- (a) FALSE. More observations alone do not give a state more weight. A
  state with 100 years all post-treatment has no within-state variation in
  `post` and contributes nothing to the coefficient, despite its $n_s$.
- (b) TRUE. The Frisch--Waugh logic says the weight on each state's
  within-state difference in means is proportional to the residual
  variance of `post` within that state, which is $p_s(1-p_s)$. This peaks
  at $p_s = 0.5$.
- (c) TRUE. When $p_s = 0$ or $p_s = 1$, $p_s(1 - p_s) = 0$, so the state
  drops out of the average. This is the "no within-unit variation, no
  contribution" point.
- (d) FALSE. Fixed effects do NOT imply equal weights. They partial out
  state means but leave the weights in the remaining comparison unequal.
- (e) TRUE. The full formula combines sample size and the variance of the
  within-state treatment indicator; both matter.

---

**5. Centering is the comparison: `lm(Y ~ D + state + year)`.** Which of the
following describe what two-way fixed effects does before computing the
coefficient on $D$?

(a) It subtracts each unit's mean of $Y$ and each unit's mean of $D$.

(b) It subtracts each year's mean of $Y$ and each year's mean of $D$
    (across units).

(c) It residualizes both $Y$ and $D$ on state and year dummies, then
    regresses the residuals.

(d) It compares each treated observation only to not-yet-treated
    observations in the same year.

(e) It removes any variation in $D$ that is constant within a state or
    constant within a year.

**Answer key: (a), (b), (c), (e).**

- (a) TRUE. State fixed effects demean $Y$ and $D$ by state.
- (b) TRUE. Year fixed effects demean $Y$ and $D$ by year (across units).
  Together, (a) and (b) approximate the TWFE "within transformation" in an
  additive way (exact for balanced panels).
- (c) TRUE. This is the Frisch--Waugh formulation: regress $Y$ and $D$
  separately on all the dummies, take the residuals, then regress the
  residual $Y$ on the residual $D$. The resulting coefficient equals the
  TWFE estimate.
- (d) FALSE. This describes Callaway--Sant'Anna or related staggered-DiD
  estimators that restrict the comparison group to not-yet-treated
  units. Plain TWFE does not do this --- which is exactly the source of
  the trouble in Q6.
- (e) TRUE. Any part of $D$ that is purely state-specific or purely
  year-specific gets absorbed by the fixed effects, so only the residual
  "within state, within year" variation identifies the coefficient.

---

**6. Why TWFE goes wrong with staggered adoption.** In Comparison 4, the
naive two-way fixed effects estimate did not match the cleanly constructed
ATT. Which of the following are problems the memo identifies?

(a) Already-treated units serve as controls for later-treated units, so
    their post-treatment outcomes contaminate the comparison.

(b) TWFE estimates a weighted average of many $2 \times 2$ comparisons, and
    some of those weights can be negative.

(c) The weights on individual treatment-cohort comparisons depend on the
    timing structure and treated-share, not on substantive importance.

(d) TWFE requires the treatment effect to be constant across units and
    time; heterogeneous effects break the interpretation as an average
    treatment effect.

(e) Two-way fixed effects is biased whenever there is any unobserved
    confounding, regardless of treatment timing.

**Answer key: (a), (b), (c).**

- (a) TRUE. This is Goodman-Bacon's "forbidden comparison." Once a unit is
  treated, its post-treatment trajectory already embeds its treatment
  effect, so using it as a "control" for a later-treated unit subtracts
  part of the effect rather than a clean counterfactual.
- (b) TRUE. The TWFE estimator can be written as a weighted average of
  $2 \times 2$ DiDs across treatment-timing cohorts. With heterogeneous
  effects and staggered adoption, some of those weights can be negative,
  so TWFE can even have the wrong sign.
- (c) TRUE. The Goodman-Bacon decomposition shows the weights are driven
  by treated-share and timing, not by anything we would call substantive
  importance. A large, late-treated group can receive tiny weight; a
  small, middle-treated group can dominate.
- (d) FALSE. TWFE does not require constant effects in the first place ---
  the problem is that under heterogeneous effects plus staggered adoption,
  the weighted average TWFE produces is not generally interpretable as an
  ATT. The memo's complaint is about weighting, not about an assumption
  being violated.
- (e) FALSE. This is a generic statement about confounding, not the
  staggered-adoption critique. The memo's point is specifically about
  timing and weights, not about omitted variables.
