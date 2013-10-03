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
" repos on github
NeoBundle 'https://github.com/Shougo/unite.vim'
NeoBundle 'https://github.com/Shougo/vimproc'
NeoBundle 'https://github.com/Shougo/vimshell'
NeoBundle 'https://github.com/Shougo/vimfiler'
NeoBundle 'https://github.com/tyru/eskk.vim'
NeoBundle 'https://github.com/s-yukikaze/vinarise'
NeoBundle 'https://github.com/rbtnn/hexript.vim.git'
NeoBundle 'https://github.com/itchyny/lightline.vim'

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
set laststatus=2

colorscheme desert

"" default UTF-8 support
set encoding=utf-8
if has('win32') || has('win64')
  set termencoding=cp932
else
  set termencoding=utf-8
end
let $LANG='ja_jp.utf-8'
set ambiwidth=double

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
nnoremap <silent> ,vf :VimFiler ~<CR>

" lightline
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'MyModified',
        \   'readonly': 'MyReadonly',
        \   'fugitive': 'MyFugitive',
        \   'filename': 'MyFilename',
        \   'fileformat': 'MyFileformat',
        \   'filetype': 'MyFiletype',
        \   'fileencoding': 'MyFileencoding',
        \   'mode': 'MyMode'
        \ }
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      return fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

