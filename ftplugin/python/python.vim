let g:ale_linters = {'python':['flake8'] }

set foldmethod=marker

" nnoremap <space> za

hi pythonSelf ctermfg=68  cterm=bold gui=bold


augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end
" set iskeyword+=:
autocmd BufEnter,BufRead,BufNewFile *.py    set iskeyword-=:

