"Arpeggio initialization {{{
call arpeggio#load()
" }}}

"FZF shorcuts +Ack with AG {{{

"Ag searches only by content not by filename
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
"shorcuts
nnoremap <leader>g :Ag<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <Leader>t :Files<CR>
nnoremap <Leader>r :Tags<CR>
""
""Search in project for word under the test
Arpeggiomap aj <leader>ag
"perform linewise completition based on what you’ve already typed
imap <c-x><c-l> <plug>(fzf-complete-line)

" Redefine :Ag command
"autocmd VimEnter * command! -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path "33;1"', fzf#vim#default_layout)
"set t_ZH=[3m
"set t_ZR=[23m
"set termguicolors

"}}}

"Syntasic {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Solve error when sourcing files in bash files
let g:syntastic_sh_shellcheck_args = "-x"

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["xml","java","sh"] }

"workaround to fix draw issue with syntastic
"augroup redrawfix
"	autocmd!
"	autocmd VimEnter * nnoremap <silent> <c-j> :TmuxNavigateDown<cr>:redraw!<cr>
"augroup END

"}}}

"YouCompleteMe (ycm){{{
"Uncomment this if it prompts for confirmaiton to load the extra conf python
"file
"let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1
Arpeggionoremap gt :YcmCompleter GoToDefinition<CR>
"}}}

"Vimux {{{
noremap <Leader>vp :VimuxPromptCommand<CR>
noremap <Leader>vl :VimuxRunLastCommand<CR>
noremap <Leader>vi :VimuxInspectRunner<CR>
noremap <Leader>vz :VimuxZoomRunner<CR>
Arpeggiomap vl <leader>vl
"}}}

"Scroll smooth{{{
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"}}}

"NerdTree{{{
"Runs NT when no folder or file specified
augroup nerdtree
	autocmd!
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	"Runs NT when folder specified, sets a new buffer in the main screen and puts
	"the controll back to the tree
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | ene | exe 'NERDTree' argv()[0] | endif

	"Close NT is the only window left is NERDTree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

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

"}}}

"Submodules{{{
" don't consume submode-leaving key
let g:submode_keep_leaving_key = 1
let g:submode_always_show_submode = 1

"Allows changin windows size easily
call submode#enter_with('window', 'n', '', '<C-w>')
for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor

call submode#enter_with('goToFoldDown', 'n', '', 'zj')
call submode#map('goToFoldDown', 'n', '', 'j', 'zj')
call submode#map('goToFoldDown', 'n', '', 'k', 'zk')
call submode#enter_with('goToFoldUp', 'n', '', 'zk')
call submode#map('goToFoldUp', 'n', '', 'k', 'zk')
call submode#map('goToFoldUp', 'n', '', 'j', 'zj')

"}}}

"Ultisnips {{{
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"let g:UltiSnipsExpandTrigger="<c-f>"
"let g:UltiSnipsJumpForwardTrigger="<c-f>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"
"}}}
