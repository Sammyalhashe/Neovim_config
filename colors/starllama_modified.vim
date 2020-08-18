" Vim color file - starllama_modified
" Generated by http://bytefluent.com/vivify 2020-06-11
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "starllama_modified"

"hi IncSearch -- no settings --
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi DiffText -- no settings --
"hi ErrorMsg -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#adabab guibg=#080404 guisp=#080404 gui=NONE ctermfg=145 ctermbg=232 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
"hi TabLineSel -- no settings --
"hi Union -- no settings --
"hi TabLineFill -- no settings --
"hi Question -- no settings --
"hi WarningMsg -- no settings --
"hi VisualNOS -- no settings --
"hi DiffDelete -- no settings --
"hi FoldColumn -- no settings --
"hi EnumerationName -- no settings --
"hi MoreMsg -- no settings --
"hi SpellCap -- no settings --
"hi DiffChange -- no settings --
"hi Cursor -- no settings --
"hi SpellLocal -- no settings --
"hi Error -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi SpellBad -- no settings --
"hi CTagsClass -- no settings --
"hi Directory -- no settings --
"hi DiffAdd -- no settings --
"hi TabLine -- no settings --
"hi clear -- no settings --
hi SpecialComment guifg=#ad6656 guibg=#181414 guisp=#181414 gui=italic ctermfg=131 ctermbg=234 cterm=NONE
hi Typedef guifg=#7d665d guibg=#080404 guisp=#080404 gui=italic ctermfg=95 ctermbg=232 cterm=NONE
hi Title guifg=#b3b3b3 guibg=#202020 guisp=#202020 gui=underline ctermfg=249 ctermbg=234 cterm=underline
hi Folded guifg=#6e6e6e guibg=#080404 guisp=#080404 gui=bold,italic ctermfg=242 ctermbg=232 cterm=bold
hi PreCondit guifg=#ad9aad guibg=#080404 guisp=#080404 gui=italic ctermfg=145 ctermbg=232 cterm=NONE
hi Include guifg=#ad9aad guibg=#080404 guisp=#080404 gui=italic ctermfg=145 ctermbg=232 cterm=NONE
hi Float guifg=#52b352 guibg=#080404 guisp=#080404 gui=NONE ctermfg=71 ctermbg=232 cterm=NONE
hi StatusLineNC guifg=#bdbdbd guibg=#000000 guisp=#000000 gui=NONE ctermfg=250 ctermbg=NONE cterm=NONE
hi NonText guifg=#b3adad guibg=#181414 guisp=#181414 gui=NONE ctermfg=249 ctermbg=234 cterm=NONE
hi Debug guifg=#ad6656 guibg=#181414 guisp=#181414 gui=italic ctermfg=131 ctermbg=234 cterm=NONE
hi PMenuSbar guifg=NONE guibg=#181414 guisp=#181414 gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Identifier guifg=#b3b3b3 guibg=#080404 guisp=#080404 gui=italic ctermfg=249 ctermbg=232 cterm=NONE
hi SpecialChar guifg=#ad6656 guibg=#181414 guisp=#181414 gui=italic ctermfg=131 ctermbg=234 cterm=NONE
hi Conditional guifg=#659d57 guibg=#080404 guisp=#080404 gui=underline ctermfg=71 ctermbg=232 cterm=underline
hi StorageClass guifg=#7d665d guibg=#080404 guisp=#080404 gui=italic ctermfg=95 ctermbg=232 cterm=NONE
hi Todo guifg=#b3b3b3 guibg=#080404 guisp=#080404 gui=bold,italic,underline ctermfg=249 ctermbg=232 cterm=bold,underline
hi Special guifg=#b30d0d guibg=#080404 guisp=#080404 gui=bold ctermfg=124 ctermbg=232 cterm=bold
hi LineNr guifg=#b3b3b3 guibg=#181414 guisp=#181414 gui=NONE ctermfg=249 ctermbg=234 cterm=NONE
hi StatusLine guifg=#bdbdbd guibg=#000000 guisp=#000000 gui=bold ctermfg=250 ctermbg=NONE cterm=bold
hi Label guifg=#7d665d guibg=#080404 guisp=#080404 gui=italic ctermfg=95 ctermbg=232 cterm=NONE
hi PMenuSel guifg=#cccccc guibg=#423939 guisp=#423939 gui=NONE ctermfg=252 ctermbg=238 cterm=NONE
hi Search guifg=#6e6e6e guibg=#e4f000 guisp=#e4f000 gui=italic,underline ctermfg=242 ctermbg=11 cterm=underline
hi Delimiter guifg=#ad6656 guibg=#181414 guisp=#181414 gui=italic ctermfg=131 ctermbg=234 cterm=NONE
hi Statement guifg=#b3b3b3 guibg=#080404 guisp=#080404 gui=bold,underline ctermfg=249 ctermbg=232 cterm=bold,underline
hi Comment guifg=#b32e0d guibg=#080404 guisp=#080404 gui=NONE ctermfg=124 ctermbg=232 cterm=NONE
hi Character guifg=#52b352 guibg=#080404 guisp=#080404 gui=NONE ctermfg=71 ctermbg=232 cterm=NONE
hi Number guifg=#933cb3 guibg=#080404 guisp=#080404 gui=NONE ctermfg=97 ctermbg=232 cterm=NONE
hi Boolean guifg=#57659d guibg=#080404 guisp=#080404 gui=underline ctermfg=61 ctermbg=232 cterm=underline
hi Operator guifg=#b3b3b3 guibg=#080404 guisp=#080404 gui=bold ctermfg=249 ctermbg=232 cterm=bold
hi CursorLine guifg=#b3adad guibg=#201c1c guisp=#201c1c gui=NONE ctermfg=249 ctermbg=234 cterm=NONE
hi ModeMsg guifg=#adadad guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=145 ctermbg=NONE cterm=bold,underline
hi CursorColumn guifg=#b3adad guibg=#201c1c guisp=#201c1c gui=NONE ctermfg=249 ctermbg=234 cterm=NONE
hi Define guifg=#627887 guibg=#080404 guisp=#080404 gui=italic ctermfg=66 ctermbg=232 cterm=NONE
hi Function guifg=#b3b3b3 guibg=#080404 guisp=#080404 gui=NONE ctermfg=249 ctermbg=232 cterm=NONE
hi PreProc guifg=#b3b3b3 guibg=#080404 guisp=#080404 gui=bold ctermfg=249 ctermbg=232 cterm=bold
hi Visual guifg=NONE guibg=#282020 guisp=#282020 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi VertSplit guifg=#6e6e6e guibg=#301810 guisp=#301810 gui=NONE ctermfg=242 ctermbg=52 cterm=NONE
hi Exception guifg=#9d331e guibg=#080404 guisp=#080404 gui=underline ctermfg=124 ctermbg=232 cterm=underline
hi Keyword guifg=#7d665d guibg=#080404 guisp=#080404 gui=italic ctermfg=95 ctermbg=232 cterm=NONE
hi Type guifg=#258c0b guibg=#080404 guisp=#080404 gui=bold ctermfg=28 ctermbg=232 cterm=bold
hi PMenu guifg=#adabab guibg=#000000 guisp=#000000 gui=NONE ctermfg=145 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#b3adad guibg=#282424 guisp=#282424 gui=bold ctermfg=249 ctermbg=235 cterm=bold
hi Constant guifg=#6866b3 guibg=#080404 guisp=#080404 gui=NONE ctermfg=61 ctermbg=232 cterm=NONE
hi Tag guifg=#ad6656 guibg=#181414 guisp=#181414 gui=italic ctermfg=131 ctermbg=234 cterm=NONE
hi String guifg=#6866b3 guibg=#080404 guisp=#080404 gui=NONE ctermfg=61 ctermbg=232 cterm=NONE
hi PMenuThumb guifg=#b3b3b3 guibg=#cfb6b6 guisp=#cfb6b6 gui=NONE ctermfg=249 ctermbg=181 cterm=NONE
hi MatchParen guifg=#b3b3b3 guibg=#904030 guisp=#904030 gui=NONE ctermfg=249 ctermbg=88 cterm=NONE
hi Repeat guifg=#9d6557 guibg=#080404 guisp=#080404 gui=underline ctermfg=131 ctermbg=232 cterm=underline
hi Structure guifg=#7d665d guibg=#080404 guisp=#080404 gui=italic ctermfg=95 ctermbg=232 cterm=NONE
hi Macro guifg=#ad9aad guibg=#080404 guisp=#080404 gui=italic ctermfg=145 ctermbg=232 cterm=NONE
hi Underlined guifg=#b3adad guibg=#080404 guisp=#080404 gui=underline ctermfg=249 ctermbg=232 cterm=underline
hi cursorim guifg=#6e6e6e guibg=#536991 guisp=#536991 gui=NONE ctermfg=242 ctermbg=60 cterm=NONE
