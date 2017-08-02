%% This is file `akabook.cls'
%%
%% Generic LaTeX 2e class file for the <publisher> publications
%% Loads standart `book.cls' and then modifys it
%% Use as replacement to 'book.cls'
%%
%% Macros written by Linas Stonys, VTeX, Lithuania
%% Please submit bugs or your comments to latex-support@vtex.lt
%%
%% You are free to use this class file as you see fit, provided 
%% that you do not make changes to the file. 
%% If you DO make changes, you are required to rename this file.
%%
%% It may be distributed under the terms of the LaTeX Project Public
%% License, as described in lppl.txt in the base LaTeX distribution.
%% Either version 1.0 or, at your option, any later version.
%%
%%
\def\@version{2017/08/02}

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{akabook}[\@version, AKA 'book' style]

\PassOptionsToPackage{fleqn}{amsmath}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions*

\LoadClass[twoside,10pt,a5paper,fleqn]{book}

\RequirePackage{mathptmx}
\RequirePackage{graphicx}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Dimensions
% TEXT DIMENSIONS
%% page a5 - 148x210mm
\def\aka@trimwidth{148mm}
\def\aka@trimheight{210mm}
\def\aka@topmargin{40pt}

\setlength\parindent {6.3mm}
\setlength\textwidth    {113mm}
\setlength\textheight   {164.87mm}
\setlength\columnsep    {24\p@}
\setlength\columnseprule{0\p@}
\columnwidth=\textwidth
\advance\columnwidth by-\columnsep
\divide\columnwidth by2

% HEADS
\setlength\headheight{12\p@}
\setlength\headsep   {16\p@}
\setlength\topskip   {10\p@}
\setlength\footskip  {24\p@}
\setlength\maxdepth  {.5\topskip}

% SIDE MARGINS
\setlength\oddsidemargin   {20mm}
\@tempdima=148mm
\advance\@tempdima by-\oddsidemargin
\advance\@tempdima by-\textwidth
\setlength\evensidemargin  {\@tempdima}%   outer

\setlength\topmargin       {\aka@topmargin}
\advance\topmargin by-5pt

% BREAKS
\setlength\smallskipamount{6\p@ \@plus 1\p@ \@minus 1\p@}
\setlength\medskipamount  {12\p@ \@plus 3\p@ \@minus 3\p@}
\setlength\bigskipamount  {18\p@ \@plus 3\p@ \@minus 3\p@}

\voffset=-1in
\hoffset=-1in
\AtBeginDvi{\special{papersize=\the\paperwidth,\the\paperheight}}%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lists
\def\@listi{\leftmargin\leftmargini
  \parsep \z@ 
  \topsep 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep \z@ 
  \labelsep=13\p@
  \leftmargini=36\p@
  }
\def\@listii {\leftmargin\leftmarginii
  \labelwidth\leftmarginii
  \advance\labelwidth-\labelsep
  \topsep    2\p@ \@plus2\p@ \@minus\p@
  \parsep    \z@
  \itemsep   \z@
  }
\def\@listiii{\leftmargin\leftmarginiii
  \labelwidth\leftmarginiii
  \advance\labelwidth-\labelsep
  \topsep    \z@
  \parsep    \z@
  \itemsep   \z@
  }
\let\@listI\@listi
\@listi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Footnote
\def\footnoterule{%
  \kern -3\p@ 
  \hrule \@width 79\p@ \kern 2.6\p@ 
  }
\def\@makefnmark{%
  \@textsuperscript{\normalfont \@thefnmark}%
  }
\renewcommand\@makefntext[1]{%
    \parindent \z@%
    \noindent
    \hbox {\hskip8\p@ \let\@textsuperscript\relax \@makefnmark}#1}
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% address, maketitle, chapter

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\address#1{\gdef\@address{#1}}
\let\@author\@undefined
\let\@title\@undefined

\def\maketitle{%
  \@maketitle
  \global\let\title\relax
  \global\let\subtitle\relax
  \global\let\author\relax
  \global\let\address\relax
  \global\let\affiliation\relax
  \global\let\@address\@empty
  }

\def\@maketitle{%
  \newpage
  \thispagestyle{empty} 
  \bgroup
    \centering
    {\fontsize{18}{26}\selectfont\@title\par}
    \vskip11pc
    \@ifundefined{@author}{}{{\fontsize{18}{22}\selectfont\@author\par}}
    \vskip 24pt
    {\normalsize\itshape\@address\par}
    \vfill 
    {\normalfont\publisher@text\par}
  \egroup
  \clearpage
  }

\def\chapter@font{\fontsize{18}{22}\selectfont}
\def\@makechapterhead#1{%
  \vspace*{6pt}%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \chapter@font \thechapter.\hskip7\p@ #1\par\nobreak
    \vskip 17\p@
  }}

\def\@makeschapterhead#1{%
  \vspace*{6pt}%
  {\parindent \z@ \raggedright \normalfont
    \interlinepenalty\@M
    \chapter@font \hskip14\p@ #1\par\nobreak
    \vskip 22\p@
  }}

