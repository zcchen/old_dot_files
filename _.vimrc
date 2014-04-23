" =========== To Do ====================
" **plugin for taking notes in vim  viki or vimwiki | 可能要自己写一个
" 支持md格式的，优先度，高中文分词插件的应用，预计要自己写，优先度，低
"D= Completion of Syntastic in vim
" plugin for spell checking in vim  normal one && D=LanguageTool
"       balloon to show the words
" Dictionary Suggection
"D= Plugin to remember the cursor last open in vim
"D= make a better way to :set tags=tags\,file
"D= find a way to toggle :set rnu & :set nu
"D= fold and unfold the function
"D= VimIm the Chinese ime in vim
" cursor moving bugs on multibytes-lang
" Calendar plugin installed and setuped.
"D= better function for imap <C-l>
"D= ctags generate tags in vim,
" so as gcc compiler
" marks and bookmarks
" **todo manager plugin     | not easy to handle it,maybe need to write one
" ConqueTermSplit
" Completion plugin better      supperTab
" Latex Suit package
" keyNav

" =========== source all plugins ========
source ~/.vim/bundle.vim
source ~/.vim/myPlugins/myFunc.vim
source ~/.vim/myPlugins/maxUndo.vim         "max undoes
"nmap ssa :call SaveSession()
"nmap sso :call RestoreSession()
source ~/.vim/myPlugins/LanguageToolUpdate.vim
"source ~/.vim/myPlugins/escalt.vim          "alt key enable
"set ttimeoutlen =10
" if the terminal env is rxvt, bugs will come out when macro is called
source ~/.vim/myPlugins/patches4plugin.vim  " snippet Addon quotation
source ~/.vim/myPlugins/cscopeQuickfix.vim " cscope Quickfix mode
source ~/.vim/myPlugins/countChs.vim        " count the chinese characters

source ~/.vim/myPlugins/tikz_preview.vim

""=========== encoding =============
set fileencoding=utf-8 encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set formatoptions+=mM
set modeline

" ========== VIM UI ==============
set wrap            " Wrap lines
set mousehide       " Hide the mouse when typing text
set cmdheight=2     " Make command line 2 lines high
set showcmd         " Show the input command in status line
set showmode
set cursorline      " make the entire line with underline
set scrolloff=3     " at least 3 rows below cursor
set ballooneval     " balloon tips
set balloondelay=100
set balloonexpr="textstring"
set showmatch           " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2         " 短暂跳转到匹配括号的时间
if has('multi_byte') && v:version > 601
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
        set ambiwidth=double
    endif
endif
" -------- list and StatusLine -------------
set number                              " Display line number
set foldcolumn=2
set ruler
set rulerformat=%m\%2c,%2v\ \ \ \ %p%%
set laststatus=2                        " Always show the statusline
set statusline=%m%r                     " right part of the status line.
set statusline+=%=                      " left part of the status line.
set statusline+=%-14.(%l,%3v%)\ %P      " show the cursor position.
" ------------ fold method ------------
set foldenable          " 开始折叠
set foldmethod=indent   " 设置语法折叠
set foldcolumn=3        " 设置折叠区域的宽度
setlocal foldlevel=0    " 设置折叠层数为1
" ------------- konsole in KDE4 ----------------
" http://ikde.org/%E5%BA%94%E7%94%A8/konsole-vim-%E5%85%89%E6%A0%87%E5%BD%A2%E7%8A%B6%E9%9A%8F%E6%A8%A1%E5%BC%8F%E5%8F%98%E6%8D%A2/
if or(or($TERM =~ 'xterm*', $TERM =~ 'xterm-256color'),
            \ or($TERM =~ 'urxvt', $TERM =~ 'rxvt'))
    let &t_SI = "\<Esc>]50; CursorShape=1; BlinkingCursorEnabled=true\x7"
    let &t_EI = "\<Esc>]50; CursorShape=0; BlinkingCursorEnabled=false\x7"
    set t_Co=256
endif
if has('gui_running')
    set guioptions-=T guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
" -------- colorscheme ------------
let g:molokai_original=1
"colorscheme Mustang
"colorscheme wombat256
"colorscheme xoria256
"colorscheme desert256
colorscheme molokai
let g:MolokaiTransp_On = 0
autocmd! BufReadPost,ColorScheme,VimEnter,WinEnter *
            \ call MolokaiTransp(g:MolokaiTransp_On)
