set ruler
colorscheme desert

source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim

:try
  set guifont=Ricty:h13.5
  set rop=type:directx,gamma:1.6,contrast:0.24,level:0.75,geom:1,renmode:6
:catch
  " do nohitng
:endtry
