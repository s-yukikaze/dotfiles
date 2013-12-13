set ruler
colorscheme desert

:try
  call dynfont#load(expand('$DOTVIM/fonts/Ricty-Regular.ttf'))
  set guifont=Ricty:h13.5
  set rop=type:directx,gamma:1.6,contrast:0.24,level:0.75,geom:1,renmode:5,taamode:3
:catch
  " do nohitng
:endtry
