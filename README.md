# LaTeX Resume Template

## Build

Requirements:
- TeX distribution with `xelatex`, `latexmk`
- LaTeX packages used in `resume.cls` (including `fontawesome5`)
- Chinese build additionally uses `xeCJK`

Build all language versions:

```bash
make
```

or

```bash
make pdf-all
```

Build a single language:

```bash
make pdf-en
make pdf-de
make pdf-zh
```

Output:

- `build/Haidong_Xu_CV_EN.pdf`
- `build/Haidong_Xu_CV_DE.pdf`
- `build/Haidong_Xu_CV_ZH.pdf`

Clean build artifacts:

```bash
make clean
```

## File Layout

- `resume.cls`: style system, typography, spacing, reusable macros
- `cv_en.tex`, `cv_de.tex`, `cv_zh.tex`: language-specific entry files
- `data_en.tex`, `data_de.tex`, `data_zh.tex`: language-specific content
- `cv.tex`, `data.tex`: English compatibility wrappers
- `latexmkrc`: latexmk engine/output settings
- `Makefile`: standard build commands

## Update Content

Edit one language data file (`data_en.tex`, `data_de.tex`, `data_zh.tex`) for normal updates:
- header name/title/contact row
- company/project/education fields
- bullet lines and skills

`cv_*.tex` usually stays unchanged unless you want to reorder sections.

## Add a New Experience Entry

1. In each target language file, define a new set of commands:
   - `\ExpThreeCompany`, `\ExpThreeLocation`, `\ExpThreeTitle`, `\ExpThreeTime`, `\ExpThreeBullets`
2. In each `cv_*.tex`, add one line in the Work Experience section:

```tex
\ExperienceEntry{\ExpThreeCompany}{\ExpThreeLocation}{\ExpThreeTitle}{\ExpThreeTime}{\ExpThreeBullets}
```

3. Run `make pdf-all` to regenerate all PDFs.
