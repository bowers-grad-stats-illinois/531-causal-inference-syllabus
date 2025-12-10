# POLS 531: Causal Inference for Political Science

Syllabus and general course materials for the second term statistics course for political science PhD students at the University of Illinois @ Urbana-Champaign.

## About This Course

This course provides a comprehensive introduction to causal inference methods for political science research. Students will learn experimental and quasi-experimental designs, modern statistical techniques for estimating causal effects, and how to critically evaluate causal claims in published research.

**First Day of Class:** Tuesday, January 20, 2026

## Building the Syllabus

The syllabus is written in LaTeX and features a modern design with:
- Sans serif fonts (Helvetica)
- University of Illinois colors (Navy Blue and Orange)
- FontAwesome icons
- Automatic date calculation (no need to hard-code class dates)

### Prerequisites

You need a LaTeX distribution installed on your system:
- **Linux**: Install TeX Live (`sudo apt-get install texlive-full`)
- **macOS**: Install MacTeX (https://www.tug.org/mactex/)
- **Windows**: Install MiKTeX (https://miktex.org/) or TeX Live

### Compilation

#### Using Make (recommended)
```bash
make          # Compile the syllabus
make view     # Compile and open the PDF
make clean    # Remove build artifacts
```

#### Manual compilation
```bash
pdflatex syllabus.tex
pdflatex syllabus.tex  # Run twice for proper formatting
```

The output will be `syllabus.pdf`.

## Customization

### Changing Course Dates

The first day of class is set in `syllabus.tex` at line 51:
```latex
\newcommand{\firstclassdate}{20/01/2026}  % Format: DD/MM/YYYY
```

Simply change this date, and all subsequent weekly dates will automatically update. No need to hard-code individual class dates!

### Modifying Content

Edit `syllabus.tex` to:
- Update instructor information (around line 88 in the course information table)
- Modify course description and objectives
- Add, remove, or reorder weeks in the schedule
- Adjust assignments and grading policies
- Update required texts and readings

### Customizing Colors

The color scheme uses University of Illinois colors:
```latex
\definecolor{primarycolor}{RGB}{19, 41, 75}   % Illinois Navy Blue
\definecolor{accentcolor}{RGB}{232, 74, 39}   % Illinois Orange
```

Change these RGB values in `syllabus.tex` (lines 19-21) to customize the color scheme.

## License

See [LICENSE](LICENSE) file for details.
