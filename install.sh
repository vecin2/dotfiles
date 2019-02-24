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
ln -sfv "$DOTFILES_DIR/gitconfig" ~/.gitconfig


ln -sfv "$DOTFILES_DIR/.vim/shortcuts.vim" ~/.vim/shortcuts.vim
ln -sfv "$DOTFILES_DIR/.vim/colors.vim" ~/.vim/colors.vim
ln -sfv "$DOTFILES_DIR/.vim/plugins.vim" ~/.vim/plugins.vim
ln -sfv "$DOTFILES_DIR/.vim/config.vim" ~/.vim/config.vim
