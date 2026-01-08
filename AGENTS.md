# Repository Guidelines

## Project Structure & Module Organization
- `syllabus.tex` is the primary LaTeX source for POLS 531; `syllabus-532.tex` is a variant.
- Generated PDFs and LaTeX artifacts live at the repo root (`syllabus.pdf`, `*.aux`, `*.log`, `*.out`, `*.fls`, `*.fdb_latexmk`).
- `topics.md` holds supplemental topic notes.
- `Makefile` and `test_compile.sh` provide build/test helpers.

## Build, Test, and Development Commands
- `make` builds `syllabus.pdf` (runs `pdflatex` twice for references).
- `make view` builds and opens the PDF using `xdg-open` or `open`.
- `make clean` removes build artifacts and the generated PDF.
- `./test_compile.sh` checks that `pdflatex` is installed and performs a non-interactive build.

## Coding Style & Naming Conventions
- Use two-space indentation inside LaTeX environments; avoid tabs.
- Keep macro definitions near the top and use descriptive names (e.g., `\classweek{N}`).
- File names are lowercase with hyphenated variants (e.g., `syllabus-532.tex`).
- No formatter or linter is configured, so prefer small, focused edits and recompile after changes.

## Testing Guidelines
- The only required test is a successful LaTeX compile.
- Run `make` or `./test_compile.sh` and confirm `syllabus.pdf` is produced.
- There are no automated coverage requirements.

## Commit & Pull Request Guidelines
- Commit messages are short and action-oriented (examples: "Update readme", "Drafting").
- PRs should include a brief summary and note whether PDFs were rebuilt.
- If syllabus content changes, update the corresponding PDF(s) in the same PR.

## Configuration Notes
- A LaTeX distribution is required (TeX Live, MacTeX, or MiKTeX).
