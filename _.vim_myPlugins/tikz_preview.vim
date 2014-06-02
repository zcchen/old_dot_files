if exists("g:Tikz_tmp_dir")
    let s:Tmp_dir = g:Tikz_tmp_dir
else
    let s:Tmp_dir = '/tmp/tikz_preview'
endif

if !exists("g:Tikz_latex_template")
    let s:latex_template = 0
else
    let s:latex_template = g:Tikz_latex_template
endif

if !exists("Tikz_preview")
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
                echo "Error"
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
        let a:cmd = ""
        if !empty(s:latex_template)
            let a:cmd = '!tikz2pdf '.
                        \ '-t '.s:latex_template.' '.
                        \ '-b xelatex % -o '.
                        \ s:Tmp_dir. '/'. a:preview_file
                        "\ s:Tmp_dir. '/'. a:preview_file.
                        "\ ' 2>&1 1>/dev/null'
        else
            let a:cmd = '!tikz2pdf '.
                        \ '-b xelatex % -o '.
                        \ s:Tmp_dir. '/'. a:preview_file.
                        \ ' 2>&1 1>/dev/null'
        endif
        echo a:cmd
        execute a:cmd
    endfunction
endif

autocmd! bufwritepost *.tikz call Tikz2pdf()
autocmd! bufwritepost *.pgf call Tikz2pdf()
map <leader>tikz :call Tikz2pdf()<CR>
autocmd! BufRead,BufNewFile *.tikz set filetype=tex
autocmd! BufRead,BufNewFile *.pgf set filetype=tex


