set ruler
colorscheme desert

source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf-8
source $VIMRUNTIME/menu.vim


if has('win32') || has('win64')
  :try
    set guifont=Consolas:h12
    set guifontwide=MS_Gothic:h11
    set rop=type:directx,gamma:1.6,contrast:0.24,level:0.75,geom:1,renmode:5,taamode:1
  :catch
    " do nohitng
  :endtry
endif
