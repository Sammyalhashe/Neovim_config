function! PyRunner() abort
    !{go run "%:p"}
endfunction

map <leader>r :call PyRunner()<CR>

let g:ale_linters = {'go':['golint']}
