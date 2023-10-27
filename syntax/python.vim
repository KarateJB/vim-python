
if exists("b:current_syntax")
    finish
endif

" Put the syntax highlighting script here.
" Keyword
syntax keyword pythonKeywords import def
syntax keyword pythonKeywords if else elif
syntax keyword pythonKeywords class return pass
" Function
syntax keyword pythonFunctions len super __init__
" Comment
syntax match pythonComment "\v#.*$"
" Operator
syntax match pythonOperator "\v\+|\-|\*|\/|\=|\%|\!|\&|\||\^|\~|\>|\<|\?"
" String
syntax region pythonString start=/\v"/ skip=/\v\\./ end=/\v"/

" Highlight the syntax groups
highlight link pythonKeywords Keyword
highlight link pythonFunctions Function 
highlight link pythonComment Comment
highlight link pythonOperator Operator
highlight link pythonString String

echom "Reload the syntax highlighting script for Python."
let b:current_syntax = "python"
