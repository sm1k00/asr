$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-File "a:\ADForestRecovery\adrecovery-2-recover-forest.ps1"'
$trigger = New-ScheduledTaskTrigger -AtStartup
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -TaskName "ADForestRecovery" -Action $action -Trigger $trigger -Settings $settings
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM" -LogonType ServiceAccount
Set-ScheduledTask -TaskName "ADForestRecovery" -Principal $principal