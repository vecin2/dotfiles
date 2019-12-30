set nocompatible              " be iMproved, required
syntax enable
filetype plugin indent on

"bundle Plugins {{{
set rtp+=~/.vim/bundle/Vundle.vim,~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"
""""""UI and utils"""""
"Approx true colors to 256 scheme colors
Plugin 'https://github.com/godlygeek/csapprox.git'
"Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'chriskempson/base16-vim'
"Jellybeans color scheme
Plugin 'https://github.com/nanotech/jellybeans.vim.git'
"allows window highlighting
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'https://github.com/blueyed/vim-diminactive'
Plugin 'https://github.com/kana/vim-arpeggio.git'
Plugin 'https://github.com/kana/vim-submode.git'

"Search && Navigation
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/ivalkeen/nerdtree-execute.git'
"This pull request from syntastic fixes an issue when opening files
"out of nerdtree, e.g fzf and then try to save then
"Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'git@github.com:NickolasHKraus/nerdtree-git-plugin.git'
Plugin 'https://github.com/terryma/vim-smooth-scroll'
Plugin 'https://github.com/easymotion/vim-easymotion.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'https://github.com/tpope/vim-projectionist.git'
"Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/mileszs/ack.vim.git'
Plugin 'https://github.com/bronson/vim-visual-star-search.git'
"Interact with tmux (VimRunLasCommand)
Plugin 'https://github.com/benmills/vimux.git'

"Editing
Plugin 'https://github.com/tpope/vim-repeat.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/tommcdo/vim-exchange.git'
"Dealing with swap files
Plugin 'https://github.com/gioele/vim-autoswap'

"Dev plugins
Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'https://github.com/tpope/vim-endwise.git'
Plugin 'https://github.com/vim-ruby/vim-ruby.git'
Plugin 'bash-support.vim'
Plugin 'tpope/vim-fugitive'
"Bundle 'skalnik/vim-vroom'
Plugin 'https://github.com/tpope/vim-dispatch.git'
Bundle 'Valloric/YouCompleteMe'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'tmhedberg/SimpylFold'
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 " see :h vundle for more details or wiki for FAQ
call vundle#end()
"}}}


" Source vim config when save {{{
augroup sourcevim
	autocmd!
	autocmd bufwritepost vimrc,config.vim,shortcuts.vim,plugins.vim source $MYVIMRC
augroup END
" }}}
"so ~/.vim/shortcuts.vim
so ~/.vim/config.vim
so ~/.vim/plugins.vim

