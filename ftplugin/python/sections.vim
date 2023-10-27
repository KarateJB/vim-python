" (Optional) Set the original section movement to <Nop>
noremap <script> <buffer> <silent> [[ <Nop>
noremap <script> <buffer> <silent> ]] <Nop>
noremap <script> <buffer> <silent> ][ <Nop>
noremap <script> <buffer> <silent> [] <Nop>

function! s:NextSection(type, isBackward, isVisualMode)
    if a:isVisualMode
        normal! gv
    endif

    if a:type == 1
        let pattern = '\v(\n\n^\S|%^)'
        let flags = 'e'
    elseif a:type == 2
        " The last non-whitespace char followed by a blank line.
        let pattern = '\v\S\n^$'
        let flags = ''
    endif

    if a:isBackward
        let direction = '?'
    else
        let direction = '/'
    endif

    execute "silent normal! " . direction . pattern . direction . flags "\r"
endfunction

" Normal Mode keymappings
noremap <script> <buffer> <silent> ]]
        \ :call <SID>NextSection(1, 0, 0)<CR>
noremap <script> <buffer> <silent> [[
        \ :call <SID>NextSection(1, 1, 0)<CR>
noremap <script> <buffer> <silent> ][
        \ :call <SID>NextSection(2, 0, 0)<CR>
noremap <script> <buffer> <silent> []
        \ :call <SID>NextSection(2, 1, 0)<CR>

" Visual Mode keymappings
vnoremap <script> <buffer> <silent> ]]
        \ :<C-U>call <SID>NextSection(1, 0, 1)<CR>
vnoremap <script> <buffer> <silent> [[
        \ :<C-U>call <SID>NextSection(1, 1, 1)<CR>
vnoremap <script> <buffer> <silent> ][
        \ :<C-U>call <SID>NextSection(2, 0, 1)<CR>
vnoremap <script> <buffer> <silent> []
        \ :<C-U>call <SID>NextSection(2, 1, 1)<CR>
