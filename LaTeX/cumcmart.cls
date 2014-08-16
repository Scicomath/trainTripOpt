\ProvidesClass{cumcmart}[2005/06/14 v050601, by Mao Ziyang��Amend 2010 by ChinaTeX]

\let\CCTCJKfonts=1
\LoadClass[CJK]{cctart}

\endlinechar -1

\newtoks\xuanti
\newtoks\numbers
\newtoks\school
\newtoks\authorone
\newtoks\authortwo
\newtoks\authorthree
\newtoks\advisor
\newtoks\theday

\renewcommand\contentsname{\centering \ziju{2}Ŀ¼}

%------------------------ Page layout ----------------------------------

%\topmargin=-15.4mm
%\oddsidemargin=-0.4mm
%\evensidemargin=-0.4mm
%\textwidth=160mm
%\textheight=247mm
\parindent=2em

\RequirePackage[a4paper,left=2.5cm,top=2.5cm,bottom=2.5cm,right=2.5cm]{geometry}

\def\maketitle{%
  \null
  \thispagestyle{empty}%
  \leavevmode
  \input{declaration}
  \null
  \cleardoublepage
  \setcounter{page}{1}
  \begin{center}
     {\heiti\zihao{3} \@title \par}%
  \end{center}
  \vspace{3\ccht}\par
  }

%------------------------ Abstract & Keywords -------------------------
\newcommand\cnabstractname{\ziju{2}ժҪ}
\newcommand\enabstractname{ABSTRACT}
\newcommand\cnkeywords[1]{\pushziti {\heiti\zihao{-4}\cnkeywordsname��#1}\popziti}
\newcommand\cnkeywordsname{�ؼ���}
\newcommand\enkeywords[1]{\pushziti {\bfseries\zihao{-4}\enkeywordsname��#1}\popziti}
\newcommand\enkeywordsname{Key words}

\newenvironment{cnabstract}{\pushziti%
    \begin{center}{\zihao{4}\heiti \cnabstractname}\end{center}\vspace{1\ccht}
    \songti\zihao{-4}
    \@afterheading}
    {\par\popziti\newpage}

%------------------------ sections -------------------------

\renewcommand\section{\renewcommand{\@seccntformat}[1]{%
   \zihao{4}\heiti\csname thesection\endcsname \hspace{0.5em}}
   \@startsection
            {section}{2}{\z@}%  {name}{depth}{}
                {3.5ex \@plus 1ex \@minus .2ex}% positive->leave parindent
                {2.3ex \@plus.2ex}%
                {\reset@font\fontsize{13.75pt}{\baselineskip}\sectionformat}}
\renewcommand\sectionname{\arabic{section}}
\renewcommand\sectionformat{\zihao{4}\heiti\selectfont\centering}

%----------------------subsection---------------------------
\renewcommand\subsection{\renewcommand{\@seccntformat}[1]{%
   \zihao{-4}\heiti\csname thesubsection\endcsname \hspace{0.2em}}
\@startsection
{subsection}{2}{\z@}% {name}{depth}{}
{1.75ex \@plus.5ex \@minus .1ex}% leave parindent
{1.15ex \@plus.1ex}%
{\reset@font\normalsize\bfseries\subsectionformat}}
\renewcommand\subsectionformat{\zihao{-4}\heiti\selectfont}
\renewcommand{\figurename}{\heiti ͼ}

%----------------------- Theorems ---------------------------
\newtheorem{theorem}{{����}}
\newtheorem{proposition}{{����}}
\newtheorem{lemma}{{����}}
\newtheorem{corollary}{{����}}[theorem]
\newtheorem{definition}{{����}}
\newtheorem{example}{{��}}

\endlinechar `\^^M
\endinput