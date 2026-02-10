LATEXMK := latexmk
MAIN := cv.tex

.PHONY: all pdf clean

all: pdf

pdf:
	mkdir -p build
	$(LATEXMK) $(MAIN)

clean:
	$(LATEXMK) -C $(MAIN)
	rm -rf build
