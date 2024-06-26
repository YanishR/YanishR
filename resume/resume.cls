% resume.cls

% \documentstyle{resume}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Copyright (C) 2010 by Trey Hunner
%
% Copying and distribution of this file, with or without modification,
% are permitted in any medium without royalty provided the copyright
% notice and this notice are preserved.  This file is offered as-is,
% without any warranty.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[11pt,letterpaper]{article}
%\usepackage{fontspec}
%\setmainfont{Times New Roman}

\usepackage[parfill]{parskip}       % Do not indent paragraphs
\usepackage{array}                  % required for boldface tabular columns
\usepackage{ifthen}
\usepackage{soul}

\nofiles                            % .aux files are not needed for resumes
\pagestyle{empty}                   % resumes do not need page numbers

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HEADINGS: Commands for printing name and address

\def \name#1{\def\@name{#1}}        % \name command can be used to set name
\def \@name {}                      % Set \@name to empty by default

\def \addressSep {$|$}         % Set default address seperator

% One or two address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax

% \address command can be used to set first and second address (optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
    \def \@addressone {#1}
  }
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% DOCUMENT: Create the head of the document

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document                     % Begin document
  \printname                        % Print the name specified with \name
  \@ifundefined{@addressone}{}{     % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{     % Print the second address if specified
    \printaddress{\@addresstwo}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SECTIONS: Create section headings

% Used to create large resume section
\newenvironment{rSection}[1]{
  \sectionskip
  \MakeUppercase{\bf #1}
  \sectionlineskip
  \hrule
  \begin{list}{}{
    \setlength{\leftmargin}{0em}
  }
  \item[]
}{
  \end{list}
  \vspace{-0.7em}
}

% Used to format job listing
\newenvironment{rSubsection}[4]{
  %%%%%%%%%%%%%%%%%%%%%% Default Layout: %%%%%%%%%%%%%%%%%%%%%%%%
  %%    Employer (bold)                     Dates (regular)    %%
  %%    Title (emphasis)                Location (emphasis)    %%
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  {\bf #1}                 \hfill                  {    #2}% Stop a space
  \ifthenelse{\equal{#3}{}}{}{
  \\
  { #3}                 \hfill                  {\em #4}% Stop a space
  }
  % \cdot used for bullets, items non-indented
  \vspace{-.2em}
  \begin{list}{\Large$\cdot$}{\leftmargin=0.792em}
  \itemsep -0.4em \vspace{-0.5em}
}{
  \end{list}
  \vspace{-.3em}
}

\def\namesize{\huge}
\def\nameskip{\smallskip}
\def\addressskip{\smallskip}
\def\sectionskip{\bigskip}
\def\sectionlineskip{\medskip}
