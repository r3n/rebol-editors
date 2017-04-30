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

" Comments
syn match       rebolComment    ";.*$" contains=rebolTodo

" Words
syn match       rebolWord       "\a\k*"
syn match       rebolWordPath   "[^[:space:]]/[^[:space]]"ms=s+1,me=e-1
syn match       rebolWordGet    "\a\k*\:"
syn match       rebolWordLit    "\'\k*"

" Booleans
syn keyword     rebolBoolean    true false on off yes no

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
syn region      rebolString     oneline start=+"+ skip=+^"+ end=+"+ contains=rebolSpecialCharacter
syn region      rebolString     start=+[^#]{+ end=+}+ skip=+{[^}]*}+ contains=rebolSpecialCharacter
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
" Tags
"syn region      rebolTag       oneline start=+<\a+ end=+>+ contains=rebolComment

" Characters
syn match       rebolSpecialCharacter contained "\^[^[:space:][]"
syn match       rebolSpecialCharacter contained "%\d\+"


" Operators
" Math operators
syn match       rebolMathOperator  "\(\*\{1,2}\|+\|-\|/\{1,2}\)"
syn keyword     rebolMathFunction  abs absolute add arccosine arcsine arctangent cosine
syn keyword     rebolMathFunction  divide exp log-10 log-2 log-e max maximum min
syn keyword     rebolMathFunction  minimum multiply negate power remainder sine
syn keyword     rebolMathFunction  square-root subtract tangent
syn keyword     rebolMathFunction  random random/seed
" Binary operators
syn keyword     rebolBinaryOperator complement and or xor ~
" Logic operators
syn match       rebolLogicOperator "[<>=]=\="
syn match       rebolLogicOperator "<>"
syn keyword     rebolLogicOperator not
syn keyword     rebolLogicFunction all attempt any maybe some trap try
syn keyword     rebolLogicFunction dir? head? tail?
syn keyword     rebolLogicFunction negative? positive? zero? even? odd?
syn keyword     rebolLogicFunction binary? block? char? date? decimal? email? empty? error?
syn keyword     rebolLogicFunction file? found? function? integer? issue? lit-word? logic? money? 
syn keyword     rebolLogicFunction native? none? number? object? paren? path? port? refinement? series?
syn keyword     rebolLogicFunction set-word? string? tag? time? tuple? url? word?
syn keyword     rebolLogicFunction exists? input? same? value?

" Conversions
syn keyword     rebolStatement      to-file to-integer to-issue to-string to-tag to-word

" Datatypes
syn keyword     rebolType       any-number! any-string! any-value! any-word!
syn keyword     rebolType       binary! blank! block! char! date! decimal! email! file!
syn keyword     rebolType       function! integer! issue! logic! map!  money! native!
syn keyword     rebolType       none! object! paren! path! port! string! tag! time!
syn keyword     rebolType       tuple! url! word!
syn keyword     rebolTypeFunction type?

" Control statements
syn keyword     rebolStatement apply attempt break catch do exit halt leave reduce return shield
syn keyword     rebolConditional if case default either else switch
syn keyword     rebolRepeat     for for-each for-skip forall foreach forskip loop repeat while until

" Series statements
syn keyword     rebolStatement  change change/part
syn keyword     rebolStatement  copy copy/part
syn keyword     rebolStatement  clear fifth find first format fourth free
syn keyword     rebolStatement  head insert last match next new-line back parse parse/all past
syn keyword     rebolStatement  pick remove second select skip sort tail third trim length
syn keyword     rebolStatement  append append/only join join-of map-each remove-each 
syn keyword     rebolStatement  reverse replace replace/all compose compose/deep
syn keyword     rebolStatement  collect take

" String
syn keyword     rebolStatement  ajoin delimit form lowercase mold spaced split unspaced uppercase

" Context
syn keyword     rebolStatement  alias bind use context

" Function
syn keyword     rebolStatement  adapt chain does func function hijack proc procedure specialize

" Object
syn keyword     rebolStatement  import make make-object rebol info? in

" I/O statements
syn keyword     rebolStatement  delete echo format import input load
syn keyword     rebolStatement  print probe read save secure send write
syn keyword     rebolOperator   size? modified?

" Debug statement
syn keyword     rebolStatement  help probe trace

" Misc statements
syn keyword     rebolStatement  free get set

" Parse statements
syn keyword     rebolStatement  opt thru to

" Chars
syn keyword     rebolStatement  charset newline space 

" Constants
syn keyword     rebolConstant   blank

" Tags
syn keyword     rebolTag        <td> </td> <tr> </tr>

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

  HiLink rebolStatement Statement
  "HiLink rebolLabel	Label
  HiLink rebolConditional Conditional
  HiLink rebolRepeat	Repeat

  HiLink rebolOperator	Operator
  HiLink rebolLogicOperator rebolOperator
  HiLink rebolLogicFunction rebolLogicOperator
  HiLink rebolMathOperator rebolOperator
  HiLink rebolMathFunction rebolMathOperator
  HiLink rebolBinaryOperator rebolOperator
  HiLink rebolBinaryFunction rebolBinaryOperator

  HiLink rebolType     Type
  HiLink rebolTypeFunction rebolOperator

  "HiLink rebolWord     Identifier
  "HiLink rebolWordPath rebolWord
  "HiLink rebolFunction	Function

  HiLink rebolCharacter Character
  HiLink rebolSpecialCharacter SpecialChar
  HiLink rebolString	String

  HiLink rebolNumber   Number
  HiLink rebolInteger  rebolNumber
  HiLink rebolDecimal  rebolNumber
  HiLink rebolTime     rebolNumber
  HiLink rebolDate     rebolNumber
  HiLink rebolMoney    rebolNumber
  HiLink rebolBinary   rebolNumber
  HiLink rebolEmail    Identifier
  HiLink rebolFile     Identifier
  HiLink rebolURL      Identifier
  HiLink rebolIssue    rebolNumber
  HiLink rebolTuple    rebolNumber
  HiLink rebolFloat    Float
  HiLink rebolBoolean  Boolean
  HiLink rebolTag      Identifier

  HiLink rebolConstant Constant

  HiLink rebolComment	Comment

  HiLink rebolError	Error

  HiLink rebolWordGet   Function
  HiLink rebolWordLit   String

  delcommand HiLink
endif

let b:current_syntax = "rebol"
