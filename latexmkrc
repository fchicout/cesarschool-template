# Latexmk configuration for CESAR School LaTeX Template
$pdf_mode = 1; # pdflatex
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';
$bibtex = 'bibtex %O %S';
$makeindex = 'makeindex %O -o %D %S';
