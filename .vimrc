"" Initialize Neobundle
set nocompatible
filetype plugin indent off

if has('win32') || has('win64')
    let $DOTVIM = expand('~/vimfiles')
else
    let $DOTVIM = expand('~/.vim')
endif

if has('vim_starting')
   set runtimepath+=$DOTVIM/bundle/neobundle.vim

   call neobundle#rc(expand('$DOTVIM/bundle'))
endif

"" Managed plugins
" Neobundle itself
NeoBundle 'https://github.com/Shougo/neobundle.vim'

" repos on github
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/vimproc'
NeoBundle 'https://github.com/Shougo/vimshell'
NeoBundle 'https://github.com/Shougo/vimfiler'
NeoBundle 'https://github.com/tyru/eskk.vim'
NeoBundle 'https://github.com/s-yukikaze/vinarise'

" repos on vim-scripts
NeoBundle 'https://github.com/vim-scripts/Darcs'

filetype plugin indent on

"" Initial options
syntax on
set bs=indent,eol,start
set number
set ruler
set title
set background=light
set nobackup
set noswapfile
set shellslash

colorscheme desert

"" default UTF-8 support
set encoding=utf-8
set termencoding=utf-8
let $LANG='ja_jp.utf-8'

"" Plugin settings
" eskk
set imdisable
let g:eskk#directory = expand('~/eskk')
let g:eskk#dictionary = { 'path': expand('~/eskk/SKK-JISYO.U'), 'sorted': 0, 'encoding': 'utf-8', }
let g:eskk#large_dictionary = { 'path': expand('~/eskk/SKK-JISYO.L'), 'sorted': 1, 'encoding': 'euc-jp', }

" vimshell
nnoremap <silent> ,sh :VimShell<CR>
nnoremap <silent> ,psh :VimShellInteractive Powershell -Command -<CR>
vnoremap <silent> ,ss :VimShellSendString<CR>

" vimfiler
nnoremap <silent> ,vf :VimFiler ~/<CR>

