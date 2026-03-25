# PLAN: Panel Data Sub-Unit (Weeks 11--13)

## From Assignment Assumptions to Outcome Assumptions

**Status**: Revised draft, March 25, 2026
*Incorporates reviews from econometric and design-based perspectives.*

---

## The Big Pedagogical Move

The course so far has progressed through assumptions about *treatment assignment*:

- **Weeks 1--3**: Randomization controls assignment directly
- **Weeks 4--7**: Selection on observables --- assignment is "as if random" conditional
  on covariates (matching, regression)
- **Week 8**: Assignment exploits a the treatment assignment of an instrument (IV/CACE)
- **Week 10**: Assignment mechanism has a discontinuity which assigns a treatment (RDD)

Now the pivot. What if we cannot credibly control or exploit the assignment
mechanism? Panel data offers a different strategy: make assumptions about how
*outcomes* would have evolved absent treatment. This is a genuinely different
kind of assumption. 

---

## Counterparts as the Organizing Concept for All Three Weeks

Rosenbaum introduces "counterparts" in *Observation and Experiment* (2017),
**Ch. 8** ("Quasi-Experimental Devices"), pp. 154--166. Counterparts are units
that stand in a defined relation to the treated and control groups ---
differing in a well-defined sense but analogous in other well-defined senses.
They are not true controls in the sense of treatment assignment. Rather, they are
governed by the same forces as treated and control groups, so studying
counterparts reveals whether those forces (rather than the treatment) can
explain the observed outcome differences.

The foundational paper is **Rosenbaum (2001), "Stability in the Absence of
Treatment," *JASA*, 96, 210--219**, which formalizes the argument and develops
the sensitivity analysis.

### The counterpart concept unifies all three weeks:

- **Week 11**: Pre-treatment measures serve as counterparts for post-treatment
  outcomes. A treated unit's own past + a matched control unit's trajectory
  together provide the comparison. This is the simplest DiD.

- **Week 12**: In staggered adoption, not-yet-treated units at each treatment
  time are counterparts for the newly treated. Risk-set matching constructs
  counterpart groups at each adoption time. The Goodman-Bacon problem is
  precisely that TWFE uses the *wrong* counterparts --- already-treated units
  whose outcomes reflect treatment, not the counterfactual.

- **Week 13**: The synthetic control donor pool is a set of candidate
  counterparts. The optimization finds the best composite counterpart ---
  a weighted combination of control units whose pre-treatment trajectory
  matches the treated unit. Placebo tests ask whether the treated unit's
  counterpart comparison is unusually large.

### Rosenbaum's counterparts across his work

The concept appears under different names throughout Rosenbaum's books and
papers, as part of a larger family of "quasi-experimental devices" that all
aim to build internal checks against hidden bias:

| Concept | Where | Key idea |
|---------|-------|----------|
| Counterparts | *O&E* Ch. 8, pp. 154--166 | Before/after as a check on cross-sectional comparisons |
| Stability in the absence of treatment | *Design* 2nd ed, Ch. 1, p. 11; Rosenbaum (2001) JASA | Formalizes the assumption: absent treatment, outcomes are stable |
| Multiple control groups | *Obs Studies* Ch. 8; *Design* Ch. 5.2.2 | Two control groups biased in different directions; agreement strengthens the claim |
| Known effects | *Obs Studies* Ch. 6; *Design* Ch. 5.2.4 | An outcome with an established effect serves as a positive control |
| Risk-set matching | *Design* Ch. 13, pp. 279--295 | Matching at the moment of treatment in longitudinal data |
| Evidence factors | Rosenbaum (2010) *Biometrika*; *Design* Ch. 20; Rosenbaum (2021) book | Before/after and treated/control are two independent pieces of evidence susceptible to different biases |
| Card & Krueger with nonbipartite matching | *Design* Ch. 12.3, pp. 267--278 | DiD within optimally matched pairs, with two independent comparisons |

**A critical theoretical result** (*Design* 2nd ed, p. 367): Rosenbaum proves
that **DiD is NOT the optimal combination of pre and post measures** from the
perspective of design sensitivity to unmeasured biases. The optimal weight
on the baseline measure is smaller in absolute value than the weight on the
post-treatment outcome. DiD overweights the baseline. This means DiD is a
*reasonable* but not *optimal* use of pre-treatment information --- a result
that connects to Ding & Li's (2019) bracketing idea from a completely
different direction.

