# Latexmk configuration for CESAR School LaTeX Template
$pdf_mode = 1; # pdflatex
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';
$bibtex = 'bibtex %O %S';
$makeindex = 'makeindex %O -o %D %S';

# Glossaries/acronyms (\makeglossaries) processing, per the glossaries
# package's own documented latexmk recipe.
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse($_[0]);
    pushd($path);
    my $return = system('makeglossaries', $base_name);
    popd();
    return $return;
}
