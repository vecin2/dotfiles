set nocompatible              " be iMproved, required
syntax enable
filetype plugin indent on

"Line added before autcmd run as it gives and error when opening .py
"files because BadWhitespace does not exist
:highlight BadWhitespace ctermfg=16 ctermbg=253 guifg=#000000 guibg=#F8F8F0

"Not sure what issue they fix
map OA <up>
map OB <down>
map OC <right>
map OD <left>


" autocmd! bufwritepost .vimrc source % after save the first ctrl-j navigation
" does not work any longer
if has("autocmd")
	autocmd bufwritepost vimrc,config.vim,shortcuts.vim,colors.vim,plugins.vim source $MYVIMRC
endif


"workaround to fix draw issue with syntastic
autocmd VimEnter * nnoremap <silent> <c-j> :TmuxNavigateDown<cr>:redraw!<cr>
"Allows to paste text copid in Vim after exit vim
autocmd VimLeave * call system("xclip -o | xclip -selection c")
set rtp+=~/.vim/bundle/Vundle.vim,~/.fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" "UI and utils
"Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'chriskempson/base16-vim'
Plugin 'https://github.com/nanotech/jellybeans.vim.git'
"allows window highlighting
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'https://github.com/blueyed/vim-diminactive'
Plugin 'https://github.com/kana/vim-arpeggio.git'

"Search && Navigation
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'https://github.com/ivalkeen/nerdtree-execute.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'https://github.com/terryma/vim-smooth-scroll'
"Plugin 'https://github.com/easymotion/vim-easymotion.git'
Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'https://github.com/tpope/vim-projectionist.git'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/mileszs/ack.vim.git'
Plugin 'https://github.com/bronson/vim-visual-star-search.git'
Plugin 'https://github.com/benmills/vimux.git'

"Editing
Plugin 'https://github.com/tpope/vim-repeat.git'
Plugin 'https://github.com/tpope/vim-surround.git'
Plugin 'https://github.com/tommcdo/vim-exchange.git'
Plugin 'https://github.com/gioele/vim-autoswap'

"Dev plugins
Plugin 'https://github.com/vim-syntastic/syntastic.git'
Plugin 'https://github.com/tpope/vim-endwise.git'
Plugin 'https://github.com/ervandew/supertab.git'
Plugin 'https://github.com/vim-ruby/vim-ruby.git'
Plugin 'bash-support.vim'
Plugin 'tpope/vim-fugitive'
"Bundle 'skalnik/vim-vroom'
Plugin 'https://github.com/tpope/vim-dispatch.git'
Bundle 'Valloric/YouCompleteMe'
 

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

