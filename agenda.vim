" default directory
let g:default_agenda_dir = get(g:, 'default_agenda_dir', "~/.config/nvim/vim-agenda/")
let g:default_agenda_file = get(g:, 'default_agenda_file', "agenda.md")
let g:expanded_default_agenda_dir = glob(g:default_agenda_dir)

" TODO: add an 'ALL' option
let g:TODO_DICT = {
    \ 1: 'TODO',
    \ 2: 'DONE'
    \ }

let g:COMMENT_TYPE = {
    \ 'md': '#'
  \ }

" Function I found online, highly unecessary I can just do this with delete()
function! DeleteFile(...)
  if(exists('a:1'))
    let theFile=a:1
  elseif ( &ft == 'help' )
    echohl Error
    echo "Cannot delete a help buffer!"
    echohl None
    return -1
  else
    let theFile=expand('%:p')
  endif
  let delStatus=delete(theFile)
  if(delStatus == 0)
    echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction

" create the agenda folder if it doesn't exist
" if (!isdirectory(g:default_agenda_dir) && exists('*mkdir'))
"     call mkdir(g:default_agenda_dir)
" endif

" Scan over the directory and recursively obtain filepaths
function! GetAgendaFilesAt(startingDir) abort
    let l:dirContents = split(globpath(a:startingDir, '*'), '\n')
    let l:files = []
    if len(l:dirContents) > 0
        " check if a file is 
        for file in l:dirContents
            if isdirectory(file)
                " recursively scan over the subdirectory
                let l:files = l:files + GetAgendaFilesAt(l:file)
            else
                " add the file
                if (glob(file) !~ g:expanded_default_agenda_dir . g:default_agenda_file)
                    let l:files = add(l:files, file)
                endif
            endif
        endfor
    endif
    return l:files
endfunction

" get all the agenda files from the default directory
function! GetAgendaFiles() abort
    return GetAgendaFilesAt(g:default_agenda_dir)
endfunction

" scans the file for the requested keywords and returns
" an array of the line and the line number found
function! ScanFile(file, searchType) abort
    let l:lines = readfile(a:file)
    let l:filteredLines = []
    let l:lineCount = 1
    for line in l:lines
        " if the line contains a todo
        " DONE: change it such that it should be at the beginning of the line
        " if tolower(line) =~ b:TODO_DICT[a:searchType]
        let l:tmpMatch = matchstr(tolower(line), '^' . g:TODO_DICT[a:searchType])
        if !empty(l:tmpMatch)
            let l:filteredLines = add(l:filteredLines, [line, l:lineCount])
        endif
        " increment the line number that we are examining
        let l:lineCount = l:lineCount + 1
    endfor
    return l:filteredLines
endfunction

function! ScanAgendaFiles(agendaFiles, type) abort
    let l:filteredFiles = {}
    for file in a:agendaFiles
        " scan the files for text
        " let the lines be indexed by the file
        let l:filteredFiles[file] = ScanFile(file, a:type)
    endfor
    return l:filteredFiles
endfunction

function! ReadAgenda(type) abort
    let l:files = GetAgendaFiles()
    return ScanAgendaFiles(l:files, a:type)
endfunction

function! AppendProjectToFile(file, projectName, tasks) abort
    echo a:projectName
    " add the comment that designates a specific project
    call writefile([g:COMMENT_TYPE['md'] . " " . a:projectName], a:file, "a")
    let l:tmpLines = []
    for l:task in a:tasks
        let l:taskText = l:task[0]
        let l:lineNbr = l:task[1]
        let l:tmpLines = add(l:tmpLines, l:taskText)
    endfor
    call writefile(l:tmpLines, a:file, "a")
    " add space between projects -> a flag for append
    call writefile(["", "", ""], a:file, "a")
endfunction

" congregates requested agenda type in a buffer (or file?)
function! CongregateAgenda(type) abort
    let l:lines = ReadAgenda(a:type)
    let l:file = g:expanded_default_agenda_dir . g:default_agenda_file
    if (filereadable(l:file))
        echo "delete " . l:file
        call DeleteFile(l:file)
        call writefile([""], l:file)
    endif
    for item in items(l:lines)
        let l:subs = substitute(item[0], g:expanded_default_agenda_dir, "", "")
        call AppendProjectToFile(l:file, l:subs, item[1])
    endfor
endfunction

" function to open the agenda file in a new buffer
function! OpenAgenda() abort
    execute "rightbelow vsplit " . g:expanded_default_agenda_dir . g:default_agenda_file
endfunction

nnoremap <leader>a :call CongregateAgenda(1)<CR>
