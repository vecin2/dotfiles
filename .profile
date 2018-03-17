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

JAVA_HOME="/opt/installers/jdk1.8.0_121"
#JAVA_HOME="/opt/installers/jdk1.7.0_79"
JBOSS_HOME="/opt/containers/jboss/jboss-as-7.1.1.Final"
WEBLOGIC_HOME="/opt/verint/verint_containers/em-appserver"
PATH="$JAVA_HOME/bin:$PATH"
AD="/opt/em/projects/elkjop/AgentDesktop/BAU"
DOCS="/home/dgarcia/Documents/applicationSupport"
CONTAINER_NAME=container_ad_1
ADPROCESSLOGS=$AD/logs/localhost-$CONTAINER_NAME/cre/session/process/
ADAPPLOGS=$AD/logs/localhost-$CONTAINER_NAME/cre/session/application
ADSERVERLOGS=$AD/logs/localhost-$CONTAINER_NAME/jboss

#WSS="/opt/em/projects/prudential/MCCS/WebSelfService/trunk"
. ~/.local/bin/bashmarks.sh 
export JAVA_HOME
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export AD ADPROCESSLOGS ADAPPLOGS ADSERVERLOGS WSS WEBLOGIC_HOME DOCS
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export PATH=$PATH:$ORACLE_HOME/bin 
#export PATH="$PATH:/home/dgarcia/dev/bash/rerun"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


#Bookmarks
#source ~/.local/bin/bashmarks.sh

#rerun
#export RERUN_MODULES=~/dev/bash/rerun_modules
#export RERUN=/home/dgarcia/dev/bash/setup-rerun/rerun/rerun
google() {
	search=""
	echo "Googling: $@"
	for term in $@; do
		search="$search%20$term"
	done
	firefox "http://www.google.com/search?q=$search"
}
