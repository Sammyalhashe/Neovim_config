let g:deoplete#enable_at_startup = 1
set completeopt-=preview
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
"let g:deoplete#omni_patterns = {}
"let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
call deoplete#custom#option({
        \ 'smart_case': v:true,
        \ 'camel_case': v:true,
        \ 'refresh_always': v:true,
        \ 'max_abbr_width': 0,
        \ 'max_menu_width': 0,
        \ 'ignore_casee': v:true
        \ })
let g:deoplete#omni#custom_var = get(g:,"deoplete#omni#custom#var()",{})
let g:deoplete#sources#ternjs#filetypes = [
            \ 'jsx',
            \ 'javascript.jsx',
            \ 'vue',
            \ 'javascript'
            \ ]
let g:deoplete#sources#tss#javascript_support = 1

call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
call deoplete#custom#source('omni',          'mark', '⌾')
call deoplete#custom#source('flow',          'mark', '⌁')
call deoplete#custom#source('padawan',       'mark', '⌁')
call deoplete#custom#source('TernJS',        'mark', 'tern')
call deoplete#custom#source('go',            'mark', 'go')
call deoplete#custom#source('jedi',          'mark', 'jedi')
call deoplete#custom#source('vim',           'mark', 'vim')
call deoplete#custom#source('neosnippet',    'mark', 'nsnip')
call deoplete#custom#source('tag',           'mark', '⌦')
call deoplete#custom#source('around',        'mark', '↻') " 
call deoplete#custom#source('buffer',        'mark', 'buf')
call deoplete#custom#source('tmux-complete', 'mark', '⊶')
call deoplete#custom#source('syntax',        'mark', '♯')
call deoplete#custom#source('member',        'mark', '.')


" deoplete tab-complete
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <expr><tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

