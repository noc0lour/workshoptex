% Class-File f�r ETIT-Workshop-Protokolle
%
\NeedsTeXFormat{LaTeX2e} 
\def\etit@version{0.0}
\def\etit@filedate{2012/10/24}

\ProvidesClass{etit-workshop-protokoll}[\etit@filedate\space \etit@version\space LaTeX2e document class]

\typeout{^^J%
  *******************************************************^^J%
  * document class ETIT-WORKSHOP-PROTOKOLL \space\space
  (\etit@filedate)^^J%
  * (c) 2012 Matthias Hofherr^^J%
  * ^^J%
  * f\"ur Mikro- und Nanolelektronische Systeme (IMS)^^J%
  * Karlsruher Institut f�r Technologie^^J%
  * http://www.ims.kit.edu^^J%
  *******************************************************^^J%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\etit@useddriver}{dvips} % Standard: Treiber dvips

\DeclareOption{pdftex}{\renewcommand{\etit@useddriver}{pdftex}}%
\DeclareOption{dvips}{\renewcommand{\etit@useddriver}{dvips}}%
\DeclareOption{dvipdf}{\renewcommand{\etit@useddriver}{dvipdf}}%
\DeclareOption{dvipdfm}{\renewcommand{\etit@useddriver}{dvipdfm}}%

\PassOptionsToPackage{english,ngerman}{babel}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%

\ProcessOptions\relax

\PassOptionsToClass{\etit@useddriver}{article}%
\PassOptionsToPackage{\etit@useddriver}{graphicx}%
\PassOptionsToPackage{\etit@useddriver}{hyperref} %


\LoadClass[12pt,a4paper,fleqn,oneside]{article}

\RequirePackage{graphicx} %
\RequirePackage[scaled=0.92]{helvet} %
\RequirePackage{courier}%
\RequirePackage[T1]{fontenc}%
\RequirePackage[utf8]{inputenc} %
\RequirePackage[ngerman]{babel}%

\RequirePackage[intlimits,fleqn]{amsmath}%
\RequirePackage{amssymb}%

\RequirePackage{array}%
\RequirePackage{fancyhdr}%
\RequirePackage[hyphens]{url}
\RequirePackage{hyperref}

\RequirePackage[locale=DE]{siunitx} 

\RequirePackage{listings}

\usepackage[framed,numbered,autolinebreaks,useliterate]{mcode}

\usepackage{bibgerm} 
\bibliographystyle{plain}

\graphicspath{{pics/}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Page layout
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\frenchspacing \sloppy

\hoffset -1in%
\voffset -1in%

\topmargin 20mm%
\headheight 15pt%
\headsep 10mm%
\topskip 2mm%
\textheight 235mm%
\footskip 10mm%
%
\oddsidemargin 25mm%
\evensidemargin 25mm%
\textwidth 160mm%
%
\parindent 0mm%
% \parskip 4pt plus 2pt minus 1pt%
%
\mathindent 10mm%
\marginparpush 2mm%
\marginparsep 2mm%
\marginparwidth 16mm%
%
\renewcommand{\topfraction}{2.00}%
\renewcommand{\bottomfraction}{2.00}%
\renewcommand{\textfraction}{-0.10}%
\renewcommand{\floatpagefraction}{0.10}%
\renewcommand{\baselinestretch}{1.10}%
%
\flushbottom%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Listings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{accsupp}
\newcommand{\noaccsupp}[1]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}
\lstset{ %
	numbers=left,                   % where to put the line-numbers
	basicstyle=\footnotesize,       % the size of the fonts that are used for the code	
	numberstyle=\footnotesize\noaccsupp,      % the size of the fonts that are used for the line-numbers
	stepnumber=1,                   % the step between two line-numbers. If it's 1 each line will be numbered
	numbersep=5pt,                  % how far the line-numbers are from the code
	backgroundcolor=\color{white},  % choose the background color. You must add \usepackage{color}
	showspaces=false,               % show spaces adding particular underscores
	showstringspaces=false,         % underline spaces within strings
	%showtabs=false,                 % show tabs within strings adding particular underscores
	frame=single,                   % adds a frame around the code
	tabsize=2,                      % sets default tabsize to 2 spaces
	captionpos=t,                   % sets the caption-position to bottom
	breaklines=true,                % sets automatic line breaking
	xleftmargin=3.5pt,
	xrightmargin=3.5pt,
	breakatwhitespace=false,        % sets if automatic breaks should only happen at whitespace
	extendedchars=true,captionpos=t , prebreak=\mbox{$\hookleftarrow$}, belowcaptionskip=0.5em,postbreak={},
	basicstyle=\ttfamily,       % the size of the fonts that are used for the code
}

  \lstdefinestyle{matlab}{ basicstyle=\footnotesize\ttfamily, columns=flexible,
    language=matlab,
    moredelim=[l][\bfseries\itshape]{\%\%}, morekeywords = {switch, case,
      inf}}


  \lstdefinestyle{latex}{ basicstyle=\footnotesize\ttfamily, columns=flexible,
    language=[LaTeX]{TeX}}

  \lstdefinestyle{other}{ basicstyle=\footnotesize\sffamily, columns=flexible,
   }
