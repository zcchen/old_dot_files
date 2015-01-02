" """""""""""""""""""""""""""""""""""""""""""""""
" Script: set cscope mapping for myself and work better
" Author: zcchen
" Date: 2013-07-26
" """""""""""""""""""""""""""""""""""""""""""""""

function! s:cscopeQuickfixToggle()
    if &cscopequickfix != 's+,c+,d+,i+,t+,e+'
        set cscopequickfix=s+,c+,d+,i+,t+,e+
        echo "cscope Quickfix mode is ".&cscopequickfix
    elseif &cscopequickfix == 's+,c+,d+,i+,t+,e+'
        set cscopequickfix=""
        echo "cscope Quickfix mode is Off."
    endif
endfunction

if has('cscope')
    """"""""""standard wok"""""""""""""     {{{
    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    " 1 means ctags before cscope
    set cscopetagorder=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    """"""""""standard wok"""""""""""""     }}}

    "" cscope quickfix options              {{{
    nmap <silent><leader>fq :call <SID>cscopeQuickfixToggle()<CR>
    nmap <leader>fcc :CscopeClear
    nmap <leader>fcl :CscopeList<CR>
    nmap <leader>fcg :CscopeGen <C-R>expand=(".")<CR>
    "" cscope quickfix options              }}}

endif

" vim: fdm=marker