\def\@seccntformat #1{\csname the#1\endcsname.\quad}
\setcounter{secnumdepth}{3}
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {12\p@ plus2\p@ minus1\p@}%
                                   {12\p@ plus2\p@ minus1\p@}%
                                   {\normalfont\normalsize\bfseries \global\@afterindentfalse}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                   {12\p@ plus2\p@ minus1\p@}%
                                   {7\p@ plus2\p@ minus1\p@}%
                                   {\normalfont\normalsize\itshape \global\@afterindentfalse}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                   {6\p@ plus2\p@ minus1\p@}%
                                   {0.0001\p@ plus.5\p@ minus.5\p@}%
                                   {\normalfont\normalsize\itshape \global\@afterindentfalse}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                   {6\p@ plus2\p@ minus1\p@}%
                                   {-1em}%
                                   {\normalfont\small\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                   {10\p@ plus2\p@ minus1\p@}%
                                   {-1em}%
                                   {\normalfont\small}}

\def\ps@headings{%
  \let\@oddfoot\@empty
  \let\@evenfoot\@oddfoot
  \def\@oddhead{\hfil\thepage}%
  \def\@evenhead{\thepage\hfil}%
  }   
\def\ps@plain{%
  \let\@oddfoot\@empty
  \let\@evenfoot\@oddfoot
  \def\@oddhead{\hfil\thepage}%
  \def\@evenhead{\thepage\hfil}%
  }   
\ps@headings  

\def\quotefont{\fontsize{9}{11}\selectfont}
\def\@quotelisti{%
  \parsep \z@ 
  \topsep 3\p@ \@plus2\p@ \@minus4\p@
  \itemsep \z@ \@plus2\p@ \@minus\p@
  \labelsep=\z@
  \leftmargini=\the\parindent
  \rightmargin=\z@
  \leftmargin=\leftmargini
  }

\def\quote{%
  \let\@listi\@quotelisti
  \list {}{\quotefont}%
  \item \relax 
  }

\def\@floatboxreset {%
  \reset@font 
  \normalsize
  \@setminipage 
  \csname @\@captype boxreset\endcsname
  \expandafter\let\expandafter\@makecaption\csname @make\@captype caption\endcsname
  }
\def\@figureboxreset{%
  \centering
  }  
\def\@tableboxreset{%
  \raggedright
  }  
\def\captionfont{\footnotesize}%

\setlength\abovecaptionskip{6.5\p@}
  
\long\def\@maketablecaption#1#2{%
  \vskip\abovecaptionskip
  \bgroup
    \csname captionfont\endcsname 
    \textbf{#1:} #2\par
  \egroup
  \vskip\belowcaptionskip
  }

\long\def\@makefigurecaption#1#2{%
  \vskip\abovecaptionskip
  \bgroup
    \csname captionfont\endcsname  
    \sbox\@tempboxa{\textbf{#1:} #2}%
    \ifdim \wd\@tempboxa >\hsize
       \textbf{#1:} #2\par
    \else
      \global \@minipagefalse
      \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
  \egroup
  \vskip\belowcaptionskip}
  
\renewcommand\theequation{\@arabic\c@equation}
\renewcommand \thefigure{\@arabic\c@figure}
\renewcommand \thetable{\@arabic\c@table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Index 
\RequirePackage{multicol}
\RequirePackage{index}
\newindex{default}{idx}{ind}{Index}

\renewenvironment{theindex}{%
  \if@twocolumn
    \@restonecolfalse
  \else
    \@restonecoltrue
  \fi
  \twocolumn[\null
  \addvspace{\baselineskip}
  \addvspace{-2\p@}
  \@makeschapterhead{\indexname}]%
  \@mkboth{\MakeUppercase\indexname}%
          {\MakeUppercase\indexname}%
  \thispagestyle{plain}\parindent\z@
  \parskip\z@ \@plus .3\p@\relax
  \columnseprule \z@
  \columnsep 35\p@
  \let\item\@idxitem
  }{%
  \if@restonecol
    \onecolumn
  \else
    \clearpage
  \fi
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Table of Content   
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 1.0em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak 
      \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
      \nobreak #2\par
      \penalty\@highpenalty
    \endgroup
  \fi}
            
\renewcommand*\l@section{\@dottedtocline{1}{2em}{2.3em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{4.7em}{3.2em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{12em}{6em}}
\def\@dotsep{0.5}
\def\numberline#1{#1.}

\def\@dottedtocline#1#2#3#4#5{%
  \ifnum #1>\c@tocdepth \else
    \vskip \z@ \@plus.2\p@
    {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
     \parindent #2\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima #3\relax
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {#4}\nobreak
     \leaders\hbox{$\m@th
        \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
        mu$}\hfill
     \nobreak
     {\normalfont \normalcolor #5}%
     \par}%
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bibliography
\def\@biblisti{%
  \parsep \z@ 
  \topsep 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep \z@ \@plus2\p@ \@minus\p@
  \labelsep=2\p@
  }
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
     \let\@listi\@biblisti
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\endinput
