" This vim script is used to add some snippet codes in
" ~/.vim/bundle/snipmate.vim/snippets/_.snippets
"
let s:_snippet =$HOME."/.vim/bundle/snipmate.vim/snippets/_.snippets"
let s:_snippetPatch =$HOME."/.vim/myPlugins/_.snippets.patch"
let s:c_snippet =$HOME."/.vim/bundle/snipmate.vim/snippets/c.snippets"
let s:c_snippetPatch =$HOME."/.vim/myPlugins/c.snippets.patch"
let s:pySnippet =$HOME."/.vim/bundle/snipmate.vim/snippets/python.snippets"
let s:pySnippetPatch =$HOME."/.vim/myPlugins/python.snippets.patch"
let s:matchitOctave = $HOME."/.vim/bundle/matchit.zip/plugin/matchit.vim"
let s:matchitOctavePatch = $HOME."/.vim/myPlugins/matchit-octave.patch"

function! s:PatchFiles(OrigFile, patchFile)
    if filereadable(a:OrigFile) && filereadable(a:patchFile)
        let a:cmd ='!patch -N -p0 '. a:OrigFile. ' -i '. a:patchFile. '>/dev/null'
        "echo a:cmd
        silent! execute a:cmd
    endif
endfunction

call s:PatchFiles(s:_snippet, s:_snippetPatch)
call s:PatchFiles(s:c_snippet, s:c_snippetPatch)
call s:PatchFiles(s:pySnippet, s:pySnippetPatch)
call s:PatchFiles(s:matchitOctave, s:matchitOctavePatch)
