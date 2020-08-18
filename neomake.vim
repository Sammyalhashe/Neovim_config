" This config is provided by the author of neomake
function! MyOnBattery()
  if has('macunix')
    return match(system('pmset -g batt'), "Now drawing from 'Battery Power'") != -1
  elseif has('unix')
    return readfile('/sys/class/power_supply/AC/online') == ['0']
  endif
  return 0
endfunction

if MyOnBattery()
  call neomake#configure#automake('w')
else
  call neomake#configure#automake('nw', 1000)
endif

let g:neomake_python_flake8_maker = {
    \ 'args': ['--ignore=E221,E241,E272,E251,W702,E203,E201,E202',  '--format=default'],
    \ 'errorformat':
        \ '%E%f:%l: could not compile,%-Z%p^,' .
        \ '%A%f:%l:%c: %t%n %m,' .
        \ '%A%f:%l: %t%n %m,' .
        \ '%-G%.%#',
    \ }
let g:neomake_python_enabled_makers = ['flake8']

let g:neomake_cpp_enabled_makers = ['clang']
" let g:neomake_cpp_enabled_makers = ['gcc']
let g:neomake_cpp_clang_maker = {'exe': 'clang++'}
" let g:neomake_cpp_clang_maker = {'exe': 'g++'}
" let g:neomake_cpp_clang_args = ['-std=c++14', '-Wall', '-Wextra', '-Weverything', '-pedantic']
let g:neomake_cpp_clang_args = ['-std=c++14', '-Wall', '-o']
let g:neomake_open_list = 2
