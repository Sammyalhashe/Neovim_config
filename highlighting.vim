" set rendering behaviour for certain words
" match Keyword /return\|while\|for\|do/
hi Function cterm=underline,bold gui=underline,bold
hi Keyword cterm=underline gui=underline
hi Comment cterm=bold gui=bold
hi String cterm=bold gui=bold


" set rendering behaviour for certain words
hi Comment cterm=bold gui=bold
hi String cterm=bold gui=bold

" Todo Syntax mappings
augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|DONE|NOTE|TODO|OPTIMIZE|XXX):/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo
