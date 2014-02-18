" --------- manager of vim plugin -------
set nocompatible               " be iMproved and Disable vi-compatibility
filetype off                   " required!
call vundle#rc()
Bundle 'scrooloose/nerdtree'
"Bundle 'vim-scripts/Conque-Shell'
Bundle 'taxilian/a.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'
"Bundle 'johnbintz/vim-taglist-plus'
" ====== complete =======
"Bundle 'vim-scripts/pythoncomplete'
Bundle 'davidhalter/jedi-vim'
Bundle 'vim-scripts/OmniCppComplete'
Bundle 'msanders/snipmate.vim'
"Bundle 'UltiSnips'
" ===== syntax =====
Bundle 'sudar/vim-arduino-snippets'
Bundle 'Arduino-syntax-file'
"Bundle 'hallison/vim-markdown'
Bundle 'vim-pandoc/vim-pandoc'
"Bundle 'vim-pandoc/vim-pandoci-syntax'
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
Bundle 'PotatoesMaster/i3-vim-syntax'
Bundle 'http://fedorapeople.org/cgit/wwoods/public_git/vim-scripts.git'
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
Bundle 'dhruvasagar/vim-table-mode'
Bundle 'lambdalisue/shareboard.vim'
" ===== Lang ======
""Bundle 'vimspell'
Bundle 'LanguageTool'
Bundle 'Engspchk'
"Bundle 'Align'
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
