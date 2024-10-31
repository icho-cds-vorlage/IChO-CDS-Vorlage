%% LaTeX2e class for ichobooklet
%% originally taken from iphobooklet by stpet 20170106
%% xmiao 20231202
%%

%  identifications
% =====================
  \NeedsTeXFormat{LaTeX2e}[1995/12/01]           % use LaTeX2e
  \ProvidesClass{ichobooklet}[2023/12/02 xmiao]
  \LoadClass[fontsize=11pt,a4paper,toc=flat]{scrartcl} % Class KOMA-article
                                                 % add option fleqn for
                                                 % formulas with left indent

%  used packages
% ===============
  \usepackage[ngerman]{babel}
  \usepackage[T1]{fontenc}
  %\usepackage{cmbright}         % use Computer Modern (SF) Font generally
                                % (also for math mode)
  \usepackage{mathpazo}
  \usepackage{textcomp}
  \usepackage[shortcuts]{extdash}
  \usepackage{scrlayer-scrpage} % control of headers and footers
  \usepackage{totpages}         % allows to find total number of pages (package lastpage led to issues with tikzexternalize)
  \usepackage{amssymb,amsmath,amsthm,amscd,bbm,autobreak} % AMS packages
  \usepackage{esvect,bigints}
  \usepackage{mathtools}        % provides \Aboxed{} environment for boxed aligned formulas
  \usepackage{apacite}          % Bibtex citing in APA style
  \usepackage[font=it,labelsep=colon, figurename=Abb.]{caption}
  \usepackage{graphicx}
  \usepackage{placeins}
  \usepackage{here}
  \usepackage[hidelinks]{hyperref}
  \usepackage{picinpar,wrapfig}
  \usepackage{epstopdf}
  \usepackage{xcolor}

  \usepackage{xintexpr}

 % \usepackage{framed}
  \usepackage{mdframed}
  \usepackage{array}
  \newcolumntype{C}[1]{>{\centering\arraybackslash}m{#1}} % vertikal und horizontal zentrierte Tabellenzellen mit fester Breite, z.B. C{3cm}
  \newcolumntype{L}[1]{>{\arraybackslash}m{#1}}
  \usepackage{longtable}
  \usepackage{multirow}
  \usepackage{makecell}
  \usepackage{tabularx}                % for tables with fixed width
  \usepackage{colortbl}
  \usepackage{enumerate}
  \usepackage[shortlabels]{enumitem}
  \usepackage{wallpaper}
  \usepackage{wasysym}                 % WASY2 fonts (glyphs, ...)
  \usepackage{ifthen}                  % ifthenelse used for markings
  \usepackage{xspace}                  % for blank space at end of macros
  \usepackage{icomma,siunitx}
    \sisetup{
      locale = DE,
      output-decimal-marker = {,},
      group-separator = {},
      exponent-product = \cdot,
      per-mode = reciprocal,
      inter-unit-product = \ensuremath{{}\cdot{}},
      separate-uncertainty,
      detect-all,
    }
    \DeclareSIUnit\angstrom{\text{\r{A}}}
    \DeclareSIUnit\bar{bar}
    \DeclareSIUnit\atm{atm}
    \DeclareSIUnit\atomicmassunit{u}
    \DeclareSIUnit\debye{D}
    \DeclareSIUnit\ppm{ppm}
  \usepackage{tikz}
    \usetikzlibrary{babel}
    \usetikzlibrary{arrows.meta}
    \usetikzlibrary{positioning}
    \usetikzlibrary{patterns}
    \usetikzlibrary{angles}
    \usetikzlibrary{quotes}
    \usetikzlibrary{calc}
%    \usetikzlibrary{decorations.pathmorphing}
%    \usetikzlibrary{decorations.shapes}
%    \usetikzlibrary{decorations.markings}


  \usepackage{pgfplots}
    \pgfplotsset{compat=1.5}
%    \usetikzlibrary{external} % Package für tikzexternalize
%    \usetikzlibrary{pgfplots.external} % Dasselbe für pgfplots
%      \tikzexternalize[prefix=tikz_pictures/]  % activate externalization with specific output folder
    % in case of problems with externalize only use definition of \tikzsetnextfilename below and uncomment three lines above
    \newcommand{\tikzsetnextfilename}[1]{} % to avoid difficulties with alternative use of tikzexternalize

  \usepackage[most]{tcolorbox} % formulas, breakable antwortkasten
  \usepackage[nomessages]{fp} % point calculation
  \usepackage{calc} %length calculations
  \usepackage{pgffor} % Iteration fuer umbrechbaren Antwortkasten
  \usepackage{expl3} %OC Kasten
  \usepackage{xparse}
  \usepackage{stringstrings} % MC fix

% Chemistry
\usepackage{chemscheme} %scheme analog figure
\usepackage{chemformula}
\usepackage{chemmacros}
\usepackage{chemgreek,upgreek}\selectchemgreekmapping{upgreek}
\usepackage{chemfig}
\newcommand{\actualscale}{1.0} % give here your wished scale
\catcode`\_=11
\pgfmathsetmacro{\currentscale}{\actualscale}
\tikzset{
    shrtdbl/.code 2 args={
        \tikzset{,shorten >= 0pt,shorten <= 0pt}\global\CF_addtomacro\CF_currentbondstyle{,shorten >= #1*\currentscale,shorten <= #2*\currentscale}
    },
    smb/.style={
        shrtdbl={0.625mm}{0.625mm}
    },
    lmb/.style={
        shrtdbl={0.0mm}{0.0mm}
    }
}
\catcode`\_=8
\setchemfig{
    atom style={scale=\actualscale},
    atom sep = 5.08mm,
    angle increment = 30,
    double bond sep = 0.9144mm,
    compound sep = 7em,
    arrow offset = 2.0em,
    bond style = {smb, line width=0.21mm},
}
\usepackage{modiagram}
\usepackage{endiagram}

  % miscellaneous
  \usepackage{blindtext}
  \usepackage[normalem]{ulem}
  \usepackage{todonotes}
  \usepackage[final]{pdfpages}
  \usepackage{etoolbox}
  \usepackage{subfiles}

%  global variables
% =========================================
%renewcommand definiert nur innerhalb der aktuellen Gruppe um; f\"ur globale Umdefinition grenewcommand
\makeatletter
\def\gnewcommand{\g@star@or@long\gnew@command}
\def\grenewcommand{\g@star@or@long\grenew@command}
\def\g@star@or@long#1{%
  \@ifstar{\let\l@ngrel@x\global#1}{\def\l@ngrel@x{\long\global}#1}}
\def\gnew@command#1{\@testopt{\@gnewcommand#1}0}
\def\@gnewcommand#1[#2]{%
  \kernel@ifnextchar [{\@gxargdef#1[#2]}%
                {\@argdef#1[#2]}}
\let\@gxargdef\@xargdef
\patchcmd{\@gxargdef}{\def}{\gdef}{}{}
\let\grenew@command\renew@command
\patchcmd{\grenew@command}{\new@command}{\gnew@command}{}{}
\makeatother

\FPset\teilaufgabenpunkte{0} %setzt Variable teilaufgabenpunkte=0 --> Berechnung Punkte innerhalb Teilaufgabe
\newcounter{doppteilaufpunkt}
\FPset\aufgabenpunkte{0} %Z\"ahler Punktzahl einer Aufgabe
\newcommand{\tasktitle}{holder} % Platzhalter
\newcommand{\taskpoints}{xx} % Platzhalter
\newcommand{\taskweight}{yy}
\newcommand{\ocscale}{0.9}
\newcommand{\vergleichshilfe}{Platzhalter}
\newcommand{\zusatzargument}{0}
\graphicspath{{./Abbildungen/}}
\newlength{\contentheight} % fuer umbrechbaren Antwortkasten
\newlength{\targetheight}  % fuer umbrechbaren Antwortkasten
\newlength{\remainingheight} % fuer umbrechbaren Antwortkasten

%  "simple" commands for task writing
% =========================================
\ifnum\ifdefined\klasse 0\else 1\fi\ifdefined\bundesland 0\else1\fi=0
  \usepackage[\solution,rd\round,ex\exam,c\code, \klasse, \bundesland]{optional}
\else
  \usepackage[\solution,rd\round,ex\exam,c\code]{optional}
\fi


% Operator
\newcommand{\operator}[1]{\uline{\textbf{#1}}}

% Antwortkasten
\newcommand{\kasten}[3]{\fbox{\parbox[b][#1][t]{\linewidth-6.8pt}{\opt{1,2}{#2}\opt{0}{#3\textcolor{white}{.}}}}\opt{2}{\marginpar{%
\FPeval\teilaufgabenpunkte{\thedoppteilaufpunkt / 2}
\setcounter{doppteilaufpunkt}{0}
\FPeval{aufgabenpunkte}{aufgabenpunkte+teilaufgabenpunkte}%
\xdef\aufgabenpunkte{\aufgabenpunkte}%
\FPeval{nachkommacheck}{10 * teilaufgabenpunkte}\FPifint\teilaufgabenpunkte \FPeval\teilaufgabenpunkte{round(teilaufgabenpunkte:0)} \else \FPeval\teilaufgabenpunkte{round(teilaufgabenpunkte:1)} \fi\textcolor{red}{ \SI{\FPprint\teilaufgabenpunkte}{}\,P.}\FPifint\nachkommacheck\else\todo{max. eine Dezimalstelle f\"ur Gesamtpunktzahl der Teilaufgabe}\fi}}\FPset\teilaufgabenpunkte{0}\par \bigskip} %Antwortkasten: 1:H\"ohe, 2: Text/Bilder, 3 Text/Bilderf in Version 0 (addierte Punktzahl wird in Rand ausgegeben und zur\"uckgesetzt; bei mehr als einer Nachkommastelle Fehlermeldung)
%letzte geschweifte Klammer weglassen funktioniert meist, aber manchmal erzeugt es unverst\"andliche Fehlermeldungen

%umbrechbarer Antwortkasten
\newcommand{\FPtruncate}[2]{\FPeval\truncatehelpone{round(#2:0)}\FPsub{\truncatehelptwo}{#2}{0.5}\FPeval\truncatehelpthree{round(truncatehelptwo:0)}\ifthenelse{\equal{\truncatehelpone}{\truncatehelpthree}}{\FPeval{#1}{\truncatehelpone}}{\FPeval{#1}{\truncatehelpthree}}} %Funktion fuer Abschneiden von Nachkommastellen (1. Argument: Zielvariable; 2. Argument: Ausgangswert oder Variable)
\newcommand{\calculateLinesToFill}[2]{%Leerzeilen, bis Kasten die gewuenschte Groesse erreicht (1. Argument: Groesse, 2. Argument: Inhalt)
    \settototalheight{\contentheight}{\parbox{\linewidth}{#2}} % Measure height of the content; doppeltes Aufrufen des Textes verdoppelt gez\"ahlte Punktzahl %Punktzahl korrigieren und wieder global machen
    \setlength{\targetheight}{#1}
    \setlength{\remainingheight}{\targetheight - \contentheight} % Calculate remaining height
    \FPdiv{\lines}{\csname rem@pt\expandafter\endcsname\the\dimexpr\remainingheight}{\csname rem@pt\expandafter\endcsname\the\dimexpr\baselineskip} % Calculate number of lines needed; dazu zuerst Einheit entfernen
    \FPtruncate{\completelines}{\lines} %number of complete lines
    \FPsub{\brokenlines}{\lines}{\completelines}\FPmul{\brokenlinesspace}{\csname rem@pt\expandafter\endcsname\the\dimexpr\baselineskip}{\brokenlines} %fehlender Abstand fuer nicht mehr volle Zeile
}
%Hinweispfeil fuer 2. Seite
\NewChemArrow{n>}{
 \draw[chemarrow,-cf]
 (cf_arrow_start)
 .. controls ([yshift=3ex]cf_arrow_mid) ..
 (cf_arrow_end);
}
\newcommand{\umbruchkasten}[6]{%
 \marginpar{\vspace*{1mm}\ch{n>}}\vspace*{-1mm}\begin{tcolorbox}[colback=white, colframe=black, sharp corners, boxrule=0.4pt, breakable, top=0.5pt, left=0.5pt, right=0.5pt, bottom=0.5pt, use color stack] %ohne color stack ist erster Absatz nach Umbruch schwarz, unabhaengig von textcolor
  \opt{1,2}{#2}\opt{0}{#3}\calculateLinesToFill{#1}{\opt{1,2}{#2}\opt{0}{#3}}\foreach \n in {1,...,\FPprint{\completelines}}{\textcolor{white}{\\\parbox[b][\baselineskip][]{\linewidth}{.}}}\vspace*{\FPprint\brokenlinesspace pt}\vspace*{\opt{0}{#4}\opt{1}{#5}\opt{2}{#6}} %erste drei Argumente wie \kasten, Argumente vier bis sechs als manuelle Korrektur (zusaetzliche Laenge fuer die Kaesten der Versionen 0 bis 2); fuer Umbrechbarkeit keine vbox sondern mit weißem Punkt gefuellte Zeilen
 \end{tcolorbox}
 \opt{2}{\marginpar{%
  \FPeval\teilaufgabenpunkte{\thedoppteilaufpunkt / 2}
  \setcounter{doppteilaufpunkt}{0}
  \FPeval{aufgabenpunkte}{aufgabenpunkte+teilaufgabenpunkte}%
  \xdef\aufgabenpunkte{\aufgabenpunkte}%
  \FPeval{nachkommacheck}{10 * teilaufgabenpunkte}\FPifint\teilaufgabenpunkte \FPeval\teilaufgabenpunkte{round(teilaufgabenpunkte:0)} \else \FPeval\teilaufgabenpunkte{round(teilaufgabenpunkte:1)} \fi\textcolor{red}{ \SI{\FPprint\teilaufgabenpunkte}{}\,P.}\FPifint\nachkommacheck\else\todo{max. eine Dezimalstelle f\"ur Gesamtpunktzahl der Teilaufgabe}\fi}}\FPset\teilaufgabenpunkte{0}\par \bigskip
}

%Teilaufgaben und deren Punkteberechnung
\newcommand{\punkte}[1]{%
    \opt{2}{\textcolor{red}{~(\SI{#1}{}\,P.)}} \addtocounter{doppteilaufpunkt}{\xintNum{\the\numexpr 2 * #1 \relax} \relax}
} % Im Text Leerzeichen davor nicht n\"otig, danach aber schon (falls nicht ein Satzzeichen kommt); nur Zahl eintragen, mit Punkt als Dezimaltrennzeichen.
\newcommand{\teilaufgabe}[2]{\begin{enumerate}[a), resume]\item #1\renewcommand{\vergleichshilfe}{#2}\ifdefstring{\vergleichshilfe}{}{}{\newline\textit{\underline{Hinweis:} #2}}\end{enumerate}} %1: Aufgabentext, 2:Hinweis (leer lassen, wenn keiner)
\newcommand{\kommentar}[1]{\opt{2}{\textcolor{red}{#1}}}
\newcommand{\sol}[1]{\opt{1,2}{#1}} %solution


%Punkte einer Teilaufgabe ausgeben, wenn kein Antwortkasten (in MC integriert)
\newcommand{\punkteausgabe}{\opt{2}{\marginpar{%
\FPeval{aufgabenpunkte}{aufgabenpunkte+teilaufgabenpunkte}%
\xdef\aufgabenpunkte{\aufgabenpunkte}%
\FPeval{nachkommacheck}{10 * teilaufgabenpunkte}\FPifint\teilaufgabenpunkte \FPeval\teilaufgabenpunkte{round(teilaufgabenpunkte:0)} \else \FPeval\teilaufgabenpunkte{round(teilaufgabenpunkte:1)} \fi\textcolor{red}{ \SI{\FPprint\teilaufgabenpunkte}{}\,P.}\FPifint\nachkommacheck\else\todo{max. eine Dezimalstelle f\"ur Gesamtpunktzahl der Teilaufgabe}\fi}}\FPset\teilaufgabenpunkte{0}\par \bigskip}

%Beginn und Ende
\newcommand{\aufgabenanfang}{\begingroup\FPset\aufgabenpunkte{0}\FPset\teilaufgabenpunkte{0}\section{\tasktitle \texorpdfstring{\hfill \opt{rd1,rd2}{\SI{\taskpoints}{}\ Punkte}\opt{rd3,rd4}{\SI{\taskweight}{\percent}}}{}}\opt{2}{\opt{rd3,rd4}{\marginpar{\textcolor{red}{\taskpoints\,P.}}}}}
\newcommand{\aufgabenende}{\opt{2}{\FPeval{nachkommacheck}{10 * aufgabenpunkte}\FPifint\aufgabenpunkte \FPeval\aufgabenpunkte{round(aufgabenpunkte:0)} \else \FPeval\aufgabenpunkte{round(aufgabenpunkte:1)} \fi\FPifint\nachkommacheck\else\todo{Auch bei der Gesamtpunktzahl nur eine Dezimalstelle}\fi%
\FPifeq\aufgabenpunkte\taskpoints\else\todo{Gesamt-punktzahl passt nicht zur Summe der Teilaufgaben~\FPprint\aufgabenpunkte}\fi}\endgroup\setcounter{figure}{0}\setcounter{table}{0}\setcounter{scheme}{0}\setcounter{equation}{0}\restartlist{enumerate}\newpage}
%\FPset gilt nur innerhalb der group, deshalb wird zu Beginn zurueckgesetzt

%Multiple-Choice-Design
\newcommand{\quadrat}{\begin{tikzpicture}\draw (0,0) -- (0.25,0) -- (0.25,0.25) -- (0,0.25) -- (0,0); \draw[color=white,opacity=0] (0,0.385) -- (0.25,0.385);\end{tikzpicture}} %MC-Quadrat
\newcommand{\quadratkor}{\begin{tikzpicture}\draw (0,0) -- (0.25,0) -- (0.25,0.25) -- (0,0.25) -- (0,0); \draw[color=white,opacity=0] (0,0.385) -- (0.25,0.385); \draw[color=red, thick] (0,0) -- (0.25,0.25); \draw[color=red, thick] (0,0.25) -- (0.25,0);\end{tikzpicture}}
\newcommand{\quadratkorr}{\opt{0}{\quadrat}\opt{1,2}{\quadratkor}}
\newcommand{\MC}[6]{{\setlength{\tabcolsep}{0.004\textwidth}
                \begin{tabular}{|C{0.192\textwidth-0.478588pt}|C{0.192\textwidth-0.478588pt}|C{0.192\textwidth-0.478588pt}|C{0.192\textwidth-0.478588pt}|C{0.192\textwidth-0.478588pt}|}\hline
                #1 & #2 & #3 & #4 & #5\\\hline
                \substring[q]{#6}{1}{1}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{2}{2}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{3}{3}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{4}{4}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{5}{5}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat}\\\hline
                \end{tabular}}\punkteausgabe}
\newcommand{\MCrf}[9]{{\setlength{\tabcolsep}{0.004\textwidth}
                \begin{tabular}{|C{0.06\textwidth+3pt}|C{0.192\textwidth-7.6585pt}|C{0.192\textwidth-7.6585pt}|C{0.192\textwidth-7.6585pt}|C{0.192\textwidth-7.6585pt}|C{0.192\textwidth-7.6585pt}|}\hline
                & #1 & #2 & #3 & #4 & #5 \\\hline
                richtig & \substring[q]{#6}{1}{1}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{2}{2}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{3}{3}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{4}{4}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat} & \substring[q]{#6}{5}{5}\ifthenelse{\equal{\thestring}{x}}{\quadratkorr}{\quadrat}\\\hline
                falsch & \substring[q]{#6}{1}{1}\ifthenelse{\equal{\thestring}{x}}{\quadrat}{\quadratkorr} & \substring[q]{#6}{2}{2}\ifthenelse{\equal{\thestring}{x}}{\quadrat}{\quadratkorr} & \substring[q]{#6}{3}{3}\ifthenelse{\equal{\thestring}{x}}{\quadrat}{\quadratkorr} & \substring[q]{#6}{4}{4}\ifthenelse{\equal{\thestring}{x}}{\quadrat}{\quadratkorr} & \substring[q]{#6}{5}{5}\ifthenelse{\equal{\thestring}{x}}{\quadrat}{\quadratkorr}\\\hline
                \end{tabular}}\endgroup\punkteausgabe}
%MC in der vertikalen Form
\newcommand{\mctype}{0}
\newcommand{\MCvAnfang}{\renewcommand{\mctype}{0}\begin{tabular}{|C{0.6cm}|L{16.4cm-30.89052pt}|}\hline}
\newcommand{\MCvrfAnfang}{\renewcommand{\mctype}{1}\begin{tabular}{|C{1.1cm}|C{1.1cm}|L{15cm-48.981425pt}|}\hline richtig & falsch & \\\hline}
\newcommand{\MCvUmbruch}{\end{tabular}\newpage\begin{tabular}{|C{0.6cm}|L{16.4cm-30.89052pt}|}\hline}
\newcommand{\MCvrfUmbruch}{\end{tabular}\newpage\begin{tabular}{|C{1.1cm}|C{1.1cm}|L{15cm-48.981425pt}|}\hline richtig & falsch & \\\hline}
\newcommand{\MCvEnde}{\end{tabular}}
\newcommand{\MCvrfEnde}{\end{tabular}}
\newcommand{\MCv}[2]{
 \ifthenelse{\equal{\mctype}{0}}{\ifthenelse{\equal{#1}{1}}{\quadratkorr}{\quadrat}}{}
 \ifthenelse{\equal{\mctype}{1}}{\ifthenelse{\equal{#1}{1}}{\quadratkorr & \quadrat}{\quadrat & \quadratkorr}}{}
 & #2 \\\hline}


% Redifine \section to fullfill IChO-style
\makeatletter
\let\latex@@thesection\thesection
\newcommand{\padwithzero}{%
  0%
}%
\renewcommand{\thesection}{Aufgabe \round\,--\,\ifnum\c@section<10\relax\padwithzero\fi\latex@@thesection}
\newcount\dummycntr
\makeatother

%Others
\newcommand{\lstandardstate}{^{\text{\normalsize\standardstate}}}
\newcommand{\strich}{{\small{}$^\prime$}}
\newcommand{\dd}[3][]{\frac{\mathrm{d}^{#1} #2}{\mathrm{d} #3^{#1}}} %vereinfachtes schreiben von Ableitungen mit \dd[2]{c_i}{t}
\renewcommand{\pH}{\ensuremath{\mathrm{pH}}}
\renewcommand{\pOH}{\ensuremath{\mathrm{pOH}}}
\newcommand{\pKs}{\ensuremath{\mathrm{p}K_{\mathrm{S}}}}
\renewcommand{\pKb}{\ensuremath{\mathrm{p}K_{\mathrm{B}}}}
\newcommand{\pKw}{\ensuremath{\mathrm{p}K_{\mathrm{W}}}}
\newcommand{\pKl}{\ensuremath{\mathrm{p}K_{\mathrm{L}}}}

%Serienbrief
\def\chopline#1;#2 \\{
  \def\suscode{#1}
  \def\susbl{#2}
 }
\newif\ifmore \moretrue

%\newcommand{\serienbriefstart}{\newread\quelle
% \openin\quelle=Codes.csv
% \loop
%  \read\quelle to \zeile
%  \ifeof\quelle
%   \global\morefalse
%  \else
%   \expandafter\chopline\zeile\\
%}
%\newcommand{\serienbriefende}{
%  \fi
% \ifmore\repeat
% \closein\quelle
%}

%  Laengenformatierungen / Header / Footer
% =========================================
  \usepackage{setspace}
% \setlength{\linespread}{1.2}   % Seperation betweeen lines
  \setlength{\parindent}{0pt}   % Absaetze nicht einruecken
  \setlength{\parskip}{1.5ex plus0.5ex minus0.5ex}   % Absatzabstand
  \makeatletter  % have normal \parskip also in minipage environment
    \newcommand{\@minipagerestore}{\setlength{\parskip}{1.5ex plus0.5ex minus0.5ex}}
  \makeatother
  \RedeclareSectionCommands[beforeskip=0em,afterskip=\parskip]
    {section} % spacing before and after heading
  \RedeclareSectionCommands[beforeskip=0em,afterskip=0.01em]
    {subsection,subsubsection} % spacing before and after heading
  \pagestyle{scrheadings}
  \clearpairofpagestyles

  \newdimen\spaceleft % for remaining height of page.

% for use on plain paper
\DeclareOption{plainpaper_IChO}{%
  \setlength{\textwidth}{168mm}%
  \setlength{\textheight}{238mm}%
  \setlength{\oddsidemargin}{-3mm}%
  \setlength{\evensidemargin}{-3mm}%
  \setlength{\topmargin}{-17mm}%
  \setlength{\headheight}{48pt}%
  \setlength{\headsep}{12pt}%
  \setlength{\footheight}{40pt}%
  \addtokomafont{headsepline}{\color{ichodark}}
  \KOMAoptions{headsepline=1pt:\textwidth}
  \ihead[]{\parbox{0.3\textwidth}{\includegraphics[height=15mm]{IChO_2011_Logo_newblue.eps}}\vspace*{1.5mm}}%
  \chead[]{\large \parbox{0.33\textwidth}{%
    \centering
    \opt{rd1}{\textbf{IChO 1. Runde \cyear}}
    \opt{rd2}{\textbf{IChO 2. Runde \cyear}}
    \opt{rd3}{\textbf{IChO 3. Runde \cyear \\ Klausur \opt{ex1}{1}\opt{ex2}{2}}}
    \opt{rd4}{\textbf{IChO 4. Runde \cyear \\ \opt{ex1}{Theorie-Klausur}\opt{ex2}{Praxis-Klausur}}}
  }}%
  \ohead[]{\setstretch{1.5} \normalsize \parbox{0.33\textwidth}{\opt{rd3,rd4}{Sch\"ulercode: \opt{c0}{\hrulefill}\opt{c1}{\suscode}\opt{rd1,rd2}{\\Bundesland: \opt{c0}{\hrulefill}\opt{c1}{\susbl}}}\opt{rd2}{}}}%
  \cfoot[]{\vspace{-4\baselineskip}\thepage~/ \pageref{TotPages}}%
}

\DeclareOption{plainpaper_Cds}{%
  \setlength{\textwidth}{168mm}%
  \setlength{\textheight}{238mm}%
  \setlength{\oddsidemargin}{-3mm}%
  \setlength{\evensidemargin}{-3mm}%
  \setlength{\topmargin}{-17mm}%
  \setlength{\headheight}{48pt}%
  \setlength{\headsep}{12pt}%
  \setlength{\footheight}{40pt}%
  \addtokomafont{headsepline}{\color{cdscolor}}
  \KOMAoptions{headsepline=1pt:\textwidth}
  \renewcommand*{\familydefault}{\sfdefault}
  \ihead[]{\parbox{0.25\textwidth}{\includegraphics[height=15mm]{CDS_Logo_Map_verbessert.eps}}\opt{rd2}{\vspace*{1.5mm}}}%
  \chead[]{\large \vspace*{4pt} \parbox{0.5\textwidth}{%
    \centering
    \opt{rd1}{\textnormal{\textbf{\glqq{}Chemie - die stimmt!\grqq{}  \the\numexpr \cyear - 1 \relax /\cyear\\Aufgabenblatt\\ 1.Runde Klassse \klasse}}}
    \opt{rd2}{\textnormal{\textbf{\glqq{}Chemie - die stimmt!\grqq{}  \the\numexpr \cyear - 1 \relax /\cyear\\Aufgabenblatt\\ 2. Runde \bundesland{} Klasse \klasse}}}
    \opt{rd3}{\textnormal{\textbf{\glqq{}Chemie - die stimmt!\grqq{}  \the\numexpr \cyear - 1 \relax /\cyear\\Aufgabenblatt\\ 3. Runde Klasse \klasse}}}
    \opt{rd4}{\textnormal{\textbf{\glqq{}Chemie - die stimmt!\grqq{}  \the\numexpr \cyear - 1 \relax /\cyear\\\opt{ex1}{Theorie-Klausur}\opt{ex2}{Praxis-Klausur}\\ 4. Runde Klasse \klasse}}}
  } \vspace*{2.5mm}}%
  \ohead[]{\setstretch{1.5} \normalsize \parbox{0.25\textwidth}{\opt{rd2,rd3,rd4}{\begin{flushright}\framebox[2.5cm]{\Large\bfseries \the\numexpr \cyear - 2000 \relax \klasse - \hfill}\end{flushright}}}}%
  \cfoot[]{\vspace{-4\baselineskip}\thepage~/ \pageref{TotPages}}%
}
% % for use on IPhO-paper
% \DeclareOption{iphopaper}{%
%   \setlength{\textwidth}{168mm}%
%   \setlength{\textheight}{202mm}%
%   \setlength{\oddsidemargin}{-5mm}%
%   \setlength{\evensidemargin}{-5mm}%
%   \setlength{\topmargin}{8mm}%
%   \setlength{\headheight}{38pt}%
%   \setlength{\headsep}{24pt}%
%   \cfoot[\thepage~/ \pageref{TotPages}]{\thepage~/ \pageref{TotPages}}%
% }

% % for use on IPhO-paper with background image
% \DeclareOption{iphopaperbckgrd}{%
%   \setlength{\textwidth}{168mm}%
%   \setlength{\textheight}{202mm}%
%   \setlength{\oddsidemargin}{-5mm}%
%   \setlength{\evensidemargin}{-5mm}%
%   \setlength{\topmargin}{8mm}%
%   \setlength{\headheight}{38pt}%
%   \setlength{\headsep}{24pt}%
%   \cfoot[\thepage~/ \pageref{TotPages}]{\thepage~/ \pageref{TotPages}}%
%   \CenterWallPaper{1}{IPhO_Briefpapier_2011.pdf}%
% }

\ProcessOptions\relax

\newcommand{\plainpaperoption}{plainpaper_Cds}


% \ifx\paperoption\plainpaperoption
%   % for solutions
%   \ifdefined\solutions
%     \chead{\qquad\ifdefined\runde \runde{} - \fi\klausur{} - Musterlösung \comm{- \todayshort}}
%   \else
%   % for tasks
%     \chead{\qquad\ifdefined\runde \runde{} - \fi\klausur{} \comm{- \todayshort}}
%   \fi
% \else
%   \rohead{\ifdefined\runde
%             \begin{minipage}[c]{12cm}
%             \begin{flushright}
%                {\usefont{T1}{cmss}{bx}{it} \runde{}\\
%                              \rundeinst{}, \klausurdate{}}
%             \end{flushright}
%             \end{minipage}
%             \hspace{.2cm}
%             \rundeinstlogo{}
%             \vspace{6pt}
%           \fi
%          }
%   \lohead{\comm{{\usefont{T1}{cmss}{bx}{it}Stand: \todayshort}}}
% \fi


%  Colors
% ===================
  \definecolor{dgray}{rgb}{0.8,0.8,0.8}    % dark grey
  \definecolor{mgray}{rgb}{0.85,0.85,0.85} % medium grey
  \definecolor{lgray}{rgb}{0.9,0.9,0.9}    % light grey
  \definecolor{ichodark}{RGB}{0, 110, 168}
  \definecolor{ichobright}{RGB}{0, 183, 255}
  % \definecolor{taskblue}{RGB}{0,64,130}
  \definecolor{cdscolor}{RGB}{157, 45, 114}

%  Labelling in lists
% ====================
  \renewcommand{\labelenumi}{\alph{enumi})}
  \renewcommand{\labelenumii}{\roman{enumii}.}
  \renewcommand{\labelitemi}{$\bullet$}
  \renewcommand{\figurename}{Abb.}

%  Gliederungsformate
% ====================
  %\numberwithin{equation}{section}

  \addtokomafont{section}{\color{ichodark}\large\fontseries{b}}
  \addtokomafont{subsection}{\color{ichodark}\normalsize\fontseries{b}}
  \setcapindent{0em} % no indentation in captions

  \newcommand{\tasksection}[2][]{
    \renewcommand{\thesection}{Aufgabe \arabic{section}} %
    \section[#2]{#2 \hfill #1} %
    \renewcommand{\thesection}{\arabic{section}}}

  \newcommand{\tasksectionnumbered}[3][]{ % tasksection with given tasknumber
    \renewcommand{\thesection}{Aufgabe #2} %
    \section[#3]{- #3 \hfill #1} %
    \renewcommand{\thesection}{\arabic{section}}}

  \newenvironment{enumsec} % enumeration with section number included
    % added \addtolength{\leftmargin}{4pt} to account for higher counter numbers 20170119
    {\begin{list}%
    {\thesection.\alph{enumi})}%
    {\usecounter{enumi}\addtolength{\leftmargin}{6pt}\addtolength{\labelwidth}{26pt}\setlength{\topsep}{0pt}}}
    {\end{list}}

  \ifdefined\solutions
    \newcommand{\solnewpage}{\newpage}
    \newcommand{\tasknewpage}{\newpage}
  \else
    \newcommand{\solnewpage}{} % prevents too many newpages when printed without solutions
    \newcommand{\tasknewpage}{\newpage $\,$ \newpage} % produce empty page in between tasks
  \fi

  \newcommand{\newpageorspace}{
  \ifdefined\solutions
   \newpage
   \else
   \vspace*{0.5cm}
   \fi
   }

  \newcounter{version} % Zur Versionsnachverfolgung
  \newcounter{hca}     % hilfscounter fuer Verweise auf andere label
                       % setzen mit \setcounter{hca}{X} % obsolete
  \newcounter{hcb}     % hilfscounter fuer Verweise auf andere label
  \newcounter{hcc}     % hilfscounter fuer Verweise auf andere label
  \newcommand{\hclabela}{\alph{hca})}
  \newcommand{\hclabelb}{\alph{hcb})}
  \newcommand{\hclabelc}{\alph{hcc})}

%Boxen fuer Formelsammlung
\newtcolorbox{formulabox}[1][]{
  colback=white,
  colframe=ichodark,
  coltitle=white,
  title={#1},
  sharp corners,
  boxrule=1pt,
  arc=0pt,
  outer arc=0pt,
  fonttitle=\bfseries
}

% Boxed Example environment
%================================
% choice between
% framed package (problem with color changes in box)
% mdframed (no rounded corners without losing pictures) ***used here***
% tcolorbox (problem with color changes within box)

  \mdfsetup{linecolor=iphodark, linewidth=1pt, backgroundcolor=lgray, skipbelow=0pt}
  \newmdenv[]{exmplbox}
  \newmdenv[linecolor=black!80,backgroundcolor=white]{studsolbox} % ,frametitle=Lösung

% OC Boxen
%================================
%stabiler Ansatz
%Speichervariablen (Num: Nummer der Verbindung; Sol: Loesung; Con: Inhalt in Schuelerversion) und drei Zaehler leer definieren fuer spaetere Umdefinition
\newcommand{\ocnumone}{}
\newcommand{\ocnumtwo}{}
\newcommand{\ocnumthree}{}
\newcommand{\ocnumfour}{}
\newcommand{\ocnumfive}{}
\newcommand{\ocnumsix}{}
\newcommand{\ocnumseven}{}
\newcommand{\ocnumeight}{}
\newcommand{\ocnumnine}{}
\newcommand{\ocnumten}{}
\newcommand{\ocnumeleven}{}
\newcommand{\ocnumtwelve}{}
\newcommand{\ocnumthirteen}{}
\newcommand{\ocnumfourteen}{}
\newcommand{\ocnumfifteen}{}
\newcommand{\ocnumsixteen}{}
\newcommand{\ocnumseventeen}{}
\newcommand{\ocnumeighteen}{}
\newcommand{\ocnumnineteen}{}
\newcommand{\ocnumtwenty}{}
\newcommand{\ocsolone}{}
\newcommand{\ocsoltwo}{}
\newcommand{\ocsolthree}{}
\newcommand{\ocsolfour}{}
\newcommand{\ocsolfive}{}
\newcommand{\ocsolsix}{}
\newcommand{\ocsolseven}{}
\newcommand{\ocsoleight}{}
\newcommand{\ocsolnine}{}
\newcommand{\ocsolten}{}
\newcommand{\ocsoleleven}{}
\newcommand{\ocsoltwelve}{}
\newcommand{\ocsolthirteen}{}
\newcommand{\ocsolfourteen}{}
\newcommand{\ocsolfifteen}{}
\newcommand{\ocsolsixteen}{}
\newcommand{\ocsolseventeen}{}
\newcommand{\ocsoleighteen}{}
\newcommand{\ocsolnineteen}{}
\newcommand{\ocsoltwenty}{}
\newcommand{\occonone}{}
\newcommand{\occontwo}{}
\newcommand{\occonthree}{}
\newcommand{\occonfour}{}
\newcommand{\occonfive}{}
\newcommand{\occonsix}{}
\newcommand{\occonseven}{}
\newcommand{\occoneight}{}
\newcommand{\occonnine}{}
\newcommand{\occonten}{}
\newcommand{\occoneleven}{}
\newcommand{\occontwelve}{}
\newcommand{\occonthirteen}{}
\newcommand{\occonfourteen}{}
\newcommand{\occonfifteen}{}
\newcommand{\occonsixteen}{}
\newcommand{\occonseventeen}{}
\newcommand{\occoneighteen}{}
\newcommand{\occonnineteen}{}
\newcommand{\occontwenty}{}
\newcommand{\oceingabehilf}{1} %zaehlt eingegebene Teilkasteninhalte
\newcommand{\ochilf}{1} %z\"ahlt Teilk\"asten
\FPset\ochsp{0} %merkt sich die bisherige H\"ohe des Gesamtkastens

%OC-Umgebung mit Zuruecksetzung aller Variablen
\newcommand{\ocanfang}{\begin{tikzpicture}\FPset\ochsp{0}}
\newcommand{\ocumbruch}{\end{tikzpicture}\newpage\begin{tikzpicture}}
\newcommand{\ocende}{\end{tikzpicture}\punkteausgabe
\grenewcommand{\ochilf}{1} %globale Zuruecksetzung, falls OC-Kasten in einer weiteren Umgebung drin
\grenewcommand{\oceingabehilf}{1}
\grenewcommand{\ocnumone}{}
\grenewcommand{\ocnumtwo}{}
\grenewcommand{\ocnumthree}{}
\grenewcommand{\ocnumfour}{}
\grenewcommand{\ocnumfive}{}
\grenewcommand{\ocnumsix}{}
\grenewcommand{\ocnumseven}{}
\grenewcommand{\ocnumeight}{}
\grenewcommand{\ocnumnine}{}
\grenewcommand{\ocnumten}{}
\grenewcommand{\ocnumeleven}{}
\grenewcommand{\ocnumtwelve}{}
\grenewcommand{\ocnumthirteen}{}
\grenewcommand{\ocnumfourteen}{}
\grenewcommand{\ocnumfifteen}{}
\grenewcommand{\ocnumsixteen}{}
\grenewcommand{\ocnumseventeen}{}
\grenewcommand{\ocnumeighteen}{}
\grenewcommand{\ocnumnineteen}{}
\grenewcommand{\ocnumtwenty}{}
\grenewcommand{\ocsolone}{}
\grenewcommand{\ocsoltwo}{}
\grenewcommand{\ocsolthree}{}
\grenewcommand{\ocsolfour}{}
\grenewcommand{\ocsolfive}{}
\grenewcommand{\ocsolsix}{}
\grenewcommand{\ocsolseven}{}
\grenewcommand{\ocsoleight}{}
\grenewcommand{\ocsolnine}{}
\grenewcommand{\ocsolten}{}
\grenewcommand{\ocsoleleven}{}
\grenewcommand{\ocsoltwelve}{}
\grenewcommand{\ocsolthirteen}{}
\grenewcommand{\ocsolfourteen}{}
\grenewcommand{\ocsolfifteen}{}
\grenewcommand{\ocsolsixteen}{}
\grenewcommand{\ocsolseventeen}{}
\grenewcommand{\ocsoleighteen}{}
\grenewcommand{\ocsolnineteen}{}
\grenewcommand{\ocsoltwenty}{}
\grenewcommand{\occonone}{}
\grenewcommand{\occontwo}{}
\grenewcommand{\occonthree}{}
\grenewcommand{\occonfour}{}
\grenewcommand{\occonfive}{}
\grenewcommand{\occonsix}{}
\grenewcommand{\occonseven}{}
\grenewcommand{\occoneight}{}
\grenewcommand{\occonnine}{}
\grenewcommand{\occonten}{}
\grenewcommand{\occoneleven}{}
\grenewcommand{\occontwelve}{}
\grenewcommand{\occonthirteen}{}
\grenewcommand{\occonfourteen}{}
\grenewcommand{\occonfifteen}{}
\grenewcommand{\occonsixteen}{}
\grenewcommand{\occonseventeen}{}
\grenewcommand{\occoneighteen}{}
\grenewcommand{\occonnineteen}{}
\grenewcommand{\occontwenty}{}
}

%Eingabe der Werte/Inhalte fuer oben initialisierte und von \ocinhalt aufgerufene Variablen, wobei \oceingabehilf hochzaehlt und Werte dem nächsten freien Variablensatz zuweist: 
\newcommand{\oc}[3]{
\ifthenelse{\equal{\oceingabehilf}{1}}{\renewcommand{\ocnumone}{#1}\renewcommand{\ocsolone}{#2}\renewcommand{\occonone}{#3}\grenewcommand{\oceingabehilf}{2}}
 {\ifthenelse{\equal{\oceingabehilf}{2}}{\renewcommand{\ocnumtwo}{#1}\renewcommand{\ocsoltwo}{#2}\renewcommand{\occontwo}{#3}\grenewcommand{\oceingabehilf}{3}}
  {\ifthenelse{\equal{\oceingabehilf}{3}}{\renewcommand{\ocnumthree}{#1}\renewcommand{\ocsolthree}{#2}\renewcommand{\occonthree}{#3}\grenewcommand{\oceingabehilf}{4}}
   {\ifthenelse{\equal{\oceingabehilf}{4}}{\renewcommand{\ocnumfour}{#1}\renewcommand{\ocsolfour}{#2}\renewcommand{\occonfour}{#3}\grenewcommand{\oceingabehilf}{5}}
    {\ifthenelse{\equal{\oceingabehilf}{5}}{\renewcommand{\ocnumfive}{#1}\renewcommand{\ocsolfive}{#2}\renewcommand{\occonfive}{#3}\grenewcommand{\oceingabehilf}{6}}
     {\ifthenelse{\equal{\oceingabehilf}{6}}{\renewcommand{\ocnumsix}{#1}\renewcommand{\ocsolsix}{#2}\renewcommand{\occonsix}{#3}\grenewcommand{\oceingabehilf}{7}}
      {\ifthenelse{\equal{\oceingabehilf}{7}}{\renewcommand{\ocnumseven}{#1}\renewcommand{\ocsolseven}{#2}\renewcommand{\occonseven}{#3}\grenewcommand{\oceingabehilf}{8}}
       {\ifthenelse{\equal{\oceingabehilf}{8}}{\renewcommand{\ocnumeight}{#1}\renewcommand{\ocsoleight}{#2}\renewcommand{\occoneight}{#3}\grenewcommand{\oceingabehilf}{9}}
        {\ifthenelse{\equal{\oceingabehilf}{9}}{\renewcommand{\ocnumnine}{#1}\renewcommand{\ocsolnine}{#2}\renewcommand{\occonnine}{#3}\grenewcommand{\oceingabehilf}{10}}
         {\ifthenelse{\equal{\oceingabehilf}{10}}{\renewcommand{\ocnumten}{#1}\renewcommand{\ocsolten}{#2}\renewcommand{\occonten}{#3}\grenewcommand{\oceingabehilf}{11}}
          {\ifthenelse{\equal{\oceingabehilf}{11}}{\renewcommand{\ocnumeleven}{#1}\renewcommand{\ocsoleleven}{#2}\renewcommand{\occoneleven}{#3}\grenewcommand{\oceingabehilf}{12}}
           {\ifthenelse{\equal{\oceingabehilf}{12}}{\renewcommand{\ocnumtwelve}{#1}\renewcommand{\ocsoltwelve}{#2}\renewcommand{\occontwelve}{#3}\grenewcommand{\oceingabehilf}{13}}
            {\ifthenelse{\equal{\oceingabehilf}{13}}{\renewcommand{\ocnumthirteen}{#1}\renewcommand{\ocsolthirteen}{#2}\renewcommand{\occonthirteen}{#3}\grenewcommand{\oceingabehilf}{14}}
             {\ifthenelse{\equal{\oceingabehilf}{14}}{\renewcommand{\ocnumfourteen}{#1}\renewcommand{\ocsolfourteen}{#2}\renewcommand{\occonfourteen}{#3}\grenewcommand{\oceingabehilf}{15}}
              {\ifthenelse{\equal{\oceingabehilf}{15}}{\renewcommand{\ocnumfifteen}{#1}\renewcommand{\ocsolfifteen}{#2}\renewcommand{\occonfifteen}{#3}\grenewcommand{\oceingabehilf}{16}}
               {\ifthenelse{\equal{\oceingabehilf}{16}}{\renewcommand{\ocnumsixteen}{#1}\renewcommand{\ocsolsixteen}{#2}\renewcommand{\occonsixteen}{#3}\grenewcommand{\oceingabehilf}{17}}
                {\ifthenelse{\equal{\oceingabehilf}{17}}{\renewcommand{\ocnumseventeen}{#1}\renewcommand{\ocsolseventeen}{#2}\renewcommand{\occonseventeen}{#3}\grenewcommand{\oceingabehilf}{18}}
                 {\ifthenelse{\equal{\oceingabehilf}{18}}{\renewcommand{\ocnumeighteen}{#1}\renewcommand{\ocsoleighteen}{#2}\renewcommand{\occoneighteen}{#3}\grenewcommand{\oceingabehilf}{19}}
                  {\ifthenelse{\equal{\oceingabehilf}{19}}{\renewcommand{\ocnumnineteen}{#1}\renewcommand{\ocsolnineteen}{#2}\renewcommand{\occonnineteen}{#3}\grenewcommand{\oceingabehilf}{20}}
                   {\ifthenelse{\equal{\oceingabehilf}{20}}{\renewcommand{\ocnumtwenty}{#1}\renewcommand{\ocsoltwenty}{#2}\renewcommand{\occontwenty}{#3}\grenewcommand{\oceingabehilf}{21}}
                    {}}}}}}}}}}}}}}}}}}}}
}



%Hilfsbefehl fuer \ockasten, gibt entsprechend der von \ochilf gezaehlten Teilkaesten den Inhalt des Variablensatzes fuer diesen Teilkasten zurueck
\newcommand{\ocinhalt}{
\ifthenelse{\equal{\ochilf}{1}}{\textbf{\ocnumone}\\\opt{1,2}{\ocsolone}\opt{0}{\occonone}\grenewcommand{\ochilf}{2}}
 {\ifthenelse{\equal{\ochilf}{2}}{\textbf{\ocnumtwo}\\\opt{1,2}{\ocsoltwo}\opt{0}{\occontwo}\grenewcommand{\ochilf}{3}}
  {\ifthenelse{\equal{\ochilf}{3}}{\textbf{\ocnumthree}\\\opt{1,2}{\ocsolthree}\opt{0}{\occonthree}\grenewcommand{\ochilf}{4}}
   {\ifthenelse{\equal{\ochilf}{4}}{\textbf{\ocnumfour}\\\opt{1,2}{\ocsolfour}\opt{0}{\occonfour}\grenewcommand{\ochilf}{5}}
    {\ifthenelse{\equal{\ochilf}{5}}{\textbf{\ocnumfive}\\\opt{1,2}{\ocsolfive}\opt{0}{\occonfive}\grenewcommand{\ochilf}{6}}
     {\ifthenelse{\equal{\ochilf}{6}}{\textbf{\ocnumsix}\\\opt{1,2}{\ocsolsix}\opt{0}{\occonsix}\grenewcommand{\ochilf}{7}}
      {\ifthenelse{\equal{\ochilf}{7}}{\textbf{\ocnumseven}\\\opt{1,2}{\ocsolseven}\opt{0}{\occonseven}\grenewcommand{\ochilf}{8}}
       {\ifthenelse{\equal{\ochilf}{8}}{\textbf{\ocnumeight}\\\opt{1,2}{\ocsoleight}\opt{0}{\occoneight}\grenewcommand{\ochilf}{9}}
        {\ifthenelse{\equal{\ochilf}{9}}{\textbf{\ocnumnine}\\\opt{1,2}{\ocsolnine}\opt{0}{\occonnine}\grenewcommand{\ochilf}{10}}
         {\ifthenelse{\equal{\ochilf}{10}}{\textbf{\ocnumten}\\\opt{1,2}{\ocsolten}\opt{0}{\occonten}\grenewcommand{\ochilf}{11}}
          {\ifthenelse{\equal{\ochilf}{11}}{\textbf{\ocnumeleven}\\\opt{1,2}{\ocsoleleven}\opt{0}{\occoneleven}\grenewcommand{\ochilf}{12}}
           {\ifthenelse{\equal{\ochilf}{12}}{\textbf{\ocnumtwelve}\\\opt{1,2}{\ocsoltwelve}\opt{0}{\occontwelve}\grenewcommand{\ochilf}{13}}
            {\ifthenelse{\equal{\ochilf}{13}}{\textbf{\ocnumthirteen}\\\opt{1,2}{\ocsolthirteen}\opt{0}{\occonthirteen}\grenewcommand{\ochilf}{14}}
             {\ifthenelse{\equal{\ochilf}{14}}{\textbf{\ocnumfourteen}\\\opt{1,2}{\ocsolfourteen}\opt{0}{\occonfourteen}\grenewcommand{\ochilf}{15}}
              {\ifthenelse{\equal{\ochilf}{15}}{\textbf{\ocnumfifteen}\\\opt{1,2}{\ocsolfifteen}\opt{0}{\occonfifteen}\grenewcommand{\ochilf}{16}}
               {\ifthenelse{\equal{\ochilf}{16}}{\textbf{\ocnumsixteen}\\\opt{1,2}{\ocsolsixteen}\opt{0}{\occonsixteen}\grenewcommand{\ochilf}{17}}
                {\ifthenelse{\equal{\ochilf}{17}}{\textbf{\ocnumseventeen}\\\opt{1,2}{\ocsolseventeen}\opt{0}{\occonseventeen}\grenewcommand{\ochilf}{18}}
                 {\ifthenelse{\equal{\ochilf}{18}}{\textbf{\ocnumeighteen}\\\opt{1,2}{\ocsoleighteen}\opt{0}{\occoneighteen}\grenewcommand{\ochilf}{19}}
                  {\ifthenelse{\equal{\ochilf}{19}}{\textbf{\ocnumnineteen}\\\opt{1,2}{\ocsolnineteen}\opt{0}{\occonnineteen}\grenewcommand{\ochilf}{20}}
                   {\ifthenelse{\equal{\ochilf}{20}}{\textbf{\ocnumtwenty}\\\opt{1,2}{\ocsoltwenty}\opt{0}{\occontwenty}\grenewcommand{\ochilf}{21}}
                    {}}}}}}}}}}}}}}}}}}}}
%ochilf muss global gezaehlt werden, daher via grenewcommand
}

%OC-Kasten: Rechteck mit Textbreite, dann Erkennung fester Spaltenverteilung (1. Argument) für vertikale Unterteilungsstriche und passende minipage-Umgebungen in den Teilkaestchen; Zeilenhoehe als 2. Argument; jeder Teilkasten ruft Inhalt aus \ocinhalt ab, bleibt ohne vorherige Inhaltsangabe leer
\newcommand{\ockasten}[2]{
\draw (0, -\ochsp) rectangle (\linewidth-0.4pt, -\ochsp-#2);

\ifthenelse{\equal{#1}{1}}{\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{\linewidth}\ocinhalt\end{minipage}};}

 {\ifthenelse{\equal{#1}{11}}{\draw (0.5\linewidth-0.2pt, -\ochsp) -- (0.5\linewidth-0.2pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.48\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.5\linewidth-0.2pt, -\ochsp) {\begin{minipage}{0.48\linewidth}\ocinhalt\end{minipage}};}

  {\ifthenelse{\equal{#1}{12}}{\draw (0.333333\linewidth-0.13pt, -\ochsp) -- (0.333333\linewidth-0.13pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.32\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.333333\linewidth-0.13pt, -\ochsp) {\begin{minipage}{0.64\linewidth}\ocinhalt\end{minipage}};}

   {\ifthenelse{\equal{#1}{21}}{\draw (0.666667\linewidth-0.26pt, -\ochsp) -- (0.666667\linewidth-0.26pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.64\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.666667\linewidth-0.26pt, -\ochsp) {\begin{minipage}{0.32\linewidth}\ocinhalt\end{minipage}};}

    {\ifthenelse{\equal{#1}{111}}{\draw (0.333333\linewidth-0.13pt, -\ochsp) -- (0.333333\linewidth-0.13pt, -\ochsp-#2);\draw (0.666667\linewidth-0.26pt, -\ochsp) -- (0.666667\linewidth-0.26pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.32\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.333333\linewidth-0.13pt, -\ochsp) {\begin{minipage}{0.32\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.666667\linewidth-0.26pt, -\ochsp) {\begin{minipage}{0.32\linewidth}\ocinhalt\end{minipage}};}

     {\ifthenelse{\equal{#1}{211}}{\draw (0.5\linewidth-0.2pt, -\ochsp) -- (0.5\linewidth-0.2pt, -\ochsp-#2);\draw (0.75\linewidth-0.3pt, -\ochsp) -- (0.75\linewidth-0.3pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.48\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.5\linewidth-0.2pt, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.75\linewidth-0.3pt, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};}

      {\ifthenelse{\equal{#1}{121}}{\draw (0.25\linewidth-0.1pt, -\ochsp) -- (0.25\linewidth-0.1pt, -\ochsp-#2);\draw (0.75\linewidth-0.3pt, -\ochsp) -- (0.75\linewidth-0.3pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.25\linewidth-0.1pt, -\ochsp) {\begin{minipage}{0.48\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.75\linewidth-0.3pt, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};}

       {\ifthenelse{\equal{#1}{112}}{\draw (0.25\linewidth-0.1pt, -\ochsp) -- (0.25\linewidth-0.1pt, -\ochsp-#2);\draw (0.5\linewidth-0.2pt, -\ochsp) -- (0.5\linewidth-0.2pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.25\linewidth-0.1pt, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.5\linewidth-0.2pt, -\ochsp) {\begin{minipage}{0.48\linewidth}\ocinhalt\end{minipage}};}

        {\ifthenelse{\equal{#1}{1111}}{\draw (0.25\linewidth-0.1pt, -\ochsp) -- (0.25\linewidth-0.1pt, -\ochsp-#2);\draw (0.5\linewidth-0.2pt, -\ochsp) -- (0.5\linewidth-0.2pt, -\ochsp-#2);\draw (0.75\linewidth-0.3pt, -\ochsp) -- (0.75\linewidth-0.3pt, -\ochsp-#2);\node[anchor=north west] at (0, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.25\linewidth-0.1pt, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.5\linewidth-0.2pt, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};\node[anchor=north west] at (0.75\linewidth-0.3pt, -\ochsp) {\begin{minipage}{0.24\linewidth}\ocinhalt\end{minipage}};}
         {}}}}}}}}}
\FPeval{\ochsp}{\ochsp+#2}
}

% experimental
\ExplSyntaxOn

% package level definitions
\tl_new:N \l__kastenarray_left_tl
\tl_new:N \l__kastenarray_right_tl
\int_new:N \l_len_int
\tl_new:N \l_row_tl
\tl_new:N \l_tmpl_tl
\tl_new:N \l_tmpr_tl
\tl_new:N \l_frame_tl

% public package interface command
\cs_new:Npn \kastenarray_zip:nnnnn #1 #2 #3 #4 #5 {
  \clist_set:Nn \l__kastenarray_left_tl {#4}
  \clist_set:Nn \l__kastenarray_right_tl {#5}
  \tl_clear:N \l_row_tl
  \tl_clear:N \l_tmpl_tl
  \tl_clear:N \l_tmpr_tl
  \tl_clear:N \l_frame_tl
  \int_set:Nn \l_len_int { \clist_count:N \l__kastenarray_left_tl }
  \int_step_inline:nnnn 1 1 {\l_len_int - 1}
    {%
      \clist_pop:NN \l__kastenarray_left_tl \l_tmpl_tl
      \clist_pop:NN \l__kastenarray_right_tl \l_tmpr_tl
      \tl_set:NV \l_frame_tl {\begin{minipage}[t][#2][t]{#1}}
          \tl_put_right:NV \l_frame_tl {\textbf{\l_tmpl_tl}\par\centering\opt{1,2}{\l_tmpr_tl}}
          \tl_put_right:NV \l_frame_tl {\end{minipage}}
      \tl_put_right:NV \l_row_tl {\begin{tcolorbox}}
          \tl_put_right:Nx \l_row_tl {\exp_not:V \l_frame_tl}
          \tl_put_right:NV \l_row_tl {\end{tcolorbox}}
      %\tl_put_right:Nx \l_row_tl { \frame{ \exp_not:V \l_frame_tl} }
      \tl_put_right:NV \l_row_tl {\hspace*{#3}}
      \tl_put_right:Nn \l_row_tl {&}
    }
  \clist_pop:NN \l__kastenarray_left_tl \l_tmpl_tl
  \clist_pop:NN \l__kastenarray_right_tl \l_tmpr_tl
  \tl_set:NV \l_frame_tl {\begin{minipage}[t][#2][t]{#1}}
      \tl_put_right:NV \l_frame_tl {\textbf{\l_tmpl_tl}\par\centering\opt{1,2}{\l_tmpr_tl}}
      \tl_put_right:NV \l_frame_tl {\end{minipage}}
  \tl_put_right:NV \l_row_tl {\begin{tcolorbox}}
      \tl_put_right:Nx \l_row_tl {\exp_not:V \l_frame_tl}
      \tl_put_right:NV \l_row_tl {\end{tcolorbox}}
  %\tl_put_right:Nx \l_row_tl { \frame{ \exp_not:V \l_frame_tl} }
  %\tl_put_right:Nn \l_row_tl {\\}
  \begin{center}
    \tcbset{
      width=#1 + 6.3pt,
      colframe=black,
      colback=white,
      boxrule=0.4pt,
      arc=0pt,
      halign=left,
      boxsep=3pt,
      left=0pt,
      right=0pt,
      top=0pt,
      bottom=0pt,
    }
    \setlength{\tabcolsep}{0pt}
    \setlength{\textfloatsep}{0pt}
    \setlength{\parskip}{0pt}
    \begin{tabular}{*{\l_len_int}{c}}
      \l_row_tl
    \end{tabular}
  \end{center}
}

% xparse interface
\NewDocumentCommand{\kastenarray}{ m m O{0cm} O{t} m m }{
  \kastenarray_zip:nnnnn {#1} {#2} {#3} {#5} {#6}
  \IfValueTF{#4}{%
    \tl_if_eq:nnTF {#4} {t} {
      \vspace*{-2.16\baselineskip}
    }{}
  }{}
}
\ExplSyntaxOff

% other commands
%================================
  \newcommand{\marcs}[1]{\mbox{(#1~Pkt.)}}
  \newcommand{\marcsinl}[1]{\mbox{\emph{(#1 Pkt.)}}}
  \newcommand{\from}[1]{\vspace{-\parskip}\vspace{-5pt}   % -1.8\parskip
  {\normalsize\itshape\color{gray} (#1)}\par}
  \newcommand{\auth}[1]{{\normalsize\itshape(Idee: #1)}\par\vspace*{4pt}}
  \newcommand{\diffic}[1]{% Difficulty estimation (1-7)
    \ifthenelse{\equal{#1}{1}}{\LEFTcircle\Circle\Circle}          % 1-2 Pkt.
     {\ifthenelse{\equal{#1}{2}}{\CIRCLE\Circle\Circle}            % 2-3 Pkt.
       {\ifthenelse{\equal{#1}{3}}{\CIRCLE\LEFTcircle\Circle}      % 3-4 Pkt.
         {\ifthenelse{\equal{#1}{4}}{\CIRCLE\CIRCLE\Circle}        % 4-5 Pkt.
           {\ifthenelse{\equal{#1}{5}}{\CIRCLE\CIRCLE\LEFTcircle}  % 5-6 Pkt.
             {\ifthenelse{\equal{#1}{6}}{\CIRCLE\CIRCLE\CIRCLE}    % 6-7 Pkt.
               {\ifthenelse{\equal{#1}{7}}{\CIRCLE\CIRCLE\CIRCLE*} % > 7 Pkt.
               {}}}}}}}}                                           % other

  \newcommand{\picright}[3]{\begin{minipage}[t]
	  {\textwidth-1em-#1}#2\end{minipage}\hfill % to put pictures aside text
    \begin{minipage}[t]{#1}#3\end{minipage}}

  \newcommand{\picleft}[3]{\begin{minipage}[t]{#1}#3\end{minipage}
     \hfill\begin{minipage}[t]{\textwidth-1em-#1}#2\end{minipage}}

  \newcommand{\listpicright}[3]{\begin{minipage}[t]
	  {\textwidth-\leftmargin-1em-#1}#2\end{minipage}\hfill
		% to put pictures aside text in list
    \begin{minipage}[t]{#1}#3\end{minipage}}

  \newcommand{\leadingzero}[1]{\ifnum #1<10 0\the#1\else\the#1\fi}
  \newcommand{\todayshort}{\leadingzero{\day}.\leadingzero{\month}.\the\year}
  \newcommand{\comm}[1]{\textcolor{red}{#1}}
  \newcommand{\corr}[1]{\textcolor{red}{#1}}
  \newcommand{\hide}[1]{}

  \newcommand{\authorcom}[1]{\todo[color=green!40,author=Autor, inline]{#1}}
  \newcommand{\corone}[1]{\todo[color=blue!40,author=Erstkorrektur, inline]{#1}}
  \newcommand{\cortwo}[1]{\todo[color=orange!40,author=Zweitkorrektur, inline]{#1}}
  \newcommand{\corend}[1]{\todo[color=magenta!40,author=Endkorrektur, inline]{#1}}

  \newcommand{\changefont}[3]{
    \fontfamily{#1} \fontseries{#2} \fontshape{#3} \selectfont}

  \newcommand{\millipapier}[3]{
    \begin{center}
	\begin{tikzpicture}[scale=#1]
  	% Draw the grid (millimeter paper)
  	\draw[step=1mm, lightgray, very thin] (0, 0) grid (#2, #3); % 1mm steps
  	\draw[step=5mm, darkgray, thin] (0, 0) grid (#2, #3);    % 5mm steps (darker)
	\end{tikzpicture}
    \end{center}}

    \newcommand{\gaptext}[2]{%Ohne diesen Kommentar extra Leerzeiche
    \settowidth{\textlength}{#1}%Legt Länge der Eingabe als \textlength fest
    \setlength{\textlength}{3\textlength}%Mal 3, da Schüler mehr Platz braucht
    \opt{1,2}{\underline{\textcolor{red}{#1}}}%Für Lösung
    \ifthenelse{\equal{#2}{}}%
            {\opt{0}{\underline{\hspace{\textlength}}}}%automatische Länge
            {\opt{0}{\underline{\hspace{#2}}}}%Angegebene Länge
    }

%   \newcommand{\ipho}[2]{\href{http://ipho.org/problems-and-solutions.html}{Internationale PhysikOlympiade} #1, Aufgabe #2}
%   \newcommand{\apho}[2]{\href{http://apho.phy.ntnu.edu.tw/papho2010.html}{APhO} #1, Aufgabe #2}
% %  \DeclareDocumentCommand{\iphode}{m m g}{%
% %        Auswahlwettbewerb zur IPhO #1, #2.~Runde\IfNoValueF {#3} {, Aufgabe #3}}
%   \DeclareDocumentCommand{\iphode}{m m g}{%
%         Auswahlwettbewerb zur IPhO #1, #2.~Runde\IfNoValueF {#3} {}}

%% ***************************
%% **** ENDE Klassendatei ****
%% ***************************
