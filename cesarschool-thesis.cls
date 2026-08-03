%% cesarschool-thesis.cls
%%
%% Document class for CESAR School theses (PhD), dissertations (MSc), and
%% undergraduate capstones (TCC), wrapping abnTeX2/ABNT NBR 14724:2011
%% formatting. This file is the only thing a student should need to look
%% at in main.tex's preamble -- everything else (package loading, colors,
%% fonts, degree/language wiring) lives here.
%%
%% Usage:
%%   \documentclass[phd, ptbr]{cesarschool-thesis}
%%   \documentclass[msc, enus]{cesarschool-thesis}
%%   \documentclass[undergrad, ptbr]{cesarschool-thesis}
%%
%% Any option not recognized below (e.g. twoside) is passed straight
%% through to the underlying abntex2/abntex2 class.
%%
%% This work may be distributed and/or modified under the conditions of
%% the LaTeX Project Public License, version 1.3c or later -- see
%% LICENSE.txt and NOTICE.md.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cesarschool-thesis}[2026/01/01 CESAR School thesis/dissertation class]

% ------------------------------------------------------------------------
% Grau / Degree -- phd (padrao/default) | msc | undergrad
%
% Nomes em ingles para quem le/publica o template, mapeados internamente
% para os valores historicos de \degreetype (doutorado/mestrado/tcc) que
% abntex2/abntex2-cesarschool.sty ja usa em seu despachante -- assim aquele
% arquivo nao precisa mudar nada da logica que ja existia.
% ------------------------------------------------------------------------
\newcommand{\CSTdegree}{doutorado}
\DeclareOption{phd}{\renewcommand{\CSTdegree}{doutorado}}
\DeclareOption{msc}{\renewcommand{\CSTdegree}{mestrado}}
\DeclareOption{undergrad}{\renewcommand{\CSTdegree}{tcc}}

% ------------------------------------------------------------------------
% Idioma / Language -- ptbr (padrao/default) | enus
% ------------------------------------------------------------------------
\newcommand{\CSTlang}{ptbr}
\DeclareOption{ptbr}{\renewcommand{\CSTlang}{ptbr}}
\DeclareOption{enus}{\renewcommand{\CSTlang}{enus}}

% qualquer outra opcao (ex.: twoside) passa direto para abntex2/abntex2
% any other option (e.g. twoside) passes straight through to abntex2/abntex2
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2/abntex2}}
\ProcessOptions\relax

% ------------------------------------------------------------------------
% Classe base abnTeX2 / Base abnTeX2 class
% ------------------------------------------------------------------------
\LoadClass[
	hidelinks,
	% -- opções da classe memoir --
	12pt,				% tamanho da fonte
	openright,			% capítulos começam em pág ímpar (insere página vazia caso preciso)
	%twoside,			% para impressão em verso e anverso. Oposto a oneside
	oneside,            % padrão para CESAR School visto que nao exigem versão impressa dos trabalhos
	a4paper,			% tamanho do papel.
	% -- opções da classe abntex2 --
	chapter=TITLE,		% títulos de capítulos convertidos em letras maiúsculas
	section=TITLE,		% títulos de seções convertidos em letras maiúsculas
	%subsection=TITLE,	% títulos de subseções convertidos em letras maiúsculas
	%subsubsection=TITLE,% títulos de subsubseções convertidos em letras maiúsculas
	% -- opções do pacote babel --
	french,				% idioma adicional para hifenização
	spanish,			% idioma adicional para hifenização
	english,
	brazil,
	% -- o último idioma é o principal do documento (trocado em tempo de
	%    execução por \aplicaridiomacorpo, ver abaixo) --
	]{abntex2/abntex2}
\renewcommand{\baselinestretch}{1.5} %para customizar o espaço entre as linhas do texto

% ------------------------------------------------------------------------
% Customização CESAR School / CESAR School customization layer
% (fontes, cores dentro dela, capa/folha de rosto, despachante de grau e
% idioma, listas de quadros/gráficos/diagramas, comandos \fonteautor etc.)
% ------------------------------------------------------------------------
\RequirePackage{abntex2/abntex2-cesarschool}
\renewcommand{\ABNTEXchapterfont}{\fontspec{Liberation Sans}} % TEST-ONLY

% Aplica o grau/idioma escolhido via opções da classe. \aplicardespachogrduidioma
% (que deriva \programaname etc. de \curso) continua sendo chamado em
% custom.tex, pois \curso só existe depois de \documentclass.
% Usa \edef (não \renewcommand) para gravar o valor resolvido de \CSTdegree/
% \CSTlang como texto literal em \degreetype/\templatelang -- o despachante
% em abntex2-cesarschool.sty usa \ifdefstring (etoolbox), que compara a
% definição da macro estruturalmente, não expande indireções como
% \renewcommand{\degreetype}{\CSTdegree} faria.
\edef\degreetype{\CSTdegree}
\edef\templatelang{\CSTlang}

