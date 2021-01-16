.PHONY: clean watch

all: build/main.pdf

build/main.pdf: main.tex *.tex *.bib images/*
	mkdir -p build
	pdflatex -halt-on-error -output-directory=build main
	TEXMFOUTPUT="build:" bibtex build/main
	pdflatex -halt-on-error -output-directory=build main
	pdflatex -halt-on-error -output-directory=build main

clean:
	rm -rf build/*

watch:
	while :; do make; sleep 60; done;
