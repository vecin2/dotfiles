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

JAVA_HOME="/opt/installers/jdk1.8.0_161"
PATH="$HOME/.local/bin:$JAVA_HOME/bin:$PATH"
export JAVA_HOME

#rerun
#export RERUN_MODULES=$HOME/dev/bash/rerun/modules
#export RERUN=/home/dgarcia/dev/bash/setup-rerun/rerun/rerun
#source $HOME/dev/bash/rerun/etc/bash_completion.sh
#export PATH="$PATH:/home/dgarcia/dev/bash/rerun"

[ -s "$HOME/.em.bash" ] && source "$HOME/.em.bash" # Load EM into a shell session *as a function*
export SQL_TEMPLATES_PATH="/home/dgarcia/dev/python/em_automation/sql_gen/templates"

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Needed to allow cx_Oracle python library run DB queries
export LD_LIBRARY_PATH=/home/dgarcia/oracle/instantclient_19_5/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
#export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
#export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export PATH=$PATH:$ORACLE_HOME/bin 