% Seleciona o idioma babel do corpo do documento automaticamente -- não
% precisa mais ser chamado à mão em main.tex.
\AtBeginDocument{\aplicaridiomacorpo}

% ------------------------------------------------------------------------
% Pacotes gerais / General-purpose packages
% ------------------------------------------------------------------------
\RequirePackage{pdfpages} %para incluir pdf como páginas
\RequirePackage{float}
\RequirePackage{fontspec}
\setmainfont{Liberation Sans}
\RequirePackage{lastpage}			% Usado pela Ficha catalográfica
\RequirePackage{indentfirst}		% Indenta o primeiro parágrafo de cada seção.
\RequirePackage{color}				% Controle das cores
\RequirePackage{graphicx}			% Inclusão de gráficos
\RequirePackage{lipsum}				% para geração de dummy text
\RequirePackage[alf,abnt-and-type=e,abnt-etal-list=3,abnt-etal-cite=3]{abntex2/abntex2cite}
% glossaries carrega tracklang internamente, que tenta rastrear suporte do
% datatool para cada idioma ativo do babel (french/spanish/brazil) e emite
% avisos inofensivos de "No datatool support for dialect ..." quando não
% encontra -- silenciados aqui (opção "nowarn" oficial do tracklang), sem
% afetar a localização real do glossaries/babel.
\PassOptionsToPackage{nowarn}{tracklang}
\RequirePackage[acronym,nonumberlist,nogroupskip,noredefwarn]{glossaries}
\RequirePackage{abntex2/url6023}
\RequirePackage{multirow}
\RequirePackage[section]{placeins}
\RequirePackage{csquotes}           % para displayquote
\RequirePackage{amsmath}
\RequirePackage{chngcntr}
\counterwithout{equation}{chapter} % Removes the chapter prefix from the equation counter
\RequirePackage{dsfont}

\RequirePackage{lscape}
\RequirePackage{rotating} %rotates the figures, page
\RequirePackage{tikz}
\RequirePackage{setspace}

\RequirePackage[table]{xcolor}
\RequirePackage{ltablex} % para usar tabelas longas - quando é maior que 1 página
\RequirePackage{longtable}

\RequirePackage{listings}
\RequirePackage{adjustbox} % ajustar tabela ao tamanho da pagina

\renewcommand*\arraystretch{1.2} %para customizar o espaço entre as linhas das tabelas

% ------------------------------------------------------------------------
% Tipos de coluna para tabelas / table column types
% ------------------------------------------------------------------------
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\newglossarystyle{modsuper}{%
  \glossarystyle{super}%
  \renewcommand{\glsgroupskip}{}
  % put the glossary in a longtable environment:
 \renewenvironment{theglossary}%
  {
    \begin{longtable}
        {L{0.2\textwidth}L{0.8\textwidth}}}%
    {\end{longtable}
  }%
}

% ------------------------------------------------------------------------
% Personalização de cores / color customization
% ------------------------------------------------------------------------
\definecolor{blue}{RGB}{41,5,195}
\definecolor{gray}{rgb}{.4,.4,.4}
\definecolor{pblue}{rgb}{0.13,0.13,1}
\definecolor{pgreen}{rgb}{0,0.5,0}
\definecolor{pred}{rgb}{0.9,0,0}
\definecolor{pgrey}{rgb}{0.46,0.45,0.48}
\definecolor{lightgray}{rgb}{0.95, 0.95, 0.96}
\definecolor{whitesmoke}{rgb}{0.96, 0.96, 0.96}
\definecolor{javared}{rgb}{0.6,0,0} % for strings
\definecolor{javagreen}{rgb}{0.25,0.5,0.35} % comments
\definecolor{javapurple}{rgb}{0.5,0,0.35} % keywords
\definecolor{javadocblue}{rgb}{0.25,0.35,0.75} % javadoc
\definecolor{meucinza}{rgb}{0.5, 0.5, 0.5}
\definecolor{cinza}{HTML}{FCF8F8}

% ------------------------------------------------------------------------
% Estilo dos trechos de código-fonte (\lstinputlisting) / source-code
% listing style (was packages.tex)
% ------------------------------------------------------------------------
\lstset{
language=Python, % idioma padrão -- pode ser sobrescrito por \lstinputlisting[language=...]
basicstyle=\small\ttfamily,
keywordstyle=\color{javapurple}\bfseries,
stringstyle=\color{pblue},
commentstyle=\color{javagreen},
morecomment=[s][\color{javadocblue}]{/**}{*/},
morecomment=[s][\color{gray}]{@}{\ },
numbers=left,
numberstyle=\tiny\color{black},
backgroundcolor=\color{cinza},
stepnumber=2,
numbersep=8pt,
xleftmargin=14pt,
tabsize=4,
showspaces=false,
showstringspaces=false,
breaklines=true,
}
