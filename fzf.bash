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
#   - CTRL-O or Enter to open with `open` command,
#   - CTRL-E to open with the $EDITOR
#   - CTRL-N or Enter key to navigate in natilus


fo() {
	local out file key
	IFS=$'\n'
 	out=$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e,ctrl-n)
	key=$(head -1 <<< "$out")
	file=$(head -2 <<< "$out" | tail -1)
	if [ -n "$file" ]; then
	 if [ "$key" = ctrl-e ]; then
		 ${EDITOR:-vim} "$file"
	 elif [ "$key" = ctrl-n ]; then
		 nautilus "$file"
	 else
		 xdg-open "$file" 
	 fi
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


cf() {
	local file

	file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

	if [[ -n $file ]]
	then
		if [[ -d $file ]]
		then
			cd -- $file
		else
			cd -- ${file:h}
		fi
	fi
}

ft(){
	local dest_bookmark=$(cdscuts_glob_echo | fzf )
	#extract path from line choose
	if [[ $dest_bookmark != '' ]]; then
		local dest_dir="/${dest_bookmark#*/}";
		cd "$dest_dir"
	fi
}
#print all bookmards to feed fzf
function cdscuts_glob_echo {
   source $SDIRS
   env | grep "^DIR_" | cut -c5- | sort |grep "^.*=" | sed 's/=/\t\t/g'
}

fg(){
  local file

  file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1}')"

  if [[ -n $file ]]
  then
     vim $file
  fi
}
