let $NVIM_COC_LOG_LEVEL = 'debug'

" Set the os
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif


if g:os == 'Darwin'
    let g:config_location = "~/.config/nvim"
    let g:my_colorscheme = "spacecamp"
elseif g:os == 'Linux'
    let g:config_location = "~/.config/nvim"
    let g:my_colorscheme = "NeoSolarized"
endif

" Install Vim Plug if not installed
if has('nvim')
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall
    endif
endif


function! BuildComposer(info)
    if a:info.status != 'unchanged' || a:info.force
        if has('nvim')
            !cargo build --release
        else
            !cargo build --release --no-default-features --features json-rpc
        endif
    endif
endfunction

call plug#begin()

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

Plug 'mhinz/vim-startify'

Plug 'vimlab/split-term.vim'
Plug 'junegunn/goyo.vim'
Plug 'jpalardy/vim-slime'

" Close the vim current buffer without ending the actual process -> :Bclose
Plug 'rbgrouleff/bclose.vim'

" Color schemes
" Plug 'patstockwell/vim-monokai-tasty'
Plug 'liuchengxu/space-vim-theme'
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'jaredgorski/spacecamp'
" Plug 'iCyMind/NeoSolarized'
" Plug 'Rigellute/rigel'

" Shuogo plugins -> vim user that makes nice plugins
Plug 'Shougo/context_filetype.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"" formatting code
Plug 'sbdchd/neoformat'

" easy commenting of code -> mapped to <leader>cc
Plug 'tpope/vim-commentary'

" gitgutter for vim
Plug 'airblade/vim-gitgutter'

" Nerdtree related plugins
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tpope/vim-fugitive'

" Build the extra binary if cargo exists on your system.
" Plug 'liuchengxu/vim-clap'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" asynchrounous linting engine
Plug 'w0rp/ale'

" statusline
Plug 'rbong/vim-crystalline'

" auto pair brackets and other bracket related plugins
Plug 'jiangmiao/auto-pairs'
" Plug 'tmsvg/pear-tree'
Plug 'kien/rainbow_parentheses.vim'

"Python Plugins
" Plug 'heavenshell/vim-pydocstring'

"Markdown Plugins
Plug 'tpope/vim-markdown'

" JSON Plugins
Plug 'elzr/vim-json'

"HTML Plugins
Plug 'alvan/vim-closetag'

"Javascript Plugins
Plug 'seavan/vim-javascript-plus'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Valloric/MatchTagAlways' " highlights matching html tags
Plug 'heavenshell/vim-jsdoc'

"Typescript Plugins
Plug 'leafgarland/typescript-vim'
call plug#end()


if has('nvim')
    source ~/.config/nvim/plugin_conf.vim
else
    source ~/.config/nvim/plugin_conf.vim
endif
