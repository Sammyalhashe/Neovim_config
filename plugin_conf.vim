"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Improved Scrolling
" Improve scroll, credits: https://github.com/Shougo
"nnoremap <expr> zz (winline() == (winheight(0)+1) / 2) ?
            "\ 'zt' : (winline() == 1) ? 'zb' : 'zz'
"noremap <expr> <C-f> max([winheight(0) - 2, 1])
            "\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
"noremap <expr> <C-b> max([winheight(0) - 2, 1])
            "\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
"noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
"noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")


set nocompatible
" set guicursor=

filetype plugin on

" buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

"set virtualedit=all
set cursorline
autocmd BufNewFile,BufRead *.py set cc=80
set iskeyword+=:

" clipboard
set clipboard^=unnamed

" Sets how many lines of history VIM has to remember
set history=500
set number relativenumber
set showtabline=2       " Always show the tabs line

" Start an external command with a single bang
nnoremap ! :!

" mouse enable
set mouse=a

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"
let maplocalleader="\<space>"

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" Look for placeholder <++>, go there delete it and start insert mode
inoremap <leader>h <Esc>/<++><Enter>"_c4l
" completely unindent the line for the python command to work
" Several ways of unindenting -> see reddit post: https://www.reddit.com/r/vim/comments/aaz14s/unindent_an_entire_line_no_matter_its_indentation/
nnoremap <c-p> :s/^\s*<Enter>:noh<Enter>:.!python3 -<Enter><leader>nf
xnoremap <c-p> J:s/^\s*<Enter>:noh<Enter><Esc>:.!python3 -<Enter><leader>nf
" :.!python3 -<Enter>=G

" for python files, insert a python script to run to insert dividers
function! Dividers()
    if &filetype == 'python'
        :call setline('.', 'for i in range(<++>): print("#"*79 + "\n"*<++>) if i != <++> else print("#"*79)')
    endif

    if &filetype == 'javascript.jsx'
        :call setline('.', 'for i in range(<++>): print("/" + "*"*77 + "/" + "\n"*<++>) if i != <++> else print("/" + "*"*77 + "/")')
    endif
endfunction

nnoremap <c-x> :call Dividers() <Enter>

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Show highlight names under cursor
nmap <silent> gh :echo 'hi<'.synIDattr(synID(line('.'), col('.'), 1), 'name')
            \.'> trans<'.synIDattr(synID(line('.'), col('.'), 0), 'name').'> lo<'
            \.synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name').'>'<CR>


" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread


" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Add a bit extra margin to the left
set foldcolumn=0
"set foldmethod=syntax

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" set true colors

if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
" Enable true color
if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set background=dark

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

let g:vim_monokai_tasty_italic = 1
let g:material_theme_style = 'palenight'
let g:material_terminal_italics = 1
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

let g:random_disabled = 0
let g:random_scheme = 0
let g:environment_theme = 0
let g:default_theme = 'NeoSolarized'
"let g:default_theme = 'eink'
let g:default_theme_airline = 'badwolf'
let g:airline_integration = 0
let g:colorscheme_airline_correlation = 1
let g:available_colorschemes = ["monotone","space-vim-dark", 'NeoSolarized', 'material', 'gruvbox', 'cobalt2', 'molokai']
let g:available_airline_themes = ['atomic','violet', 'solarized_flood', 'material', 'gruvbox', 'cobalt2', 'molokai']
let g:clearLineNr = 1

if g:os == 'Linux'
    colorscheme NeoSolarized
endif


" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
"set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if g:os == 'Darwin'
    let g:python3_host_prog='/Library/Frameworks/Python.framework/Versions/3.6/bin/python3'
else
    let g:python3_host_prog='/usr/bin/python'
endif
" Use K for show documentation in preview window
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
exec printf("source %s/%s", g:config_location, "crystalline.vim")

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Rainbow Parentheses
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" NerdTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif " These lines open NT automatically if no file is specified

