" vim: foldmethod=marker

"====================================================================="
"                  ______   _    _  _____  ______                     "
"                 |  ___ \ | |  | |(_____)|  ___ \                    "
"                 | |   | || |  | |   _   | | _ | |                   "
"                 | |   | | \ \/ /   | |  | || || |                   "
"                 | |   | |  \  /   _| |_ | || || |                   "
"                 |_|   |_|   \/   (_____)|_||_||_| config            "
"====================================================================="

" Set the os {{{1
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif


if g:os == 'Darwin'
    let g:config_location = "~/.config/nvim"
    let g:my_colorscheme = "gruvbox"
elseif g:os == 'Linux'
    let g:config_location = "~/.config/nvim"
    let g:my_colorscheme = "NeoSolarized"
endif
" }}}

" Install Vim Plug if not installed {{{1
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
" }}}

" VimPlug Choices {{{1
call plug#begin()

function! DoRemote(arg)
    UpdateRemotePlugins
endfunction

" Miscellaneous Plugins {{{2
Plug 'tpope/vim-vinegar'
Plug 'jceb/vim-orgmode'
Plug '~/Documents/sammys-vim-agenda/'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mhinz/vim-startify'
" Plug 'vimlab/split-term.vim'
Plug 'junegunn/goyo.vim'
Plug 'triglav/vim-visual-increment'

" Close the vim current buffer without ending the actual process -> :Bclose
Plug 'rbgrouleff/bclose.vim'

"" formatting code
Plug 'sbdchd/neoformat'

" easy commenting of code -> mapped to <leader>cc
Plug 'tpope/vim-commentary'

" gitgutter for vim
Plug 'airblade/vim-gitgutter'

" Git client
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Build the extra binary if cargo exists on your system.
" Plug 'liuchengxu/vim-clap'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" asynchrounous linting engine
" Plug 'w0rp/ale'
" Plug 'neomake/neomake'

" statusline
Plug 'rbong/vim-crystalline'

" auto pair brackets and other bracket related plugins
Plug 'jiangmiao/auto-pairs'
Plug 'kien/rainbow_parentheses.vim'

" }}}2

" Color schemes {{{2
" Plug 'patstockwell/vim-monokai-tasty'
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'liuchengxu/space-vim-theme'
Plug 'rakr/vim-one'
Plug 'lifepillar/vim-solarized8'
Plug 'vim-scripts/tango.vim'
Plug 'vim-scripts/darktango.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'jaredgorski/spacecamp'
Plug 'jaredgorski/fogbell.vim'
" Plug 'iCyMind/NeoSolarized'
" Plug 'Rigellute/rigel'
" }}}2

" Shuogo plugins -> vim user that makes nice plugins {{{2
Plug 'Shougo/context_filetype.vim'
" }}}2

" Autocomplete {{{2
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'Shougo/deoplete-lsp'
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" }}}2

" Language plugins {{{2

" Arduino {{{3
Plug 'kingbin/vim-arduino'
" }}}3

" Python Plugins {{{3
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
" }}}3

" Markdown Plugins {{{3
Plug 'tpope/vim-markdown'
" }}}3

"HTML/CSS Plugins {{{3
Plug 'alvan/vim-closetag'
" }}}3

" Javascript Plugins {{{3
Plug 'seavan/vim-javascript-plus'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/vim-js-pretty-template'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'Valloric/MatchTagAlways' " highlights matching html tags
Plug 'heavenshell/vim-jsdoc'
Plug 'elzr/vim-json'
" }}}3

" Typescript Plugins {{{3
Plug 'leafgarland/typescript-vim'
" }}}3

" }}}2
call plug#end()
" }}}1

" Sourcing other files {{{1
if exists('g:loaded_plug')
  source ~/.config/nvim/plugin_conf.vim
endif
" }}}1
