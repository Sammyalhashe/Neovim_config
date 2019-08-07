function! ScalaRunner() abort
!{scala "%:p"}
endfunction

map <leader>r :call ScalaRunner()<CR>
