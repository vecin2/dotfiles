#!/bin/bash

export DOTFILES_DIR DOTFILES_CACHE EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/.bashrc" ~
ln -sfv "$DOTFILES_DIR/.bash_aliases" ~
ln -sfv "$DOTFILES_DIR/.profile" ~
ln -sfv "$DOTFILES_DIR/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/.vimrc" ~
ln -sfv "$DOTFILES_DIR/.gvimrc" ~
ln -sfv "$DOTFILES_DIR/fzf.bash" ~/.fzf.bash


ln -sfv "$DOTFILES_DIR/.vim/shortcuts.vim" ~/.vim/shortcuts.vim
ln -sfv "$DOTFILES_DIR/.vim/colors.vim" ~/.vim/colors.vim
ln -sfv "$DOTFILES_DIR/.vim/plugins.vim" ~/.vim/plugins.vim
ln -sfv "$DOTFILES_DIR/.vim/config.vim" ~/.vim/config.vim

##Adding pluggins###
bash_apps_path=$HOME/dev/bash
mkdir -p $bash_apps_path

#Check make is installed
make -h>/dev/null 2>&1
make_installed=$?

if [ -d "~/.local/bin/bashmarks.sh" ]; then
	echo "Bashmarks already installed"
elif hash make 2>/dev/null; then
	cd $bash_apps_path
	git clone https://github.com/vecin2/bashmarks.git
	cd bashmarks
	make install
	source $HOME/.local/bin/bashmarks.sh
else
	echo "Bashmark cannot be installed because 'make' is not installed."
fi
