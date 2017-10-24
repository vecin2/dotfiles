:imap jj <Esc>

"remap resizing panels
if bufwinnr(1)
	map - <C-W>-
	map + <C-W>+
	map < <C-W><
	map > <C-W>>
endif

"remap windows navigation keys
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
map ; :

"Save Ctrl+S
" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
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