\def\lstlistingname{Quellcode}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\etit@kursnummer}{}
\newcommand{\etit@kurstitel}{}
\newcommand{\etit@kursname}{}

\newcommand{\kursnummer}[1]{\renewcommand{\etit@kursnummer}{#1}}
\newcommand{\kurstitel}[1]{\renewcommand{\etit@kurstitel}{#1}}
\newcommand{\kursname}[1]{\renewcommand{\etit@kursname}{#1}}

\newcommand{\teilnehmer}[6]{%
  \expandafter\newcommand\expandafter{\csname vorname#1\endcsname}{#2}%
  \expandafter\newcommand\expandafter{\csname nachname#1\endcsname}{#3}%
  \expandafter\newcommand\expandafter{\csname uaccount#1\endcsname}{#4}%
  \expandafter\newcommand\expandafter{\csname matrikel#1\endcsname}{#5}%
  \expandafter\newcommand\expandafter{\csname email#1\endcsname}{#6}%
  \expandafter\newcommand\expandafter{\csname zeile#1\endcsname}{#2 & #3 & #4 & #5 & \href{mailto:#6}{\nolinkurl{#6}} \\ \hline}%
}

\renewcommand{\maketitle}{\pagestyle{empty}\pagenumbering{arabic}\begin{titlepage}%
    \topmargin 25mm% <- nur Titelseite
    \topskip 20mm% <- nur Titelseite
    \headheight 0mm% <- nur Titelseite
    \headsep 0mm% <- nur Titelseite
    \renewcommand{\familydefault}{\sfdefault}
%    \begin{flushleft}
%      \includegraphics[scale=0.55]{kit_logo_de_farbe_positiv}
%    \end{flushleft}


\begin{tabular}{cc}
\begin{tabular}{l}
\includegraphics[scale=0.45]{kit_logo_de_farbe_positiv.jpg}
\end{tabular} & %
\begin{tabular}{ll}
 & \quad\tabularnewline Institut f\"ur Mikro- und Nanolelektronische Systeme (IMS) und \\Institut f\"ur Hochfrequenztechnik und Elektronik (IHE)\tabularnewline
  & \quad\tabularnewline {Matthias Hofherr, Tobias Mahler}%\tabularnewline
\end{tabular}\tabularnewline
\multicolumn{2}{c}{\textbf{\huge \medskip{}
}}\tabularnewline
\end{tabular}


    \begin{center}

      \vfill%

      \LARGE\bf Workshop Elektrotechnik und Informationstechnik%

      \vfill

      \Large\bf Kurs \etit@kursnummer : \etit@kursname \\ \etit@kurstitel
\normalfont %[5ex]%
	
	\begin{center}
	\includegraphics[scale=0.25]{Titelbild_IBT}
	\end{center}
      \vfill%
      \today
      \vfill%
      \vfill%
	\normalsize
       \begin{tabular}{p{2.5cm}|p{3.1cm}|p{2.cm}|p{2cm}|p{4cm}}%
        Vorname & Nachname & Matrikel-Nr. & u-Account & E-Mail \\ \hline \hline
        \@ifundefined{vornameI}  {}{\zeileI}
        \@ifundefined{vornameII} {}{\zeileII}
        \@ifundefined{vornameIII}{}{\zeileIII}
        \@ifundefined{vornameIV} {}{\zeileIV}
      \end{tabular}

    \vfill
\vfill
       \today

    \end{center}%

    \vfill

  \end{titlepage}%
\pagestyle{fancy}
} %



% Hyperref
\hypersetup{colorlinks=true, citecolor=black, linkcolor=black,
      urlcolor=black, hyperfootnotes=false, breaklinks}

\endinput
