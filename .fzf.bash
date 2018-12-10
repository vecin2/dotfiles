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

