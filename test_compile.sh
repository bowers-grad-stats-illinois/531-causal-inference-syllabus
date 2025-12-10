#!/bin/bash
# Simple test script to verify LaTeX compilation

set -e

echo "Testing LaTeX compilation..."

if ! command -v pdflatex &> /dev/null; then
    echo "ERROR: pdflatex not found. Please install a LaTeX distribution."
    echo "  - Linux: sudo apt-get install texlive-full"
    echo "  - macOS: Install MacTeX from https://www.tug.org/mactex/"
    echo "  - Windows: Install MiKTeX from https://miktex.org/"
    exit 1
fi

echo "Found pdflatex: $(which pdflatex)"

# Compile the syllabus
echo "Compiling syllabus.tex..."
pdflatex -interaction=nonstopmode syllabus.tex > /dev/null
pdflatex -interaction=nonstopmode syllabus.tex > /dev/null

if [ -f "syllabus.pdf" ]; then
    echo "✓ Successfully compiled syllabus.pdf"
    echo "  File size: $(du -h syllabus.pdf | cut -f1)"
else
    echo "✗ Compilation failed - syllabus.pdf not found"
    exit 1
fi

echo ""
echo "All tests passed!"
