" Airline config

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1

"let g:airline_solarized_bg='palenight'
let g:Powerline_symbols='fancy'

scriptencoding utf-8

let s:error_symbol = get(g:, 'airline#extensions#ale#error_symbol', 'E:')
let s:warning_symbol = get(g:, 'airline#extensions#ale#warning_symbol', 'W:')
let s:show_line_numbers = get(g:, 'airline#extensions#ale#show_line_numbers', 1)

