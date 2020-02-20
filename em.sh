last_log_path(){
	ADPROCESSLOGS=$EM_CORE_HOME/logs/ad/cre/session/process
	if [ -z "$1" ] 
	then
		TAIL=1
	else
		TAIL=$1
	fi

	FILE_NAME=$(ls $ADPROCESSLOGS -ltr | grep process | tail -$TAIL | head -1 | rev | cut -d " " -f1 | rev)

	FULL_PATH=$ADPROCESSLOGS/$FILE_NAME
	echo $FULL_PATH
}
vpl(){
	vim $(last_log_path $1)
}
ccadmin(){
	cmd.exe wslpath -w "/mnt/c/em/projects/pacificorp/bin/ccadmin.bat" "$@" &
}

