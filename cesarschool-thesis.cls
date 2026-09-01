%% cesarschool-thesis.cls
%%
%% Master Document class for CESAR School theses (PhD), dissertations (MSc), and
%% undergraduate capstones (TCC), implementing ABNT NBR 14724:2011 standards.
%%
%% Usage Examples:
%   \documentclass[phd, pt-br]{cesarschool-thesis}              % DPES (Doutorado Eng. Software)
%   \documentclass[msc, mpes, pt-br]{cesarschool-thesis}         % MPES (Mestrado Eng. Software)
%   \documentclass[msc, mpd, pt-br]{cesarschool-thesis}          % MPD (Mestrado Design)
%   \documentclass[undergrad, cc, pt-br]{cesarschool-thesis}     % TCC (Ciência da Computação)
%   \documentclass[undergrad, design, pt-br]{cesarschool-thesis} % TCC (Design)
%   \documentclass[undergrad, admtech, pt-br]{cesarschool-thesis}% TCC (ADM Tech)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cesarschool-thesis}[2026/08/27 CESAR School thesis/dissertation master class]

% ------------------------------------------------------------------------------
% Opções da Classe: Grau / Degree (phd | msc | undergrad)
% ------------------------------------------------------------------------------
\newcommand{\CSTdegree}{doutorado}
\DeclareOption{phd}{\renewcommand{\CSTdegree}{doutorado}}
\DeclareOption{msc}{\renewcommand{\CSTdegree}{mestrado}}
\DeclareOption{undergrad}{\renewcommand{\CSTdegree}{tcc}}

% ------------------------------------------------------------------------------
% Opções da Classe: Idioma / Language (pt-br | en-us)
% ------------------------------------------------------------------------------
\newcommand{\CSTlang}{pt-br}
\DeclareOption{pt-br}{\renewcommand{\CSTlang}{pt-br}}
\DeclareOption{ptbr}{\renewcommand{\CSTlang}{pt-br}}
\DeclareOption{en-us}{\renewcommand{\CSTlang}{en-us}}
\DeclareOption{enus}{\renewcommand{\CSTlang}{en-us}}

% ------------------------------------------------------------------------------
% Opções da Classe: Curso / Program (mpes | mpd | cc | admtech | etc.)
% ------------------------------------------------------------------------------
\newcommand{\CSTcourse}{auto}
\DeclareOption{mpes}{\renewcommand{\CSTcourse}{se}}
\DeclareOption{dpes}{\renewcommand{\CSTcourse}{se}}
\DeclareOption{software}{\renewcommand{\CSTcourse}{se}}
\DeclareOption{se}{\renewcommand{\CSTcourse}{se}}
\DeclareOption{mpd}{\renewcommand{\CSTcourse}{design}}
\DeclareOption{design}{\renewcommand{\CSTcourse}{design}}
\DeclareOption{cc}{\renewcommand{\CSTcourse}{cc}}
\DeclareOption{comp}{\renewcommand{\CSTcourse}{cc}}
\DeclareOption{admtech}{\renewcommand{\CSTcourse}{admtech}}
\DeclareOption{adm}{\renewcommand{\CSTcourse}{admtech}}

% Redireciona opções adicionais para a classe abntex2 base
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2/abntex2}}
\ProcessOptions\relax

% ------------------------------------------------------------------------------
% Carrega Classe Base abnTeX2
% ------------------------------------------------------------------------------
\LoadClass[
	12pt,
	openright,
	oneside,
	a4paper,
	chapter=TITLE,
	section=TITLE,
	french,
	spanish,
	english,
	brazilian
]{abntex2/abntex2}

\renewcommand{\baselinestretch}{1.5}

% Record resolved values
\edef\degreetype{\CSTdegree}
\edef\templatelang{\CSTlang}
\edef\coursetype{\CSTcourse}

% Automates language activation at document start
\AtBeginDocument{\aplicaridiomacorpo}

% ------------------------------------------------------------------------------
% Pacotes Gerais Obrigatórios
% ------------------------------------------------------------------------------
\RequirePackage{pdfpages}
\RequirePackage{iftex}
\ifPDFTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  \RequirePackage{helvet}
  \renewcommand{\familydefault}{\sfdefault}
\else
  \RequirePackage{fontspec}
  \setmainfont{Liberation Sans}
\fi
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{lipsum}
\RequirePackage[alf,abnt-and-type=e,abnt-etal-list=3,abnt-etal-cite=3]{abntex2/abntex2cite}
\RequirePackage{abntex2/url6023}
\RequirePackage{multirow}
\RequirePackage[section]{placeins}
\RequirePackage{csquotes}
\RequirePackage{amsmath}
\RequirePackage{chngcntr}
\counterwithout{equation}{chapter}
\RequirePackage{lscape}
\RequirePackage{setspace}

% ------------------------------------------------------------------------------
% Carrega Módulos Internos da CESAR School (sty/)
% ------------------------------------------------------------------------------
\RequirePackage{sty/cesar-core}
\RequirePackage{sty/cesar-cover}
\RequirePackage{sty/cesar-floats}
\RequirePackage{sty/cesar-glossary}

% Types de colunas de tabela customizados
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Hyperref settings
\makeatletter
\hypersetup{
	pdftitle={\@title}, 
	pdfauthor={\@author},
	pdfsubject={\imprimirpreambulo},
	pdfcreator={LaTeX with abnTeX2 - CESAR School Template},
	pdfkeywords={cesar}{cesarschool}{abnt}{latex}{abntex}{abntex2}{trabalho acadêmico}, 
	colorlinks=false,
	linkcolor=blue,
	citecolor=blue,
	filecolor=magenta,
	urlcolor=blue,
	bookmarksdepth=4
}
\makeatother

\endinput
