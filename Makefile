AUX_DIR = tmp
OUT_DIR = pdf
SRC_DIR = src
FILE = $(SRC_DIR)/$(REL_DIR)/$(MAIN)
OUT = $(OUT_FILE).pdf

TEX = lualatex -output-directory $(AUX_DIR) -interaction nonstopmode -shell-escape -file-line-error-style

.PHONY: all bib gls dist clean shell

all: $(OUT) dist

$(OUT): clean $(MAIN).pdf

$(MAIN).pdf: $(FILE).tex
	$(TEX) $<
	$(TEX) $<

dist:
	mv $(AUX_DIR)/$(MAIN).pdf $(OUT_DIR)/$(OUT)
	$(MAKE) clean

clean:
	rm -rfv $(AUX_DIR)/* _minted-main $(MAIN).xdy *.pyg

pyg-lexers:
	pygmentize -L lexers

pyg-styles:
	pygmentize -L styles

shell:
	/bin/bash