if !exists(g:colors_name)
    highlight cursorline guibg=lightblue
    highlight Normal guibg=grey90
    highlight Cursor guibg=Green guifg=NONE
    highlight lCursor guibg=Cyan guifg=NONE
    highlight NonText guibg=grey80
    highlight Constant gui=NONE guibg=grey95
    highlight Special gui=NONE guibg=grey95
endif

" ========== VIM settings ===========
set splitright
set history =50
set backspace=indent,eol,start
    " allow backspacing over everything in insert mode, gvim need this...
if has('mouse')
    "set mouse=a
    set mouse=""
endif
set confirm
set textwidth=75
set autochdir       " change working dir when open files.
set hidden          " A buffer becomes hidden when it is abandoned
set formatoptions+=B   " No space when joining two lines of Chinese together
set formatoptions+=m
" ---------- syntax -------
if !exists("syntax_on")
    syntax enable
endif
" ---------- undo ----------
set undodir=~/.vim/undodir
" ------------ search ------------
set ignorecase
set smartcase       " Ignore case when searching
set incsearch       " 开启实时搜索
set hlsearch        " Switch on search pattern highlighting.
set wrapscan        " search all over the file
" ------------- indent ---------------
set autoindent              " 自动缩进
set cindent                 " 自动C语言缩进
" ---------- tab key ----------
set smarttab
set list                        " 设置显示TAB,默认为^I
set listchars=tab:>-,trail:∓    " 设置显示TAB以及行尾空格的标志
set expandtab       " 将tab展开成空格,而不是制表符
set shiftwidth=4    " 自动缩进插入的空格数
set softtabstop=4   " 使用tab或bs自动插入或者删除相应的空格数
set showtabline=2   " always show tab line
" ---------- spell ---------
set spelllang =en_us       "if need more dictionaries, add more.
" ---------- developping --------
set completeopt+=longest   "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let c_comment_strings=1         "highlighting strings inside C comments

" ============ Plugins Settings =============
"------- ctags & Tagbar / TagList --------------
set tags=tags,tags;
nmap <leader>ctags   :!ctags --c++-kinds=+p --fields=+iaS --links=yes --extra=+q -R *
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tabbar_autoshowtag =1
let g:tagbar_autofocus = 0
let g:tagbar_autoclose =1
let g:tagbar_left =0
let g:tagbar_compact = 1
let g:tagbar_width = 25
"autocmd VimEnter * nested :TagbarOpen
"set statusline+=%{tagbar#currenttag('[%s] ','')}
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Use_Right_Window =1
"let Tlist_File_Fold_Auto_Close =1
"let Tlist_Exit_OnlyWindow=1
"" ------------ a.vim ---------------------
"<Leader>ih switches to file under cursor
"<Leader>is switches to the alternate file of file under cursor
"<Leader>ihn cycles through matches
" ---------- NeoComplCache.vim ------------
let g:AutoComplPop_NotEnableAtStartup = 1
let g:NeoComplCache_EnableAtStartup = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_TagsAutoUpdate = 1
let g:NeoComplCache_EnableInfo = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_EnableSkipCompletion = 1
let g:NeoComplCache_SkipInputTime = '0.5'
"let g:NeoComplCache_SnippetsDir = $VIMFILES.'/snippets'
"------------ Powerline --------------
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_colorscheme = 'default'
let g:Powerline_stl_path_style = 'full'
" ------------ NERD Tree -----------------
"let load_nerd_tree =1
let NERDTreeIgnore=['\~$']
"autocmd VimEnter * nested :NERDTree
let g:nerdtree_tabs_open_on_gui_startup=0
" Open NERDTree on gvim/macvim startup
let g:nerdtree_tabs_open_on_console_startup=0
" Open NERDTree on console vim startup
"------------ indent-guide --------------
let g:indent_guides_guide_size=1
let g:indent_guides_start_level =2
"<leader>ig IndentGuidesToggle
"--------------doxygen ----------------------
" need more to complete
"let g:load_doxygen_syntax=1
"let mail_minlines = 30
"let g:is_bash =1
"let g:sh_fold_enabled= 4
" ------------- Syntastic -----------------
" set some argus here
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_loc_list=2
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_enable_highlighting=1
let g:syntastic_ignore_files=['^/usr/include/', '\c\.h$']
let g:syntastic_c_include_dirs = [ '/usr/avr/include/']
" see :h Syntastic for more details
" ------------ table-mode --------------
let g:table_mode_corner_corner = '+'
" ------------- SnipMate -----------------
let g:snipMateAllowMatchingDot = 0
"------------ LanguageTool --------------
" jar download url: http://www.languagetool.org/download/snapshots/
"let g:languagetool_jar='/usr/share/java/languagetool/LanguageTool.jar'
" *TODO* add a function to one-key download and update
let g:languagetool_jar='~/.vim/LanguageTool/LanguageTool.jar'
let g:languagetool_lang='en-US'
" --------------- FencView.h -------------------
" :FencAutoDetect
let g:fencview_autodetect=0
" --------------- Pyclewn --------------------
" Pyclewn 调试 C 类程序，依此执行 :Pyclewn :Cinferiortty 然后就是正常的gdb命令
" 调试了

