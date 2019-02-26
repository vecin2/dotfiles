#!/bin/bash
./install.sh
##Adding pluggins###
bash_apps_path=$HOME/dev/bash
mkdir -p $bash_apps_path

#Check make is installed
make -h>/dev/null 2>&1
make_installed=$?

if [ -f "$HOME/.local/bin/bashmarks.sh" ]; then
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

#install solarized

#install dir_colors
