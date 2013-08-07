" =========== To Do ====================
" **plugin for taking notes in vim  viki or vimwiki | 可能要自己写一个支持md格式的，优先度，高
" 中文分词插件的应用，预计要自己写，优先度，低
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

" ============= vundle setting ===========                                 {{{
" --------- manager of vim plugin -------
set nocompatible               " be iMproved and Disable vi-compatibility
filetype off                   " required!
call vundle#rc()
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'taxilian/a.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
"Bundle 'johnbintz/vim-taglist-plus'
" ====== complete =======
Bundle 'vim-scripts/pythoncomplete'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'msanders/snipmate.vim'
"Bundle 'UltiSnips'
" ===== syntax =====
Bundle 'sudar/vim-arduino-snippets'
Bundle 'Arduino-syntax-file'
"Bundle 'hallison/vim-markdown'
Bundle 'vim-pandoc/vim-pandoc'
Bundle 'rest.vim'
Bundle 'scrooloose/syntastic'
"Bundle 'ervandew/supertab'
"Bundle 'AutoFold.vim'
Bundle 'simplefold'
"Bundle 'Workspace-Manager'
"Bundle 'sgeb/vim-matlab'
Bundle 'vim-scripts/octave.vim--'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'matchit.zip'
Bundle 'DoxygenToolkit.vim'
Bundle 'DoxyGen-Syntax'
"Bundle 'cscope_macros.vim'
Bundle 'brookhong/cscope.vim'
" ===== text =====
"Bundle 'vimwiki'
"Bundle 'VOoM'
"Bundle 'samsonw/vim-task'
"Bundle 'cuteTodoList'
"Bundle 'vim-scripts/DoxygenToolkit.vim'
"Bundle 'winmanager'
Bundle 'vim-scripts/DrawIt'
Bundle 'sketch.vim'
"Bundle 'vim-scripts/calendar.vim'
"Bundle 'vim-scripts/CmdlineComplete'
"Bundle 'browser.vim'
"Bundle 'kakkyz81/evervim'
Bundle 'terryma/vim-multiple-cursors'
" ===== Lang ======
""Bundle 'vimspell'
Bundle 'LanguageTool'
Bundle 'Engspchk'
Bundle 'Align'
"Bundle 'easwy/share/blob/master/vim/vimrc/vimfiles/plugin/showmarks.vim'
"Bundle 'vimim/vimim'
Bundle 'FencView.vim'
"Bundle 'nixternal/taskwarrior-vim'
Bundle 'vim-scripts/fcitx.vim'
Bundle 'DoxygenToolkit.vim'
" ===== Other =====
Bundle 'yuratomo/w3m.vim'
" search
Bundle 'ack.vim'
" files
Bundle 'ctrlp.vim'
Bundle 'yuratomo/gmail.vim'
Bundle 'shougo/vimproc'
" ===== color =====
Bundle 'lilydjwg/colorizer'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/Colour-Sampler-Pack'
Bundle 'altercation/vim-colors-solarized.git'
"Bundle 'Color-Scheme-Explorer'
Bundle 'uguu-org/vim-matrix-screensaver'
"Bundle 'lumixia/bad-apple-vim'

filetype plugin indent on     " required!
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
" ========================================                                 }}}

