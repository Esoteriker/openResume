LATEXMK := latexmk
BUILD_DIR := build

.PHONY: all pdf pdf-en pdf-en-tesla pdf-de pdf-zh pdf-all clean

all: pdf-all

pdf: pdf-en

pdf-en:
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) -jobname=Haidong_Xu_CV_EN cv_en.tex

pdf-en-tesla:
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) -jobname=Haidong_Xu_CV_EN_TESLA cv_en_tesla.tex

pdf-de:
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) -jobname=Haidong_Xu_CV_DE cv_de.tex

pdf-zh:
	mkdir -p $(BUILD_DIR)
	$(LATEXMK) -jobname=Haidong_Xu_CV_ZH cv_zh.tex

pdf-all: pdf-en pdf-de pdf-zh

clean:
	rm -rf $(BUILD_DIR)
