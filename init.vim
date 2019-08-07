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
elseif g:os == 'Linux'
    let g:config_location = "~/.config/nvim"
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


" Close the vim current buffer without ending the actual process -> :Bclose
Plug 'rbgrouleff/bclose.vim'

" Syntax Highlighting 
" Plug 'sheerun/vim-polyglot'

" Color schemes
Plug 'patstockwell/vim-monokai-tasty'
Plug 'liuchengxu/space-vim-dark'
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'herrbischoff/cobalt2.vim'
Plug 'iCyMind/NeoSolarized'
" Plug 'Lokaltog/vim-monotone'
Plug 'tomasr/molokai'

" Shuogo plugins -> vim user that makes nice plugins
Plug 'Shougo/context_filetype.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" latex
"Plug 'lervag/vimtex'

"" formatting code
Plug 'sbdchd/neoformat'

" easy commenting of code -> mapped to <leader>cc
" Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-commentary'

" nice looking opening for vim
Plug 'mhinz/vim-startify'

" gitgutter for vim
" Plug 'airblade/vim-gitgutter'

" Nerdtree related plugins
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'ryanoasis/vim-devicons'
" Plug 'scrooloose/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'tpope/vim-fugitive'
" asynchrounous linting engine
Plug 'w0rp/ale'

" airline related plugins
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'rbong/vim-crystalline'

" auto pair brackets and other bracket related plugins
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'

"Python Plugins
Plug 'heavenshell/vim-pydocstring'

"Markdown Plugins
Plug 'tpope/vim-markdown'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" JSON Plugins
Plug 'elzr/vim-json'

"HTML Plugins
Plug 'alvan/vim-closetag'
Plug 'digitaltoad/vim-pug'

" CSS plugins

"Javascript Plugins
Plug 'mxw/vim-jsx'
Plug 'Quramy/vim-js-pretty-template'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Valloric/MatchTagAlways' " highlights matching html tags
Plug 'heavenshell/vim-jsdoc'

" Java Plugins

"Typescript Plugins
Plug 'leafgarland/typescript-vim'
"Plug 'mhartington/nvim-typescript', {'build': './install.sh'}

call plug#end()


if exists('veonim')
    source ~/.config/nvim/veonim.vim
elseif has('nvim')
    source ~/.config/nvim/plugin_conf.vim
else
    source ~/.config/nvim/plugin_conf.vim
endif
