let mapleader="\<Space>"
"Global shorcuts
:imap jj <Esc>
map ; :

"remap windows navigation keys
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <Leader>c :nohl<CR><C-l>

"change current folder easily
nnoremap cd. :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>kl :e ~/Documents/kana/kanaLinks.txt<CR> "Edit kanaLinks
nnoremap <Leader>pl :e ~/Documents/personal/links.txt<CR> "Edit personalLinks
nnoremap <Leader>adl :e $EM_CORE_HOME/docs/links.txt<CR> "Edit personalLinks
nnoremap <Leader>uv :e ~/Documents/kana/usefulviews.sql<CR> "Edit personalLinks

 " Quick quit command
 noremap <Leader>e :quit<CR>  " Quit current window
 noremap <Leader>E :qa!<CR>   " Quit all windows

"Save Ctrl+S
" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified 
			\|    if empty(bufname('%'))
				\|        browse confirm write
				\|     else
					\|        confirm write
				\|     endif 
				\|endif 
nnoremap <silent><C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>


" Zoom / Restore window.
function! s:ZoomToggle() abort
	if exists('t:zoomed') && t:zoomed
		execute t:zoom_winrestcmd
		let t:zoomed = 0
	else
		let t:zoom_winrestcmd = winrestcmd()
		resize
		vertical resize
		let t:zoomed = 1
	endif
endfunction
command!  ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>z :ZoomToggle<CR>

"Change window size
nnoremap <silent> <Leader>> :vertical resize +5<CR>
nnoremap <silent> <Leader>< :vertical resize -5<CR>

"Bubble single lines
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>
nmap <C-Up> ddkP
nmap <C-Down> ddp
"Buble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

"remap resizing panels
"if bufwinnr(1)
"	map - <C-W>-
"	map + <C-W>+
"	map < <C-W><
"	map > <C-W>>
"endif

