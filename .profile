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

JAVA_HOME="/opt/installers/jdk1.8.0_121"
#JAVA_HOME="/opt/installers/jdk1.7.0_79"
JBOSS_HOME="/opt/containers/jboss/jboss-as-7.1.1.Final"
WEBLOGIC_HOME="/opt/verint/verint_containers/em-appserver"
PATH="$JAVA_HOME/bin:$PATH"
AD="/opt/verint/verint_projects/SPEN/FP3"
PRJ_DOCS="~/Documents/SPEN/CSO"
CONTAINER_NAME=container_ad_1
ADPROCESSLOGS=$AD/logs/localhost-$CONTAINER_NAME/cre/session/process/
ADAPPLOGS=$AD/logs/localhost-$CONTAINER_NAME/cre/session/application
ADSERVERLOGS=$AD/logs/localhost-$CONTAINER_NAME/weblogic

#WSS="/opt/em/projects/prudential/MCCS/WebSelfService/trunk"

export JAVA_HOME
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export AD ADPROCESSLOGS ADAPPLOGS ADSERVERLOGS WSS WEBLOGIC_HOME

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


