.PHONY: clean

all: main.pdf

main.pdf: main.tex *.tex *.bib images/*
	mkdir -p build
	pdflatex -output-directory=build main
	TEXMFOUTPUT="build:" bibtex build/main
	pdflatex -output-directory=build main
	pdflatex -output-directory=build main

clean:
	rm -rf build/*
