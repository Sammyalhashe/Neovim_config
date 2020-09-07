" sane defaults for python files
" setting the tabs
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent
" set the colorcolumn
setlocal colorcolumn=80
" set the path for nvim to parse in projects [current directory and recursively all subs]
setlocal path=.,**
" ignore compiled python files
setlocal wildignore=*.pyc
" set the included files (in a file) to be signified by import statements
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)

" function to take these matches strings and turn them
" into filepaths that can be linkable
" import conv.metrics (1)
" /conv.metrics/
" conv/metrics.py
" from conv import conversion as conv (2)
" /conv import conversion/
" conv/conversion.py OR conv.py (can be either a filename or a function)
function! PyInclude(fname)
    let parts = split(a:fname, ' import ') " (1) [conv.metric] (2) [conv, conversion]
    let leftPart = parts[0] " (1) conv.metrics (2) conv
    echom a:fname
    echom leftPart
    if len(parts) > 1
        let rightPart = parts[1] " conversion
        let joined = join([leftPart, rightPart], '.') " conv.conversion
        let fp = substitute(joined, '\.', '/', 'g') . '.py'
        echom(fp)
        let found = glob(fp, 1)
        if (len(found))
            return found
        endif
    endif
    return substitute(leftPart, '\.', '/', 'g') . '.py'
endfunction

setlocal includeexpr=PyInclude(v:fname)
