.PHONY: all clean view

# Main target
all: syllabus.pdf

# Compile the syllabus (with bibliography)
syllabus.pdf: syllabus.tex syllabus.bib
	pdflatex syllabus.tex
	biber syllabus
	pdflatex syllabus.tex
	pdflatex syllabus.tex

# Open the PDF (works on most systems)
view: syllabus.pdf
	@if command -v xdg-open > /dev/null; then \
		xdg-open syllabus.pdf; \
	elif command -v open > /dev/null; then \
		open syllabus.pdf; \
	else \
		echo "Please open syllabus.pdf manually"; \
	fi

# Clean build artifacts
clean:
	rm -f *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.synctex.gz *.bbl *.blg *.nav *.snm *.vrb *.bcf *.run.xml
	rm -f syllabus.pdf

# Help message
help:
	@echo "Available targets:"
	@echo "  all (default) - Compile the syllabus"
	@echo "  clean         - Remove build artifacts and PDF"
	@echo "  view          - Open the PDF after building"
	@echo "  help          - Show this help message"
