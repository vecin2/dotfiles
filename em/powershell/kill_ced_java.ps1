(Get-WmiObject Win32_Process  -Filter "name like '%Java%' and commandLine like '%Toolbox.jar%'").Terminate()
