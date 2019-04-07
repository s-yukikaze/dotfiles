"" Initialize
if &compatible
    set nocompatible
endif

if has('win32') || has('win64')
    let s:dotvim_dir = expand('~/vimfiles')
    let s:vimrc_local = expand('~/_vimrc_local')
    let g:python3_host_prog = 'python'
else
    let s:dotvim_dir = expand('~/.vim')
    let s:vimrc_local = expand('~/.vimrc_local')
    let g:python3_host_prog = 'python'
endif

"" Load local setting
if filereadable(s:vimrc_local)
    execute 'source '.fnameescape(s:vimrc_local)
endif

"" Set options
" Input
set backspace=indent,eol,start
" Buffer
set number
set ruler
set notitle
set cursorline
syntax on
" Status
set laststatus=2
" File
set nobackup
set noswapfile
set noundofile
set hidden
set shellslash
" Colorscheme
colorscheme molokai

"" default UTF-8 support
set encoding=utf-8
if has('win32') || has('win64')
  set termencoding=cp932
else
  set termencoding=utf-8
end
let $LANG='ja_jp.utf-8'
set ambiwidth=double

"" Manage plugins
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute "set runtimepath^=" . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    let s:toml      = s:dotvim_dir . '/dein/dein.toml'
    let s:lazy_toml = s:dotvim_dir . '/dein/dein_lazy.toml'
    call dein#begin(s:dein_dir, [$MYVIMRC, s:toml, s:lazy_toml])
    call dein#load_toml(s:toml,      {'lazy': 0})
    call dein#load_toml(s:lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" Enable filetype
filetype plugin indent on
