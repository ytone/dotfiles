set directory=~/vimswap
set autoindent
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
augroup END
set smartindent
set number
set clipboard=unnamed
set nocompatible
set ruler
set list
set listchars=tab:>-
set tabstop=4
set shiftwidth=4
set expandtab

let g:symfony_app_console_caller= "php"
let g:symfony_app_console_path= "app/console"
au BufRead,BufNewFile *.twig set filetype=htmljinja
set splitbelow
let g:quickrun_config={'*': {'vsplit': ''}}
set foldmethod=marker

let &runtimepath=&runtimepath . ',~/vim/force.com'
" make sure vim loads apexcode filetype detection
runtime ftdetect/vim-force.com.vim
filetype plugin on
syntax on
""" 下記はプロジェクト毎だったり環境によって色々変えてください。
" build.properties ファイルはForce.com Migration Tool 内にサンプルが入っていますので、
" これを環境に合わせて編集して、いい場所に置いてください。
let g:apex_properties_folder="/home/y.tonegawa/workspace"
let g:apex_temp_folder="/tmp/apex/gvim-deproyment"
let g:apex_backup_folder="/tmp/apex/gvim-backup"
let g:apex_deployment_error_log="apex_deployment_error_log"



set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')

" (中略)
call dein#add('scrooloose/nerdtree')
call dein#add('Townk/vim-autoclose')
call dein#add('grep.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/syntastic')
call dein#add('thinca/vim-quickrun')
call dein#add('surround.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-abolish')

call dein#end()

:call dein#install()


" Required:
filetype plugin indent on
 
