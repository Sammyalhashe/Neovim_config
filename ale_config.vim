let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_fixers = {
            \ 'javascript': ['eslint']
            \}
let g:ale_linter_aliases = {
            \    'svelte': ['css', 'javascript']
            \}
let g:ale_lint_on_text_changed = 0
let g:ale_python_pylint_change_directory = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
" let g:ale_sign_error = '✘'
" let g:ale_sign_warning = '⚠'
let g:ale_fix_on_save = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=NONE
highlight ALEWarningSign ctermbg=NONE ctermfg=NONE
nmap <silent> <leader>a <Plug>(ale_next_wrap)
