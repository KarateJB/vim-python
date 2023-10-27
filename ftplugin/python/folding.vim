" setlocal foldmethod=indent
" setlocal foldignore=

setlocal foldmethod=expr
setlocal foldexpr=GetPythonFold(v:lnum)

function! GetPythonFold(lnum)
  if getline(a:lnum) =~? '\v*\s*$'
      return '-1'
  endif

  let this_indent = IndentLevel(a:lnum)
  let next_indent = IndentLevel(NextNonBlank(a:lnum))
  if this_indent == next_indent
      return this_indent
  elseif next_indent < this_indent
      return this_indent
  elseif next_indent > this_indent
    return '>' . next_indent
  endif

  return '0'
endfunction

" Returns the indent level of the line.
" e.q. 4 spaces in front of a line returns indent level as 1, 8 spaces returns 2, etc.
function! IndentLevel(lnum)
  return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlank(lnum)
  let numlines = line('$')
  let current = a:lnum + 1

  while current <= numlines
    if getline(current) =~? '\v\S'
      return current
    endif
    let current += 1
  endwhile

  return -2
endfunction