**Best single overview**: Rosenbaum (2015), "How to See More in Observational
Studies: Some New Quasi-Experimental Devices," *Annual Review of Statistics
and Its Application*, 2, 21--48.

### Three key insights from the counterparts treatment

1. **Counterparts do not require time.** The hospital anesthesia example
   (pp. 155--156) shows the logic is about analogous structure, not temporal
   sequence. DiD is a special case where "before" serves as the counterpart.

2. **Counterparts reinforce claims rather than mechanically removing bias.**
   The argument is: "Either there is a treatment effect, or else certain
   specific forces made outcomes different --- but only if those forces acted
   very differently on treated/control groups versus their counterparts."
   Parallel trends is an *operationalization* of this reasoning --- and a
   somewhat crude one, since it reduces the coherence argument to a single
   moment condition.

3. **The log transformation problem.** Rosenbaum demonstrates (Figures
   8.4--8.5) that "causal effects do not come and go by taking logarithms"
   but mechanical DiD calculations do. This means the simple arithmetic of
   DiD "cannot be fundamental to causal inference if difference-in-differences
   come and go with transformations but causal effects do not." Roth &
   Sant'Anna (2023, *Econometrica*) formalize this: parallel trends is
   insensitive to all monotone transformations if and only if a much
   stronger distributional condition holds.

---

## Two Threads Running Through All Three Weeks

### Thread 1: Sensitivity analysis

In the Rosenbaum tradition, sensitivity analysis is the *culmination* of
the design-based approach. The conclusion of a well-designed study is not
"the effect is X" but "the effect is X, and an unmeasured confounder would
need to be at least Y strong to explain this away." Two complementary
frameworks exist:

