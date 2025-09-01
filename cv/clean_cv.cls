\ProvidesClass{clean_cv}[2021/07/28 v1.0.0 'CleanCV' Class]

\LoadClass[11pt]{article}

\RequirePackage[margin=0.6in]{geometry}
\RequirePackage{microtype}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{array}
\RequirePackage{xcolor}
\RequirePackage{xpatch}
\RequirePackage{enumitem}
\usepackage{titlesec}

% Load fonts
\RequirePackage[fixed]{fontawesome5}
\RequirePackage[scaled=.96,osf]{XCharter}
\linespread{1.04}

% Load biber
\RequirePackage[backend=biber,sorting=ydnt,block=none,bibstyle=apa,doi=true,isbn=false]{biblatex}
\setlength\bibitemsep{1.5\itemsep}
\RequirePackage[hidelinks]{hyperref}

\DeclareSourcemap{
    \maps[datatype=bibtex]{
        \map[overwrite]{
            \step[fieldsource=date, match=\regexp{(\d{4})},
                  fieldset=keywords, fieldvalue={YEAR-$1}, append, ]
	}
	\map[overwrite]{
	    \step[fieldset=note, null]
	}
}}
\defbibenvironment{bibliography}
{\list{}
{\setlength{\leftmargin}{5em}%
\setlength{\itemindent}{-4em}%
\setlength{\itemsep}{\bibitemsep}%
\setlength{\parsep}{\bibparsep}
\addtolength{\leftmargin}{\labelsep}
\addtolength{\leftmargin}{\leftskip}}}
{\endlist}
{\item}

%\AtBeginBibliography{\vspace*{-2em}}



\definecolor{dateline}{gray}{0.5}
\definecolor{datecolor}{gray}{0.4}
\newcolumntype{R}{>{\raggedleft\arraybackslash}p{4em}}
\newcommand{\daterule}{\color{dateline}\vrule width 1pt}
\newcommand{\dateentry}[2]{{\leavevmode\color{datecolor}{#1}} & #2 \\ \noalign{\medskip}}
%\dimexpr(\textwidth - #1)\relax
\newenvironment{datetabular}[1]{%
    \begin{longtable}{@{}>{\raggedleft\arraybackslash}p{#1}!{\daterule}p{\dimexpr(\linewidth - #1 - 1em)\relax}}%
}{%
    \end{longtable}%
}

\newcommand{\faCenter}[1]{\raisebox{-2pt}{\faIcon{#1}}}
\newcommand{\faCenterStyle}[2]{\raisebox{-2pt}{\faIcon[#1]{#2}}}

\titleformat{\section}[display]{\large\bfseries}{}{0pt}{}[\vspace{-10pt}\rule{\linewidth}{1pt}]
\titlespacing*{\section}{0pt}{0em}{0.4em}

\setlength\parindent{0pt}
%\setlength\parskip{0pt}

%\setlist{noitemsep,topsep=0pt,parsep=0pt,partopsep=0pt}
\newcommand{\eatvspace}{\vspace*{-1.5em}\,}

\newcommand*{\headlineposition}[1]{\def\@headlineposition{#1}}

\let\@author\@empty
\let\@headlineposition\@empty

\renewcommand{\maketitle}{%
\begin{center}
    \ifx\@author\@empty\else{ \Huge \@author} \\\fi \ifx\@headlineposition\@empty\else\vspace{6pt} {\itshape \@headlineposition}\fi
\end{center}%
\vspace{-8.2pt}
\rule{\linewidth}{1pt}
}

%extra format
\newcommand{\service}[2]{\dateentry{#1}{
{#2}
}

}

\newcommand{\serviceentry}[3]{{#1} \hfill {#3}

\qquad {#2} \vspace{.4em}

}
\newcommand{\teachingentry}[2]{\textbf{{#1}}: {#2}
\vspace{.4em}

}
\newcommand{\teachingentryweird}[1]{\textbf{{#1}}
\vspace{.4em}

}

\newcommand{\talkentry}[6]{
``{#1},'' {#2} by {#3}. \textit{#4}, {#5}; {#6}.\vspace{1em}


}
\newcommand{\talkattendance}[5]{
``{#1},'' organized by {#2}. Invited participant. \textit{#3}, {#4}; {#5}.\vspace{1em}


}


\newcommand{\reference}[4]{{\textbf{#1}} \hfill {\textit{#2}}

\qquad {#3} 

\qquad {#4} \vspace{.4em}

}


\pagestyle{empty}
