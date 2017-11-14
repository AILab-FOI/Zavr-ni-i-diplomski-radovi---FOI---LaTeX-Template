\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{foi}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions
\LoadClass[11pt, onecolumn]{report}
\RequirePackage[a4paper, left=2.5cm, right=2.5cm, bottom=2.5cm, top=2.5cm]{geometry}
\RequirePackage[utf8]{inputenc}
\RequirePackage[croatian]{babel}
\RequirePackage{csquotes}
\RequirePackage[T1]{fontenc}
\RequirePackage{anyfontsize}
\RequirePackage{graphicx} % Uključeno jer je često korišteno
\RequirePackage{amssymb} % Uključeno jer je često korišteno
\RequirePackage{amsmath} % Uključeno jer je često korišteno
\RequirePackage{caption}
\RequirePackage{ifthen}
\RequirePackage{url} % Potrebno radi natbiba
\RequirePackage{enumitem} % Potrebno radi izmjene itemize okoline
\RequirePackage{titlesec}
\RequirePackage{tabularx} % tablice
\RequirePackage{fancyhdr} % zaglavlja
\RequirePackage{chngcntr} % promjena brojača
\RequirePackage[table]{xcolor} % bojanje tablica
\RequirePackage{listings} % ispis programskog koda
\RequirePackage{times}
\RequirePackage{courier} % za programski kod
\RequirePackage[backend=biber, style=ieee]{biblatex} % IEEE stil citiranja
\addbibresource{lib.bib}

\RequirePackage{comment}
\RequirePackage{indentfirst}
\RequirePackage{wrapfig}
\RequirePackage{setspace}

% stvaranje poveznica u dokumentu
\RequirePackage[pdftex,
bookmarks=true,
bookmarksnumbered=true,
pdfpagemode=UseNone,
pdfstartview=FitH,
pdfpagelayout=SinglePage,
colorlinks=false,
urlcolor=black,
pdfborder={0 0 0},
unicode
]{hyperref} 

% postavke za programski kod s UTF8 znakovima
\lstset{ 
    escapeinside={\%*}{*)},
    extendedchars=false,
    inputencoding=utf8,
    basicstyle=\footnotesize\ttfamily,
    breaklines=true
}

% Promjena iz Times u Sans font
\renewcommand{\rmdefault}{\sfdefault}

% Podešavanje broja stranice u donji desni kut
\pagestyle{fancy} 
\fancyhf{}
\fancyfoot[R]{\thepage}
\fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{0pt}%
    \fancyhf{}%
    \fancyfoot[R]{\thepage}%
}


% Redefiniranje datuma
\def\date#1{\gdef\@date{#1}}

% 1.5 prored (1.2 je faktor za množenje)
\linespread{1.2}
% Veličina indenta na svakom paragrafu
\setlength{\parindent}{0.49in}
% Veličina praznog prostora nakon svakog paragrafa
\setlength{\parskip}{0.08in}

% Podešavanje oznaka kod listi (1. razina je crtica, 2. puni krug)
\renewcommand{\labelitemi}{\textbullet}
\renewcommand{\labelitemii}{\textendash}