- **Design-based**: Keele, Small, Hsu & Fogarty (2019) develop
  Rosenbaum-style sensitivity analysis for matched DiD. Leavitt ("Beyond
  Pre-Trends," accepted) develops discordance-based sensitivity analysis.
  Both ask: how much violation of the identifying assumption would change
  the conclusion?

- **Econometric**: Rambachan & Roth (2023, *Review of Economic Studies*)
  restrict how post-treatment violations of parallel trends can differ
  from pre-treatment trend differences, then construct robust confidence
  intervals. The `HonestDiD` R package implements this.

Teaching both side by side shows students how the two traditions converge
on the same fundamental question.

### Thread 2: Testing vs. estimation

The design-based tradition draws a sharp distinction:

- **Testing the sharp null** (no effect for any unit): requires only that
  treatment was assigned randomly within matched sets. Does NOT require
  parallel trends. A permutation test within matched pairs is valid under
  the matching assumption alone --- a weaker requirement.

- **Estimating the ATT**: requires parallel trends (or some equivalent
  assumption about counterfactual outcomes). More informative (gives a
  point estimate) but requires more assumptions.

Students should understand this tradeoff: you can reject the null of no
effect without being able to estimate the size of the effect, and that is
still valuable. The Rosenbaum tradition values this tradeoff; the
econometric tradition generally pushes for estimation.

---

## Week 11: Counterparts, Parallel Trends, and DiD Foundations

**Date**: 21 April 2026 (Week 11 per syllabus)

**Theme**: *When you cannot control assignment, borrow from the past --- but
understand what you are borrowing and what it costs.*

### Opening: Counterparts (Rosenbaum Ch. 8, pp. 154--166)

Start with the counterparts concept, not with the TWFE regression.

- What is a counterpart? Not a true control. An analogous unit governed by
  the same forces.
- The worker compensation example (Meyer, Viscusi, Durbin): higher-wage
  (affected) vs. lower-wage (unaffected) workers, before vs. after the
  ceiling change.
- The mechanical DiD calculation and its limitations:
  - Counterparts are "nonequivalent controls" --- the DiD may fail to
    estimate the treatment effect.
  - The log transformation problem: causal effects are invariant to
    monotone transformations; DiD calculations are not (Rosenbaum pp.
    164--166; Roth & Sant'Anna 2023).
  - DiD overweights the baseline: the optimal combination puts less weight
    on the pre-treatment measure than DiD does (Rosenbaum, *Design*
    p. 367).

### The Parallel Trends Assumption

Having established what counterparts can and cannot do, formalize the
assumption that makes DiD work as an estimator:

- The canonical 2x2 DiD (Roth et al. 2023, Sec 2):
  - Potential outcomes: $Y_{i,t}(0)$, $Y_{i,t}(1)$
  - Parallel trends: the *average* trend among controls equals the
    counterfactual trend of the treated. This does not require each
    control to be individually a good counterpart --- just that they are
    on average.
  - No anticipation: $Y_{i,1}(0) = Y_{i,1}(1)$ for all $i$ with $D_i = 1$.
    This is a *substantive* assumption, not a technicality --- if firms
    change behavior in anticipation of regulation, or voters adjust
    before an election law takes effect, the pre-treatment period is
    contaminated. Requires domain knowledge to assess.
  - The ATT estimand
- DiD by hand, via TWFE regression, and the equivalence
- What parallel trends assumes (selection on levels is OK; selection on
  trends is not) and what it does not assume (no requirement that levels
  be similar)

### Bracketing: DiD vs. Lagged Outcome Adjustment (Ding & Li 2019)

- DiD assumes parallel trends in levels
- Lagged dependent variable (LDV) adjustment assumes selection on baseline
  outcomes (conditional on $Y_{i,1}$, treatment is as good as random)
- Neither is verifiable from data
- Reporting both brackets the ATT: if both agree, more confidence;
  if they diverge, the gap measures uncertainty about assumptions

### The Design-Based Approach: Risk-Set Matching + DiD

Connect to what students already know from Explorations 4--5. This is not
a supplement to DiD --- it is a different way of *doing* DiD:

- **Cohn, Song & Zubizarreta (2025)**: the clearest example of the full
  design-based approach. Combines profile matching (balances covariates by
  design) with risk-set matching (preserves time alignment). Tests for
  effect modification within matched sets. Includes Rosenbaum-style
  sensitivity analysis. Application to gun violence and health outcomes.
- PanelMatch (Imai & Kim 2021): matching on treatment history and
  covariates; operationalizes risk-set matching computationally.
- Permutation inference within matched sets: tests the sharp null of no
  effect without requiring parallel trends.
- Why this matters: Imai & Kim (2019, *AJPS*) show that TWFE does not
  represent a design-based, nonparametric estimation strategy. If you want
  design-based inference, you need a different approach.

### Sensitivity Analysis for DiD (Week 11 installment)

- **Design-based**: Keele, Small, Hsu & Fogarty (2019) --- Rosenbaum-style
  sensitivity analysis for matched DiD. How large would the bias from
  time-varying confounding need to be to explain away this effect?
- **Econometric**: Rambachan & Roth (2023) --- restrict post-treatment
  violations of parallel trends relative to pre-treatment trend differences.
  Robust confidence intervals via `HonestDiD`.
- **Leavitt** ("Beyond Pre-Trends") --- discordance-based sensitivity analysis.
  Formalizes the relationship between pre-treatment discordance and
  post-treatment bias.
- All three ask the same question from different angles: how robust is
  this conclusion?

### Pre-Trends Diagnostics

- Event-study plots as falsification tests
- What pre-trends can and cannot tell you:
  - Absence of a pre-trend does not prove parallel trends (low power)
  - Conditioning on passing a pre-test introduces selection bias (Roth 2022)
  - Pre-trends are diagnostic, not dispositive
- Connection to Rosenbaum: counterparts reinforce claims, they do not
  prove them

### The Transformation Problem

- Rosenbaum's insight (pp. 164--166): DiD comes and goes with
  transformations, but causal effects do not.
- Roth & Sant'Anna (2023, *Econometrica*): parallel trends is insensitive
  to monotone transformations iff a much stronger distributional condition
  holds. The `didFF` R package implements testable implications.
- Leavitt & Hatfield (2025): the APM framework offers a principled
  resolution --- choose the model whose identifying assumption is most
  robust to violations, measured by pre-period differential prediction
  errors. Assigns as recommended reading; discuss in class via the
  Rosenbaum log examples.

### Readings for Week 11

**Required:**
1. Rosenbaum (2017), *Observation and Experiment*, **Ch. 8** pp. 154--166
   (counterparts and DiD)
2. Roth, Sant'Anna, Bilinski & Poe (2023), "What's Trending in
   Difference-in-Differences?" Secs 1--2 (the canonical model)
3. Cohn, Song & Zubizarreta (2025), "Risk Set Matched
   Difference-in-Differences" (the full design-based approach)

**Recommended:**
4. Rosenbaum (2001), "Stability in the Absence of Treatment," *JASA*
   (the foundational paper for the counterparts concept)
5. Cunningham (2021), *Causal Inference: The Mixtape*, Ch. 9
   (accessible intro; predates the modern estimators)
6. Ding & Li (2019), on bracketing DiD and LDV
7. Keele, Small, Hsu & Fogarty (2019), sensitivity analysis for matched DiD
8. Rambachan & Roth (2023), "A More Credible Approach to Parallel Trends"
   + `HonestDiD` R package
9. Leavitt & Hatfield (2025), "Averaged Prediction Models"
10. Leavitt, "Beyond Pre-Trends" (sensitivity analysis for DiD)
11. diff.healthpolicydatascience.org (Leavitt, Zeldow & Hatfield)
12. Imai & Kim (2019), "When Should We Use Unit Fixed Effects?" *AJPS*
13. Imai & Kim (2021), PanelMatch

### Exploration 9 (lives here)

A 2-period DiD exploration where students:
- Compute DiD by hand, via regression, and via matched pairs
- Compare DiD to LDV (bracketing)
- Test the sharp null within matched sets (permutation test --- does not
  require parallel trends)
- Assess pre-trends where possible
- Confront the log transformation problem on a concrete dataset
- Compute a sensitivity analysis (how much violation of parallel trends
  would be needed to explain away the result?)
- **Head-to-head: building the matched design by hand vs. PanelMatch.**
  Students first construct a matched DiD design "by hand" using `optmatch`
  or `designmatch` --- defining the risk set, building a distance matrix
  on pre-treatment outcomes and covariates, creating matched sets, and
  estimating the effect within those sets. Then they replicate the same
  analysis using `PanelMatch`, which automates the risk-set matching.
  Comparing the two side by side demystifies what PanelMatch is doing:
  students see that it is constructing matched sets based on treatment
  history, just as they did manually. They can compare the matched sets
  (are the same units paired?), the balance (does PanelMatch achieve
  similar covariate balance?), and the estimates (do they agree?). This
  connects directly to Explorations 4--5, where students built matched
  designs by hand with `optmatch` and `designmatch`, and shows that
  panel-data matching is the same logic applied to a richer data
  structure.

**Candidate datasets:**
- Medellin homicide data (from ci-textbook Ch. 9, already tested; has
  pre-treatment periods for matching)
- A subset of the castle data: pick one early-adopting state vs.
  never-treated, letting Exploration 10 expand to the full panel
- Card & Krueger (1994) NJ/PA minimum wage: classic 2-period. Rosenbaum
  uses this data in *Design* Ch. 12.3 with nonbipartite matching --- a
  natural connection.

---

## Week 12: Staggered Treatment, TWFE Problems, and the Experimental Perspective

**Date**: 28 April 2026 (Week 12 per syllabus)

**Theme**: *When treatment arrives at different times, TWFE uses the wrong
counterparts --- and both traditions offer fixes.*

### The Counterparts Problem in Staggered Settings

Frame the TWFE failure through the counterparts lens:

- In a staggered panel, the natural counterparts for a newly-treated unit
  are the not-yet-treated units at the same time.
- TWFE uses already-treated units as counterparts ("forbidden comparisons").
  Their outcomes reflect treatment, so they are contaminated counterparts.
- This is why the Goodman-Bacon (2021) decomposition matters: it reveals
  which 2x2 comparisons (which counterpart groups) drive the TWFE estimate.
- The negative weighting problem arises specifically when treatment effects
  are heterogeneous across groups and over time. If effects are constant,
  TWFE is fine --- heterogeneity is the problem, not staggering per se.

### Modern Estimators

- **Callaway & Sant'Anna (2021)**: group-time ATT as building block.
  Uses only not-yet-treated (or never-treated) as counterparts. Avoids
  forbidden comparisons. Aggregates with researcher-chosen weights.
- **Borusyak, Jaravel & Spiess (2024, *Review of Economic Studies*)**: imputation
  approach. Fit TWFE on untreated observations only, impute counterfactuals
  for treated observations.
- **de Chaisemartin & d'Haultfoeuille (2023, *Econometrics Journal*)**: a third
  family of heterogeneity-robust estimators. Handles non-binary treatments
  that can increase or decrease --- a practical case neither of the above
  handles out of the box.
- The common thread: isolate clean counterpart comparisons, then aggregate
  with transparent weights.
- **Baker, Callaway, Cunningham, Goodman-Bacon & Sant'Anna (2025)**:
  the definitive practitioner's guide. Co-authored by the central figures.
  Covers the full landscape with concrete recommendations.

### The Experimental Perspective (Shen et al. 2024)

Shen et al. ask: *what hypothetical experiment is each estimator
approximating?* This connects directly to Chattopadhyay & Zubizarreta
(2023, *Biometrika*), who make visible the implied weights of regression.

- Which (unit, time) cells are used as "treatment" observations vs.
  "control" observations? The key visualizations.
- Assumptions as justifications for borrowing more information:
  - Minimal: only concurrent treated/untreated observations
  - Baseline randomization: borrow across units with same covariates
  - Unit fixed effects: borrow across time within units
  - Each additional assumption expands the information set
- Diagnostics: covariate balance, sign reversal, effective sample size
- Connection to Goodman-Bacon: the decomposition tells you what TWFE *did*;
  the experimental perspective tells you what it *should have done*

### Design-Based Approaches to Staggered Settings

Not a separate school of thought --- a different inferential framework
applied to the same problem:

- **Athey & Imbens (2022, *Journal of Econometrics*)**: under random
  assignment of adoption dates, the standard DiD estimator has exact
  finite-sample properties analogous to those in completely randomized
  experiments. "Design-based" does not mean "a different estimator" ---
  it means "a different inferential framework applied to the same
  estimator."
- **Risk-set matching** (Cohn et al. 2025): at each treatment time, match
  newly-treated to not-yet-treated. The not-yet-treated ARE counterparts.
  Permutation inference within matched risk sets.
- **PanelMatch** (Imai & Kim 2021): matching on treatment history in
  staggered settings.
- **Testing**: sharp null hypotheses within matched sets avoid the TWFE
  aggregation problems entirely. More robust (fewer assumptions) but less
  informative (no point estimate).

### Sensitivity Analysis (Week 12 installment)

- Sensitivity analysis in staggered settings: how does risk-set matching
  improve design sensitivity relative to naive TWFE?
- `HonestDiD` applied to event-study estimates from Callaway-Sant'Anna
- Leavitt's discordance approach in multi-period settings
- Bowers, Leavitt & Miratrix, "Sequential Sensitivity Analysis for Multiple
  Assumptions" (under review) --- relevant when you have multiple
  assumptions (parallel trends for each cohort-time pair)

### Readings for Week 12

**Required:**
1. Baker, Callaway, Cunningham, Goodman-Bacon & Sant'Anna (2025),
   "Difference-in-Differences Designs: A Practitioner's Guide"
   (arXiv:2503.13323, forthcoming *JEL*)
2. Shen, Chattopadhyay, Lin & Zubizarreta (2024), "An Anatomy of Event
   Studies," Secs 1--3
3. Athey & Imbens (2022), "Design-based analysis in Difference-in-Differences
   settings with staggered adoption," *J. Econometrics*

**Recommended:**
4. Roth et al. (2023), Secs 3--4 (staggered treatment, pre-trends violations)
5. Goodman-Bacon (2021), "Difference-in-Differences with Variation in
   Treatment Timing" (the decomposition)
6. Callaway & Sant'Anna (2021), "Difference-in-Differences with Multiple
   Time Periods"
7. Cunningham (2021), *Mixtape* Ch. 9 (accessible intro, predates modern
   estimators)
8. Rambachan & Roth (2023) + `HonestDiD` (if not read in Week 11)
9. Chattopadhyay & Zubizarreta (2023), "On the implied weights of linear
   regression for causal inference," *Biometrika* + `lmw` R package

### Exploration 10 (lives here)

A staggered-adoption exploration where students:
- Run naive TWFE and observe unexpected behavior
- Apply the Bacon decomposition to identify forbidden comparisons
  (which counterpart groups are contaminated?)
- Apply Callaway-Sant'Anna and compare
- Visualize which observations contribute to each estimate (Shen et al.)
- Apply risk-set matching as an alternative design, constructing proper
  counterpart groups at each adoption time
- Run sensitivity analysis (`HonestDiD` or discordance-based)

**Primary dataset: `castle` (castle doctrine / stand-your-ground laws)**
- Available in `bacondecomp::castle` (R package)
- State-level panel, 2000--2010, 20 states adopting at different times
- Outcome: log homicide rate (connects to Week 11's transformation problem)
- Source: Cheng & Hoekstra (2013, JHR)

**Supplementary dataset: `staggered::pj_officer_level_balanced`**
- Procedural justice training in Chicago PD (Wood, Tyler, Papachristos,
  Roth & Sant'Anna 2020). *Randomized* staggered rollout --- parallel
  trends holds by construction. Students can verify that modern estimators
  work correctly and see what TWFE gets wrong even when the design is valid.

**Other candidates:**
- `PanelMatch::dem` --- democracy and GDP growth (Acemoglu et al. 2019).
  Comparative politics. Binary treatment with transitions in both
  directions.
- `did::mpdta` --- county-level teen employment and minimum wage. Simple.
- Grumbach (2023, APSR) --- "Laboratories of Democratic Backsliding."
  State-level 2000--2018. Genuinely political science.
- CSPP (Correlates of State Policy Project) --- build a custom dataset.

---

## Week 13: Synthetic Controls and the Hierarchy of Panel Methods

**Date**: 5 May 2026 (Week 13 per syllabus)

**Theme**: *When you have one treated unit, optimize the counterpart --- and
see the architecture connecting all panel methods.*

### The Synthetic Control Method as Optimized Counterpart Construction

Frame synthetic controls through the counterparts lens:

- The donor pool is a set of candidate counterparts. The optimization
  finds the best *composite* counterpart --- a weighted combination of
  control units whose pre-treatment trajectory matches the treated unit.
- Connection to DiD: DiD uses uniform weights on all controls (every
  control is an equally weighted counterpart). Synthetic control optimizes
  the weights. DiD is the special case where all controls have the same
  average trajectory as the treated unit.
- Note: SC matches *levels*, not trends. This is a different kind of
  assumption from parallel trends --- SC requires the weighted combination
  to reproduce the treated unit's outcome trajectory, while DiD allows
  permanent level differences.

### The Method Concretely (Abadie, Diamond & Hainmueller 2010)

- The estimand: treatment effect for the specific treated unit
- Construction: weights on control units that minimize pre-treatment
  distance in outcome trajectory
- The California Proposition 99 example
- The Basque Country terrorism example (Abadie & Gardeazabal 2003)

### Inference: Placebo Tests as Permutation Inference

This is where the design-based perspective does its strongest work:

- Placebo tests: apply the method to each control unit in turn. The
  treated unit's effect is unusual if it is larger than most placebo effects.
- This IS permutation inference: the "randomization" is which unit happened
  to adopt the policy. The sharp null is that the policy had no effect on
  any unit.
- Rank-based p-values from the placebo distribution.
- Limitation: when N is small, the placebo distribution has low resolution.
  Lei & Sudijono (2024) address this with a leave-two-out procedure
  providing O(N^2) reference estimates.
- Formal inference beyond placebo tests: Cattaneo, Feng, Palomba &
  Titiunik (2025) provide prediction intervals with non-asymptotic
  coverage guarantees via the `scpi` R package.

### Sensitivity Analysis (Week 13 installment)

- Firpo & Possebom (2018, *J. Causal Inference*): sensitivity analysis
  and confidence sets for synthetic controls.
- How sensitive is the estimate to: the choice of donor pool? The
  pre-treatment fit period? The outcome variable?

### Extensions and Generalizations

- **Augmented SC** (Ben-Michael, Feller & Rothstein 2021): combines
  SC weights with a regression adjustment. Bias correction when the
  pre-treatment fit is imperfect. Doubly robust in spirit.
- **Generalized SC / interactive fixed effects** (Xu 2017): factor model
  for untreated potential outcomes.
- **Synthetic DiD** (Arkhangelsky et al. 2021): combines unit weights
  (like SC) with time weights (unlike standard DiD). Bridges DiD and SC.
- **Matrix completion** (Athey et al. 2021): the missing data perspective.
  Low-rank structure for the unit-by-time outcome matrix.

### The Hierarchy of Panel Methods

Step back and see the architecture connecting all three weeks:

| Method | Outcome assumption | Unit weights | Time weights | Inferential framework |
|--------|-------------------|-------------|-------------|----------------------|
| DiD | Parallel trends (average across controls) | Equal | Last pre vs. post | Sampling-based (CLT) or design-based (permutation within matched sets) |
| Matched DiD | Parallel trends (for matched units) | Binary (matched/unmatched) | Last pre vs. post | Design-based (permutation, sensitivity analysis) |
| Callaway-Sant'Anna | Parallel trends (by cohort, post-treatment only) | Cohort-proportional | Event-time specific | Sampling-based or design-based (Athey & Imbens 2022) |
| Synthetic control | Pre-treatment trajectory fit (levels, not trends) | Optimized (convex) | Pre-treatment fit | Permutation (placebo tests) |
| Augmented SC | Factor model + bias correction | Optimized + adjusted | Pre-treatment fit | Sampling-based or permutation |
| Matrix completion | Low-rank factor structure | Data-driven | Data-driven | Sampling-based |

The hierarchy trades off:
- Assumption strength (stronger --> simpler methods --> fewer data needs)
- Data requirements (weaker assumptions --> more pre-treatment periods)
- Precision vs. robustness

The "Inferential framework" column makes explicit that the choice between
design-based and sampling-based inference is a decision point within
the analysis, not a property of the method. For several methods
(DiD, Callaway-Sant'Anna, SC), both frameworks are available.

### Readings for Week 13

**Required:**
1. Abadie (2020), "Using Synthetic Controls: Feasibility, Data Requirements,
   and Methodological Aspects" (accessible survey)
2. Ben-Michael, Feller & Rothstein (2021), "The Augmented Synthetic Control
   Method"

**Recommended:**
3. Abadie, Diamond & Hainmueller (2010), the original Proposition 99 paper
4. Xu (2017), "Generalized Synthetic Control Method"
5. Arkhangelsky et al. (2021), "Synthetic Difference-in-Differences"
6. Cunningham (2021), *Mixtape*, synthetic control chapter
7. Lei & Sudijono (2024), "Inference for Synthetic Controls via Refined
   Placebo Tests"
8. Firpo & Possebom (2018), sensitivity analysis for synthetic controls
9. Cattaneo, Feng, Palomba & Titiunik (2025) + `scpi` R package

### Exploration 11 (lives here)

Students construct a synthetic control, run placebo tests, compare to
simple DiD, and assess sensitivity:

**Primary dataset**: California Proposition 99 (via `Synth` or `augsynth`
R packages). The canonical example; every student of SC should work
through it.

**Alternative**: A political science application (e.g., the effect of a
single state's policy on some outcome).

---

## Resolved Decisions

### 1. Where does PanelMatch fit?

**Resolution: Week 11 (Option a), with Imai & Kim (2019) as recommended
reading.** PanelMatch operationalizes risk-set matching for panel data.
Students already know matching from Explorations 4--5; PanelMatch extends
that logic. Imai & Kim (2019, *AJPS*) explains *why* TWFE is not
design-based --- important background.

### 2. Coherence

Rosenbaum's "coherence" (Design Ch. 18; Observational Studies Ch. 9) is
about multiple outcomes responding consistently. Valuable but not the right
framing for DiD. The **counterparts** concept from Ch. 8 is the bridge.
However, the coherence result on p. 367 of *Design* (DiD overweights the
baseline) IS relevant and should be mentioned in Week 11.

### 3. The Leavitt & Hatfield transformation problem

**Resolution: Recommended reading for Week 11.** Rosenbaum raises the log
problem (pp. 164--166). Roth & Sant'Anna (2023) formalize it. Leavitt &
Hatfield provide the resolution. Discuss in class via the Rosenbaum
examples. Do not require the APM paper --- it is too much for a first
encounter with DiD.

### 4. Reading load

**Resolution: 3 required + generous recommended list per week.** Required
readings balanced roughly 2:1 between traditions (sometimes 2 econometric +
1 design-based, sometimes 1 + 2). Students pick from recommended based on
interest.

### 5. How deep into econometrics?

Students need to: understand why TWFE fails, know alternatives exist,
implement at least one, understand the assumptions. They do NOT need to:
derive decomposition weights, prove estimator properties, or master
asymptotics. The Shen et al. visualizations and the Baker et al.
practitioner's guide are the right level.

---

## Bibliography Entries Needed for syllabus.bib

**Must add (not currently in bib):**
- Roth, Sant'Anna, Bilinski & Poe (2023), *J. Econometrics* 235, 2218--2244
- Baker, Callaway, Cunningham, Goodman-Bacon & Sant'Anna (2025),
  arXiv:2503.13323, forthcoming *JEL*
- Leavitt & Hatfield (2025), *Annals of Applied Statistics* 19(3), 1826--1846
- Leavitt, "Beyond Pre-Trends" (accepted)
- Cohn, Song & Zubizarreta (2025), *Annals of Applied Statistics* 19(1)
- Athey & Imbens (2022), *J. Econometrics* 226(1), 62--79
- Roth & Sant'Anna (2023), *Econometrica* 91(2), 737--747
- Keele, Small, Hsu & Fogarty (2019), arXiv:1901.01869
- Rosenbaum (2001), *JASA* 96, 210--219
- Rosenbaum (2015), *Annual Review of Statistics* 2, 21--48
- Borusyak, Jaravel & Spiess (2024), *Review of Economic Studies* 91(6),
  3253--3285
- de Chaisemartin & d'Haultfoeuille (2023), *Econometrics Journal* 26(3),
  C1--C66
- Rambachan & Roth (2023), *Review of Economic Studies* 90(5), 2555--2591
- Chattopadhyay & Zubizarreta (2023), *Biometrika* 110(3), 615--629
- Cheng & Hoekstra (2013), *Journal of Human Resources* 48(3), 821--854
- Arkhangelsky et al. (2021), *American Economic Review* 111(12), 4088--4118
- Sun & Abraham (2021), *J. Econometrics* 225(2), 175--199
- Cattaneo, Feng, Palomba & Titiunik (2025), *J. Statistical Software*
- Lei & Sudijono (2024), arXiv:2401.07152
- Firpo & Possebom (2018), *J. Causal Inference* 6(2)

**Already in bib (verify/update to published versions):**
- `goodman-bacon2018a` --> update to Goodman-Bacon (2021), *J. Econometrics*
- `callawaysantanna2019` --> update to Callaway & Sant'Anna (2021),
  *J. Econometrics*
- `dingli2019` --> verify Ding & Li (2019)
- `imaikim2021` --> verify
- `shen2024anatomy` --> verify
- `abadieetal2012` --> verify (may be the 2010 paper)
- `abadie2020` --> verify
- `ben-michaeletal2021` --> verify
- `xu2017generalized` --> verify

---

## Summary of the Dual Perspective Across All Three Weeks

| Week | Counterparts framing | Economics / Estimation | Design-Based / Testing | Sensitivity Analysis |
|------|---------------------|----------------------|----------------------|---------------------|
| 11 | Pre-treatment measures as counterparts | Parallel trends, TWFE, ATT, bracketing (Ding & Li) | Matched DiD, permutation tests (sharp null without parallel trends), risk-set matching (Cohn et al.) | Keele et al. (design-based); Rambachan & Roth (econometric); Leavitt (discordance) |
| 12 | Not-yet-treated as counterparts; TWFE uses wrong counterparts | Goodman-Bacon decomposition, Callaway-Sant'Anna, event studies, Shen et al. | Athey & Imbens (design-based DiD), risk-set matching in staggered settings, testing within matched sets | `HonestDiD` on event-study estimates; Bowers, Leavitt & Miratrix (sequential) |
| 13 | Donor pool as candidate counterparts; optimization finds best composite | SC estimation, augmented SC, synthetic DiD, matrix completion | Placebo tests as permutation inference, refined placebo tests (Lei & Sudijono) | Firpo & Possebom (SC sensitivity); donor pool sensitivity |

---

## R Packages Summary

| Package | What it does | Week |
|---------|-------------|------|
| Base R / `estimatr` | Hand-computed DiD and regression | 11 |
| `PanelMatch` | Risk-set matching for panel data | 11--12 |
| `did` | Callaway & Sant'Anna estimator | 12 |
| `bacondecomp` | Goodman-Bacon decomposition + castle data | 12 |
| `fixest` (incl. `sunab()`) | Fast TWFE and Sun-Abraham estimator | 12 |
| `HonestDiD` | Rambachan-Roth sensitivity analysis | 11--12 |
| `lmw` | Implied weights of regression | 12 |
| `Synth` or `augsynth` | Synthetic controls (classic and augmented) | 13 |
| `scpi` | Prediction intervals for synthetic controls | 13 |

---

*Plan revised: March 25, 2026*
*Incorporates feedback from econometric reviewer (Baker et al. 2025,
Rambachan & Roth, doubly robust DiD, de Chaisemartin & d'Haultfoeuille,
continuous treatments, Cattaneo et al. SC inference) and design-based
reviewer (Keele et al., Athey & Imbens 2022, testing vs. estimation,
counterparts as organizing concept for all weeks, sensitivity analysis
thread, implied weights, Imai & Kim 2019). Also incorporates Rosenbaum
search findings (Ch. 8 not Ch. 13, Rosenbaum 2001 JASA, the DiD-
overweights-baseline result from Design p. 367, evidence factors,
the 2015 Annual Review, and the full family of quasi-experimental devices).*