"" ========== disable arrow keys ============                              {{{
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
" ===========================================                              }}}

"" =========== vimrc ===========                                           {{{
set splitright
set history =50
" allow backspacing over everything in insert mode, gvim need this...
set backspace=indent,eol,start
set undolevels=10000
if has('mouse')
    set mouse=a
endif
set textwidth=79
set autochdir       " change working dir when open files.
set hidden          " A buffer becomes hidden when it is abandoned
set formatoptions+=B    " No space when joining two lines of Chinese together
set formatoptions+=m
"--------- list and StatusLine -------------                               {{{
set number          "自动设置行号
set foldcolumn=2
set ruler
set rulerformat=%m\%2c,%2v\ \ \ \ %p%%
set laststatus=2                        " Always show the statusline
set statusline=%m%r                     " right part of the status line.
set statusline+=%=                      " left part of the status line.
set statusline+=%-14.(%l,%3v%)\ %P      " show the cursor position.      " }}}
" --------- UI setup -------------                                         {{{
if has('gui_running')
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif
set wrap            " Wrap lines
set mousehide       " Hide the mouse when typing text
set cmdheight=2     " Make command line 3 lines high
set showcmd         " 在状态栏显示正在输入的命令
set showmode
set cursorline      " make the entire line with underline
set scrolloff=3     " at least 3 rows below cursor
set ballooneval     " balloon tips
set balloondelay=100
set balloonexpr="textstring"
"autocmd FileType text setlocal textwidth=78 set cursorline
" konsole in KDE4
" http://ikde.org/%E5%BA%94%E7%94%A8/konsole-vim-%E5%85%89%E6%A0%87%E5%BD%A2%E7%8A%B6%E9%9A%8F%E6%A8%A1%E5%BC%8F%E5%8F%98%E6%8D%A2/
if or(or($TERM =~ 'xterm*', $TERM =~ 'xterm-256color'), or($TERM =~ 'urxvt', $TERM =~ 'rxvt'))
    let &t_SI = "\<Esc>]50;CursorShape=1;BlinkingCursorEnabled=true\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0;BlinkingCursorEnabled=false\x7"
    set t_Co=256
endif     "                                                                }}}
" --------- searching -------------                                        {{{
set ignorecase
set smartcase       " Ignore case when searching
set incsearch       " 开启实时搜索
set hlsearch        " Switch on search pattern highlighting.
set wrapscan        " search all over the file     "                       }}}
" --------- color scheme -------------                                     {{{
highlight cursorline guibg=lightblue
highlight Normal guibg=grey90
highlight Cursor guibg=Green guifg=NONE
highlight lCursor guibg=Cyan guifg=NONE
highlight NonText guibg=grey80
highlight Constant gui=NONE guibg=grey95
highlight Special gui=NONE guibg=grey95     "                              }}}
" ------------ fold method ------------                                    {{{
set foldenable          " 开始折叠
set foldmethod=indent   " 设置语法折叠
set foldcolumn=3        " 设置折叠区域的宽度
setlocal foldlevel=0    " 设置折叠层数为1     "                     }}}
" ------------ tabs ----------------                                       {{{
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_width = 25
nmap <leader>tbn :tabnew <CR>       " Open a new tab with nothing
nmap <leader>tbc :tabclose <CR>
nmap <leader>tbe :tabedit           |" Open a new tab with file     "      }}}
"" ---------- windows -------------                                        {{{
    nnoremap <C-h> <C-w>h|"<C-w>_<C-w>10-
    nnoremap <C-j> <C-w>j|"<C-w>_<C-w>10-
    nnoremap <C-k> <C-w>k|"<C-w>_<C-w>10-
    nnoremap <C-l> <C-w>l|"<C-w>_<C-w>10-     "                   }}}
" --------------undo ------------------------------------------------------{{{
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload
"                                                                          }}}
"================================                                          }}}

""=========== encoding =============                                       {{{
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileformats=unix,dos,mac
set formatoptions+=mM
if has('multi_byte') && v:version > 601
    if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
	set ambiwidth=double
    endif
endif
"" --------- Language and Spell ------------
"map <A-s> :set spell! <CR>
map <leader>sp :set spell! <CR>
"map! <A-s> <C-o>:set spell!<CR>
set spelllang =en_us       "if need more dictionaries, add more.
"" =================================                                       }}}

