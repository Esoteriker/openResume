\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2026/02/10 Maintainable one-page resume class]

\LoadClass[10pt]{article}

\RequirePackage{iftex}
\ifPDFTeX
  \ClassError{resume}{This template requires XeLaTeX or LuaLaTeX}{Use xelatex or lualatex.}
\fi

\RequirePackage[a4paper,top=0.52in,bottom=0.50in,left=0.58in,right=0.58in]{geometry}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{fontawesome5}
\RequirePackage{etoolbox}
\RequirePackage{array}
\RequirePackage{tabularx}

\IfFontExistsTF{Times New Roman}{
  \setmainfont{Times New Roman}
}{
  \IfFontExistsTF{TeX Gyre Termes}{
    \setmainfont{TeX Gyre Termes}
  }{
    \setmainfont{Latin Modern Roman}
  }
}

\definecolor{ResumeLink}{HTML}{1A34A8}
\definecolor{ResumeRule}{HTML}{6B6B6B}

\hypersetup{
  colorlinks=true,
  urlcolor=ResumeLink,
  linkcolor=ResumeLink,
  pdfauthor={},
  pdftitle={Resume}
}

\setlength{\parindent}{0pt}
\setlength{\parskip}{0.10em}
\linespread{1.03}
\pagestyle{empty}
\pagenumbering{gobble}
\setlength{\tabcolsep}{0pt}
\setlist[itemize]{
  leftmargin=1.05em,
  itemsep=0.10em,
  topsep=0.08em,
  parsep=0pt,
  partopsep=0pt
}

\newlist{resumeitems}{itemize}{1}
\setlist[resumeitems]{
  label=\textbullet,
  leftmargin=1.05em,
  itemsep=0.11em,
  topsep=0.06em,
  parsep=0pt,
  partopsep=0pt
}

\newcommand{\resumeName}{}
\newcommand{\resumeRole}{}
\newcommand{\resumeContacts}{}

\newcommand{\Name}[1]{\renewcommand{\resumeName}{#1}}
\newcommand{\Role}[1]{\renewcommand{\resumeRole}{#1}}
\newcommand{\Contacts}[1]{\renewcommand{\resumeContacts}{#1}}

\newcommand{\ContactSep}{\hspace{0.60em}}

\newcommand{\ContactItem}[3]{%
  \ifstrempty{#3}{%
    #1\hspace{0.26em}#2%
  }{%
    \href{#3}{#1\hspace{0.26em}#2}%
  }%
}

\newcommand{\MakeHeader}{%
  {\centering
    {\fontsize{24}{26}\selectfont\bfseries \resumeName\par}
    \vspace{0.14em}
    {\normalsize\bfseries \resumeRole\par}
    \vspace{0.30em}
    {\small \resumeContacts\par}
    \vspace{0.34em}
  }
}

\newcommand{\Section}[1]{%
  \vspace{0.24em}
  {\Large\bfseries #1\par}
  \vspace{0.11em}
  {\color{ResumeRule}\rule{\linewidth}{0.55pt}}\par
  \vspace{0.10em}
}

\newcommand{\ExperienceEntry}[5]{%
  \begin{tabularx}{\linewidth}{@{}X@{}>{\raggedleft\arraybackslash}p{0.30\linewidth}@{}}
    \ifstrempty{#1#2}{}{%
      \textbf{#1} & \textbf{#2} \\
    }%
    \textit{#3} & \textit{#4}
  \end{tabularx}
  \vspace{-0.58em}
  \begin{resumeitems}
    #5
  \end{resumeitems}
  \vspace{0.09em}
}

\newcommand{\ProjectEntry}[2]{%
  \textbf{#1}\par
  \vspace{-0.58em}
  \begin{resumeitems}
    #2
  \end{resumeitems}
  \vspace{0.10em}
}

\newcommand{\EducationEntry}[4]{%
  \begin{tabularx}{\linewidth}{@{}X@{}>{\raggedleft\arraybackslash}p{0.32\linewidth}@{}}
    \textbf{#1}\ifstrempty{#2}{}{~\textit{#2}} &
    \ifstrempty{#3}{%
      \ifstrempty{#4}{}{\textit{#4}}%
    }{%
      \textbf{#3}\ifstrempty{#4}{}{~\textit{#4}}%
    }
  \end{tabularx}
  \vspace{-0.08em}
}

\newcommand{\SkillLine}[2]{%
  \textbf{#1}: #2\par
}

\endinput
