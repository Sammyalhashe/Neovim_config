function! Compile(ext)
    let a:mapping = {'md': 'md', 'latex': 'pdf', 'pdf': 'pdf'}
    let a:full = "%"
    let a:fname = expand("%:r")
    let a:fext = expand("%:e")
    silent execute "! {pandoc " a:full "-f markdown -t " a:ext " -s -o " a:fname . "." . a:mapping[a:ext] "}"
endfunction

" command! -nargs=1 Compile call s:compile(<q-args>)
command! -nargs=0 Compile call Compile('latex')

nnoremap <leader>r :call Compile('latex')<CR>