" ============ keymaps ============                                        {{{
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
let mapleader = "\\"
"let mapleader = ","
map <silent> <leader>hls :set hlsearch! <CR>
map <silent> <leader>hlc :let @/ = ""<CR>
map <leader>nu  :call NumberToggle() <CR>
"map <leader>cp  "+y``          |" copy selected texts to clipboard
map <leader>cp  "+y|" copy selected texts to clipboard
"" ---------- insert mode ------------                                     {{{
set pastetoggle=<A-p>
inoremap jk <ESC>
" Make shift-insert work like in Xterm
"map <S-Insert> <MiddleMouse>
"map! <S-Insert> <MiddleMouse>
map <silent> <leader>p<leader>p :set paste<CR>"+gp<C-o>:set nopaste<CR>``
imap <S-Insert> <C-o>"+gp
"" <Esc> 退出插入模式时总把该选项复位为 0,可以用:
":inoremap <ESC> <ESC>:set iminsert=0<CR>
" -------------------------------------                                    }}}
" ----------- Normal Mode -------------                                    {{{
nnoremap <leader>vimrc :vsp $MYVIMRC <CR>   " edit $MYVIMRC in vsp windows " }}}
" ---------- tab key and Words --------------                              {{{
set smarttab
set list                        " 设置显示TAB,默认为^I
set listchars=tab:>-,trail:∓    " 设置显示TAB以及行尾空格的标志
set expandtab       " 将tab展开成空格,而不是制表符
set shiftwidth=4    " 自动缩进插入的空格数
set softtabstop=4   " 使用tab或bs自动插入或者删除相应的空格数
set showtabline=2   " always show tab line     "                           }}}
"" =================================                                       }}}

