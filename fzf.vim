nnoremap <leader>e :GFiles<CR>
nnoremap <leader>ag :Ag!<CR>
nnoremap <leader>li :Lines<CR>
nnoremap <leader>/ :BLines!<CR>
nnoremap <leader>? :Rg!<CR>

" FZF {{{
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(&lines * 0.4) " 40% of screen
  let width = float2nr(&columns * 0.8) " 70% of screen
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr(&lines * 0.1) " space to top: 10%

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'anchor': 'NW',
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
" }}}
