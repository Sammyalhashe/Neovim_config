" Vim color file - starllama
" Generated by http://bytefluent.com/vivify 2020-06-09
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "starllama"

"hi IncSearch -- no settings --
"hi WildMenu -- no settings --
"hi SignColumn -- no settings --
"hi TabLineSel -- no settings --
"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi DiffText -- no settings --
"hi ErrorMsg -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#e0dddd guibg=#080404 guisp=#080404 gui=NONE ctermfg=254 ctermbg=232 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi SpellRare -- no settings --
"hi EnumerationValue -- no settings --
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
hi SpecialComment guifg=#db7f6d guibg=#181414 guisp=#181414 gui=italic ctermfg=167 ctermbg=234 cterm=NONE
hi Typedef guifg=#ad8c7e guibg=#080404 guisp=#080404 gui=italic ctermfg=138 ctermbg=232 cterm=NONE
hi Title guifg=#e6e6e6 guibg=#202020 guisp=#202020 gui=underline ctermfg=254 ctermbg=234 cterm=underline
hi Folded guifg=#a1a1a1 guibg=#080404 guisp=#080404 gui=bold,italic ctermfg=247 ctermbg=232 cterm=bold
hi PreCondit guifg=#dbc3db guibg=#080404 guisp=#080404 gui=italic ctermfg=182 ctermbg=232 cterm=NONE
hi Include guifg=#dbc3db guibg=#080404 guisp=#080404 gui=italic ctermfg=182 ctermbg=232 cterm=NONE
hi StatusLineNC guifg=#eeeeee guibg=#000000 guisp=#000000 gui=NONE ctermfg=255 ctermbg=NONE cterm=NONE
hi NonText guifg=#e6dede guibg=#181414 guisp=#181414 gui=NONE ctermfg=254 ctermbg=234 cterm=NONE
hi Debug guifg=#db7f6d guibg=#181414 guisp=#181414 gui=italic ctermfg=167 ctermbg=234 cterm=NONE
hi PMenuSbar guifg=NONE guibg=#181414 guisp=#181414 gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi Identifier guifg=#e6e6e6 guibg=#080404 guisp=#080404 gui=italic ctermfg=254 ctermbg=232 cterm=NONE
hi SpecialChar guifg=#db7f6d guibg=#181414 guisp=#181414 gui=italic ctermfg=167 ctermbg=234 cterm=NONE
hi Conditional guifg=#86cc72 guibg=#080404 guisp=#080404 gui=underline ctermfg=114 ctermbg=232 cterm=underline
hi StorageClass guifg=#ad8c7e guibg=#080404 guisp=#080404 gui=italic ctermfg=138 ctermbg=232 cterm=NONE
hi Todo guifg=#e6e6e6 guibg=#080404 guisp=#080404 gui=bold,italic,underline ctermfg=254 ctermbg=232 cterm=bold,underline
hi Special guifg=#e61111 guibg=#181414 guisp=#181414 gui=bold ctermfg=160 ctermbg=234 cterm=bold
hi LineNr guifg=#e6e6e6 guibg=#181414 guisp=#181414 gui=NONE ctermfg=254 ctermbg=234 cterm=NONE
hi StatusLine guifg=#eeeeee guibg=#000000 guisp=#000000 gui=bold ctermfg=255 ctermbg=NONE cterm=bold
hi Label guifg=#ad8c7e guibg=#080404 guisp=#080404 gui=italic ctermfg=138 ctermbg=232 cterm=NONE
hi PMenuSel guifg=#ffffff guibg=#423939 guisp=#423939 gui=NONE ctermfg=15 ctermbg=238 cterm=NONE
hi Search guifg=#a1a1a1 guibg=#e4f000 guisp=#e4f000 gui=italic,underline ctermfg=247 ctermbg=11 cterm=underline
hi Delimiter guifg=#db7f6d guibg=#181414 guisp=#181414 gui=italic ctermfg=167 ctermbg=234 cterm=NONE
hi Statement guifg=#e6e6e6 guibg=#080404 guisp=#080404 gui=bold,underline ctermfg=254 ctermbg=232 cterm=bold,underline
hi Comment guifg=#e63c11 guibg=#080404 guisp=#080404 gui=NONE ctermfg=160 ctermbg=232 cterm=NONE
hi Character guifg=#6ae66a guibg=#080404 guisp=#080404 gui=NONE ctermfg=77 ctermbg=232 cterm=NONE
hi Float guifg=#6ae66a guibg=#080404 guisp=#080404 gui=NONE ctermfg=77 ctermbg=232 cterm=NONE
hi Number guifg=#bd4ee6 guibg=#080404 guisp=#080404 gui=NONE ctermfg=134 ctermbg=232 cterm=NONE
hi Boolean guifg=#7286cc guibg=#080404 guisp=#080404 gui=underline ctermfg=104 ctermbg=232 cterm=underline
hi Operator guifg=#e6e6e6 guibg=#080404 guisp=#080404 gui=bold ctermfg=254 ctermbg=232 cterm=bold
hi CursorLine guifg=#e6dede guibg=#201c1c guisp=#201c1c gui=NONE ctermfg=254 ctermbg=234 cterm=NONE
hi ModeMsg guifg=#dedede guibg=NONE guisp=NONE gui=bold,italic,underline ctermfg=253 ctermbg=NONE cterm=bold,underline
hi CursorColumn guifg=#e6dede guibg=#201c1c guisp=#201c1c gui=NONE ctermfg=254 ctermbg=234 cterm=NONE
hi Define guifg=#88a6bb guibg=#080404 guisp=#080404 gui=italic ctermfg=109 ctermbg=232 cterm=NONE
hi Function guifg=#e6e6e6 guibg=#080404 guisp=#080404 gui=NONE ctermfg=254 ctermbg=232 cterm=NONE
hi PreProc guifg=#e6e6e6 guibg=#080404 guisp=#080404 gui=bold ctermfg=254 ctermbg=232 cterm=bold
hi Visual guifg=NONE guibg=#282020 guisp=#282020 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi VertSplit guifg=#a1a1a1 guibg=#301810 guisp=#301810 gui=NONE ctermfg=247 ctermbg=52 cterm=NONE
hi Exception guifg=#cc4327 guibg=#080404 guisp=#080404 gui=underline ctermfg=160 ctermbg=232 cterm=underline
hi Keyword guifg=#ad8c7e guibg=#080404 guisp=#080404 gui=italic ctermfg=138 ctermbg=232 cterm=NONE
hi Type guifg=#e6e6e6 guibg=#080404 guisp=#080404 gui=bold ctermfg=254 ctermbg=232 cterm=bold
hi PMenu guifg=#e0dddd guibg=#000000 guisp=#000000 gui=NONE ctermfg=254 ctermbg=NONE cterm=NONE
hi SpecialKey guifg=#e6dede guibg=#282424 guisp=#282424 gui=bold ctermfg=254 ctermbg=235 cterm=bold
hi Constant guifg=#8584e6 guibg=#080404 guisp=#080404 gui=NONE ctermfg=104 ctermbg=232 cterm=NONE
hi Tag guifg=#db7f6d guibg=#181414 guisp=#181414 gui=italic ctermfg=167 ctermbg=234 cterm=NONE
hi String guifg=#8584e6 guibg=#080404 guisp=#080404 gui=NONE ctermfg=104 ctermbg=232 cterm=NONE
hi PMenuThumb guifg=#e6e6e6 guibg=#cfb6b6 guisp=#cfb6b6 gui=NONE ctermfg=254 ctermbg=181 cterm=NONE
hi MatchParen guifg=#e6e6e6 guibg=#904030 guisp=#904030 gui=NONE ctermfg=254 ctermbg=88 cterm=NONE
hi Repeat guifg=#cc8672 guibg=#080404 guisp=#080404 gui=underline ctermfg=174 ctermbg=232 cterm=underline
hi Structure guifg=#ad8c7e guibg=#080404 guisp=#080404 gui=italic ctermfg=138 ctermbg=232 cterm=NONE
hi Macro guifg=#dbc3db guibg=#080404 guisp=#080404 gui=italic ctermfg=182 ctermbg=232 cterm=NONE
hi Underlined guifg=#e6dede guibg=#080404 guisp=#080404 gui=underline ctermfg=254 ctermbg=232 cterm=underline
hi cursorim guifg=#a1a1a1 guibg=#536991 guisp=#536991 gui=NONE ctermfg=247 ctermbg=60 cterm=NONE
