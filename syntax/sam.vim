" Vim syntax file
" Language: SAM (S)yntactically (A)mbiguous (M)ess
" Maintainer: (Sam)my Al Hashemi
" Latest Revision: 27 Apr 2020

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword samLanguageKeywords print var sam
syn keyword samConditionalKeywords if else
syn keyword samRepeatKeywords for while
syn keyword samLogicalKeywords and or
syn keyword otherKeywords nil
syn match samComment /\/\/.*/
syn region samString start=/"/ end=/"/
syn keyword samBool true false
