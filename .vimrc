set nocompatible              " be iMproved, required
filetype plugin on                  " required

set tags +=.git/tags

"set relativenumber and absolute number for current line
set rnu
set number
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

"Nerdtree
nmap <c-n> :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
autocmd VimEnter * if !argc() | NERDTree | endif

syntax enable
let g:solarized_termcolors=16      
let g:solarized_termtrans=0       
let g:solarized_degrade=0       
let g:solarized_bold=1       
let g:solarized_underline=1       
let g:solarized_italic=1       
let g:solarized_contrast="high"
let g:solarized_visibility="high"
set t_Co=16
set background=dark
colorscheme solarized
"highlight with underline
"highlight! link visual cursorline

"search by files completing like sh
set wildmode=longest,list 

"allow searching in subdirectories
set path+=**

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"UI
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
"
"Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'git://github.com/easymotion/vim-easymotion.git'
Plugin 'git://github.com/vim-scripts/SearchComplete.git'
Plugin 'christoomey/vim-tmux-navigator'

"Editing
Plugin 'git://github.com/tpope/vim-surround.git'
"Dev plugins
Plugin 'git://github.com/tpope/vim-endwise.git'
Plugin 'git://github.com/ervandew/supertab.git'
Plugin 'git://github.com/vim-ruby/vim-ruby.git'
Plugin 'tpope/vim-fugitive'
Bundle 'skalnik/vim-vroom'

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
call vundle#end()
filetype plugin indent on
