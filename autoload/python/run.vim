" Show autoloading message when first loaded.
echom "Autoloaded autoload/python/run.vim..."

function! python#run#RunPython()
  " Clear the screen to not show 'Press ENTER or type command to continue'
  silent! clear

  " Use the global option or show the result on the buffer by default.
  if !exists("g:show_result_on_buffer")
    let s:isShowResultOnBuffer = 1
  else
    let s:isShowResultOnBuffer = get(g:, 'show_result_on_buffer')
  endif

  if !s:isShowResultOnBuffer
    let cmd = "!" . g:python_command . " " . bufname("%")
    execute cmd
  else
    " Execute the command and get the result
    let cmd = g:python_command . " " . bufname("%")
    let result = system(cmd)
    " Create the new buffer, then clear and setup it.
    let bufname = "_result_"
    " check if there is already a buffer named _result_
    let bnr = bufwinnr(bufname)
    if bnr > 0
      exe bnr . "wincmd w"
    else
      execute 'vsplit ' . bufname
    endif

    normal! ggdG
    setlocal filetype=log
    setlocal buftype=nofile
    " Insert the execution result to the buffer
    call append(0, split(result, "\n")) 
    " Or use setline() 
    " call setline(1, split(result, '\n'))
    " (Optional) remove CRLF in Windows
    " execute searching  and remove it

    silent exe "%s///g"
  endif
endfunction

