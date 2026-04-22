# Handoff: Final Paper Rubric Revision

## What was done

Revised `final_paper_rubric.md` for PS 531 Spring 2026. The rubric went from
a rough list of 8 criteria (numbered 0--7) to a structured document with
clearer framing, sharper distinctions between criteria, and practical guidance
for students.

## Key decisions made

1. **Two framings for the assignment.** Jake clarified that the project can be
   either (a) a pedagogical appendix to a paper the student is writing, or
   (b) a methods-book chapter. Both are now presented as equally valid paths.
   The appendix framing emphasizes making methodological choices transparent
   to substantive experts; the methods-book framing emphasizes teaching the
   technique itself.

2. **"Your reader is your student."** Jake wanted the rubric to make clear
   that the reviewer/colleague/advisor is the student for the duration of the
   document --- that this assignment asks for the explanation the published
   paper leaves out. Published papers compress methodology; this project is
   the uncompressed version. This is the closing paragraph of the assignment
   section.

3. **Split identification from statistical inference.** The old rubric had a
   blurry distinction between "assumptions for causal inference" (old item 2)
   and "assumptions for statistical inference" (old item 3). The new rubric
   separates these into three distinct criteria: Estimands (item 2),
   Identification (item 3), and Statistical inference (item 4).

4. **Added research design as item 1.** The old rubric jumped to "have you
   chosen a technique?" without asking students to describe the research
   design. The new item 1 asks students to describe the substantive question,
   the units, the treatment, the outcomes, and the comparison --- before any
   formalism.

5. **Concrete examples in assessment criteria.** Item 5 (assessing
   assumptions with data) now lists specific empirical checks from the course:
   covariate balance, placebo tests, density tests, first-stage diagnostics,
   pre-treatment trends.

6. **Added practical expectations.** Reproducibility (.qmd/.Rmd that
   compiles), submission via PR, collaboration policy.

7. **Added "What distinguishes excellent work."** Gives students a signal
   about what separates adequate from excellent --- genuine engagement with the
   method vs. running a canned analysis.

## Files changed and why

- `final_paper_rubric.md` --- Complete rewrite. The syllabus blockquote at the
  top is preserved verbatim. Everything below it is new: assignment framing,
  8 rubric criteria (0--8), practical expectations, and what distinguishes
  excellent work.

## Current blockers or open questions

- **No changes to syllabus.tex.** The syllabus still contains the original
  (vaguer) description of the final project. Jake may want to update it to
  match the rubric, or may prefer to keep the syllabus language general and
  let the rubric do the detailed work.

- **Grading weights not specified.** The rubric does not assign point values
  or weights to each criterion. Jake may want this to remain qualitative, or
  may want to add a scoring grid later.

- **The rubric is in markdown, not LaTeX.** It matches the format Jake started
  with. If he wants it compiled as a PDF to distribute, he may need a render
  step (e.g., pandoc or Quarto).

- **The Howard Becker AI instruction (item 0) is preserved** but could be
  expanded with more specific guidance about what to ask the AI to check for.
  Jake seemed happy with it as-is.

## Important context to preserve

- Jake's writing-style preferences are detailed in `~/.claude/CLAUDE.md`:
  plain ASCII only (no unicode dashes, quotes, ellipses), Gopen & Swan
  sentence-level craft, Rosenbaum/Bowers pedagogical voice, direct tone.
  The rubric was written to match these preferences.

- The course teaches multiple frameworks (randomization-based vs. model-based,
  estimation vs. testing, design-based vs. outcome-based) as complementary
  rather than competing. The rubric reflects this in item 7 (alternatives).

- The explorations repo (`~/repos/531-Explorations`) contains 12 exploration
  documents that model the kind of engagement the rubric asks for. Students
  have been doing this kind of work all semester; the final project asks them
  to do it independently on a question they care about.

- The previous HANDOFF.md covered Week 14 exploration design (mediators,
  front-door paths, post-treatment variables). That work is complete and
  reflected in `syllabus.tex`.

## What's done vs. what remains

**Done:**
- Full rubric revision with Jake's input on both framings and the
  "reader as student" framing
- All 9 criteria (0--8) written with concrete guidance
- Practical expectations and "excellent work" sections added

**Remains:**
- Jake's review of the full document --- he may want to adjust tone,
  add/remove criteria, or change emphasis
- Decision on whether to update syllabus.tex final project description
- Decision on grading weights (if desired)
- Rendering to PDF for distribution to students (if desired)
