%% LaTeX class for the Technical Report series of Cicirello.org.
%% Copyright (c) 2024 Vincent A. Cicirello
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cicirello}[2024/01/16 Cicirello.org Technical Reports]

\DeclareOption{twocolumn}{\@twocolumntrue\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[letterpaper,11pt]{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage{times}
\RequirePackage{tikz}
\RequirePackage{xcolor}
\RequirePackage{multirow}
\RequirePackage{fancyhdr}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{silence}
\RequirePackage{etoolbox}
\RequirePackage[pdftex]{hyperref}
\RequirePackage{hyperxmp}

\DeclareRobustCommand*\reportnum[1]{\gdef\@reportnum{#1}}
\DeclareRobustCommand*\address[1]{\gdef\@address{#1}}
\address{}
\DeclareRobustCommand*\copyrightyear[1]{\gdef\@copyrightyear{#1}}
\copyrightyear{\the\year{}}
\DeclareRobustCommand*\orcid[1]{\gdef\@orcid{#1}}
\orcid{}
\DeclareRobustCommand*\keywords[1]{\gdef\@keywords{#1}}
\keywords{}
\DeclareRobustCommand*\ACM[1]{\gdef\@ACM{#1}}
\ACM{}
\DeclareRobustCommand*\MSC[1]{\gdef\@MSC{#1}}
\MSC{}
\DeclareRobustCommand*\subject[1]{\gdef\@subject{#1}}
\subject{}
\DeclareRobustCommand*\abstract[1]{\gdef\@abstract{#1}}
\abstract{}
\DeclareRobustCommand*\reporturl[1]{\gdef\@reporturl{#1}}
\reporturl{}
\DeclareRobustCommand*\citeas[1]{\gdef\@citeas{#1}}
\citeas{}
\DeclareRobustCommand*\citetype[1]{\gdef\@citetype{#1}}
\citetype{Journal ref}

\AtEndPreamble{%
  \pdfinfo{
	/Author (\@author)
	/Keywords (\@keywords)
	/ACM (\@ACM)
	/MSC (\@MSC)
  }
  \hypersetup{%
    keeppdfinfo,
    pdftitle={\@title},
    pdfauthor={\@author},
	pdfsubject={\ifx\@subject\@empty {\@abstract} \else {\@subject} \fi},
	pdfkeywords={\@keywords},
	pdfcopyright={Copyright (C) \@copyrightyear\ \@author},
    pdfpublisher={Cicirello.org},
	pdfpubtype={report},
	pdfsource={},
	pdfurl={\@reporturl}
  }%% NOTE: add pdfurl once I determine the URL format
}

\definecolor{lime}{HTML}{A6CE39}
\DeclareRobustCommand{\orcidicon}{%
	\begin{tikzpicture}
	\draw[color=lime, fill=lime] (5pt,5pt) circle [radius=5pt];
	\node[color=white, font={\fontfamily{qag}\fontsize{6.25}{6.25}\selectfont}] (A) at (5pt,5pt) {\,ID};
	\draw[color=white, fill=white] (3.125pt,8.125pt) circle [radius=0.17pt];
	\end{tikzpicture}%
}

\DeclareRobustCommand{\orcidiconlarger}{%
	\begin{tikzpicture}
	\draw[color=lime, fill=lime] (6pt,6pt) circle [radius=6pt];
	\node[color=white, font={\fontfamily{qag}\fontsize{7.5}{7.5}\selectfont}] (A) at (6pt,6pt) {\,ID};
	\draw[color=white, fill=white] (3.75pt,9.75pt) circle [radius=0.20pt];
	\end{tikzpicture}
}

%% This works, sort of, but inserts an empty link.
%% \newcommand\orcidfootnote{%
%%   \begingroup
%%   \ifx\@orcid\@empty {\vskip 1.5em} \else% 
%%     \renewcommand\thefootnote\relax\footnote{\kern-0.5em
%% 	\raisebox{0.25em}{\href{https://orcid.org/\@orcid}{\orcidicon}}
%% 	\kern-0.5em \hypertarget{orcidtarget}{\url{https://orcid.org/\@orcid}}}%
%%     \addtocounter{footnote}{-1}%
%%   \fi
%%   \endgroup
%% }

\def\blfootnote{\xdef\@thefnmark{}\@footnotetext}

\newcommand\insertcitation{%
  \begingroup
  \ifx\@citeas\@empty {} \else%
    \vskip 1em
	{\Large \fbox{\begin{minipage}{\citeboxwidth}\textbf{\@citetype:}\\ \@citeas\end{minipage}}}
  \fi
  \endgroup
}

\newcommand\orcidfootnote{%
  \begingroup
  \ifx\@orcid\@empty {\vskip 1.5em} \else%
    \WarningsOff[hyperref]
    \blfootnote{\kern-1.5em \href{https://orcid.org/\@orcid}{\orcidicon}
	  \hypertarget{orcidtarget}{\url{https://orcid.org/\@orcid}}}%
	\WarningsOn[hyperref]
  \fi
  \endgroup
}

\definecolor{logobackground}{HTML}{F6F0BB}
\definecolor{logoforeground}{HTML}{862D2D}
\DeclareRobustCommand{\cicirellologo}{%
	\begin{tikzpicture}
	\clip (0pt,0pt) rectangle (32pt,32pt);
	\draw[color=logoforeground, fill=logobackground, rounded corners=4pt, line width=1.5pt] (0.75pt, 0.75pt) rectangle (31.25pt, 31.25pt);
	\node[color=logoforeground, font={\fontfamily{qtm}\fontsize{20}{20}\selectfont}] (A) at (16pt,20.8pt) {VC};
	\node[color=logoforeground, font={\fontfamily{qtm}\fontsize{20}{20}\selectfont}] (B) at (16pt,11.2pt) {A};
	\end{tikzpicture}
}

\DeclareRobustCommand{\cicirellologosmall}{%
	\begin{tikzpicture}
	\clip (0pt,0pt) rectangle (16pt,16pt);
	\draw[color=logoforeground, fill=logobackground, rounded corners=2pt, line width=0.75pt] (0.375pt, 0.375pt) rectangle (15.625pt, 15.625pt);
	\node[color=logoforeground, font={\fontfamily{qtm}\fontsize{10}{10}\selectfont}] (A) at (8pt,10.4pt) {VC};
	\node[color=logoforeground, font={\fontfamily{qtm}\fontsize{10}{10}\selectfont}] (B) at (8pt,5.6pt) {A};
	\end{tikzpicture}
}

\DeclareRobustCommand{\cicirellologotiny}{%
	\begin{tikzpicture}
	\clip (0pt,0pt) rectangle (12.8pt,12.8pt);
	\draw[color=logoforeground, fill=logobackground, rounded corners=1.6pt, line width=0.6pt] (0.3pt, 0.3pt) rectangle (12.5pt, 12.5pt);
	\node[color=logoforeground, font={\fontfamily{qtm}\fontsize{8}{8}\selectfont}] (A) at (6.4pt,8.32pt) {VC};
	\node[color=logoforeground, font={\fontfamily{qtm}\fontsize{8}{8}\selectfont}] (B) at (6.4pt,4.48pt) {A};
	\end{tikzpicture}
}

\renewcommand{\maketitle}{%
  \hypersetup{pageanchor=false}
  \begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \thispagestyle{fancy}
  \setlength{\headheight}{16.88004pt}
  \fancyhf{}
  \fancyhead[L]{\cicirellologotiny {\Large Cicirello.org}}
  \fancyhead[C]{{\Large \textit{Technical Report}}}
  \fancyhead[R]{{\Large \@reportnum}}
  \null\vfil
  \vskip 8\p@
  \begin{center}%
    {\Huge \bfseries \@title \par}%
    \vskip 3em%
    {\huge
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 3.1em%
	{\LARGE
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@address
      \end{tabular}\par}%
      \vskip 3.1em%
	{\LARGE
	  \lineskip .75em%
      \begin{tabular}[t]{c}%
        Technical Report \@reportnum
      \end{tabular}\par}%
      \vskip 1.0em%
    {\LARGE
	  \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@date
      \end{tabular}\par}%
      \vskip 3.1em%
	{\Large
	  \lineskip .75em%
      \begin{tabular}[t]{c}%
        Copyright \copyright\ \@copyrightyear\ \@author
      \end{tabular}\par}%
      \vskip 1.5em%
	{\Large
	  \lineskip .75em%
      \begin{tabular}[t]{l@{}l}%
        \multirow[b]{2}{*}[-2pt]{\cicirellologo} & The {\itshape Technical Report} series of Cicirello.org is available via\\ 
		& the Internet at: \url{https://reports.cicirello.org/}
      \end{tabular}}%
  \end{center}
  \insertcitation
  \vfil\null
  \end{titlepage}%
  \hypersetup{pageanchor=true}
  \if@twocolumn
    \ifnum \col@number=\@ne
      \makeremainderoftitle%
    \else
      \twocolumn[\makeremainderoftitle]%
    \fi
  \else
    \newpage
    \global\@topnum\z@   % Prevents figures from going at top of page.
    \makeremainderoftitle%
  \fi
  \orcidfootnote%
  \global\let\@reportnum\@empty
  \global\let\reportnum\relax
  \global\let\@address\@empty
  \global\let\address\relax
  \global\let\@copyrightyear\@empty
  \global\let\copyrightyear\relax
  \global\let\@orcid\@empty
  \global\let\orcid\relax
  \global\let\@keywords\@empty
  \global\let\keywords\relax
  \global\let\@ACM\@empty
  \global\let\ACM\relax
  \global\let\@MSC\@empty
  \global\let\MSC\relax
  \global\let\@subject\@empty
  \global\let\subject\relax
  \global\let\@abstract\@empty
  \global\let\abstract\relax
  \global\let\@reporturl\@empty
  \global\let\reporturl\relax
  \global\let\@citeas\@empty
  \global\let\citeas\relax
  \global\let\@citetype\@empty
  \global\let\citetype\relax
}

\newcommand{\makeremainderoftitle}{%
  \newpage
  \null
  \setlength{\headheight}{12pt}
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\Large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author \ifx\@orcid\@empty {} 
		  \else \raisebox{0.25em}{\hyperlink{orcidtarget}{\orcidicon}}
		  \fi
      \end{tabular}\par}%
	\vskip 1em%
    {\large \@address}%
	\vskip 1em%
    {\large Technical Report \@reportnum}%
  \end{center}%
  {\small%
    \begin{center}%
      {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
    \end{center}%
    \begin{quotation}
    \@abstract
    \end{quotation}
  }
  \makemetadata
}

%% IMPORTANT: The blank lines are meaningful in this command.
\newcommand{\makemetadata}{%
	  \ifx\@keywords\@empty%
	    \ifx\@ACM\@empty%
		  \ifx\@MSC\@empty {}%
		  \else%
		    \begin{quote}%
		    \textbf{MSC Classes:} \@MSC%
			\ifx\@citeas\empty {}%
		    \else%
		  
		      \textbf{\@citetype:} \@citeas%
		    \fi%
			\end{quote}%
		  \fi%
		\else%
		  \begin{quote}%
		  \textbf{ACM Classes:} \@ACM%
		  \ifx\@MSC\@empty {}%
		  \else%
				
		    \textbf{MSC Classes:} \@MSC%
		  \fi%
		  \ifx\@citeas\empty {}%
		  \else%
		  
		    \textbf{\@citetype:} \@citeas%
		  \fi%
		  \end{quote}%
		\fi
      \else%
	    \begin{quote}%
	    \textbf{Keywords:} \@keywords%
		\ifx\@ACM\@empty {}%
		\else%
			
		  \textbf{ACM Classes:} \@ACM%
		\fi
		\ifx\@MSC\@empty {}%
		\else%
				
		  \textbf{MSC Classes:} \@MSC%
		\fi%
		\ifx\@citeas\empty {}%
		\else%
		  
		  \textbf{\@citetype:} \@citeas%
		\fi%
		\end{quote}
	  \fi%
}

\setlength{\textwidth}{6.5in}
\setlength{\oddsidemargin}{0in}
\setlength{\evensidemargin}{0in}
\setlength{\topmargin}{-0.25in}
\setlength{\textheight}{9.5in}
\setlength{\headheight}{12pt}
\addtolength{\textheight}{-\footskip}
\addtolength{\textheight}{-\headheight}
\addtolength{\textheight}{-\headsep}

\newlength{\citeboxwidth}
\setlength{\citeboxwidth}{\textwidth}
\addtolength{\citeboxwidth}{-6.79pt}
