# LaTeX Resume Template

## Build

Requirements:
- TeX distribution with `xelatex`, `latexmk`
- LaTeX packages used in `resume.cls` (including `fontawesome5`)

Build PDF:

```bash
make
```

Output:

- `build/Haidong_Xu_CV.pdf`

Clean build artifacts:

```bash
make clean
```

## File Layout

- `resume.cls`: style system, typography, spacing, reusable macros
- `cv.tex`: resume structure (section order and entry wiring)
- `data.tex`: all personal data, entries, bullet text
- `latexmkrc`: latexmk engine/output settings
- `Makefile`: standard build commands

## Update Content

Edit only `data.tex` for normal updates:
- header name/title/contact row
- company/project/education fields
- bullet lines and skills

`cv.tex` usually stays unchanged unless you want to reorder sections.

## Add a New Experience Entry

1. In `data.tex`, define a new set of commands:
   - `\ExpThreeCompany`, `\ExpThreeLocation`, `\ExpThreeTitle`, `\ExpThreeTime`, `\ExpThreeBullets`
2. In `cv.tex`, add one line in the Experience section:

```tex
\ExperienceEntry{\ExpThreeCompany}{\ExpThreeLocation}{\ExpThreeTitle}{\ExpThreeTime}{\ExpThreeBullets}
```

3. Run `make` to regenerate `build/Haidong_Xu_CV.pdf`.
