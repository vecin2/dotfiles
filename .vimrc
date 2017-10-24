set nocompatible              " be iMproved, required
filetype plugin on                  " required
syntax enable
filetype plugin indent on



so ~/.vim/shortcuts.vim
so ~/.vim/colors.vim
so ~/.vim/plugins.vim
so ~/.vim/config.vim



 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'
 "UI
 Plugin 'git://github.com/altercation/vim-colors-solarized.git'

 "Navigation
 Plugin 'scrooloose/nerdtree'
 Plugin 'Xuyuanp/nerdtree-git-plugin'
 Plugin 'git://github.com/terryma/vim-smooth-scroll'
 Plugin 'git://github.com/easymotion/vim-easymotion.git'
 Plugin 'git://github.com/vim-scripts/SearchComplete.git'
 Plugin 'christoomey/vim-tmux-navigator'

 "Editing
 Plugin 'git://github.com/tpope/vim-repeat.git'
 Plugin 'git://github.com/tpope/vim-surround.git'

 "Dev plugins
 Plugin 'git://github.com/vim-syntastic/syntastic.git'
 Plugin 'git://github.com/tpope/vim-endwise.git'
 Plugin 'git://github.com/ervandew/supertab.git'
 Plugin 'git://github.com/vim-ruby/vim-ruby.git'
 Plugin 'bash-support.vim'
 Plugin 'tpope/vim-fugitive'
 Bundle 'skalnik/vim-vroom'

 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 " see :h vundle for more details or wiki for FAQ
 call vundle#end()
