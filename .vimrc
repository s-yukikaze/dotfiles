"" Initialize
if &compatible
    set nocompatible
endif

if has('win32') || has('win64')
    let s:dotvim_dir = expand('~/vimfiles')
    let s:vimrc_local = expand('~/_vimrc_local')
else
    let s:dotvim_dir = expand('~/.vim')
    let s:vimrc_local = expand('~/.vimrc_local')
endif

"" Load local setting
if filereadable(s:vimrc_local)
    execute 'source '.fnameescape(s:vimrc_local)
endif

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
