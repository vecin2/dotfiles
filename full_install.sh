#!/bin/bash
./install.sh
#install solarized

#install dir_colors

#Update vim version(if version is 'Small Version without GUI')
sudo apt-get install vim-gui-common
sudo apt-get install vim-runtime

#vim vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#tmux and tmuxinator
sudo apt-get install tmux
sudo apt-get install tmuxinator

#fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

#ack
sudo apt-get install ack



