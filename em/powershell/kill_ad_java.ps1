(Get-WmiObject Win32_Process  -Filter "name like '%Java%' and commandLine like '%Dweblogic.name=Admin%'").Terminate()
