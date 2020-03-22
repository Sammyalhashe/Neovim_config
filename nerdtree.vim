autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " close if only thing left is NT
let g:NERDTreeWinPos = "left"
nnoremap <Leader>y :NERDTreeToggle<Enter>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeShowHidden=1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#282828')
" call NERDTreeHighlightFile('py', 'yellow', 'none', 'yellow', 'none')
" call NERDTreeHighlightFile('py*', 'yellow', 'none', 'yellow', 'none')
" call NERDTreeHighlightFile('vim', 'green', 'none', 'green', 'none')
" call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#282828')
" call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#282828')
" call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#282828')
" call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#282828')
" call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#282828')
" call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'none')
" call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#282828')
" call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#282828')
" call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#282828')
" call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#282828')
" call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#282828')
" call NERDTreeHighlightFile('ts', 'blue', 'none', '#ffa500', '#282828')
" call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#282828')