% Slike numeriramo kroz cijeli dokument
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% http://www.tex.ac.uk/cgi-bin/texfaq2html?label=seccntfmt
% dodaje tocku nakon section broja ali ne i nakon chapter!
% za chapter se koristi jednostavno http://theoval.cmp.uea.ac.uk/~nlct/latex/thesis/node10.html
\renewcommand*{\@seccntformat}[1]{%
  \csname the#1\endcsname
  \csname adddot@#1\endcsname.\quad
}
% Postavka točkica u sadržaju
\renewcommand*\l@chapter[2]{\textbf{\@dottedtocline{1}{0em}{2.3em}{#1}{#2}}}

%Dodane točke nakon brojeva u TOC
\let \savenumberline \numberline
\def \numberline#1{\savenumberline{#1.}}

% Redefinicija sadržaja
\renewcommand\tableofcontents{%
%\setcounter{page}{2}
\setcounter{secnumdepth}{3} % dubina do subsubsekcije
\setcounter{tocdepth}{3} % dubina do subsubsekcije
\chapter*{ \vspace{-7.5mm}\sffamily\fontsize{18pt}{0pt}\bfseries{Sadr\v zaj}
\vspace{-10pt}
  \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
\begin{spacing}{0.6}
\@starttoc{toc}%
\end{spacing}
}

\def\musko{M}
\def\zensko{Z}
\def\odaberi{O}

\newcommand{\autor}[1]
{
  \ifthenelse{\equal{#1}{M}}{Autor\!\!\!\!\!\!}{}
  \ifthenelse{\equal{#1}{Z}}{Autorica\!\!\!\!\!\!}{}
  \ifthenelse{\equal{#1}{O}}{Autor/Autorica\!\!\!\!\!\!}{}
}

\newcommand{\mentorr}[1]
{
  \ifthenelse{\equal{#1}{M}}{\!\!\!\!Mentor}{}
  \ifthenelse{\equal{#1}{Z}}{\!\!\!\!\!Mentorica}{}
  \ifthenelse{\equal{#1}{O}}{\!\!\!\!\!\!\!Mentor/Mentorica}{}
}

\newcommand{\potvrdio}[1]
{
  \ifthenelse{\equal{#1}{M}}{potvrdio\!\!\!\!\!}{}
  \ifthenelse{\equal{#1}{Z}}{potvrdila\!\!\!}{}
  \ifthenelse{\equal{#1}{O}}{potvrdio/potvrdila\!}{}
}

% Podešavanje poglavlja tako da se ne ispisuje "Poglavlje <broj>"
\newboolean{prvi}
\setboolean{prvi}{false}
\newboolean{drugi}
\setboolean{drugi}{false}
\renewcommand{\@makechapterhead}[1]{%

%%
\ifthenelse{\boolean{prvi}}{%
	{\setlength{\parskip}{0em} \parindent \z@ \raggedright \normalfont
		\interlinepenalty\@M
		\ifnum \c@secnumdepth >\m@ne
			\par\nobreak
		\fi
		\nobreak
		\vskip 15\p@
	}
}
%%
%%
{
\ifthenelse{\boolean{drugi}}

	{
		\setcounter{page}{1}
		\renewcommand{\thepage}{\arabic{page}}
		\setboolean{drugi}{true}
	}


	{
                     \setlength{\parskip}{0em} \parindent \z@ \raggedright \normalfont
		\interlinepenalty\@M
		\ifnum \c@secnumdepth >\m@ne
			\sffamily\fontsize{18pt}{18pt}\bfseries \thechapter.~#1
			\par\nobreak
		\fi
		\nobreak
		\vskip 15\p@
	}
}
%%
}

% Oblici za podnaslove
\titleformat{\section}
  {\normalfont\fontsize{16pt}{16pt}\sffamily\bfseries}{\thesection.}{1em}{}
\titleformat{\subsection}
  {\normalfont\fontsize{14pt}{14pt}\sffamily\bfseries}{\thesubsection.}{1em}{}
\titleformat{\subsubsection}
  {\normalfont\fontsize{12pt}{12pt}\sffamily\bfseries}{\thesubsubsection.}{1em}{}

% Definicija varijabilnih vrijednosti
\def\vrstaRada#1{\gdef\@vrstaRada{\uppercase{#1}}}
\def\title#1{\gdef\@title{\uppercase{#1}}}
\def\mentor#1{\gdef\@mentor{#1}}
\def\godina#1{\gdef\@godina{#1}}
\def\mjesec#1{\gdef\@mjesec{#1}}
\def\status#1{\gdef\@status{#1}}
\def\indeks#1{\gdef\@indeks{#1}}
\def\smjer#1{\gdef\@smjer{#1}}
\def\titulaProfesora#1{\gdef\@titulaProfesora{#1}}
\def\sazetak#1{\gdef\@sazetak{#1}}
\def\kljucneRijeci#1{\gdef\@kljucneRijeci{#1}}
\def\spolStudenta#1{\gdef\@spolStudenta{#1}}
\def\spolMentora#1{\gdef\@spolMentora{#1}}

\def\zavrsni{završni rad}
\def\diplomski{diplomski rad}

% Naslovne stranice
\renewcommand\maketitle{%
%
\thispagestyle{empty}
\begin{center}
  {\large \fontsize{14}{17}\selectfont\bfseries{SVEU\v CILI\v STE U ZAGREBU}} \\[8pt]
  {\large \fontsize{14}{17}\selectfont\bfseries{FAKULTET ORGANIZACIJE I INFORMATIKE}} \\[8pt]
  {\large \fontsize{14}{17}\selectfont\bfseries{VARA\v ZDIN}}
\end{center}

\vskip 20mm
\begin{flushleft}
\Large \bfseries{\@author}
\end{flushleft}

\vskip 60mm
\begin{center}
{ \linespread{2.5}\sffamily\bfseries{\fontsize{22}{27}\selectfont\MakeUppercase\@title}\par}\ \\[10mm]
{\normalfont \large \bfseries{\fontsize{14}{17}\selectfont\MakeUppercase\@vrstaRada}}
\end{center}

\vfill
\begin{center}
{\large \bfseries{Vara\v zdin}, \bfseries{\@godina}.}
\end{center}

\newpage

\thispagestyle{empty}
\begin{center}
  {\bfseries{SVEU\v CILI\v STE U ZAGREBU}} \\[12pt]
  {\bfseries{FAKULTET ORGANIZACIJE I INFORMATIKE}} \\[12pt]
  {\bfseries{V A R A \v Z D I N}}
\end{center}

\vskip 15mm
\begin{flushleft}
{\bfseries{\@author}}\\[8pt]
{\bfseries{Matični broj:} \bfseries{\@indeks}}\\[8pt]
{\bfseries{Studij:} \bfseries{\@smjer}}\\[8pt]
\end{flushleft}

\vskip 40mm
\begin{center}
{\setstretch{1.2}\sffamily \bfseries{\fontsize{14}{17}\selectfont\MakeUppercase\@title}\par} \vspace{10mm}
{\normalfont \bfseries{\MakeUppercase\@vrstaRada}}
\end{center}

\vskip 20mm
\begin{flushleft}
\hspace{90mm}
{\bfseries{\mentorr{\@spolMentora}}\!:}\\[15pt]
\hspace{90mm}{\normalfont {\@titulaProfesora}}
{\normalfont {\@mentor}}
\end{flushleft}


\vfill
\begin{center}
{\bfseries{Vara\v zdin}, \bfseries{\@mjesec} {\@godina}.}
\end{center}

\pagenumbering{roman}
\setcounter{page}{0}
\newpage
\thispagestyle{plain}

\begin{flushleft}
\textit{\@author}
\end{flushleft}

{\begin{center}\bfseries{Izjava o izvornosti}\end{center}}


\noindent Izjavljujem da je moj \@vrstaRada\ izvorni rezultat mojeg rada te da se u izradi istoga nisam koristio drugim izvorima osim onima koji su u njemu navedeni. Za izradu rada su korištene etički prikladne i prihvatljive metode i tehnike rada.

\begin{flushright}
\textit{\autor{\@spolStudenta} \potvrdio{\@spolStudenta} prihvaćanjem odredbi u sustavu FOI-radovi}\par
\end{flushright}

\noindent\makebox[\linewidth]{\rule{\textwidth}{0.4pt}}

\newpage
\thispagestyle{plain}

{\begin{center}\bfseries{Sažetak}\end{center}}

\noindent \@sazetak

\begin{flushleft}
\textbf{Ključne riječi}: \@kljucneRijeci
\end{flushleft}


	}
