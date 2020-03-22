function! PyRunner() abort
    !{python3 "%:p"}
endfunction

function! PyRunnerServer() abort
    !{cat "%:p" | ssh sammyalhashe@$manjaroIP -p 8888 python3 -}
endfunction

map <leader>r :call PyRunner()<CR>
map <leader>rs :call PyRunnerServer()<CR>
