# $Id: Makefile 87305 2016-02-08 13:50:32Z lafferty $
# ===============================================================================
# Purpose: simple Makefile to streamline processing latex document (just say "make" to execute)
# Author: Tomasz Skwarnicki
# Created on: 2010-09-24
# A few changes by Patrick Koppenburg on 2015-06-26
# ===============================================================================
# Modified by Mingrui Zhao for the purpose to write notes

# name of the main latex file (do not include .tex)
Part1 = template
Part2 = symbols-list
# name of command to perform Latex (either pdflatex or latex)
LATEX = xelatex

FIGEXT = .pdf
MAINEXT= .pdf
BUILDCOMMAND1=rm -f $(Part1).aux && $(LATEX) $(Part1) && $(LATEX) $(Part1) && $(LATEX) $(Part1)
BUILDCOMMAND2=rm -f $(Part2).aux && $(LATEX) $(Part2) && $(LATEX) $(Part2) && $(LATEX) $(Part2)

# list of all source files
TEXSOURCES = $(wildcard *.tex) $(wildcard *.bib)
FIGSOURCES = $(wildcard figs/*$(FIGEXT))
SOURCES    = $(TEXSOURCES) $(FIGSOURCES)

# define output (could be making .ps instead)
Output1 = $(Part1)$(MAINEXT)
Output2 = $(Part2)$(MAINEXT)

# cp temporary main.pdf to target.
$(Output1): $(Part1)$(MAINEXT)
	cp $(Part1)$(MAINEXT) $(Output1)

$(Output2): $(Part2)$(MAINEXT)
	cp $(Part2)$(MAINEXT) $(Output2)

# prescription how to make output (your favorite commands to process latex)
# do latex twice to make sure that all cross-references are updated 
$(Part1)$(MAINEXT): $(SOURCES) Makefile
	$(BUILDCOMMAND1)

$(Part2)$(MAINEXT): $(SOURCES) Makefile
	$(BUILDCOMMAND2)

# just so we can say "make all" without knowing the output name
all: $(Output1) $(Output2)

# remove temporary files (good idea to say "make clean" before putting things back into repository)
.PHONY : clean
clean:
	rm -f *~ *.aux *.log *.bbl *.blg *.dvi *.tmp *.out *.blg *.bbl $(OUTPUT) $(Part1)$(MAINEXT) $(Part2)$(MAINEXT)
