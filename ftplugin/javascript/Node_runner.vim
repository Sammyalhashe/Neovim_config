function! NodeRunner() abort
!{node "%:p"}
endfunction

map <leader>r :call NodeRunner()<CR>
