SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
RM := rm -f
RMDIR := rm -rf

all: test.pdf
website: website/test.pdf

test.pdf: test.tex
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $@)" $<
clean:
	clean:
	@(\
		shopt -s globstar;\
		$(RM) **/*.aux **/*.log **/*.out **/*.toc **/*.fls;\
		$(RM) **/*.fdb_latexmk;\
		$(RM) **/*.bbl **/*.run.xml **/*.auxlock;\
		$(RM) **/*.idx **/*.ind **/*.ilg;\
		$(RM) **/*.dep **/*.dpth **/*.md5 **/*-figure*.pdf;\
		$(RM) **/*.pdf **/*.dvi;\
	)

website/test.pdf: test.pdf
	@cp $< $@

.PHONY: all website
