# Attribution / Copyright Notice

This template is distributed under the **LaTeX Project Public License (LPPL) v1.3c**,
reproduced verbatim and unmodified in [`LICENSE.txt`](LICENSE.txt).

It is a derived work built on several layers of prior contributions:

1. **abnTeX2** (`abntex2/abntex2.cls`, `abntex2cite.sty`, `abntex2abrev.sty`, the
   `.bst` bibliography styles, `url6023.sty`) — Copyright 2012-2016 by the abnTeX2
   group, led by Lauro César Araujo. See <https://www.abntex.net.br/>. These files
   are vendored unmodified from abnTeX2 and should stay that way so future upstream
   updates remain a simple diff/replace.
2. **UFPE CIn customization layer** — adapted the original abnTeX2 layout for
   UFPE's Centro de Informática thesis/dissertation requirements.
   Bruno Maciel (2016), Daniel Severo Estrázulas (2020).
3. **CESAR School customization layer** (`abntex2/abntex2-cesarschool.sty`,
   `custom.tex`, and the example `content/` tree) — adapted the UFPE CIn layout to
   CESAR School's library requirements. Tiago Barros (2024), reviewed by the
   CESAR School library staff.
4. **2026 refactor** — reorganized the template's file structure (the `content/`,
   `figures/`, `equations/`, `library/` split), added the `\degreetype`/
   `\templatelang` configuration switches, added full pt-BR/en-US bilingual
   support, archived dead/commented-out experimental code (see
   `abntex2/archive/alternate-designs.sty`), and replaced research-specific
   placeholder content with generic examples, in preparation for publishing
   this template to the Overleaf Template Gallery.

## A note on the bundled Arial font

`fonts/ARIAL.TTF` is bundled in this repository, but `\setmainfont{Arial}`
(in `main.tex`) resolves the font by name via `fontspec`/the system font
catalog (Overleaf provides Arial system-wide) — it does **not** load the
bundled file directly. Arial is a proprietary Microsoft font; whether bundling
its `.ttf` file in a publicly redistributed template is appropriate is a
licensing question CESAR School should confirm before publishing, independent
of whether the file is technically wired up. This file was flagged, not
removed, during the 2026 refactor.

## Other files flagged (not removed) during the 2026 refactor

These were found unused while reorganizing the template, but weren't deleted
since deciding whether to keep them is a call for CESAR School to make, not
an automated cleanup:

- `substr.sty` — never `\usepackage`'d anywhere in the template.
- `library/anexoA.pdf` — not referenced by any `.tex` file; appears to be a
  leftover sample from before the template was genericized.

