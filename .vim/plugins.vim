"FZF shorcuts +Ack with AG
nnoremap <leader>g :Ag<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>r :Tags<CR>

"Syntasic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ycm_confirm_extra_conf=0

"Vimux key bindings
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>

"Arpeggio key bindings
call arpeggio#load()
"VimuxRunLastCommnad
Arpeggiomap vl <leader>vl
"Search in project for word under the test
Arpeggiomap aj <leader>ag

"Scrall smoth
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

"NERDTREE
"Runs NT when no folder or file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Runs NT when folder specified, sets a new buffer in the main screen and puts
"the controll back to the tree
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | ene | exe 'NERDTree' argv()[0] | endif

"Close NT is the only window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"To allow NERDTREE delete a buffer without exiting window
nnoremap \d :bp<cr>:bd #<cr>
"Use Arpeggio
Arpeggiomap bd \d
nnoremap <Leader>v :NERDTreeToggle<Enter>
nnoremap <Leader>f :NERDTreeFind<Enter>
"Automatically closes NT when opening  a file
"let NERDTreeQuitOnOpen = 1
"Automatically delete a buffer when delete file from NT
let NERDTreeAutoDeleteBuffer = 1

"Hide Press ? for help
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore = ['.pyc$']

