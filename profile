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

#JAVA_HOME="/opt/installers/jdk1.8.0_161"
#PATH="$HOME/.local/bin:$JAVA_HOME/bin:$PATH"
#export JAVA_HOME

[ -s "$HOME/.em.sh" ] && source "$HOME/.em.sh" # Load EM into a shell session *as a function*

export SQL_TEMPLATES_PATH="/home/dgarcia/dev/python/em_automation/sql_gen/templates"

#ORACLE
# Needed to allow cx_Oracle python library run DB queries
export LD_LIBRARY_PATH=/home/dgarcia/oracle/instantclient_19_5/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
#export PATH=$PATH:$ORACLE_HOME/bin
#export ORACLE_HOME=/usr/lib/oracle/12.1/client64