" =============== autocmd command ===============
autocmd! InsertLeave * if pumvisible() == 0|pclose|endif
"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"回车即选中当前项
autocmd! bufwritepost .vimrc source $MYVIMRC
autocmd! bufwritepost bundle.vim source $MYVIMRC
" auto reload vimrc when editing it
autocmd! BufReadPost *
            \   if line("'\"") > 1 && line("'\"") <= line("$")
            \|      exe "normal! g`\""
            \|  endif   " 打开文件后自动定位上次光标的位置
autocmd BufNewFile,BufEnter *.tmp set textwidth=0
" --------- filetype --------
autocmd FileType text set textwidth=0
"autocmd BufRead,BufNewFile *.md set filetype=pandoc
autocmd FileType pandoc setlocal textwidth=0 list "formatoptions-=l
" 显示行标志位，输入过程中自动换行
autocmd FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4
autocmd FileType diff  setlocal shiftwidth=4 tabstop=4
autocmd BufEnter /usr/include/c++/*    setf cpp
" -------- develop -----------
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" 编译后，如有错误则打开quickfix窗口。（光标仍停留在源码窗口）
" 注意：需要开启netsting autocmd
" complete options
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif
" http://vim.wikia.com/wiki/Omnicomplete_-_Remove_Python_Pydoc_Preview_Window
" 参照这篇文章。这样设置，在显示了文档并完成选择后，窗口会关闭
" ---------- Octave / matlab ----------------
autocmd FileType matlab
            \setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
" ----------- Pandoc -----------------------
let g:pandoc_syntax_dont_use_conceal_for_rules=["hrule"]
let g:snips_author = 'zcchen'
" ------------ Shareboard ---------------
let g:shareboard_command = printf('pandoc -sS --toc --webtex -c "%s" --bibliography="%s"',
    \ expand("~/.vim/shareboard/main.css"),
    \ expand("~/.vim/shareboard/library.bib"))

" =================== key mapping ==============
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map j gj
map k gk
inoremap jk <ESC>
let mapleader = "\\"
"let mapleader = ","
map <silent> <leader>hlc :let @/ = ""<CR>
map <leader>nu  :call NumberToggle() <CR>
" -------- copy & paste ---------
set pastetoggle=<leader>pp
map <leader>pp <leader>pp````
map <leader>cp  "+y|            " copy selected texts to clipboard
imap <S-Insert> <C-o>"+gp
nmap <silent> <leader>p<leader>p :set paste<CR>"+gp<C-o>:set nopaste<CR>``
" -------- tabs & windows ----------
nmap <leader>tbn :tabnew <CR>       " Open a new tab with nothing
nmap <leader>tbc :tabclose <CR>
nmap <leader>tbe :tabedit           |" Open a new tab with file
nnoremap <C-h> <C-w>h|        "<C-w>_<C-w>10-
nnoremap <C-j> <C-w>j|        "<C-w>_<C-w>10-
nnoremap <C-k> <C-w>k|        "<C-w>_<C-w>10-
nnoremap <C-l> <C-w>l|        "<C-w>_<C-w>10-
" -------- spell ---------
map <leader>sp :set spell! <CR>
" -------- plugins ------
nnoremap <leader>tag    :TagbarToggle <CR>
map <leader>tnd :NERDTreeToggle <CR>
map <leader>tst     :SyntasticToggleMode <CR>
map <leader>tsc     :SyntasticCheck <CR>
" <leader>di to start Draw it
" <leader>ds to stop Draw it
nmap <leader>sk :call ToggleSketch() <CR>
" :call ToggleSketch() to start sketch
" -------- others -------
nnoremap <leader>transp :call MolokaiTransp(!g:MolokaiTransp_On)<CR>
nnoremap <leader>vimrc :vsp $MYVIMRC <CR>
nmap <S-F4> :call Chmodx()<CR>

" ---------- 论文写作 ----------
nmap <leader>bib ^f{lyt,
nmap <leader>abib i[@]<ESC>P


" vim:foldmethod=marker
