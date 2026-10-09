% 金子研究室 修士論文用 LaTeX クラス
% LuaLaTeX / A4 / 11pt / 1段組み
%
% 使用方法:
%   \documentclass{classes/Mthesis}
%
% 著者名・題目などは本文側で定義する。
% 表紙: \makethesistitle
% 要旨見出し: \makethesisabstracttitle

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{classes/mthesis}[2026/10/09]

%==================================================
% 基本クラス
%==================================================

\LoadClass[a4paper,11pt,openany]{ltjsreport}

%==================================================
% パッケージ
%==================================================

\RequirePackage{luatexja}
\RequirePackage{graphicx} % 図表関連のパッケージ
\PassOptionsToPackage{hyphens}{url}
\RequirePackage{setspace} % 行間設定用パッケージ
\RequirePackage{caption} % キャプションとサブキャプションのパッケージ
\RequirePackage{subcaption}
\RequirePackage{here} % 好きな位置にfigなどを置くためのパッケージ
\RequirePackage[hyphens]{xurl} % URLを表示するためのパッケージ、ハイフンでの改行を許可
\urlstyle{same} % URLの表示形式を本文と同じにする
\RequirePackage{paralist} % インラインリストのパッケージ
\RequirePackage{amssymb, amsmath, amsthm} % 高度な数式記述用パッケージ
\RequirePackage{mathtools} % 高度な数式記述用パッケージ
\RequirePackage{tabularray} % 高度な表組み用パッケージ
\RequirePackage{minted} % ソースコード表示の用パッケージ
\RequirePackage{siunitx} % SI単位記法に準拠した形式で単位を書くためのパッケージ
\RequirePackage{subfiles} % 大規模な文章を分割して記述して、統合するためのパッケージ
\RequirePackage{enumitem} % 高機能番号付き箇条書きのパッケージ
\RequirePackage{xr} % 分割されたファイル間でラベルなどを相互参照するためのパッケージ
\RequirePackage{indentfirst} % 最初の段落でインデントするためのパッケージ
\RequirePackage{framed} % 囲み付き文章を出すためのパッケージ
\RequirePackage{type1cm} % 文字の大きさを自由に変えるためのパッケージ
\RequirePackage{tabularx} % 表の幅を指定するためのパッケージ
%%%%% ここに自分でパッケージを追加
\RequirePackage{tikz}
\RequirePackage{multirow}
%%%%%%
\RequirePackage[
    unicode,
    hidelinks,
    pdfusetitle
]{hyperref} % ハイパーリンクのパッケージ

%==================================================
% フォント
%   和文フォント - 原ノ味（デフォルト値）
%   英文フォント - STIX Two Text
%   等幅フォント - IBM Plex Mono
%   数式フォント - STIX Two Math
%==================================================

\RequirePackage[no-math,match]{luatexja-fontspec}

% 和文フォントは LuaTeX-ja のデフォルト設定を利用
\setmainfont{STIX Two Text}

\setmonofont{IBM Plex Mono}[
  Scale=0.9,
  BoldFont=* SmBld,
  BoldItalicFont=* SmBld Italic
]

\RequirePackage[
  % mathtoolsと一部競合するため，警告を無視
  warnings-off={mathtools-colon,mathtools-overbracket}
]{unicode-math}
\setmathfont{STIX Two Math}

%==================================================
% 定理環境
%==================================================

\theoremstyle{definition}
\newtheorem{definition}{定義}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem*{example*}{例}

%==================================================
% 証明環境
%==================================================

\renewcommand{\proofname}{証明}

%==================================================
% 図表の配置
%==================================================

\renewcommand\topfraction{.99}
\renewcommand\bottomfraction{.99}
\renewcommand\textfraction{.01}

%==================================================
% 図表のキャプション
%==================================================

\captionsetup[figure]{labelsep=space, labelformat=simple, name=図}
\captionsetup[subfigure]{labelsep=space, labelformat=simple, name=図}
\renewcommand*{\thesubfigure}{(\alph{subfigure})}
\captionsetup[table]{labelsep=space, labelformat=simple, name=表}

%==================================================
% ソースコード表示
%==================================================

\setminted{
    fontsize=\small,
    breaklines,
    linenos,
    frame=lines,
    tabsize=4
}

%==================================================
% 文献管理補助
%==================================================

% BibTeX の制御エントリを引用リストに記録する。
% 使用例: \bstctlcite{IEEEexample:BSTcontrol}
\makeatletter
\newcommand{\bstctlcite}{%
  \@ifnextchar[{\@bstctlcite}{\@bstctlcite[@auxout]}%
}
\def\@bstctlcite[#1]#2{%
  \@bsphack
  \@for\@citeb:=#2\do{%
    \edef\@citeb{\expandafter\@firstofone\@citeb}%
    \if@filesw
      \immediate\write\csname #1\endcsname{%
        \string\citation{\@citeb}%
      }%
    \fi
  }%
  \@esphack
}
\makeatother

%==================================================
% 修士論文のメタデータ
%==================================================

% 以下のコマンドは本文側で定義する:
% \myNameJa
% \myNameEn
% \studentNumber
% \yearOfEnrollment
% \titleJa
% \titleJaLarge
% \titleEn
% \titleEnLarge
% \dateOfSubmission
% \yearOfGraduation
% \dateOfSubmissionAbs
% \teacherName
% \thesisPortrait

%==================================================
% 表紙（修士論文用、顔写真なし）
%==================================================

\newcommand{\makethesistitle}{%
  \begin{titlepage}
    \centering
    \vspace*{10mm}

    {\LARGE \titleJaLarge\par}
    \vspace{3mm}

    {\LARGE \titleEnLarge\par}
    \vspace{25mm}

    {\Large \myNameJa\par}
    {\large \myNameEn\par}
    \vspace{5mm}

    (\yearOfEnrollment 年度入学，\studentNumber)\par

    \vspace{10mm}

    {\Large 指導教員　\teacherName\par}
    \vspace{25mm}

    {\large
      東京農工大学 工学府 知能情報システム工学専攻
      \yearOfGraduation 年度 修士論文\par
    }

    \vspace{5mm}

    {\large（\dateOfSubmission 提出）\par}
  \end{titlepage}
}

%==================================================
% 要旨タイトル
%==================================================

\newcommand{\makethesisabstracttitle}{%
  \thispagestyle{empty}
  \begin{center}
    東京農工大学 工学府 知能情報システム工学専攻\\
    \yearOfGraduation 年度 修士論文 要旨

    \vspace{1em}

    \titleJa

    \vspace{0.5em}

    \titleEn

    \vspace{0.5em}

    学籍番号 \studentNumber,
    氏名 \myNameJa（\myNameEn）\\
    提出日 \dateOfSubmissionAbs
  \end{center}
  \par
}

%==================================================
% 参考文献など
%==================================================

% 既存の \bibliography と \bibliographystyle をそのまま利用可能。
% 章の改ページは ltjsarticle の標準動作を利用する。
