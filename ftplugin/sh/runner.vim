function! PyRunner() abort
    !{sh "%:p"}
endfunction

map <leader>r :call PyRunner()<CR>
