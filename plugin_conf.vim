" vim: foldmethod=marker

" Defaults {{{1

" allow sourcing of local rc files
set exrc
set secure

set nocompatible

filetype plugin on

" terminal mode mappings
tnoremap <Esc> <C-\><C-n>

" buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" tab switching
map tn :tabn<cr>

"set virtualedit=all
set cursorline
autocmd BufNewFile,BufRead *.py set cc=80
set iskeyword+=:

" clipboard
set clipboard^=unnamed

" Sets how many lines of history VIM has to remember
set history=500
" set number relativenumber
set showtabline=2       " Always show the tabs line

" Start an external command with a single bang
nnoremap ! :!

" mouse enable
set mouse=a

" With a map jeader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\\"
let maplocalleader="\<Space>"


" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


" }}}1

" My Dividers Helper {{{1
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
" }}}1

" => VIM user interface {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
" set so=7

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
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
" set hlsearch

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
" }}}1

" folding {{{1
exec printf("source %s/%s", g:config_location, "folding.vim")
" }}}1

" set true colors {{{1

if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
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

if g:os == 'Darwin'
    set background=light
else
    set background=light
endif

" }}}1

" => Colors and Fonts {{{1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

let g:vim_monokai_tasty_italic = 1

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

if g:os == 'Darwin'
    exec printf("colorscheme %s", g:my_colorscheme)
endif

if g:os == 'Linux'
    exec printf("colorscheme %s", g:my_colorscheme)
endif

" }}}1

" => Files, backups and undo {{{1
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" }}}1

" => Text, tab and indent related {{{1
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
set nowrap " don't Wrap lines
" }}}1

" => Visual mode related {{{1
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
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

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
" }}}1

" => Moving around, tabs, windows and buffers {{{1

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
" }}}1

" => Editing mappings {{{1
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
" Note I found out these mappings by typing <option-j/k> in my terminal and copied the character
nmap ∆ mz:m+<cr>`z
nmap ˚ mz:m-2<cr>`z
vmap ∆ :m'>+<cr>`<my`>mzgv`yo`z
vmap ˚ :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
" }}}1

" => Spell checking {{{1
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
" }}}1

" => Helper functions {{{1

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

" }}}1

" python version {{{1
if g:os == 'Darwin'
    let g:python3_host_prog='/usr/local/bin/python3'
else
    let g:python3_host_prog='/usr/bin/python'
endif
" }}}1

" Crystalline {{{1
exec printf("source %s/%s", g:config_location, "crystalline.vim")
" }}}1

" Rainbow Parentheses {{{1
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
" }}}1

"Typescript {{{1
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" }}}1

" Vim Help {{{1
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

" }}}1

" Gitgutter {{{1
let g:gitgutter_map_keys = 0
let g:gitgutter_sh = $SHELL
let g:gitgutter_sign_added = '┃'
let g:gitgutter_sign_modified = '┃'
let g:gitgutter_sign_removed = '━'
let g:gitgutter_sign_modified_removed = '╋━'
" }}}1

" Plugin key-mappings.

" netrw {{{1
nnoremap <Leader>y :Vexplore<CR>
let g:netrw_liststyle = 3
let g:netrw_winsize = 25
" }}}1

" ctrlp {{{1
" exec printf("source %s/%s", g:config_location, "ctrlp.vim")
" }}}1

" fzf {{{1
exec printf("source %s/%s", g:config_location, "fzf.vim")
" }}}1

" vim-markdown {{{1
let g:vim_markdown_folding_disabled = 1
let g:mkdp_auto_start = 1
" }}}1

" echodoc config {{{1
set cmdheight=1
" }}}1

" Neoformat {{{1
nnoremap <leader>nf :call Nf()<CR>
" autocmd BufWritePost * silent call Nf()

let g:neoformat_javascriptreact_prettier = {
      \ 'exe': 'prettier',
      \ 'args': ['--write'],
      \ 'replace': 1
      \ }

function! Nf()
    if &filetype == 'python'
        :Neoformat yapf
    elseif &filetype == 'javascriptreact' || 'typescript' || 'javascript'
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

let g:neoformat_try_formatprg = 1
" }}}1

" ale | neomake {{{1
" exec printf("source %s/%s", g:config_location, "neomake.vim")
exec printf("source %s/%s", g:config_location, "ale_config.vim")
" }}}1

" vim-jsx-pretty {{{1
let g:vim_jsx_pretty_colorful_config = 1
" }}}1

" match tags always plugin {{{1
let g:mta_filetypes = {
            \ 'html' : 1,
            \ 'xhtml' : 1,
            \ 'xml' : 1,
            \ 'jinja' : 1,
            \ 'javascript.jsx' : 1,
            \}
" }}}1

" Startify {{{1

let g:startify_custom_header = [
            \ '                                ',
            \ '            __                  ',
            \ '    __  __ /\_\    ___ ___      ',
            \ '   /\ \/\ \\/\ \ /'' __` __`\   ',
            \ '   \ \ \_/ |\ \ \/\ \/\ \/\ \   ',
            \ '    \ \___/  \ \_\ \_\ \_\ \_\  ',
            \ '     \/__/    \/_/\/_/\/_/\/_/  ',
            \ ]

let g:antigram = ['"A volunteer fireman" is an anagram for "I never run to a flame"']
let g:startify_custom_header = g:startify_custom_header + startify#fortune#boxed() + g:antigram
" }}}1

" closetag {{{1
let g:closetag_filenames = "*.html,*html+,*.xhtml,*.phtml,*.php,*.jsx,*.tsx,*.js"
" }}}1

" pydocstring {{{1
nmap <silent> <c-o> <Plug>(pydocstring)
" }}}1

" JsDoc config {{{1
exec printf("source %s/%s", g:config_location, "/jsdoc.vim")
" }}}1

" random_colorscheme config {{{1
exec printf("source %s/%s", g:config_location, "/random_colorscheme_config.vim")
" }}}1

" coc config {{{1
" exec printf('source %s/%s', "~/.config/nvim/", 'coc_config.vim')
exec printf('source %s/%s', "~/.config/nvim/", 'lsp.vim')
" }}}1

" TermSplit config {{{1
exec printf("source %s/%s", g:config_location, "/NeovimTerm.vim")
" }}}1

" vim-todo-highlight {{{1
exec printf("source %s/%s", g:config_location, "/vim_todo_highlight.vim")
" }}}1

