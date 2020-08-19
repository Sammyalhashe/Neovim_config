" default directory
let g:default_agenda_dir = get(g:, 'default_agenda_dir', "~/.config/nvim/vim-agenda/")
let g:default_agenda_file = get(g:, 'default_agenda_file', "agenda.md")
let g:expanded_default_agenda_dir = glob(g:default_agenda_dir)

" TODO: add an 'ALL' option
let g:TODO_DICT = {
    \ 1: 'TODO',
    \ 2: 'DONE',
    \ 3: "[TODO\|DONE\|NOTE\|OPTIMIZE\|FIXME]"
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
    silent echo "Deleted " . theFile
  else
    echohl WarningMsg
    echo "Failed to delete " . theFile
    echohl None
  endif
  return delStatus
endfunction

" Creates a directory if it doesn't already exist
function! CreateDirectoryIfNotExists(fp) abort
    if (!isdirectory(a:fp) && exists('*mkdir')) 
        call mkdir(a:fp, "p") " default protection bits 0755
        echohl Identifier
        echo "\n" . a:fp . " created successfully"
    elseif !isdirectory(a:fp)
        echohl WarningMsg
        echo "\nUnable to create directory"
    endif
endfunction

" Deletes a directory if it exists
function DeleteDirectoryIfExists(fp) abort
    if (isdirectory(a:fp)) 
        call delete(a:fp, "d")
        echohl Identifier
        echo "\nSuccessfully deleted directory " . a:fp
    else
        echohl WarningMsg
        echo "\nUnable to delete directory " . a:fp
    endif
endfunction

" create the agenda folder if it doesn't exist
call CreateDirectoryIfNotExists(g:default_agenda_dir)

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

" Scan over the directories and find all "Projects"
function! GetProjectPaths(startingDir) abort
    let l:dirContents = split(globpath(a:startingDir, '*'), '\n')
    let l:dirs = []
    if len(l:dirContents) > 0
        for file in l:dirContents
            if isdirectory(file)
                " Add the current path
                let l:dirs = add(l:dirs, file)
                " Recursively find other options
                let l:dirs = l:dirs + GetProjectPaths(file)
            endif
        endfor
    endif
    return l:dirs
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
" TODO: Figure out how to update the buffer if it is already open (maybe edit!)
function! CongregateAgenda(type) abort
    let l:lines = ReadAgenda(a:type)
    let l:file = g:expanded_default_agenda_dir . g:default_agenda_file
    if (filereadable(l:file))
        silent echo "delete " . l:file
        call DeleteFile(l:file)
        call writefile([""], l:file)
    endif
    for item in items(l:lines)
        let l:subs = substitute(item[0], g:expanded_default_agenda_dir, "", "")
        call AppendProjectToFile(l:file, l:subs, item[1])
    endfor
endfunction

" function to open a project file in a new buffer
function! OpenFile(fp) abort
    execute "rightbelow vsplit " . a:fp
endfunction

" function to open the agenda file in a new buffer
function! OpenAgenda() abort
    execute "rightbelow vsplit " . g:expanded_default_agenda_dir . g:default_agenda_file
endfunction

" Creates a Project Directory
function! CreateAgendaProject() abort
    call inputsave()
    let l:fName = input("Enter the project name: ")
    call inputrestore()
    let l:expandedName = g:expanded_default_agenda_dir . l:fName
    call CreateDirectoryIfNotExists(l:expandedName)
endfunction

" DONE: function to split by '/' and add a '&' to the last word
" TODO: May have to modify this so that it supports more projects
" NOTE: Thinking about finding a way to add extra characters in front
"       Ie. (a)Sammy (b)Test ... (aa)asdf (ab)qwer
function SplitAndAddCharToLast(toSplit, separator, charToAdd, chosen) abort
    let l:haveSplit = split(a:toSplit, a:separator)
    let l:lchosen = l:haveSplit[-1][0]
    let l:idx = 0
    while match(l:lchosen, "[&\|,\|/\|\]") != -1 || (l:idx + 1 < len(l:haveSplit[-1]) && index(a:chosen, l:lchosen) >= 0)
        let l:idx = l:idx + 1
        let l:lchosen = l:haveSplit[-1][l:idx]
    endwhile
    call add(a:chosen, l:lchosen) " add the chosen char

    let l:haveSplit[-1] = (idx == 0 ? '' : l:haveSplit[-1][: idx - 1]) . "&" . l:haveSplit[-1][idx:]
    return join(l:haveSplit, "/")
endfunction

" Adds Subproject to Project
function! AddSubModule() abort
    let l:lettersChosen = []
    " DONE: grab the projects and separate them by newLines 
    let l:projectPaths = GetProjectPaths(g:expanded_default_agenda_dir)
    let l:copy = copy(l:projectPaths)
    let l:subs = map(l:projectPaths, 'substitute(v:val, g:expanded_default_agenda_dir, "", "")')
    " NOTE: add Cancel option
    call add(l:subs, "Cancel")
    " TODO: add '&' to word after the last '/'
    let l:subs = map(l:subs, {_, val -> SplitAndAddCharToLast(val, "/", "&", l:lettersChosen)})
    let l:shortenedProjectPaths = join(l:subs, "\n")
    let l:projectIdx = confirm("Enter the project to edit: ", l:shortenedProjectPaths, "Question")
    if l:projectIdx == len(l:subs)
        echohl WarningMsg
        echo "Cancelled"
        return
    endif
    let l:projectPathChosen = l:copy[l:projectIdx - 1]
    call inputsave()
    let l:subModuleName = input("Enter submodule name: ")
    call CreateDirectoryIfNotExists(l:projectPathChosen . "/" . l:subModuleName)
    call inputrestore()
endfunction

function! EditProject() abort
    let l:lettersChosen = []
    " DONE: grab the projects and separate them by newLines 
    let l:projectPaths = GetProjectPaths(g:expanded_default_agenda_dir)
    let l:copy = copy(l:projectPaths)
    let l:subs = map(l:projectPaths, 'substitute(v:val, g:expanded_default_agenda_dir, "", "")')
    " NOTE: add Cancel option
    call add(l:subs, "Cancel")
    " TODO: add '&' to word after the last '/'
    let l:subs = map(l:subs, {_, val -> SplitAndAddCharToLast(val, "/", "&", l:lettersChosen)})
    let l:shortenedProjectPaths = join(l:subs, "\n")
    let l:projectIdx = confirm("Enter the project to edit: ", l:shortenedProjectPaths, "Question")
    if l:projectIdx == len(l:subs)
        echohl WarningMsg
        echo "Cancelled"
        return
    endif
    let l:projectPathChosen = l:copy[l:projectIdx - 1]
    let l:projectFiles = GetAgendaFilesAt(l:projectPathChosen)
    let l:copy2 = copy(l:projectFiles)
    let l:fileNames = map(l:projectFiles, 'substitute(v:val, g:expanded_default_agenda_dir, "", "")')
    echo l:fileNames
    " NOTE: add Cancel option
    call add(l:fileNames, "Cancel")
    let l:lettersChosen = []
    let l:fileNames = map(l:fileNames, {_, val -> SplitAndAddCharToLast(val, "/", "&", l:lettersChosen)})
    let l:shortenedFilePaths = join(l:fileNames, "\n")
    let l:fileIdx = confirm("Enter the file to edit: ", l:shortenedFilePaths, "Question")
    if l:fileIdx == len(l:fileNames)
        echohl WarningMsg
        echo "Cancelled"
        return
    endif
    let l:filePathChosen = l:copy2[l:fileIdx - 1]
    call OpenFile(l:filePathChosen)
endfunction

" Delete project from Agenda and ask for confirmation
function! DeleteProject() abort
    let l:lettersChosen = []
    " DONE: grab the projects and separate them by newLines 
    let l:projectPaths = GetProjectPaths(g:expanded_default_agenda_dir)
    let l:copy = copy(l:projectPaths)
    let l:subs = map(l:projectPaths, 'substitute(v:val, g:expanded_default_agenda_dir, "", "")')
    " NOTE: add Cancel option
    call add(l:subs, "Cancel")
    " TODO: add '&' to word after the last '/'
    let l:subs = map(l:subs, {_, val -> SplitAndAddCharToLast(val, "/", "&", l:lettersChosen)})
    let l:shortenedProjectPaths = join(l:subs, "\n")
    let l:projectIdx = confirm("Enter the project to delete: ", l:shortenedProjectPaths, "Question")

    if l:projectIdx == len(l:subs)
        echohl WarningMsg
        echo "Cancelled"
        return
    endif

    let l:projectPathChosen = l:copy[l:projectIdx - 1]
    let l:idx = confirm("Are you sure?: ", "&Yes\n&No", "Question")
    if l:idx == 1
        call DeleteDirectoryIfExists(l:projectPathChosen)
    elseif l:idx == 2
        echohl WarningMsg
        echo "Cancelled"
    endif
endfunction


autocmd BufWritePost * call CongregateAgenda(1)
command! -nargs=0 OpenAgenda call OpenAgenda()
command! -nargs=0 DeleteProject call DeleteProject()
command! -nargs=0 EditProject call EditProject()
command! -nargs=0 AddSubModule call AddSubModule()
