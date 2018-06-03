# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
export EDITOR=vim

JAVA_HOME="/c/em/installers/Java/jdk1.8.0_171"
PATH="$HOME/.local/bin:$JAVA_HOME/bin:$PATH"
export JAVA_HOME

#rerun
export RERUN_MODULES=$HOME/dev/bash/rerun/modules
export RERUN=/home/dgarcia/dev/bash/setup-rerun/rerun/rerun
source $HOME/dev/bash/rerun/etc/bash_completion.sh
#export PATH="$PATH:/home/dgarcia/dev/bash/rerun"

[ -s "$HOME/.em.bash" ] && source "$HOME/.em.bash" # Load RVM into a shell session *as a function*

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#export AD ADPROCESSLOGS ADAPPLOGS ADSERVERLOGS WSS WEBLOGIC_HOME DOCS
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
#export ORACLE_HOME=/usr/lib/oracle/12.1/client64
#export PATH=$PATH:$ORACLE_HOME/bin 

#Bookmarks
. $HOME/.local/bin/bashmarks.sh 

google() {
	search=""
	echo "Googling: $@"
	for term in $@; do
		search="$search%20$term"
	done
	firefox "http://www.google.com/search?q=$search"
}

#python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
#source $HOME/.local/bin/virtualenvwrapper.sh
