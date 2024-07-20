" lox.vim: Vim syntax file for Lox.
"
" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

syn region loxBlock        start="{" end="}" transparent fold

syn region loxComment     start="//" end="$"
hi def link loxComment    Comment

syn match loxEscapeSeq  "\\[\\nrt-]" contained
syn match loxEscapeSeq  "\\x[0-9a-fA-F]\{2}" contained
syn match loxEscapeSeq  "\\u[0-9a-fA-F]\{4}" contained
syn match loxEscapeSeq  "\\U[0-9a-fA-F]\{8}" contained
hi def link loxEscapeSeq Macro

syn region loxCharClass start=+\[+ skip="\\\]" end="\]" contains=loxEscapeSeq
hi def link loxCharClass String

syn region loxLiteral   start=+'+ skip=+\\'+ end=+'+ contains=loxEscapeSeq
hi def link loxLiteral  String

syn iskeyword @-@,@,48-57,_

syn keyword loxSection @parser @lexer
hi def link loxSection Type

syn keyword loxKeyword @start @discard @macro @frag @empty @external
syn keyword loxKeyword @mode @push_mode @pop_mode @error @left @list @right
syn match loxKeyword "[()]"
hi def link loxKeyword  Keyword

syn match loxDecimalInt   "\<-\=\(0\|[1-9]_\?\(\d\|\d\+_\?\d\+\)*\)\%([Ee][-+]\=\d\+\)\=\>"
hi def link loxDecimalInt Number

syn match loxIdentifier "\<[A-Za-z0-9_]\+\>"
hi def link loxIdentifier Normal

syn match loxCardinality "[+?*]"
hi def link loxCardinality Operator 

syn match loxOperators "[=|]"
hi def link loxOperators Operator 

syn sync minlines=500

let b:current_syntax = "lox"
