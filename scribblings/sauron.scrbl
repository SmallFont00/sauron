#lang scribble/manual
@require[@for-label[sauron racket
                    racket/gui]]
@require[scribble/decode]

@title{sauron}
@author{dannypsnl}

@defmodule[sauron]

@section{User Guide}

In sauron, all `cmd`/`ctrl` would be called `c`, `alt`/`option` called `o`.

@subsection{Shortcut}

@(itemlist
  ;;; file
  @item{c+o open file}
  @item{c+s save file(would auto indent code)}
  ;;; program
  @item{c+e run REPL}
  ;;; version control
  @item{c+k open version control panel}
  ;;; edit
  @item{c+a select all}
  @item{c+c copy}
  @item{c+v paste}
  @item{c+z undo}
  @item{c+x cut}
  ;;; move cursor
  @item{c+<up>/<down>/<left>/<right> move to most up/down/left/right}
  @item{o+<left> move left by a token/s-exp}
  @item{o+<right> move right by a token/s-exp}
  ; jump to definition
  @item{c+b or <click> jump to definition(notice that only identifier is clickable to trigger this)}
  ; open document
  @item{c+d open document}
  ; refactor
  @item{c+r rename all bound}
  ;;; comment/uncomment
  @item{c+; comment selected text or line if uncommented, uncomment if commented}
  ;;; misc
  @item{c+f open text searcher}
  @item|{(/[/{/" when has selected text, wrap selected text automatically}|
  ;;; For Editor Tabs
  @item{c+0..9 would select tab, at most 10 tabs, 1 maps to the first, and 0 maps to the last when all 10 tabs are showed}
  @item{c+w would close current tab})

@subsection{Panel: REPL}

REPL panel helps users quickly testing their ideas, it has a few key bindings can work on it:

    @itemlist[
      @item{<enter> evaluate and save expression into evaluated history(also reset selected status to no selection)}
      @item{<up> switch to previous expression in history}
      @item{<down> switch to next expression in history}
    ]

@subsection{Panel: Version Control}

You can use c+k open version control panel, once open the panel, it has two part:

@subsubsection{commit message editor}

You can type commit message in this editor, use c+<enter> to commit.

@subsubsection{Changed files}

Changed files would show below of the commit editor, they were clickable. Clicked means ready to commit, else is not.

@subsection{Panel: Project Files}

@itemlist[
@item{interactive with files}
@item{open file via double click}
]

@subsection{Auto complete}

Warning: Only consider #lang racket currently, would try to support more variant in the future.

Sauron try to improve experience when programming Racket, one of the important features was auto completion, Sauron provides several builtin form.
Full list can refer to @code[#:lang "racket"]{racket-builtin-form*} in @(link "https://github.com/racket-tw/sauron/blob/master/meta.rkt" "meta.rkt").
When you introduce identifier, Sauron would record it to provide completion.

For example:

@(racketblock
  (define (id x) x))

Type @code[#:lang "racket"]{i} would trigger completion.

@subsubsection{smart insertion}

Smart insertion is an interactive insert mode for creating correct input of program. For example, it would check identifier of `define` form.

@subsection{LaTeX input}

Sauron also supports convert input \all to ∀. This is helpful for PLT or Math researchers. Full list can refer to @code[#:lang "racket"]{latex-complete} in @(link "https://github.com/racket-tw/sauron/blob/master/meta.rkt" "meta.rkt").

@section{As DrRacket Plugin}

New user guide, most features should move to here in the end.

@itemlist[
    @item{c+backspace delete whole line from current position}
    @item{o+backspace delete previous sexp}
]

@section{Develop}

ctrl/command and alt/option just rely on this function from racket/gui @code{get-default-shortcut-prefix}.
