# Latexmk configuration for CESAR School LaTeX Template
$pdf_mode = 1; # pdflatex
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';
$bibtex = 'bibtex %O %S';
$makeindex = 'makeindex %O -o %D %S';

# Glossaries/acronyms (\makeglossaries) processing. Calls makeindex
# directly (same binary latexmk already uses for the main index) with
# the exact arguments the glossaries package's own "makeglossaries"
# wrapper script would use, rather than shelling out to that separate
# script -- Overleaf's compile sandbox reliably runs makeindex/bibtex
# as built-in latexmk rules, but a custom rule that spawns a *different*
# external script is a less predictable dependency there.
add_cus_dep('glo', 'gls', 0, 'run_gls_makeindex');
add_cus_dep('acn', 'acr', 0, 'run_acr_makeindex');

sub run_gls_makeindex {
    return system("makeindex -s \"$_[0].ist\" -t \"$_[0].glg\" -o \"$_[0].gls\" \"$_[0].glo\"");
}

sub run_acr_makeindex {
    return system("makeindex -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acr\" \"$_[0].acn\"");
}
