colo codeschool
set guifont=Monaco\ 11
set guioptions+=m " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
:set mousemodel=popup

"copy and paste like windows
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r>+