" source ~/.config/nvim/nerdtree.vim

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"Typescript
"let g:typescript_compiler_binary = 'tsc'
"let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"YAPF
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"Python Mode
hi pythonSelf ctermfg=68  cterm=bold gui=bold


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Vim Help
" Snippets from vim-help
" Credits: https://github.com/dahu/vim-help

if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setlocal spell<'
setlocal nospell

setlocal nohidden
setlocal iskeyword+=:
setlocal iskeyword+=#
setlocal iskeyword+=-

wincmd L

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Jump to links with enter
nmap <buffer> <CR> <C-]>

" Jump back with backspace
nmap <buffer> <BS> <C-T>


" Skip to next subject link
nmap <buffer><nowait> s /\|\S\+\|<CR>l

" Skip to previous subject link
nmap <buffer> S h?\|\S\+\|<CR>l

" Skip to next tag (subject anchor)
nmap <buffer> t /\*\S\+\*<CR>l

" Skip to previous tag (subject anchor)
nmap <buffer> T h?\*\S\+\*<CR>l

let &cpoptions = s:save_cpo
" vim: set ts=2 sw=2 tw=80 noet :

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Airblade
let g:gitgutter_map_keys = 0
let g:gitgutter_sh = $SHELL
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_modified_removed = '╋━'

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

imap <expr><TAB>
    \ pumvisible() ? "\<C-n>" :
    \ neosnippet#expandable_or_jumpable() ?
    \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" conceal neosnippet markers
set conceallevel=2
set concealcursor=niv
" autocmd MyAutoCmd InsertLeave * NeoSnippetClearMarkers

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" ctrlp
"let g:ctrlp_map = '<c-f>'
"let g:ctrlp_cmd = 'CtrlP'

exec printf("source %s/%s", g:config_location, "ctrlp.vim") 

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:mkdp_auto_start = 1
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" echodoc config
set cmdheight=1

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nnoremap <leader>nf :call Nf()<CR>
autocmd BufWritePost * silent call Nf()

function! Nf()
    if &filetype == 'python'
        :Neoformat yapf
    elseif &filetype == 'javascript.jsx' || 'typescript'
        :Neoformat prettier
    else
        :Neoformat
    endif
endfunction

" command to create new file
command! -nargs=1 Nf call s:NewFile(<q-args>)

function! s:NewFile(fp)
    echom a:fp
    execute "e " . expand("%:h") . "/" . a:fp
endfunction

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
let g:neoformat_try_formatprg = 1
"let g:neoformat_javascript_prettier = {
"\ 'exe': 'prettier',
"\ 'args': ['--tab-width', '4'],
"\ 'stdin': 1,
"\ 'valid_exit_codes': [0, 23],
"\ }

"let g:neoformat_enabled_javascript = ['prettier']

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" ale

exec printf("source %s/%s", g:config_location, "/ale_config.vim")
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-jsx
" let g:jsx_ext_required = 0

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" vim-devicons
" loading the plugin
let g:webdevicons_enable = 1
" adding the flags to NERDTree
"let g:webdevicons_enable_nerdtree = 1
" adding to vim-airline's statusline
let g:webdevicons_enable_airline_statusline = 1
let g:WebDevIconsOS = 'Darwin'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['class'] = '💎'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" match tags always plugin
let g:mta_filetypes = {
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \ 'javascript.jsx' : 1,
            \}
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
"highlight LineNr ctermfg=6 guifg=darkgrey
highlight clear LineNr
highlight clear SignColumn
highlight LineNr guibg=NONE
"highlight CursorLineNr ctermfg=6 guifg=white
"highlight CursorLineNr cterm=underline 


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Startify

