.PHONY: clean watch

all: build/main.pdf

build/main.pdf: main.tex *.tex *.bib images/*
	mkdir -p build
	pdflatex -shell-escape -halt-on-error -interaction=nonstopmode -output-directory=build main
	TEXMFOUTPUT="build:" bibtex build/main
	pdflatex -shell-escape -halt-on-error -interaction=nonstopmode -output-directory=build main
	pdflatex -shell-escape -halt-on-error -interaction=nonstopmode -output-directory=build main

clean:
	rm -rf build/*

watch:
	while :; do make; sleep 60; done;
