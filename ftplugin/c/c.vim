function! PyRunner() abort
    let filt = &filetype
    echomsg(filt)
    if (filt == "cpp")
        !{clang++ -Wall -std=c++11 -o "%:r" "%:p" && "./%:r" && rm "%:r" || rm "%:r"}
    else
        !{clang -Wall -std=c99 -o "%:r" "%:p" && "./%:r" && rm "%:r" || rm "%:r"}
    endif
endfunction


map <leader>r :call PyRunner()<CR>
