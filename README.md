# CESAR School LaTeX Thesis/Dissertation Template

An [abnTeX2](https://www.abntex.net.br/)-based LaTeX template for CESAR School
theses (Doutorado), dissertations (Mestrado), and undergraduate capstones (TCC),
formatted to comply with ABNT NBR 14724:2011. Supports both **pt-BR** and
**en-US** as output languages.

## Quick start

1. Copy this project (or, on Overleaf, use "Copy Project" from the template
   gallery listing).
2. Compile with **XeLaTeX** (required — the template uses `fontspec` to set
   Arial as the main font). On Overleaf: Menu > Settings > Compiler > XeLaTeX.
3. Open `custom.tex` and fill in:
   - `\degreetype` — `doutorado`, `mestrado`, or `tcc`
   - `\templatelang` — `ptbr` or `enus`
   - `\curso`, `\titulo`, `\autor`, `\orientador`, etc.
4. Replace the example chapter text under `content/<language>/` with your own.
5. Get your `ficha catalográfica` PDF from the CESAR School library and drop
   it in `library/ficha.pdf`.

The template recompiles correctly for any `\degreetype`/`\templatelang`
combination — all boilerplate text (cover, title page, preamble sentences,
auto-generated names like "Abstract"/"Resumo", "Contents"/"Sumário") switches
automatically. See the comments in `custom.tex` and
`abntex2/abntex2-cesarschool.sty` for details.

## Folder layout

```
main.tex              entry point; compiles the whole document
custom.tex             fill this in: title, author, advisor, degree type, language
body.tex               chapter-inclusion manifest for the main body
appendix.tex/anexos.tex  appendix/annex manifests
packages.tex            extra package config (currently: code-listing styling)
references2.bib         your bibliography

abntex2/                the abnTeX2 engine (vendored, do not edit) plus
                         abntex2-cesarschool.sty (CESAR School's customization
                         layer — degree/language dispatch, cover page, fonts, etc.)
figures/                 shared binary images, one subfolder per chapter
equations/               shared, language-neutral reusable equation macros
library/                 institutional PDFs: ficha catalográfica, approval-sheet
                          template — same regardless of \templatelang
fonts/                   bundled Arial TTF (see NOTICE.md re: licensing)

content/
  pt-br/                 Portuguese chapter text, front matter, appendices
  en-us/                 English chapter text, front matter, appendices
                         (mirrors the pt-br/ tree file-for-file)
```

`content/pt-br/` and `content/en-us/` are structured identically — same
subfolders, same filenames — so `\templatelang` in `custom.tex` can switch
between them by just changing which directory gets `\input`. When adding a
new chapter or section, add the file to **both** trees.

## Attribution and licensing

See [`NOTICE.md`](NOTICE.md) for the full attribution chain (abnTeX2 → UFPE
CIn → CESAR School) and [`LICENSE.txt`](LICENSE.txt) for the LPPL license
text.
