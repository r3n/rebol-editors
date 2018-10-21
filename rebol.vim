" Vim syntax file
" Language:	Rebol
" Maintainer:	Mike Williams <mrw@eandem.co.uk>
" Filenames:	*.r
" Last Change:	27th June 2002
" URL:		http://www.eandem.co.uk/mrw/vim

" Changes-by: Barry Walsh <draegtun@gmail.com>
" Last updated: 17-May-2013

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Rebol is case insensitive
syn case ignore

" As per current users documentation
if version < 600
  set isk=@,48-57,?,!,.,',+,-,*,&,\|,=,_,~
else
  setlocal isk=@,48-57,?,!,.,',+,-,*,&,\|,=,_,~
endif

" Yer TODO highlighter
syn keyword	rebolTodo	contained TODO

" Delimiters
syn match       rebolDelimiter  "[][(|)]"

" Comments
syn match       rebolComment    ";.*$" contains=rebolTodo

" Words
syn match       rebolWord       "\a\k*"
syn match       rebolWordPath   "[^[:space:]]/[^[:space]]"ms=s+1,me=e-1
syn match       rebolWordSet    "\a\k*\:"
syn match       rebolWordLit    "\'\k*"

" Values
" Integers
syn match       rebolInteger    "\<[+-]\=\d\+\('\d*\)*\>"
" Decimals
syn match       rebolDecimal    "[+-]\=\(\d\+\('\d*\)*\)\=[,.]\d*\(e[+-]\=\d\+\)\="
syn match       rebolDecimal    "[+-]\=\d\+\('\d*\)*\(e[+-]\=\d\+\)\="
" Time
syn match       rebolTime       "[+-]\=\(\d\+\('\d*\)*\:\)\{1,2}\d\+\('\d*\)*\([.,]\d\+\)\=\([AP]M\)\=\>"
syn match       rebolTime       "[+-]\=:\d\+\([.,]\d*\)\=\([AP]M\)\=\>"
" Dates
" DD-MMM-YY & YYYY format
syn match       rebolDate       "\d\{1,2}\([/-]\)\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\)\1\(\d\{2}\)\{1,2}\>"
" DD-month-YY & YYYY format
syn match       rebolDate       "\d\{1,2}\([/-]\)\(January\|February\|March\|April\|May\|June\|July\|August\|September\|October\|November\|December\)\1\(\d\{2}\)\{1,2}\>"
" DD-MM-YY & YY format
syn match       rebolDate       "\d\{1,2}\([/-]\)\d\{1,2}\1\(\d\{2}\)\{1,2}\>"
" YYYY-MM-YY format
syn match       rebolDate       "\d\{4}-\d\{1,2}-\d\{1,2}\>"
" DD.MM.YYYY format
syn match       rebolDate       "\d\{1,2}\.\d\{1,2}\.\d\{4}\>"
" Money
syn match       rebolMoney      "\a*\$\d\+\('\d*\)*\([,.]\d\+\)\="
" Strings
syn region      rebolString1     oneline start=+"+ skip=+\^"+ end=+"+ contains=rebolSpecialCharacter,remMarkdownCharacter
syn region      rebolString2     start=+{+ end=+}+ skip=+\^}+ contains=rebolSpecialCharacter,remMarkdownCharacter,rebolString2
" Binary
syn region      rebolBinary     start=+\d*#{+ end=+}+ contains=rebolComment
" Email
syn match       rebolEmail      "\<\k\+@\(\k\+\.\)*\k\+\>"
" File
syn match       rebolFile       "%\(\k\+/\)*\k\+[/]\=" contains=rebolSpecialCharacter
syn region      rebolFile       oneline start=+%"+ end=+"+ contains=rebolSpecialCharacter
" URLs
syn match       rebolURL        "http://\k\+\(\.\k\+\)*\(:\d\+\)\=\(/\(\k\+/\)*\(\k\+\)\=\)*"
syn match       rebolURL        "file://\k\+\(\.\k\+\)*/\(\k\+/\)*\k\+"
syn match       rebolURL        "ftp://\(\k\+:\k\+@\)\=\k\+\(\.\k\+\)*\(:\d\+\)\=/\(\k\+/\)*\k\+"
syn match       rebolURL        "mailto:\k\+\(\.\k\+\)*@\k\+\(\.\k\+\)*"
" Issues
syn match       rebolIssue      "#\(\d\+-\)*\d\+"
" Tuples
syn match       rebolTuple      "\(\d\+\.\)\{2,}"
" Characters
syn match       rebolSpecialCharacter contained "\^[^[:space:][]"
syn match       rebolSpecialCharacter contained "%\d\+"


