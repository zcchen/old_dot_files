" This script is used to update LanguageTool on archlinux
"
function! LanguageToolUpdate()
    let s:dateYmD=strftime("%Y%m%d",localtime()-86400)
    let s:fileName='LanguageTool-'.s:dateYmD.'-snapshot.zip'
    let s:downloadURL='http://www.languagetool.org/download/snapshots/'.s:fileName
    echo s:downloadURL
    " TODO
    " 判断文件夹是否存在，如果否，则创建文件夹
    silent! execute '!wget -c '.s:downloadURL.' -O /tmp/'.s:fileName.
        \'&& unzip -od ~/.vim/ '.'/tmp/'.s:fileName
endfunction
