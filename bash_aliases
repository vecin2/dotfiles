#verint
alias tad="cd $EM_CORE_HOME"
alias ced='wstart ccadmin ced'
alias sqltask='command "/mnt/c/em/projects/pacificorp/bin/sqltask.exe"'
alias rsql='sqltask run-sql'
alias csql='sqltask create-sql'
alias tsql='sqltask create-sql'

#rerun
alias rr="~/dev/bash/rerun/rerun"
alias trr="cd ~/dev/bash/rerun"

#tmux
alias tmux="env TERM=screen-italics tmux -2"

#tmuxinator
alias mux=tmuxinator
alias ag="ag --color-path '36;1' --color-line-number '1;35'"
stty -ixon

#fasd
alias v='f -e vim' # quick opening files with vim
alias o='a -e xdg-open' # quick opening files with xdg-open
alias r='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
