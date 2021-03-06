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
	cmd.exe wslpath -w "${EM_CORE_HOME}/bin/ccadmin.bat" "$@" &
}
ad_kill(){
	dir='C:\ProgramData\Verint\powershell\kill_ad_java.ps1'
	powershell.exe -F $dir
}
ad_restart(){
	ad_kill
	ccadmin start-appserver -Dcontainer.name=ad
}
ced_kill(){
	dir='C:\ProgramData\Verint\powershell\kill_ced_java.ps1'
	powershell.exe -F $dir
}
ced_restart(){
	ced_kill
	ccadmin ced
}
