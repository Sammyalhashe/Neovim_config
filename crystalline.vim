" {{ vim-crystalline config

" let g:crystalline_separators = ["\ue0b4", "\ue0b6"]
" let g:crystalline_separators = ["\ue0ce", "\ue0b6"]
let g:crystalline_separators = ["", ""]
" let g:crystalline_separators = ["\ue0c0", "\ue0b6"]

" {{ function to get status }}
function! StatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
  return join(msgs, ' '). ' ' . get(g:, 'coc_status', '')
endfunction

function! StatusLine(current, width)
  let l:s = ''

  if a:current
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  else
    " let l:s .= '%#CrystallineInactive#'
    let l:s .= crystalline#mode() . crystalline#right_mode_sep('')
  endif
  let l:s .= ' %f%h%w%m%r '
  if a:current
    let l:s .= '%{fugitive#head()} ' . crystalline#right_sep('', 'Fill') . coc#status()
  endif

  if a:current
    " let l:s .= crystalline#right_sep('', 'Fill') . luaeval(vim.lsp.buf.declaration())
  endif
  let l:s .= '%='
  if a:current
    let l:s .= crystalline#left_mode_sep('Fill') . ' %{&paste ?"PASTE ":""}%{&spell?"SPELL ":""} '
    " let l:s .= crystalline#left_mode_sep('')
  endif
  if a:width > 80
    let l:s .= '%{&ft}[%{&enc}][%{&ffs}] %l/%L %c%V %P '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! TabLine()
  let l:vimlabel = has("nvim") ?  " NVIM " : " VIM "
  return crystalline#bufferline(2, len(l:vimlabel), 1) . '%=%#CrystallineTab#' . crystalline#left_mode_sep('Fill') . l:vimlabel
endfunction



let g:crystalline_statusline_fn = 'StatusLine'
let g:crystalline_tabline_fn = 'TabLine'
let g:crystalline_enable_sep = 1

if g:os == 'Darwin'
    if g:my_colorscheme == "nord"
        let g:crystalline_theme = 'nord'
    elseif g:my_colorscheme == "gruvbox"
        let g:crystalline_theme = "gruvbox"
    elseif g:my_colorscheme =~ "solarized8" 
        let g:crystalline_theme = "solarized"
    else
        let g:crystalline_theme = "dracula"
    endif
else
    let g:crystalline_theme = 'dracula'
endif


set showtabline=2
set laststatus=2