" Operators
" Math operators
syn match       rebolMathOperator  "\(\*\{1,2}\|+\|-\|/\{1,2}\)"
" Binary operators
syn match       rebolLogicOperator "[<>=]=\="
syn match       rebolLogicOperator "<>"

" Tags
syn region      rebolTag       oneline start=+<\a+ end=+>+ contains=rebolComment


" Experiments of mine!
"syn match       rebolFuncStatement  "func\s\["

"""""""""""""""""""""""""""

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_rebol_syntax_inits")
  if version < 508
    let did_rebol_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink rebolTodo     Todo

  HiLink rebolKW Statement

  HiLink rebolOperator	Operator
  HiLink rebolLogicOperator rebolOperator
  HiLink rebolMathOperator rebolOperator
  HiLink rebolBinaryOperator rebolOperator
  HiLink rebolSpecialCharacter SpecialChar
  HiLink rebolString1	String
  HiLink rebolString2	String

  HiLink rebolNumber   Number
  HiLink rebolInteger  rebolNumber
  HiLink rebolDecimal  rebolNumber
  HiLink rebolTime     rebolNumber
  HiLink rebolDate     rebolNumber
  HiLink rebolMoney    rebolNumber
  HiLink rebolBinary   rebolNumber
  HiLink rebolEmail    String
  HiLink rebolFile     String
  HiLink rebolURL      String
  HiLink rebolIssue    rebolNumber
  HiLink rebolTuple    rebolNumber
  HiLink rebolFloat    Float
  HiLink rebolBoolean  Boolean
  HiLink rebolTag      String


  HiLink rebolComment	Comment


  HiLink rebolWordSet   Function
  HiLink rebolWordLit   String

  HiLink rebolDelimiter Delimiter

  delcommand HiLink
endif

syntax keyword rebolKW abs absolute adapt add ajoin alias all and any any-number! any-string! any-value! any-word! append append/only apply arccosine arcsine arctangent attempt attempt back
syntax keyword rebolKW binary! binary? bind blank blank! block! block? break case catch chain change change/part char! char? charset clear collect complement compose compose/deep
syntax keyword rebolKW context copy copy/part cosine date! date? decimal! decimal? default delete delimit dir? divide do does echo either else email! email? empty?
syntax keyword rebolKW error? even? exists? exit exp false fifth file! file? find first for for-each for-skip forall foreach form format format forskip found?
syntax keyword rebolKW fourth free free func function function! function? get halt head head? help hijack if import import in info? input input? insert
syntax keyword rebolKW integer! integer? issue! issue? join join-of last leave length lit-word? load log-10 log-2 log-e logic! logic? loop lowercase make make-object map!
syntax keyword rebolKW map-each match max maximum maybe min minimum modified? mold money! money? multiply native! native? negate negative? new-line newline next no none!
syntax keyword rebolKW none? not number? object! object? odd? off on opt or paren! paren? parse parse/all past path! path? pick port! port? positive?
syntax keyword rebolKW power print probe probe proc procedure random random/seed read rebol reduce refinement? remainder remove remove-each repeat replace replace/all return reverse same?
syntax keyword rebolKW save second secure select send series? set set-word? shield sine size? skip some sort space spaced specialize split square-root string! string?
syntax keyword rebolKW subtract switch tag! tag? tail tail? take tangent third thru time! time? to to-file to-integer to-issue to-string to-tag to-word trace trap
syntax keyword rebolKW trim true try tuple! tuple? type? unspaced until uppercase url! url? use value? while word! word? write xor yes zero? 

let b:current_syntax = "rebol"
