<powershell>
# Create new local user and add to administrator group
$password = ConvertTo-SecureString "${userpassword}" -AsPlainText -Force
$username = "demo"
New-LocalUser $username -Password $password -FullName "F5 Demo"
Add-LocalGroupMember -Group "Administrators" -Member $username

# Create temp directory
New-Item -Path 'C:\temp' -ItemType Directory
New-Item -Path 'C:\temp\code' -ItemType Directory

# Copy certificate to temp directory
New-Item -Path 'C:\temp\id_rsa' -ItemType File -Value "${certificate}" -Force
# Copy known_hosts to temp directory
New-Item -Path 'C:\temp\known_hosts' -ItemType File -Value "${knownhosts}" -Force
# Copy aws creds files to temp directory
New-Item -Path 'C:\temp\config' -ItemType File -Value "${shared_config_files}" -Force
New-Item -Path 'C:\temp\credentials' -ItemType File -Value "${shared_credentials_files}" -Force
# Copy logon script to temp directory
New-Item -Path 'C:\temp\logon.cmd' -ItemType File -Value "${logonScriptCMD}" -Force

# Create user logon task
$actions = New-ScheduledTaskAction -Execute "C:\temp\logon.cmd"
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
$task = New-ScheduledTask -Action $actions -Principal $principal -Trigger $trigger
Register-ScheduledTask "userLogonTask" -InputObject $task 

# Install applications
Set-ItemProperty -Path HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name UseWUServer -Value 0
Restart-Service -Name wuauserv -Force
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString(‘https://chocolatey.org/install.ps1’))
choco feature enable -n allowGlobalConfirmation
# Install terraform
choco install terraform
# Install Chrome
$LocalTempDir = $env:TEMP; $ChromeInstaller = "ChromeInstaller.exe"; (new-object    System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); & "$LocalTempDir\$ChromeInstaller" /silent /install; $Process2Monitor =  "ChromeInstaller"; Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } } Until (!$ProcessesFound)
# Install VSCode
choco install vscode
# Install Git
choco install git
</powershell>