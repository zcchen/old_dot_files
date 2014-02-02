" This is the functions I defined, to make the .vimrc more clean
" Author: zcchen <chen (dot) bill (dot) bill (at) gmail (dot) com>
" LGPL

function! MolokaiTransp(on)                                           "{{{
    if exists('g:colors_name')
        if g:colors_name =~ 'molokai' && a:on
            highlight Comment ctermfg=109
            if &term =~ 'rxvt'
                highlight Normal ctermbg=256
                highlight NonText ctermbg=256
            elseif &term =~ 'xterm'
                highlight Normal ctermbg=16
                highlight NonText ctermbg=16
            endif
            let g:MolokaiTransp_On = 1
            "!echo "1"
        elseif g:colors_name =~ 'molokai' && !a:on
            highlight Normal  ctermbg=233
            highlight Comment ctermfg=59
            highlight NonText ctermbg=234
            let g:MolokaiTransp_On = 0
            "!echo "0"
        endif
    endif
endfunction
command! MolokaiTransp call MolokaiTransp(!g:MolokaiTransp_On)
"}}}

" 实现绝对行号和相对行号的互换
function! NumberToggle()                                                 "{{{
    if &number && !&relativenumber
        setlocal relativenumber
    elseif &relativenumber && &number
        setlocal norelativenumber nonumber
    else
        setlocal number
    endif
endfunction
command! NumberToggle call NumberToggle()                               "}}}

" 自动加执行权限
function! Chmodx()                                                      "{{{
  if strpart(getline(1), 0, 2) == '#!'
    let file = expand("%:p")
    if stridx(getfperm(file), 'x') != 2
      call system("chmod +x ".shellescape(file))
      edit!
      filetype detect
      nmap <buffer> <S-F4> :!%:p<CR>
    endif
  endif
endfunction                                                             "}}}

" 在开头的地方自动插入相关信息
function! TitleAuthorUpdate()                                           "{{{
    "if not exists, then add, otherwise update
endfunction                                                             "}}}

" 可以把现在的文件和原始文件对比。
if !exists(":DiffOrig")                                                 "{{{
    command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif                                                                   "}}}

" 备份VimIM的原始拼音查找文件
function! RenameVimIM()                                                 "{{{
    let a:vimimDBpatch=$HOME.'.vim/bundle/'.'vimim/plugin/'
    let a:vimimDBfileEX=a:vimimDBpatch . 'vimim.gbk.bsddb'
    let a:vimimDBfileAF=a:vimimDBpatch . 'vimim-bak.gbk.bsddb'
    if filereadable(a:vimimDBfileEX)
        call rename(a:vimimDBfileEX, a:vimimDBfileAF)
    endif
endfunction                                                             "}}}
