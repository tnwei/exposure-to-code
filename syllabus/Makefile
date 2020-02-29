PANDOC=/home/tnwei/miniconda3/bin/pandoc

MD_FILES=$(wildcard *.md)
PDF_FILES=$(patsubst %.md, %.pdf, $(MD_FILES))

.PHONY: all
all: $(PDF_FILES)

%.pdf : $(MD_FILES)
	$(PANDOC) -V geometry:margin=1in -f markdown+hard_line_breaks -o $@ $<
    
clean:
	rm $(PDF_FILES)
