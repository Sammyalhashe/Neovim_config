function! PyRunner() abort
    !{clang++ -Wall -std=c++11 -o "%:r" "%:p" && "./%:r" && rm "%:r" || rm "%:r"}
endfunction
map <F5> :<C-U>!clang++ -O2 -DLOCAL -std=c++14 -Wall -Wextra -Wno-unused-result %:r.cpp -o %:r<CR>
map <F9> :<C-U>!./%:r < test.txt<CR>

map <leader>r :call PyRunner()<CR>
