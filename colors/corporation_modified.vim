" Vim color file - corporation_modified
" Generated by http://bytefluent.com/vivify 2020-03-26
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "corporation_modified"

"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#e1e6e3 guibg=#19241a guisp=#19241a gui=NONE ctermfg=254 ctermbg=235 cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi Question -- no settings --
"hi EnumerationName -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi CTagsClass -- no settings --
"hi clear -- no settings --
hi IncSearch guifg=#1a1a1a guibg=#bd0084 guisp=#bd0084 gui=NONE ctermfg=234 ctermbg=5 cterm=NONE
hi WildMenu guifg=NONE guibg=#a7a8a1 guisp=#a7a8a1 gui=NONE ctermfg=NONE ctermbg=144 cterm=NONE
hi SignColumn guifg=#1a1a1a guibg=#53915c guisp=#53915c gui=NONE ctermfg=234 ctermbg=65 cterm=NONE
hi SpecialComment guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi Typedef guifg=#45784c guibg=NONE guisp=NONE gui=bold ctermfg=65 ctermbg=NONE cterm=bold
hi Title guifg=#e1e6e3 guibg=#19241a guisp=#19241a gui=bold ctermfg=254 ctermbg=235 cterm=bold
hi Folded guifg=#1a1a1a guibg=#a7a8a1 guisp=#a7a8a1 gui=italic ctermfg=234 ctermbg=144 cterm=NONE
hi PreCondit guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi Include guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#1a1a1a guibg=#bd0084 guisp=#bd0084 gui=bold ctermfg=234 ctermbg=5 cterm=bold
hi StatusLineNC guifg=#1a1a1a guibg=#63705e guisp=#63705e gui=bold ctermfg=234 ctermbg=65 cterm=bold
hi NonText guifg=#4e584a guibg=NONE guisp=NONE gui=italic ctermfg=240 ctermbg=NONE cterm=NONE
hi DiffText guifg=NONE guibg=#342249 guisp=#342249 gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE
hi ErrorMsg guifg=#8e8f89 guibg=#740091 guisp=#740091 gui=NONE ctermfg=245 ctermbg=54 cterm=NONE
hi Debug guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
hi Identifier guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi Conditional guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi StorageClass guifg=#45784c guibg=NONE guisp=NONE gui=bold ctermfg=65 ctermbg=NONE cterm=bold
hi Todo guifg=#e1e6e3 guibg=#bd0084 guisp=#bd0084 gui=NONE ctermfg=254 ctermbg=5 cterm=NONE
hi Special guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi LineNr guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#1a1a1a guibg=#bd0084 guisp=#bd0084 gui=bold ctermfg=234 ctermbg=5 cterm=bold
hi Label guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi PMenuSel guifg=#1a1a1a guibg=#bd0084 guisp=#bd0084 gui=NONE ctermfg=234 ctermbg=5 cterm=NONE
hi Search guifg=#1a1a1a guibg=#bd0084 guisp=#bd0084 gui=NONE ctermfg=234 ctermbg=5 cterm=NONE
hi Delimiter guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi Statement guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi SpellRare guifg=#e1e6e3 guibg=#19241a guisp=#19241a gui=underline ctermfg=254 ctermbg=235 cterm=underline
hi Comment guifg=#4e584a guibg=NONE guisp=NONE gui=italic ctermfg=240 ctermbg=NONE cterm=NONE
hi Character guifg=#8e8f89 guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Float guifg=#8e8f89 guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Number guifg=#8e8f89 guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Boolean guifg=#8e8f89 guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Operator guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi CursorLine guifg=NONE guibg=#303022 guisp=#303022 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLineFill guifg=#1a1a1a guibg=#63705e guisp=#63705e gui=bold ctermfg=234 ctermbg=65 cterm=bold
hi WarningMsg guifg=#8e8f89 guibg=#740091 guisp=#740091 gui=NONE ctermfg=245 ctermbg=54 cterm=NONE
hi VisualNOS guifg=#1a1a1a guibg=#f9fffc guisp=#f9fffc gui=underline ctermfg=234 ctermbg=194 cterm=underline
hi DiffDelete guifg=NONE guibg=#19241a guisp=#19241a gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi ModeMsg guifg=#e0e0e0 guibg=#19241a guisp=#19241a gui=bold ctermfg=254 ctermbg=235 cterm=bold
hi CursorColumn guifg=NONE guibg=#303022 guisp=#303022 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Define guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi Function guifg=#45784c guibg=NONE guisp=NONE gui=bold ctermfg=65 ctermbg=NONE cterm=bold
hi FoldColumn guifg=#1a1a1a guibg=#a7a8a1 guisp=#a7a8a1 gui=italic ctermfg=234 ctermbg=144 cterm=NONE
hi PreProc guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi Visual guifg=#1a1a1a guibg=#f9fffc guisp=#f9fffc gui=NONE ctermfg=234 ctermbg=194 cterm=NONE
hi MoreMsg guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi SpellCap guifg=#e1e6e3 guibg=#19241a guisp=#19241a gui=underline ctermfg=254 ctermbg=235 cterm=underline
hi VertSplit guifg=#1a1a1a guibg=#63705e guisp=#63705e gui=bold ctermfg=234 ctermbg=65 cterm=bold
hi Exception guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi Keyword guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi Type guifg=#45784c guibg=NONE guisp=NONE gui=bold ctermfg=65 ctermbg=NONE cterm=bold
hi DiffChange guifg=NONE guibg=#342249 guisp=#342249 gui=NONE ctermfg=NONE ctermbg=239 cterm=NONE
hi Cursor guifg=#1a1a1a guibg=#f9f9f9 guisp=#f9f9f9 gui=NONE ctermfg=234 ctermbg=15 cterm=NONE
hi SpellLocal guifg=#e1e6e3 guibg=#19241a guisp=#19241a gui=underline ctermfg=254 ctermbg=235 cterm=underline
hi Error guifg=#8e8f89 guibg=#740091 guisp=#740091 gui=NONE ctermfg=245 ctermbg=54 cterm=NONE
hi PMenu guifg=#1a1a1a guibg=#63705e guisp=#63705e gui=NONE ctermfg=234 ctermbg=65 cterm=NONE
hi SpecialKey guifg=#4e584a guibg=NONE guisp=NONE gui=italic ctermfg=240 ctermbg=NONE cterm=NONE
hi Constant guifg=#8e8f89 guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi Tag guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi String guifg=#8e8f89 guibg=NONE guisp=NONE gui=NONE ctermfg=245 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=NONE guibg=#a5a4a8 guisp=#a5a4a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi MatchParen guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi Repeat guifg=#a40073 guibg=NONE guisp=NONE gui=bold ctermfg=126 ctermbg=NONE cterm=bold
hi SpellBad guifg=#e1e6e3 guibg=#19241a guisp=#19241a gui=underline ctermfg=254 ctermbg=235 cterm=underline
hi Directory guifg=#45784c guibg=NONE guisp=NONE gui=bold ctermfg=65 ctermbg=NONE cterm=bold
hi Structure guifg=#45784c guibg=NONE guisp=NONE gui=bold ctermfg=65 ctermbg=NONE cterm=bold
hi Macro guifg=#a40073 guibg=NONE guisp=NONE gui=NONE ctermfg=126 ctermbg=NONE cterm=NONE
hi Underlined guifg=#e1e6e3 guibg=#19241a guisp=#19241a gui=underline ctermfg=254 ctermbg=235 cterm=underline
hi DiffAdd guifg=NONE guibg=#322c19 guisp=#322c19 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLine guifg=#1a1a1a guibg=#63705e guisp=#63705e gui=bold ctermfg=234 ctermbg=65 cterm=bold
hi cursorim guifg=#1a1a1a guibg=#53915c guisp=#53915c gui=NONE ctermfg=234 ctermbg=65 cterm=NONE
hi mbenormal guifg=#b799b4 guibg=#2e3f3b guisp=#2e3f3b gui=NONE ctermfg=139 ctermbg=237 cterm=NONE
hi perlspecialstring guifg=#71a3b8 guibg=#404040 guisp=#404040 gui=NONE ctermfg=67 ctermbg=238 cterm=NONE
hi doxygenspecial guifg=#e581dd guibg=NONE guisp=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
hi mbechanged guifg=#d6d6d6 guibg=#2e3f3b guisp=#2e3f3b gui=NONE ctermfg=188 ctermbg=237 cterm=NONE
hi mbevisiblechanged guifg=#d6d6d6 guibg=#4e8f6e guisp=#4e8f6e gui=NONE ctermfg=188 ctermbg=65 cterm=NONE
hi doxygenparam guifg=#e581dd guibg=NONE guisp=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
hi doxygensmallspecial guifg=#e581dd guibg=NONE guisp=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
hi doxygenprev guifg=#e581dd guibg=NONE guisp=NONE gui=NONE ctermfg=176 ctermbg=NONE cterm=NONE
hi perlspecialmatch guifg=#71a3b8 guibg=#404040 guisp=#404040 gui=NONE ctermfg=67 ctermbg=238 cterm=NONE
hi cformat guifg=#71a3b8 guibg=#404040 guisp=#404040 gui=NONE ctermfg=67 ctermbg=238 cterm=NONE
hi lcursor guifg=#272727 guibg=#ffc18b guisp=#ffc18b gui=NONE ctermfg=235 ctermbg=216 cterm=NONE
hi doxygenspecialmultilinedesc guifg=#950a93 guibg=NONE guisp=NONE gui=NONE ctermfg=90 ctermbg=NONE cterm=NONE
hi taglisttagname guifg=#73d59a guibg=NONE guisp=NONE gui=NONE ctermfg=115 ctermbg=NONE cterm=NONE
hi doxygenbrief guifg=#e357e5 guibg=NONE guisp=NONE gui=NONE ctermfg=170 ctermbg=NONE cterm=NONE
hi mbevisiblenormal guifg=#b7b7b6 guibg=#4e8f6e guisp=#4e8f6e gui=NONE ctermfg=250 ctermbg=65 cterm=NONE
hi user2 guifg=#5e8773 guibg=#3e5e4d guisp=#3e5e4d gui=NONE ctermfg=66 ctermbg=65 cterm=NONE
hi user1 guifg=#dbe600 guibg=#3e5e4d guisp=#3e5e4d gui=NONE ctermfg=184 ctermbg=65 cterm=NONE
hi doxygenspecialonelinedesc guifg=#950a93 guibg=NONE guisp=NONE gui=NONE ctermfg=90 ctermbg=NONE cterm=NONE
hi doxygencomment guifg=#951c83 guibg=NONE guisp=NONE gui=NONE ctermfg=89 ctermbg=NONE cterm=NONE
hi cspecialcharacter guifg=#71a3b8 guibg=#404040 guisp=#404040 gui=NONE ctermfg=67 ctermbg=238 cterm=NONE
hi pythonimport guifg=#783c00 guibg=NONE guisp=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi pythonexception guifg=#6b00d6 guibg=NONE guisp=NONE gui=NONE ctermfg=56 ctermbg=NONE cterm=NONE
hi pythonbuiltinfunction guifg=#783c00 guibg=NONE guisp=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi pythonoperator guifg=#6b8a70 guibg=NONE guisp=NONE gui=NONE ctermfg=65 ctermbg=NONE cterm=NONE
hi pythonexclass guifg=#783c00 guibg=NONE guisp=NONE gui=NONE ctermfg=3 ctermbg=NONE cterm=NONE
hi pythonbuiltin guifg=#777d6d guibg=NONE guisp=NONE gui=NONE ctermfg=101 ctermbg=NONE cterm=NONE
hi phpstringdouble guifg=#cacbcc guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi htmltagname guifg=#cacbcc guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi javascriptstrings guifg=#cacbcc guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi htmlstring guifg=#cacbcc guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi phpstringsingle guifg=#cacbcc guibg=NONE guisp=NONE gui=NONE ctermfg=252 ctermbg=NONE cterm=NONE
hi stringdelimiter guifg=#4e272d guibg=NONE guisp=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE
hi rubyregexp guifg=#0021c5 guibg=NONE guisp=NONE gui=NONE ctermfg=4 ctermbg=NONE cterm=NONE
hi string guifg=#955c66 guibg=NONE guisp=NONE gui=NONE ctermfg=95 ctermbg=NONE cterm=NONE
hi constant guifg=#9843b7 guibg=NONE guisp=NONE gui=NONE ctermfg=97 ctermbg=NONE cterm=NONE
hi normal guifg=#d0bec7 guibg=#151515 guisp=#151515 gui=NONE ctermfg=252 ctermbg=233 cterm=NONE
hi rubyinstancevariable guifg=#a4e6d3 guibg=NONE guisp=NONE gui=NONE ctermfg=115 ctermbg=NONE cterm=NONE
hi rubyclass guifg=#41813a guibg=NONE guisp=NONE gui=NONE ctermfg=65 ctermbg=NONE cterm=NONE
hi identifier guifg=#a4d6cc guibg=NONE guisp=NONE gui=NONE ctermfg=152 ctermbg=NONE cterm=NONE
hi comment guifg=#707070 guibg=NONE guisp=NONE gui=italic ctermfg=242 ctermbg=NONE cterm=NONE
hi rubyregexpdelimiter guifg=#00304a guibg=NONE guisp=NONE gui=NONE ctermfg=23 ctermbg=NONE cterm=NONE
hi rubyregexpspecial guifg=#001c8c guibg=NONE guisp=NONE gui=NONE ctermfg=18 ctermbg=NONE cterm=NONE
hi rubypredefinedidentifier guifg=#6b4cc6 guibg=NONE guisp=NONE gui=NONE ctermfg=98 ctermbg=NONE cterm=NONE
hi function guifg=#e06dcd guibg=NONE guisp=NONE gui=NONE ctermfg=170 ctermbg=NONE cterm=NONE
hi directory guifg=#c277a4 guibg=NONE guisp=NONE gui=NONE ctermfg=175 ctermbg=NONE cterm=NONE
hi rubysymbol guifg=#69bd76 guibg=NONE guisp=NONE gui=NONE ctermfg=71 ctermbg=NONE cterm=NONE
hi rubycontrol guifg=#66ad6c guibg=NONE guisp=NONE gui=NONE ctermfg=71 ctermbg=NONE cterm=NONE
hi rubyidentifier guifg=#a4e6d3 guibg=NONE guisp=NONE gui=NONE ctermfg=115 ctermbg=NONE cterm=NONE