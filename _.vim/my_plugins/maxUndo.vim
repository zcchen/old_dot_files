" """""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This script is written by TualatriX.
" URL: http://imtx.me/archives/1810.html
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Auto Session Save/Restore
function! GetProjectName()
    " Get the current editing file list, Unix only
    let edit_files = split(system("ps -o command= -p " . getpid()))
    if len(edit_files) >= 2
        let project_path = edit_files[1]
        if project_path[0] != '/'
            let project_path = getcwd() . project_path
        endif
    else
        let project_path = getcwd()
    endif

    return shellescape(substitute(project_path, '[/]', '', 'g'))
endfunction

function! SaveSession()
    "NERDTree doesn't support session, so close before saving
    execute ':NERDTreeClose' 
    let project_name = GetProjectName()
    execute 'mksession! ~/.vim/sessions/' . project_name
endfunction

function! RestoreSession()
    let session_path = expand('~/.vim/sessions/' . GetProjectName())
    if filereadable(session_path)
        execute 'so ' . session_path
        if bufexists(1)
            for l in range(1, bufnr('$'))
                if bufwinnr(l) == -1
                    exec 'sbuffer ' . l
                endif
            endfor
        endif
    endif
    "Make sure the syntax is on
    syntax on
endfunction

nmap ssa :call SaveSession()
nmap sso :call RestoreSession()
autocmd VimLeave * call SaveSession()
autocmd VimEnter * call RestoreSession()

" Persistent undo
set undodir=~/.vim/undodir
set undofile
set undolevels=10000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
