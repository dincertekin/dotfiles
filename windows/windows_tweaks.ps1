# Windows 11 Privacy Settings Script
# For fresh installations
# Made by https://github.com/dincertekin

# Set Notifications
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name "ShowWindowsWelcomeExperience" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Notifications\Settings" -Name "ShowGetTips" -Value 0

# AutoPlay
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers\Settings" -Name "DisableAutoplay" -Value 1

# Network & Internet Settings
# IPv4 and IPv6 DNS settings for Ethernet
$dnsServers = "9.9.9.9","149.112.112.112" # Quad9 DNS
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $dnsServers

# Random hardware addresses for Wi-Fi
Set-NetConnectionProfile -InterfaceAlias "Wi-Fi" -NetworkCategory Private

# DNS settings for Wi-Fi
Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ServerAddresses $dnsServers

# Apps Settings
# Uninstall apps using PowerShell
Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage
Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage
Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage
Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage
Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage
Get-AppxPackage *Microsoft.People* | Remove-AppxPackage
Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage
Get-AppxPackage *Microsoft.News* | Remove-AppxPackage
Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage
Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage
Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage
Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage

# Find My Device
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\FindMyDevice" -Name "AllowFindMyDevice" -Value 0

# Diagnostics & feedback settings
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0

# Activity History
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy\ActivityHistory" -Name "ActivityHistoryEnabled" -Value 0

# Disable OneDrive Notifications in File Explorer
$explorerOptionsPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $explorerOptionsPath -Name "SyncProviderNotifications" -Value 0

# Disable Telemetry Service
Stop-Service -Name "DiagTrack" -Force
Set-Service -Name "DiagTrack" -StartupType Disabled

# Block & Uninstall Quick Assist
Add-Content -Path "C:\Windows\System32\drivers\etc\hosts" -Value "0.0.0.0 remoteassistance.support.services.microsoft.com"
Remove-AppxPackage -Package "MicrosoftCorporationII.QuickAssist"

# Disable Trending Searches & Web Search
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0 -PropertyType DWORD -Force

# Disable Copilot
New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows" -Name "WindowsCopilot" -Force
New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffWindowsCopilot" -Value 1 -PropertyType DWORD -Force
