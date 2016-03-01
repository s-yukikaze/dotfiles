set ruler
colorscheme desert

if has('win32') || has('win64')
    let s:dotvim_dir = expand('~/vimfiles')
else
    let s:dotvim_dir = expand('~/.vim')
endif

:try
  call dynfont#load(s:dotvim_dir . '/fonts/Ricty-Regular.ttf')
  set guifont=Ricty:h13.5
  set rop=type:directx,gamma:1.6,contrast:0.24,level:0.75,geom:1,renmode:5,taamode:3
:catch
  " do nohitng
:endtry
