if !exists("Tikz_preview")

    if exists(":Tikz_tmp_dir")
        let s:Tmp_dir = g:Tikz_tmp_dir
    else
        let s:Tmp_dir = '/tmp/tikz_preview'
    endif

    function! Tikz_mkdir()
        echo "make dir"
        execute '!mkdir -p '.s:Tmp_dir
    endfunction

    function! Tikz2pdf()
        if filereadable(s:Tmp_dir)
            if filewritable(s:Tmp_dir) == 1
                execute 'rm -rf '.s:Tmp_dir
                call Tikz_mkdir()
            else
                echo "1Error"
            endif
        else
            if filewritable(s:Tmp_dir) == 1
                execute 'rm -rf '.s:Tmp_dir
                call Tikz_mkdir()
            elseif filewritable(s:Tmp_dir) == 0
                call Tikz_mkdir()
            endif
        endif

        let a:preview_file = expand('%:t:r').'.pdf'
        let a:cmd = '!tikz2pdf -t '.
                    \ $HOME.'/.vim/myPlugins/tikz2pdf.latex '.
                    \ '-b xelatex % -o '.
                    \ s:Tmp_dir. '/'. a:preview_file
        echo a:cmd
        execute a:cmd
    endfunction
endif

autocmd! bufwritepost *.tikz call Tikz2pdf()
map <leader>tikz :call Tikz2pdf()<CR>
autocmd! BufRead,BufNewFile *.tikz set filetype=tex


