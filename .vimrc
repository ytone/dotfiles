set directory=~/vimswap
set autoindent
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
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


"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

" NeoBundle
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'grep.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'surround.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-abolish'
 
call neobundle#end()
 
" Required:
filetype plugin indent on
 
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
 
"-------------------------
" End Neobundle Settings.
"-------------------------
