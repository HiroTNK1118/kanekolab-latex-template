% 金子研究室 簡易レポート用 LaTeX クラス
% 2段組 A4 11pt

\ProvidesClass{classes/report2col}[2026/08/03]


% LuaLaTeX向け互換設定
\RequirePackage{plautopatch}
\NeedsTeXFormat{LaTeX2e}


%==================================================
% 基本クラス
%==================================================

\LoadClass[
  a4paper,
  11pt,
  twocolumn
]{ltjsarticle}


%==================================================
% 日本語設定
%==================================================

\RequirePackage{luatexja}


%==================================================
% ページレイアウト
%==================================================

\RequirePackage[
  top=20mm,
  bottom=20mm,
  left=18mm,
  right=18mm,
  columnsep=8mm
]{geometry}


%==================================================
% 基本パッケージ
%==================================================

\RequirePackage{subfiles}

\RequirePackage{graphicx}

\PassOptionsToPackage{hyphens}{url}
\RequirePackage[hyphens]{xurl}
\urlstyle{same}

\RequirePackage{
  amsmath,
  amssymb,
  % mathtools
}

\RequirePackage[style=base]{
  caption
}
\RequirePackage{
  subcaption
}

\RequirePackage{here}

\RequirePackage{
  tabularray,
  tabularx,
  multirow
}

\RequirePackage{
  % enumitem,
  paralist
}

\RequirePackage{
  minted
}

\RequirePackage{
  siunitx
}

\RequirePackage{
  framed,
  indentfirst
}


%==================================================
% ハイパーリンク
%==================================================

\RequirePackage[
  unicode,
  hidelinks,
  pdfusetitle
]{hyperref}



%==================================================
% フォント設定
%==================================================

\RequirePackage[
  no-math,
  match
]{luatexja-fontspec}


% 欧文
\setmainfont{STIX Two Text}


% 等幅
\setmonofont{IBM Plex Mono}[
  Scale=0.9,
  BoldFont=* SmBld,
  BoldItalicFont=* SmBld Italic
]


% 数式
\RequirePackage{unicode-math}
\setmathfont{STIX Two Math}



%==================================================
% 図表設定
%==================================================

\captionsetup[figure]
{
  labelsep=space,
  labelformat=simple,
  name=図
}

\captionsetup[table]
{
  labelsep=space,
  labelformat=simple,
  name=表
}


\captionsetup[subfigure]
{
  labelsep=space,
  labelformat=simple,
  name=図
}

\renewcommand*{\thesubfigure}{(\alph{subfigure})}



%==================================================
% Float設定
%==================================================

\renewcommand\topfraction{0.95}
\renewcommand\bottomfraction{0.95}
\renewcommand\textfraction{0.05}



%==================================================
% 定理環境
%==================================================

\newtheorem{definition}{定義}



%==================================================
% bm互換
%==================================================

\newcommand{\bm}[1]{\symbfit{#1}}



%==================================================
% タイトル情報
%==================================================

% 本文側で定義されることを想定
% \myNameJa
% \myNameEn
% \studentNumber
% \titleJa
% \titleEn
% \dateOfSubmission
% \teacherName


\renewcommand{\maketitle}{

\twocolumn[
\begin{center}

{\LARGE\bfseries
\titleJa
\par
}

\vspace{3mm}


{\large
\titleEn
\par
}


\vspace{5mm}


\begin{tabular}{c}
\myNameJa\quad
\myNameEn\quad
学籍番号：\studentNumber
\\
指導教員：\teacherName
\\
\dateOfSubmission
\end{tabular}


\end{center}


\vspace{8mm}

]


}


%==================================================
% section設定
%==================================================

\RequirePackage{titlesec}


\titleformat{\section}
{\large\bfseries}
{\thesection}
{1em}
{}


\titleformat{\subsection}
{\normalsize\bfseries}
{\thesubsection}
{1em}
{}


\titlespacing*{\section}
{0pt}
{1.5ex}
{0.5ex}


\titlespacing*{\subsection}
{0pt}
{1ex}
{0.3ex}