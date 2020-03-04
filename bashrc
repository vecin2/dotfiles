# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
		export PS1="\W \$"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# Add ansible specific scripts on this file
if [ -f ~/.bash_ansible ]; then
    . ~/.bash_ansible
fi
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export FZF_DEFAULT_OPTIONS="--extended --color fg:241,bg:230,hl:33,fg+:241,bg+:221,hl+:33 --color info:33,prompt:33,pointer:166,marker:166,spinner:33"
# Setting fd as the default source for fzf
#export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_COMMAND='ag --path-to-ignore ~/.ignore --hidden -g "" --follow'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export MY_BASHRC_VAR="$FZF_DEFAULT_COMMAND"

# log every command typed and when
#if [ -n "${BASH_VERSION}" ]; then
#	trap "caller >/dev/null || \
#		printf '%s\\n' \"\$(date '+%Y-%m-%dT%H:%M:%S%z')\
#		\$(tty) \${BASH_COMMAND}\" 2>/dev/null >>~/.dotfiles/command_log" DEBUG
#fi

 #Avoid duplicates
#export HISTCONTROL=ignoredups:erasedups  

# After each command, append to the history file and reread it
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r; history -n"



[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#Enable VcXsrv for clipboard to work correctly within WSL
export DISPLAY=localhost:0.0
#xlaunch="/mnt/c/Program Files/VcXsrv/xlaunch.exe"
#if test -f "$xlaunch"; then
#	"$xlaunch" -run /mnt/c/Users/vecin/Desktop/config.xlaunch
#fi

#Bookmarks
. $HOME/.local/bin/bashmarks.sh 
. $HOME/.sdirs

google() {
	search=""
	echo "Googling: $@"
	for term in $@; do
		search="$search%20$term"
	done
	firefox "http://www.google.com/search?q=$search"
}

ccadmin(){
	cmd.exe wslpath -w "/mnt/c/em/projects/pacificorp/bin/ccadmin.bat" "$@" 
}


#setup python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/dev/python
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6
source $HOME/.local/bin/virtualenvwrapper.sh

#autocomplation for fasd
#eval "$(fasd --init auto)"
#export LS_COLORS="$(vivid generate molokai)"
#test -r "~/.dir_colors_nord" &&
eval $(dircolors ~/.dir_colors)

#For being able to run .bat files from WSL
#sudo sh -c "echo :WindowsBatch:E::bat::/init: > /proc/sys/fs/binfmt_misc/register"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
	[ -s "$BASE16_SHELL/profile_helper.sh" ] && \
	eval "$("$BASE16_SHELL/profile_helper.sh")"
export EM_CORE_HOME=/mnt/c/em/projects/pacificorp
export AD=$EM_CORE_HOME
export PATH="$PATH:$EM_CORE_HOME/bin" # Add bin EM folder
#sudo sh -c "echo :WindowsBatch:E::bat::/init: > /proc/sys/fs/binfmt_misc/register"
. $EM_CORE_HOME/project/.em/em.sh
