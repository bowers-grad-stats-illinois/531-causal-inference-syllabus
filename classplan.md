
# 27-01-2025

## Admin

Dropping the teaching a class component. Just too much.

## Next time

## Last time: Quiz and Review

- Workflow
  - The importance of modularization of code (why?)
  - The importance of version control  (why?)
  - The importance of directory structure and file naming conventions. (why?)
  - Other things?

- "Model-based" versus "design-based" causal inference versus statistical inference.
  - Why should I change my beliefs about the causes of cooperation between states based on this  

## Today

Notice differences across writers/disciplines:
 - Ashworth et all say that the point is to "estimate" which implies
   statistical inference if not also causal inference. (rather than describe
   patterns as Matt suggested)
 - Other readings focus a lot on identification of causal effects.
 - Rosenbaum never mentions it.
 - If we were doing Bayesian predictive causal inference, it is also not clear
   if it would be relevant.
 - Also differences in notation: $r_T$, $r_C$, $Y(1)$, $Y^a$,...

- What is randomization supposed to do in order to help us make causal
  inferences?

- How is randomization the "reasoned basis for inference"? Why do people like
  this?
  - An example of randomization-based inference for estimation of average
    causal effects?
  - An example of randomization-based inference for testing hypotheses about
    individual causal effects?
  - Notice: "randomization-based inference" need not **use** permutations, it
    could rely on the central limit theorem.

- The exploration: Say you have an experiment that is less of a toy. How should
  you analyze it? How should you think about (1) defining estimands, (2)
  deciding on hypotheses to test, etc... 

"Identification"
  - Angrist and Pischke Chap 1: "Angrist and Krueger (1991) used the term
    *identification strategy* to describe the manner in which a reserach uses
    observational data...to approximate a real experiment."
  - Hernan and Robins:
    - "When.. a counterfactual quantity can be expressed as a function of the
      distribution (i.e. the probabilities) of the observed data, we say that
      the counterfactual quantity is identified (or identifiable); otherwise we
      say it is unidentified."
    - "Identifiablity conditions" (Chap 3.1) they say "Ideal randomized
      experiments can be used to identify and quantify average causal effects
      because the randomized assignment of treatment leads to exchangeability."
      - Exchangeability: "In marginally (i.e., unconditionally) randomized
        experiments, the treated and the untreated are exchangeable because the
        treated, had they remained untreated, would have experienced the same
        average outcome as the untreated did, and vice versa. This is so
        because randomization ensures that the independent predictors of the
        outcome are equally distributed between the treated and the untreated
        groups." (page 29) The idea is that we could **swap** who receives the
        treatment and the average potential outcomes would be the same between
        the two groups. They say, "in ideal randomized experiments association
        is causation." (Exchangeability plus positivity is "ignorability"  for
        Rubin and Rosenbaum)
      - Consistency: "Consistency of counterfactuals means that the observed
        outcome Y for every treated individual equals her outcome if she had
        received treatment, $Y^a=1$ , and that the observed outcome Y for every
        untreated individual equals her outcome if she had remained untreated,
        $Y^a=0$. That is, consistency is the assumption that $Y= Y^A$, where
        $Y^A$ is the counterfactual $Y^a$ with $a$ evaluated at an individual’s
        actual treatment $A$." (Consistency plus non-interference is "SUTVA"
        for  Rubin and Rosenbaum)

- Conditional Randomization/Stratification/Block randomization (same! **must**
  analyze using weights)
- Inverse Probability Weighting (IPW) (same! another way to produce weights). 

> Informally, an observational study can be conceptualized as a conditionally
> randomized experiment if the following conditions hold:
> 1. the values of treatment under comparison correspond to well-defined in-
>    terventions
> 2. the conditional probability of receiving every value of treatment, though
>    not decided by the investigators, depends only on measured covariates L
> 3. the probability of receiving every value of treatment conditional on L is
>    greater than zero, i.e., positive In this chapter we describe these three
>    conditions in the context of ob- servational studies. Condition 1 was
>    referred to as consistency in Chapter 1, condition 2 was referred to as
>    exchangeability in the previous chapters, and condition 3 was referred to as
>    positivity in Technical Point 2.3. (Chap 28)


# 20-01-2025

## Admin

The Syllabus!
 - Mediation

Are the assignments ones that you think will help you grow? Sufficiently challenging? Not too boring?

An open question for this term: How much review should we do? (Continue reviewing)

Teaching a class: Jake posts a Google Sheet for signups or the Class says, "no."

## Next Time

Experiments.

## Quiz and Review

Quiz.

Review: 
 - What are some of the problems of linear regression for description?
 - What are some of the problems of linear regression for statistical inference?

The credibility revolution and the distinction between "covariates" and
"interventions/treatments/key explanatory variables" and "outcomes".


### Today:

Your questions and comments.

Workflow

 - How have you organized your work with others (or your future self)? What
 worked well and what worked less well?

Counterfactual conception of causality.
 
 - Potential Outcomes
 - Fundamental problem: why do we call it causal **inference**?
 - Why should we care to infer?

DAGs
 - What is the point? (What should we condition on? Why should we condition on
   it? What does it mean to **condition on**? "Bad controls")
 - Backdoor criterion
 - Colliders.

From Morgan and Winship:

> The frequency of basic confounding has established subgroup analysis as perhaps the most common modeling strategy to prosecute causal questions in social science research. Whether referred to as subclassification, stratification, tabular decomposi- tion, or simply adjustment for a third variable, the data are analyzed after “condi- tioning” on membership in groups defined by values of the confounder variable. 


