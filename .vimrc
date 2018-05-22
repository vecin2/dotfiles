set nocompatible              " be iMproved, required
syntax enable
filetype plugin indent on

if has("autocmd")
	autocmd bufwritepost vimrc,config.vim,shortcuts.vim,colors.vim,plugins.vim source $MYVIMRC
endif



" autocmd! bufwritepost .vimrc source % after save the first ctrl-j navigation
" does not work any longer


"workaround to fix draw issue with syntastic
autocmd VimEnter * nnoremap <silent> <c-j> :TmuxNavigateDown<cr>:redraw!<cr>
"Allows to paste text copid in Vim after exit vim
autocmd VimLeave * call system("xclip -o | xclip -selection c")
set rtp+=~/.vim/bundle/Vundle.vim,~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" "UI and utils
Plugin 'git://github.com/altercation/vim-colors-solarized.git'
Plugin 'chriskempson/base16-vim'
"allows window highlighting
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'https://github.com/blueyed/vim-diminactive'
Plugin 'https://github.com/kana/vim-arpeggio.git'

"Search && Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'git://github.com/ivalkeen/nerdtree-execute.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'git://github.com/terryma/vim-smooth-scroll'
Plugin 'git://github.com/easymotion/vim-easymotion.git'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'git://github.com/tpope/vim-projectionist.git'
Plugin 'git://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/mileszs/ack.vim.git'
Plugin 'git://github.com/bronson/vim-visual-star-search.git'
Plugin 'https://github.com/benmills/vimux.git'

"Editing
Plugin 'git://github.com/tpope/vim-repeat.git'
Plugin 'git://github.com/tpope/vim-surround.git'
Plugin 'git://github.com/tommcdo/vim-exchange.git'
Plugin 'https://github.com/gioele/vim-autoswap'

"Dev plugins
Plugin 'git://github.com/vim-syntastic/syntastic.git'
Plugin 'git://github.com/tpope/vim-endwise.git'
Plugin 'git://github.com/ervandew/supertab.git'
Plugin 'git://github.com/vim-ruby/vim-ruby.git'
Plugin 'bash-support.vim'
Plugin 'tpope/vim-fugitive'
Bundle 'skalnik/vim-vroom'
Plugin 'git://github.com/tpope/vim-dispatch.git'
 

 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 " see :h vundle for more details or wiki for FAQ
call vundle#end()

so ~/.vim/shortcuts.vim
so ~/.vim/colors.vim
so ~/.vim/plugins.vim
so ~/.vim/config.vim

