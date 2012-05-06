set ruler
set background=light
colorscheme desert

call dynfont#enable_directwrite('1')

:try
  call dynfont#load(expand('$DOTVIM/fonts/Ricty-Regular.ttf'))
  set guifont=Ricty:h13.5
:catch
  " do nohitng
:endtry

