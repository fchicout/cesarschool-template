# CESAR School LaTeX Thesis / Dissertation Template

[![Open in Overleaf](https://img.shields.io/badge/Overleaf-Create%20New%20Project-47a141?style=for-the-badge&logo=overleaf&logoColor=white)](https://www.overleaf.com/docs?snip_uri=https://github.com/fchicout/cesarschool-template/archive/refs/heads/main.zip&main_document=main.tex)

An [abnTeX2](https://www.abntex.net.br/)-based, highly modular, clean LaTeX template for CESAR School theses (Doutorado), dissertations (Mestrado), and undergraduate capstones (TCC), fully compliant with **ABNT NBR 14724:2011** and official **CESAR School Library Normalization Rules**.

Supports both **pt-BR** and **en-US** output languages natively.

---

## 🚀 Quick Start

### Option A: Open directly in Overleaf
Click the button below to instantiate a new project in Overleaf directly from the latest template release:

👉 **[Create New Project on Overleaf](https://www.overleaf.com/docs?snip_uri=https://github.com/fchicout/cesarschool-template/archive/refs/heads/main.zip&main_document=main.tex)**

> **Important (Overleaf Compiler Setting):** 
> After creating your project on Overleaf, ensure the compiler is set to **XeLaTeX**:
> *Go to **Menu** (top left) > **Compiler** > Select **XeLaTeX**.*

---

### Option B: Local Setup & Configuration
1. **Compiler Selection:** Compile locally using `latexmk` (pre-configured via `latexmkrc`).
2. **Document Configuration:**
   * Open `main.tex` and select your degree (`phd`, `msc`, or `undergrad`) and language (`pt-br` or `en-us`):
     ```latex
     \documentclass[phd, pt-br]{cesarschool-thesis}
     ```
   * Open `config/metadata.tex` to fill in your work's title, author, course, advisor, and co-advisor.
3. **Institutional PDF Drop-in:**
   * Place your official catalog card PDF from the library into `library/ficha.pdf`.
4. **Writing Your Content:**
   * Write your main text under `content/pt-br/chapters/` (or `content/en-us/chapters/`).

---

## 🏛️ Official CESAR School Library Rules Built-in

This template automatically enforces the official CESAR School Library normalization standards:

1. **Institutional Name:** Enforced strictly as `CESAR School` (only *CESAR* in uppercase).
2. **City Location:** Location (`RECIFE`) is automatically converted to **UPPERCASE** on Cover, Title Page, and Approval Sheet.
3. **Pre-Textual Pagination Governance:** Pre-textual elements count silently per ABNT rules, but visible page numbers only render starting on Page 1 of Chapter 1 (`\textual`), preventing spurious headers.
4. **Approval Sheet Placeholder:** Automatically renders an official approval sheet placeholder page after the catalog card (`ficha catalográfica`) until replaced with a signed scan.
5. **Official Course Registry:** Metadata configuration natively supports the 6 official CESAR School degree programs:
   - **Graduação / Bacharelado:** `Bacharelado em Ciência da Computação`, `Bacharelado em Design`, `Bacharelado em ADM Tech`
   - **Mestrado Profissional:** `Mestrado Profissional em Engenharia de Software` (MPES), `Mestrado Profissional em Design` (MPD)
   - **Doutorado Profissional:** `Doutorado Profissional em Engenharia de Software` (DPES)

---

## 📁 Modular Directory Architecture

```
cesarschool-template/
├── main.tex                    # Clean declarative driver file (~40 lines)
├── cesarschool-thesis.cls      # Master LaTeX class
├── latexmkrc                   # Build automation configuration for XeLaTeX
├── config/
│   ├── metadata.tex            # User work metadata (title, author, course, advisor)
│   └── user-packages.tex       # Custom user packages and commands
├── sty/
│   ├── cesar-core.sty          # Typography, colors, ABNT page geometry, city uppercase
│   ├── cesar-cover.sty         # Cover, Title Page & Approval Sheet Placeholder
│   ├── cesar-floats.sty        # Quadros, Gráficos, Diagramas & Listings governance
│   └── cesar-glossary.sty      # Acronyms & Glossaries styling
├── bib/
│   ├── references.bib          # Bibliography file
│   └── abntex2-alf.bst         # ABNT citation style files
├── content/
│   ├── pt-br/                  # Portuguese content (front-matter, chapters, appendices)
│   └── en-us/                  # English content (mirrors pt-br directory tree)
├── figures/                    # Shared graphics & illustrations
└── library/                    # Institutional PDFs (ficha catalográfica, signed approval)
```

---

## 📜 Attribution and Licensing

See [`NOTICE.md`](NOTICE.md) for the full attribution chain (abnTeX2 → UFPE CIn → CESAR School) and [`LICENSE.txt`](LICENSE.txt) for the LPPL license text.
