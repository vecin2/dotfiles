#!/bin/bash

export DOTFILES_DIR DOTFILES_CACHE EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/bashrc" ~/.bashrc
ln -sfv "$DOTFILES_DIR/bash_aliases" ~/.bash_aliases
ln -sfv "$DOTFILES_DIR/bash_profile" ~/.bash_profile
ln -sfv "$DOTFILES_DIR/profile" ~/.profile
ln -sfv "$DOTFILES_DIR/tmux.conf" ~/.tmux.conf
ln -sfv "$DOTFILES_DIR/vimrc" ~/.vimrc
ln -sfv "$DOTFILES_DIR/gvimrc" ~/.gvimrc
ln -sfv "$DOTFILES_DIR/fzf.bash" ~/.fzf.bash
ln -sfv "$DOTFILES_DIR/gitconfig" ~/.gitconfig
#install gruvbox
ln -sfv "$DOTFILES_DIR/dircolors/dircolors_gruvbox" ~/.dir_colors

ln -sfv "$DOTFILES_DIR/flake8" ~/.flake8
ln -sfv "$DOTFILES_DIR/pylintrc" ~/.pylintrc

ln -sfv "$DOTFILES_DIR/vim/shortcuts.vim" ~/.vim/shortcuts.vim
ln -sfv "$DOTFILES_DIR/vim/colors.vim" ~/.vim/colors.vim
ln -sfv "$DOTFILES_DIR/vim/plugins.vim" ~/.vim/plugins.vim
ln -sfv "$DOTFILES_DIR/vim/config.vim" ~/.vim/config.vim

#install verint functions
mkdir -p $HOME/.vim
verint_path=$(wslpath 'C:\ProgramData\Verint\')
mkdir -p $verint_path
ln -sfv "${DOTFILES_DIR}"/em ~/.em
cp -rf "${DOTFILES_DIR}"/em/powershell/ $verint_path
echo "Copied '${DOTFILES_DIR}/em/powershell' to '${verint_path}'"

#install wsltty themes
install_wsltty_theme(){
	themes_path=$(cmd.exe /c echo %APPDATA%)
	themes_path=$(wslpath "${themes_path}")
	themes_path=$(echo "${themes_path}" | tr '\r' '/')/wsltty/themes
	git_theme_loc=$1
	file_to_copy=$(basename $git_theme_loc)
	git_url=$2
	wsltty_theme_loc="${themes_path}"/$file_to_copy
	if test -f $wsltty_theme_loc; then
		echo "$file_to_copy already exist"
	else
		echo "Installing theme on '$themes_path'"
		mkdir tmp_schema
		cd tmp_schema
		git clone ${git_url}
		cp  "${git_theme_loc}" "${wsltty_theme_loc}"
		echo "copying ${git_theme_loc} '${wsltty_theme_loc}'"
		cd ..
		rm -rf tmp_schema
	fi
}
install_wsltty_theme "gruvbox-contrib/mintty/gruvbox.minttyrc" "git@github.com:morhetz/gruvbox-contrib.git"
install_wsltty_theme "nord-mintty/src/nord.minttyrc" "git@github.com:arcticicestudio/nord-mintty.git"
install_wsltty_theme "WSL-config/mintty/themes/tomorrow-night.minttyrc" "git@github.com:hsab/WSL-config.git"
