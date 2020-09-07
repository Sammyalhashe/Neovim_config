" https://github.com/neovim/nvim-lsp/issues/130
lua << EOF
local nvim_lsp = require('nvim_lsp')
local configs = require('nvim_lsp/configs')

local on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    local method = 'textDocument/publishDiagnostics'

local default_callback = vim.lsp.callbacks[method]
  vim.lsp.callbacks[method] = function(err, method, result, client_id)
    default_callback(err, method, result, client_id)
    if result and result.diagnostics then
      for _, v in ipairs(result.diagnostics) do
        v.uri = v.uri or result.uri
      end
      vim.lsp.util.set_qflist(result.diagnostics)
      end
    end

    -- Mappings.
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ',e', '<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opts)
  end


-- NOTE: jdtls isn't defined for this solution. Just use emacs
local servers = {'pyls', 'tsserver', 'vimls', 'clangd', 'bashls'}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = on_attach,
    }
  end


-- Check if it's already defined for when I reload this file.
-- require'nvim_lsp'.pyls.setup{}
-- require'nvim_lsp'.tsserver.setup{}
-- require'nvim_lsp'.vimls.setup{}
-- require'nvim_lsp'.clangd.setup{}
EOF

let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><CR> <SID>smart_carriage_return()


augroup user_plugin_deoplete
	autocmd!
	autocmd CompleteDone * call <SID>smart_complete_done()
augroup END

function s:smart_complete_done()
	" Store the last completed item abbr
	let g:completed_abbr = get(v:completed_item, 'abbr', '')
	silent! pclose!
endfunction

function s:smart_carriage_return()
   if !pumvisible() || get(complete_info(), 'selected', -1) < 0
      return "\<CR>"
   else
      return "\<C-y>"
   endif
endfunction

autocmd BufEnter * lua require'completion'.on_attach()
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-p> completion#trigger_completion() " map <c-p> to manually trigger completion
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"
" let g:completion_enable_snippet = 'Neosnippet'


" " Plugin key-mappings.
" " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)

" " SuperTab like snippets behavior.
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" " For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