""=========== syntax ===============                                       {{{
" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
    syntax enable
endif
" ----------- brackets -------------
set showmatch           " 插入括号时，短暂地跳转到匹配的对应括号
set matchtime=2         " 短暂跳转到匹配括号的时间
autocmd! BufNewFile,BufRead *.pde,*.ino setlocal ft=arduino
cabbrev Wq wq
cabbrev W w
" ====================================                                     }}}

" =========== developing language =================                        {{{
set autoindent              " 自动缩进
set completeopt+=longest    "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
""--------------- C / Cpp ------------------                               {{{
set cindent                 " 自动C语言缩进
autocmd FileType c,cpp setlocal cinoptions=:0,g0,(0,w1 shiftwidth=4 tabstop=4
autocmd FileType diff  setlocal shiftwidth=4 tabstop=4
" 确保把 /usr/include/c++ 和 /usr/include/g++-3 目录下的所有文件都当成 C++ 类型的文件
autocmd BufEnter /usr/include/c++/*    setf cpp
autocmd BufEnter /usr/include/g++-3/*  setf cpp
" Setting for files following the GNU coding standard
"au BufEnter /usr/*                call GnuIndent()
let c_comment_strings=1         "highlighting strings inside C comments     " }}}
" =========================================                                }}}

" ========== Make and Debug =============                                  {{{
" 编译后，如有错误则打开quickfix窗口。（光标仍停留在源码窗口）
" 注意：需要开启netsting autocmd
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
" =======================================                                  }}}

" ============= plugins ================                                  {{{
" ----------- Max Undos ----------------
source ~/.vim/myPlugins/maxUndo.vim
"nmap ssa :call SaveSession()
"smap SO :call RestoreSession()
" ----------- self made plugins -----------
source ~/.vim/myPlugins/LanguageToolUpdate.vim
"" ------------ alt key enable --------------
source ~/.vim/myPlugins/escalt.vim
set ttimeoutlen =10
"" ------------ snippet quotation --------------
source ~/.vim/myPlugins/snippetsPatch.vim
"" ------------ cscope Quickfix mode --------------
source ~/.vim/myPlugins/cscopeQuickfix.vim
"" ------------ a.vim ---------------------
"<Leader>ih switches to file under cursor
"<Leader>is switches to the alternate file of file under cursor
"<Leader>ihn cycles through matches 
" ---------- NeoComplCache.vim ------------                                {{{
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
" http://vim.wikia.com/wiki/Omnicomplete_-_Remove_Python_Pydoc_Preview_Window 参照这篇文章。
" 这样设置，在显示了文档并完成选择后，窗口会关闭
autocmd CursorMovedI *  if pumvisible() == 0|silent! pclose|endif
autocmd InsertLeave * if pumvisible() == 0|silent! pclose|endif     "      }}}
"------------ Powerline --------------                                     {{{
"choose theme
    let g:Powerline_symbols = 'unicode'
    let g:Powerline_colorscheme = 'solarized256'
    "let g:Powerline_colorscheme = 'default'
    "let t_Co=256
    let g:Powerline_stl_path_style = 'full'     "                          }}}
" ------------ latexsuite --------------                                   {{{
 "set grepprg=grep\ -nH\ $*
 "let g:tex_flavor = "latex"
 "noremap <NOP> <Plug>IMAP_JumpForward
 "noremap! <NOP> <Plug>IMAP_JumpForward  | " nth     "                      }}}
" ------------ NERD Comment --------------                                 {{{
"V/v to choose a paragraph of codes
"\cc        " Comments per line
"\cu        " Cancel Comments
"\cm        " Comments a block                                             }}}
" ------------ NERD Tree -----------------                                 {{{
map <leader>tnd :NERDTreeToggle <CR>
"let load_nerd_tree =1
let NERDTreeIgnore=['\~$']
"autocmd VimEnter * nested :NERDTree
let g:nerdtree_tabs_open_on_gui_startup=0     " Open NERDTree on gvim/macvim startup
let g:nerdtree_tabs_open_on_console_startup=0 " Open NERDTree on console vim startup     " }}}
"------- ctags & Tagbar / TagList --------------                           {{{
set tags=tags,tags;
nmap <leader>ctags   :!ctags --c++-kinds=+p --fields=+iaS --extra=+q -R *
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tabbar_autoshowtag =1
let g:tagbar_autofocus = 0
let g:tagbar_autoclose =1
let g:tagbar_left =0
"autocmd VimEnter * nested :TagbarOpen
"set statusline+=%{tagbar#currenttag('[%s] ','')}
nnoremap <leader>tag    :TagbarToggle <CR>
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
"let Tlist_Use_Right_Window =1
"let Tlist_File_Fold_Auto_Close =1
"let Tlist_Exit_OnlyWindow=1
"map <leader>tag     :TlistToggle <CR>
"map! <leader>tag    :TlistToggle <CR>                           | "       }}}
"--------------doxygen ----------------------                              {{{
" need more to complete
"let g:load_doxygen_syntax=1
"let mail_minlines = 30
"let g:is_bash =1
"let g:sh_fold_enabled= 4     "                                             }}}
"------------ indent-guide --------------                                  {{{
let g:indent_guides_guide_size=1
let g:indent_guides_start_level =2
"<leader>ig IndentGuidesToggle                                             }}}
"------------ LanguageTool --------------                                  {{{
" jar download url: http://www.languagetool.org/download/snapshots/
"let g:languagetool_jar='/usr/share/java/languagetool/LanguageTool.jar'
" *TODO* add a function to one-key download and update
let g:languagetool_jar='~/.vim/LanguageTool/LanguageTool.jar'
let g:languagetool_lang='en-US'     "                                      }}}
" --------------- VOom ------------------                                  {{{
"nmap <leader>tvo :VoomToggle <CR>       | " no comments     "              }}}
" ------------- Vimwiki -----------------                                  {{{
"let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
		    "\ 'path_html': '~/Documents/vimwiki/html/',
		    "\ "auto_export": 0}]     "     }}}
" ------------- SnipMate -----------------                                 {{{
let g:snipMateAllowMatchingDot = 0     "                                   }}}
" ------------- SuperTab -----------------                                 {{{
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"                        }}}
" ------------- Syntastic -----------------                                {{{
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
map <leader>tst     :SyntasticToggleMode <CR>
map <leader>tsc     :SyntasticCheck <CR>
" see :h Syntastic for more details                                        }}}
" --------------- FencView.h -------------------                           {{{
" :FencAutoDetect
let g:fencview_autodetect=0     "                                          }}}
" -------- Draw it & sketch.vim --------------                             {{{
" <leader>di to start Draw it
" <leader>ds to stop Draw it
" :call ToggleSketch() to start sketch
nmap <leader>sk :call ToggleSketch() <CR>
" ---------- Octave / matlab ----------------                               {{{
autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search     " }}}
" Pyclewn 调试 C 类程序，依此执行 :Pyclewn :Cinferiortty 然后就是正常的gdb命令
" 调试了
"==============================================                            }}}

" ======= VimIm =============                                              {{{
"let g:vimim_cloud=-1
"let g:vimim_toggle='pinyin'
"let g:vimim_toggle=-1
"let g:vimim_punctuation=3
"CTRL-^ ：（与Vim的定义一致）切换输入法 Toggle the use of language
"CTRL-L ：（点石成金）开关菜单窗口（中文模式）切换中英文标点
"imap <silent> <C-^> <C-^><C-L>
"------------ color scheme --------------                                  {{{
let g:molokai_original=1
"colorscheme Mustang
"colorscheme wombat256
"colorscheme xoria256
"colorscheme desert256
colorscheme molokai
autocmd! BufReadPost,ColorScheme,VimEnter,WinEnter * call MolokaiTransp()
"                                                                          }}}
" ==========================                                               }}}
"" --------- autocmd command -------------                                 {{{
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source $MYVIMRC
" 打开文件后自动定位上次光标的位置
autocmd BufReadPost *
\   if line("'\"") > 1 && line("'\"") <= line("$")
\|      exe "normal! g`\""
\|  endif
autocmd FileType text set textwidth=0
autocmd FileType pandoc setlocal textwidth=79 list "formatoptions-=l
" 显示行标致位，输入过程中自动换行
autocmd BufNewFile,BufEnter *.tmp set textwidth=0
"                                                                          }}}

" ===== Personal Function ======                                           {{{
function! MolokaiTransp()
    highlight Comment ctermfg=109
    if &term =~ 'rxvt'
        highlight Normal ctermbg=256
        highlight NonText ctermbg=256
    elseif &term =~ 'xterm'
        highlight Normal ctermbg=16
        highlight NonText ctermbg=16
    endif
endfunction

" 实现绝对行号和相对行号的互换
function! NumberToggle()                                                    "{{{
    if &number
        setlocal relativenumber
    elseif &relativenumber
        setlocal norelativenumber
    else
        setlocal nu
    endif
endfunction                                                                 "}}}
call MolokaiTransp()

" 自动加执行权限
function! Chmodx()                                                          "{{{
  if strpart(getline(1), 0, 2) == '#!'
    let f = expand("%:p")
    if stridx(getfperm(f), 'x') != 2
      call system("chmod +x ".shellescape(f))
      e!
      filetype detect
      nmap <buffer> <S-F5> :!%:p<CR>
    endif
  endif
endfunction                                                                 "}}}

" 在开头的地方自动插入相关信息
function! TitleAuthorUpdate()                                               "{{{
    "if not exists, then add, otherwise update
endfunction                                                                 "}}}

" 可以把现在的文件和原始文件对比。
if !exists(":DiffOrig")                                                     "{{{
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
    \ | wincmd p | diffthis
endif                                                                       "}}}

" 备份VimIM的原始拼音查找文件
function! RenameVimIM()                                                     "{{{
    let a:vimimDBpatch=$HOME.'.vim/bundle/'.'vimim/plugin/'
    let a:vimimDBfileEX=a:vimimDBpatch . 'vimim.gbk.bsddb'
    let a:vimimDBfileAF=a:vimimDBpatch . 'vimim-bak.gbk.bsddb'
    if filereadable(a:vimimDBfileEX)
        call rename(a:vimimDBfileEX, a:vimimDBfileAF)
    endif
endfunction
"call RenameVimIM()                                                          "}}}


"}}}


" vim:foldmethod=marker