"let g:startify_custom_header = [
            "\ '                                 ________  __ __        ',
            "\ '            __                  /\_____  \/\ \\ \       ',
            "\ '    __  __ /\_\    ___ ___      \/___//''/''\ \ \\ \    ',
            "\ '   /\ \/\ \\/\ \ /'' __` __`\        /'' /''  \ \ \\ \_ ',
            "\ '   \ \ \_/ |\ \ \/\ \/\ \/\ \      /'' /''__  \ \__ ,__\',
            "\ '    \ \___/  \ \_\ \_\ \_\ \_\    /\_/ /\_\  \/_/\_\_/  ',
            "\ '     \/__/    \/_/\/_/\/_/\/_/    \//  \/_/     \/_/    ',
            "\ ]
let g:startify_custom_header = [
            \ '                                ',
            \ '            __                  ',
            \ '    __  __ /\_\    ___ ___      ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\   ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \   ',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/  ',
            \ ]                      
"let g:ascii = [      
            "\ '                        /@                                    ',                                      
            "\ '                      __/\/                                   ',                                      
            "\ '       /==\      /  \_/\/                                     ',                                                           
            "\ '     /======\    \/\__ \__                                    ',                                                           
            "\ '   /==/\  /\==\    /\_|__ \                                   ',                                                           
            "\ '/==/    ||    \=\ / / / /_/                                   ',                                                           
            "\ '/    /\ || /\   \=\/ /                                        ',                                                           
            "\ '   /   \||/   \   \===\                                       ',                                                           
            "\ ' /_________________ \===\                                     ',                                                           
            "\ ' |                /  \====\                                   ',                                                           
            "\ ' |  _________    /  \   \===\    THE LEGEND OF                ',                                                                                    
            "\ ' | /   /  \ / / /  __________\_____      ______       ___     ',                                                                                    
            "\ ' |/   /____/ / /   \   _____ |\   /      \   _ \      \  \    ',                                                                                    
            "\ '     /\   / / /     | |  /= \| | |        | | \ \     / _ \   ',                                                                                    
            "\ '    /  \ / / /   /  | | /===/  | |        | |  \ \   / / \ \  ',                                                                                    
            "\ '\\ /____/   /_\ //  | |_____/| | |        | |   | | / /___\ \ ',                                                                                    
            "\ '\\\\\\\/   /////// /|  _____ | | |        | |   | | |  ___  | ',                                                                                    
            "\ '  \\\\/ / //////   \| |/==/ \| | |        | |   | | | /   \ | ',                                                                                    
            "\ ' _ \\/ / /////    _ | |==/     | |        | |  / /  | |   | | ',                                                                                    
            "\ '/ \ / / ///      /|\| |_____/| | |_____/| | |_/ /   | |   | | ',                                                                                    
            "\ '   / / /________/ |/_________|/_________|/_____/   /___\ /___\',                                                                                    
            "\ '  /               | /==/                                      ',                                                           
            "\ ' /________________|/=/    OCARINA OF TIME                     ',                                                           
            "\ '=\     _____     /==/                                         ',                                    
            "\ '                                                              ',               
            "\ '                                                              ',               
            "\ '                                                              ',               
            "\ ]                                                   

let g:antigram = ['"A volunteer fireman" is an anagram for "I never run to a flame"']
let g:startify_custom_header = g:startify_custom_header + startify#fortune#boxed() + g:antigram


"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" closetag
let g:closetag_filenames = "*.html,*html+,*.xhtml,*.phtml,*.php,*.jsx,*.tsx,*.js"
"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" pydocstring
nmap <silent> <c-o> <Plug>(pydocstring)

"source ~/.config/nvim/check_clashes.vim


augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self:
                \ | highlight def link pythonSelf Special
augroup end
" set iskeyword+=:
autocmd BufEnter,BufRead,BufNewFile *.py    set iskeyword-=:

" {{JsDoc config
exec printf("source %s/%s", g:config_location, "/jsdoc.vim")

" }}

exec printf('source %s/%s', "~/.config/nvim/", 'coc_config.vim')
