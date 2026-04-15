---
title: Final Project Rubric for PS 531 Spring 2026
author: Jake Bowers
date: '`r format(Sys.Date(), "%B %d, %Y")`'
---

## The assignment

The default assignment in this class is to write a document that **teaches** a
reader about a causal inference technique and **applies** it to a substantive
question using data. Your audience is a colleague in political science ---
someone unfamiliar with the particular method you are explaining and probably
unfamiliar with some of the fundamentals of statistics that we have studied in
PS 530 and PS 531. The goal is not to summarize a textbook chapter. The goal is
to build a reader's understanding from the ground up, show the method working on
real data, and then honestly assess what we learned and what remains uncertain
about a substantive topic.

There are two natural framings for this project but you should feel free to
propose a different project. Make sure to check in with Jake if you want to do
something different, and make sure it has a clear pedagogical component. 

The two framings:

- **A pedagogical appendix to a paper you are writing.** You are doing
  substantive work --- analyzing an experiment, a policy rollout, a panel
  dataset --- and you want to give a reader deep access to the methodological
  choices you made. Why this method and not another (reviewers always ask this)?
  What assumptions does your chosen technique require, and how credible are they
  in your specific setting? What happens to the conclusions if those assumptions
  are wrong? Think of it as the appendix that helps a substantive expert --- a
  reviewer, a colleague, an advisor --- understand not just *what* you did but
  *why*, and how much the conclusions depend on choices that could have gone
  differently.

- **A chapter in an applied methods book.** You pick a technique, explain it
  from the ground up, and demonstrate it on data. The emphasis is on teaching
  the method itself --- its logic, its assumptions, its strengths and
  limitations --- using a concrete application as the vehicle. The mixtape
  website is a good model for this kind of project. Feel free to propose your
  chapter for use in our ci-textbook. Or if you want, you can edit and improve
  on and draft one of the chapters we already have. This is a project that is
  already co-authored, so I can't promise your work will be included in the
  textbook, but it is a chance to contribute to a resource that will be widely
  used and to learn by teaching. 

Either way, you are both teacher and analyst. Your reader --- whether a
reviewer, a colleague, or an advisor --- is your student for the duration of
this document. Published papers rarely explain their methods at this depth;
page limits and disciplinary norms push authors to cite a technique and move
on. But if you are going to *use* a method to draw causal conclusions, you
should be able to *teach* it --- to explain why it works, what it assumes,
and where it might fail. This assignment asks for the explanation that the
published paper leaves out.

## Rubric

### 0. Writing

Is your writing clear and direct? Every sentence should do work. Avoid jargon
that does not earn its place, passive constructions that hide the actor, and
hedging that adds no information. Use concrete examples before abstractions.
Technical terms are fine when they do real work --- they are not fine when a
plain word would serve.

If you wonder how to achieve clarity, ask yourself: what would Howard Becker
say? Read the final draft as if you were Howard Becker reading *Writing for
Social Scientists* for the first time. Would he say "this is clear" or "this is
classy"? If the latter, edit until the former. You can also make use of an AI
for help. 

### 1. Substantive question and research design

What causal question are you asking, and why does it matter? OR What is the kind
of causal question scholars often want to address with the technique that you
will be teaching? What is the research design? Describe it concretely: what are
the units of treatment/intervention/exposure, the units of measurement, units
for the measurement of outcomes?

The method you choose should follow from the design, not the other way around.
If you are doing something like difference-in-differences, explain the policy
change, the outcomes and the panel structure. If you are doing matching, explain
the treatment assignment/selection process you are trying to adjust for. The
reader should understand the substantive setting before encountering any
formalism.

### 2. What are you trying to learn?

State explicitly what causal quantity you are after. Is it an average treatment
effect? A complier average causal effect? An effect on the treated? A sharp null
hypothesis that the treatment moved no one? Something else? What is the
substantive reason for making this choice? What does it mean, in the context of
your application, for this quantity to be large or small or zero?

### 3. What assumptions make causal claims possible?

Causal inference requires more than data. It requires assumptions about how
treatment was assigned (interventions/exposures experienced) and how observed
outcomes relate to potential outcomes. These are the conditions under which a
statistical quantity (a p-value, a confidence interval, a difference in means, a
regression coefficient, a ratio of ITTs) can be interpreted as a causal effect.

Explain each assumption your method requires. Do not just list them. For each
one:

- State it in plain language. What is it asking you to believe (at least
  provisionally, for the sake of argument) about the world?
- Explain what it rules out. What pattern of confounding or selection or
  interference would violate it?
