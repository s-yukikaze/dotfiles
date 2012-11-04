set ruler
set background=light
colorscheme desert

:try
  call dynfont#load(expand('$DOTVIM/fonts/Ricty-Regular.ttf'))
  set guifont=Ricty:h13.5
:catch
  " do nohitng
:endtry

