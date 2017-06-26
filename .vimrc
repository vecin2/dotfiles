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

nmap <c-n> :NERDTreeToggle<CR>
"let nerdtreeshowhidden=1
"autocmd vimenter * if (argc()==0 || argc()==1 && isdirectory(argv()[0])) | nerdtree | endif
autocmd VimEnter * if !argc() | NERDTree | endif
"let g:nerdtreehijacknetrw = 1
"au vimenter nerd_tree_1 enew | execute 'nerdtree '.argv()[0]

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
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'scrooloose/nerdtree'
Plugin 'git://github.com/easymotion/vim-easymotion.git'
Plugin 'git://github.com/vim-scripts/SearchComplete.git'
"Dev plugins
Plugin 'git://github.com/tpope/vim-endwise.git'
Plugin 'git://github.com/ervandew/supertab.git'
Plugin 'git://github.com/vim-ruby/vim-ruby.git'
Bundle 'skalnik/vim-vroom'
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
call vundle#end()
filetype plugin indent on
