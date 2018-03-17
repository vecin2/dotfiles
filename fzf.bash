# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dgarcia/.fzf/bin* ]]; then
  export PATH="$PATH:/home/dgarcia/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dgarcia/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/dgarcia/.fzf/shell/key-bindings.bash"



# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
	local out file key
	IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
	key=$(head -1 <<< "$out")
	file=$(head -2 <<< "$out" | tail -1)
	if [ -n "$file" ]; then
		gnome-open "$file"
		#[ "$key" = ctrl-o ] && gnome-open "$file" || ${EDITOR:-vim} "$file"
		#xdg-open "$file" 
	fi
}
#bind '"\C-o":"fo\n"'


# fkill - kill process
fkill() {
	local pid
	pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

	if [ "x$pid" != "x" ]
	then
		echo $pid | xargs kill -${1:-9}
	fi
}
