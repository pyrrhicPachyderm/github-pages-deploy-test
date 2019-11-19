SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
RM := rm -f
RMDIR := rm -rf

all: test.pdf
website: website/test.pdf

test.pdf: test.tex
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $@)" $<

website/test.pdf: test.pdf
	@cp $< $@

.PHONY: all website
