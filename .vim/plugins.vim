"Scrall smoth
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"NERDTREE
"autocmd StdinReadPre * let s:std_in=1
autocmd StdinReadPre * let s:std_in=1

"Runs NT when no folder or file specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Runs NT when folder specified, sets a new buffer in the main screen and puts
"the controll back to the tree
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | ene | exe 'NERDTree' argv()[0] | endif

"Close NT is the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <Leader>v :NERDTreeToggle<Enter>
nnoremap <Leader>f :NERDTreeFind<Enter>

"Automatically closes NT when opening  a file
"let NERDTreeQuitOnOpen = 1
"Automatically delete a buffer when delete file from NT
let NERDTreeAutoDeleteBuffer = 1

"Hide Press ? for help
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1