- Explain what it enables. If this assumption holds, what can you now claim that
  you could not claim without it?

For example: if you are doing difference-in-differences, do not stop at
"parallel trends." That is one assumption among several (no anticipation, no
spillover, stable composition, etc.), and it is relevant to only some estimands.
If you are doing instrumental variables, walk through the exclusion restriction,
relevance, sutva, as-if-randomized and monotonicity, explaining what each means
in the context of your specific application.

### 4. Statistical inference: the assumptions that let you quantify uncertainty

The assumptions step (including "identification" for estimands) tells you what
the data *mean*. Statistical inference tells you how much to trust your answer
given that you have finite data and possibly noisy measurements. These are
different problems, and the assumptions are different.

What framework are you using for inference? Randomization-based inference
(deriving a reference distribution from the treatment assignment mechanism)?
Sampling-based inference (treating units as a sample from a population)?
Model-based inference (assuming a parametric form for outcomes) (we only
gestured at this in the class, this is an approach that uses likelihood
functions with or without prior distributions)? Some combination?

An example of an assumption of this nature is the idea that "clustered standard
errors are valid." This is not an assumption about how treatment was assigned or
how outcomes relate to potential outcomes. It is an assumption about how to
quantify uncertainty. It is an assumption that allows you to say "the
probability of a false positive error is 5%." 

### 5. Assessing assumptions with data and argument

A reasonable reader will want to know: why should I believe these assumptions
hold, even provisionally? Some assumptions can be partially checked with data.
Others require argument. Show and explain both.

Demonstrate at least one empirical check. Examples from this course:

- Covariate balance before and after adjustment (for matching or stratification)
- Placebo tests on pre-treatment outcomes or outcomes known to be unaffected
  (for DiD, synthetic controls)
- Density tests or covariate smoothness at the cutoff (for RDD)
- First-stage strength and reduced-form effects (for IV)
- Parallel pre-treatment trends (for DiD --- though remember, pre-treatment
  parallel trends do not guarantee post-treatment parallel trends)

For assumptions that cannot be checked with data (e.g., exclusion restriction,
no unmeasured confounding, parallel trends in the post-treatment period),
make the best argument you can. What would have to be true about the world
for this assumption to fail? How plausible is that?

### 6. Sensitivity analysis

Most assumptions are not directly testable. Sensitivity analysis asks: how
large would the departure from an assumption have to be before the conclusion
changes?

Implement a sensitivity analysis appropriate to your method. Interpret the
results in substantive terms. Saying "the result is sensitive to a bias of Gamma
= 1.5" is not helpful by itself. What does a bias of that magnitude look like?
Is it plausible given what we know about the problem? What confounder(s) would
create such a bias? Compare to observable confounders if possible (as in the
Rosenbaum bounds tradition or the Cinelli and Hazlett approach for regression).

The point of sensitivity analysis is not to prove robustness. It is to
understand fragility --- to learn where the boundaries of your knowledge are.

### 7. Alternative approaches

No method is uniquely correct for any problem. What are the main alternatives to
the approach you chose? Why might someone prefer a different method with
different assumptions (or different data requirements or different summaries of
causal effects)? If you tried an alternative, what did you find? If you did not,
what would you expect and why?

This is where your judgment as a researcher matters. The course has shown you
that methodologists across disciplines have developed more than one credible
approach to nearly every problem. Demonstrate that you understand the tradeoffs.

### 8. Summary and interpretation

What did you learn about the causal question you started with? Be honest about
what the analysis can and cannot tell you. Translate your findings back into
the substantive language of the application --- not just "the ATT is 0.3" but
what that means for the policy, the theory, or the puzzle that motivated the
work.

Step back and assess the method itself. Is this an approach that deserves wider
use in your field? Does it serve a special purpose? Are the assumptions
reasonable in typical applications, or do they require unusual data or
settings? After your deep dive, would you recommend this approach to a
colleague? Under what conditions?


## Practical expectations

- **Reproducibility.** I should be able to do `git clone` to the repository
  containing your project and then in one or two steps reproduce your entire
  paper. See [my paper on
  this](https://jakebowers.org/static/papers/bowers_voors_2016.pdf). You might
  find it useful to use Quarto or LaTeX. You should not use Word. No figure or
  table should involve copying and pasting by hand into a document or into an
  image file unless these are images that you took from elsewhere for
  illustration.

- **Length.** There is no page limit. But you should not include raw R code or
  output in the paper unless you are teaching us how to use R.

- **Collaboration.** You may work with one or more co-authors. Both names should appear
  on the document. Both authors should be able to explain every part of the
  paper if I ask for an impromptu oral exam.
