function! PyRunner() abort
    !{~/Desktop/samex/bin/sam "%:p"}
endfunction

map <leader>r :call PyRunner()<CR>
