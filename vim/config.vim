"Colors {{{
"let base16colorspace=256
if filereadable(expand("~/.vimrc_background"))
	  let base16colorspace=256
	    source ~/.vimrc_background
endif
"colorscheme blackboard
"highlight Comment cterm=italic
"}}}

"Coding settings {{{
set tags +=.git/tags
"It defaults diff splits to be vertical
set diffopt+=vertical
"mark white spaces
augroup whitespace
	autocmd!
	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
augroup END
"Line added before autcmd run as it gives and error when opening .py
"files because BadWhitespace does not exist
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0
" }}}

"Python settings{{{
augroup filetype_py
	autocmd!
	autocmd FileType python :iabbrev <buffer> \s @pytest.mark.skip
	autocmd FileType python : set colorcolumn =79
"}}}

"Vimscript file setting ----- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Folding {{{
"Cheatsheet
"zi switch folding on or off
"za toggle current fold open/close
"zc close current fold
"zM close all folds 
"zv expand folds to reveal cursor
set nofoldenable
nnoremap , za
nnoremap <leader>, zMzv
" }}}

"Searching {{{
"search by files completing like sh
set wildmode=longest,list 
"allow searching in subdirectories
set path+=**
" hilight searched term
set hlsearch
"Allows vim to use ag with ack plugin
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <leader>a <Esc>:Ack! 
"}}}

"Clipboard settings {{{
"Allows to paste text copied from Vim after exit vim
autocmd VimLeave * call system("xclip -o | xclip -selection c")
set clipboard=unnamed
"}}}

"""Navigating docs {{{
"Remove backup files swp
set nobackup nowritebackup
"Allow exit buffer without saving
set hidden
" Always show 5 lines between current cursor line and top or bottom line
set scrolloff=5   
"set relativenumber and absolute number for current line
set rnu
set number
"This map allows to use the arrow keys in insert mode. Otherwise it shows
"strange characters
map OA <up>
map OB <down>
map OC <right>
map OD <left>
"}}}

"Status Line {{{
"Display status line always
set laststatus=2
function! GitBranch()
    return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
    let l:branchname = GitBranch()
    return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
"
set statusline=
set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=\
"}}}

"Mouse config {{{
set mouse=a  "enable mouse
set ttymouse=sgr
" }}}

"Global Remaps{{{
let mapleader="\<Space>"
:inoremap jk <Esc>
"Uncommenting the below lines causes characters to appear when mouse events
"occur in insert mode
":inoremap <Esc> <nop>

noremap ; :
noremap : <nop>
"}}}

"Other Vim remaps {{{
"To allow NERDTREE delete a buffer without exiting window
nnoremap \d :bp<cr>:bd! #<cr>
" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <Leader>c :nohl<CR><C-l>
"Change root dir to current
nnoremap cd. :lcd %:p:h<CR>:pwd<CR> 
"Change window size
nnoremap <silent> <Leader>> :vertical resize +5<CR>
nnoremap <silent> <Leader>< :vertical resize -5<CR>
"}}}

""" Ctrl+S {{{
" If the current buffer has never been saved, it will have no name,
" " call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified 
			\|    if empty(bufname('%'))
				\|        browse confirm write
				\|     else
					\|        confirm write
				\|     endif 
				\|endif 
"Ctrl+s Save
nnoremap <silent><C-S> :<C-u>Update<CR>
inoremap <c-s> <Esc>:Update<CR>
" }}}

" Ctrl+z Zoom / Restore window {{{
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
"}}}

"Ctrl+UP(Down) -Bubble single lines{{{
map <ESC>[1;5A <C-Up>
map <ESC>[1;5B <C-Down>
nmap <C-Up> ddkP
nmap <C-Down> ddp
"Buble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]
"}}}

"Setting tabs Set tabstop, softtabstop and shiftwidth to the same value {{{
command! -nargs=* Stab call Stab()
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction
" }}}

" Shorcuts to main docs {{{
nnoremap <Leader>kl :e ~/Documents/kana/kanaLinks.txt<CR> 
nnoremap <Leader>pl :e ~/Documents/personal/links.txt<CR> 
nnoremap <Leader>adl :e $EM_CORE_HOME/docs/links.txt<CR> 
nnoremap <Leader>uv :e ~/Documents/kana/usefulviews.sql<CR> 
nnoremap <Leader>mv :e $MYVIMRC<CR> "Edit MYVIMRC
nnoremap <Leader>mc :e ~/.vim/config.vim<CR> "Edit config.vim
nnoremap <Leader>mp :e ~/.vim/plugins.vim<CR> "Edit plugins.vim
nnoremap <Leader>pn :e $EM_CORE_HOME/docs/notes.txt<CR> 
"}}}

