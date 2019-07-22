function! PyRunner() abort
    !{python3 "%:p"}
endfunction

map <leader>r :call PyRunner()<CR>
