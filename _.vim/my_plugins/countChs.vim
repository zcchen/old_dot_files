if !exists("Count_chs")
    function! Count_chs()
        execute '!texcount -chinese %'
    endfunction
endif

nmap <leader>zhc :call Count_chs() <CR>
