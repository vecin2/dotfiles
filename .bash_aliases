alias ad="cd $AD/shell_tools"
alias ccadmin="$AD/shell_tools/ccadmin.sh"
alias gt="$AD/shell_tools/gt.sh"
alias wss="cd $WSS/bin"
alias mp="cd ~/dev/workspaces/RubyWeb/MyKitty/"
alias docprj="cd $PRJ_DOCS"
alias adprocesslogs="cd $ADPROCESSLOGS"
alias adapplogs="cd $ADAPPLOGS"
alias adserverlogs="cd $ADSERVERLOGS"

# bash
# No ttyctl, so we need to save and then restore terminal settings
vi()
{
	# osx users, use stty -g
	local STTYOPTS="$(stty --save)"
	stty stop '' -ixoff
	command vi "$@"
	stty "$STTYOPTS"
}

	
