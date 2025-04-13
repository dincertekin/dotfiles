# Windows 11 (My) Privacy Settings Script
# For fresh installations
# Made by https://github.com/dincertekin

# Disable AutoPlay for USB
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Value 1

# Network & Internet
$dnsServers = "9.9.9.9","149.112.112.112" # Quad9 DNS
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $dnsServers
# Same DNS Servers for Wi-Fi
Set-DnsClientServerAddress -InterfaceAlias "Wi-Fi" -ServerAddresses $dnsServers
# Sshh! Private Mode
Set-NetConnectionProfile -InterfaceAlias "Wi-Fi" -NetworkCategory Private

# Debloating Windows
Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage # Cortana
Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage
Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage
Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage
Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage
Get-AppxPackage *Microsoft.People* | Remove-AppxPackage
Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage
Get-AppxPackage *Microsoft.News* | Remove-AppxPackage
Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage
Get-AppxPackage *Microsoft.BingSearch* | Remove-AppxPackage
Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage
Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage
Get-AppxPackage *Microsoft.GetStarted* | Remove-AppxPackage

# Diagnostics & Feedback
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0

# Must Have Alias for Python 3
Set-Alias -Name python3 -Value python
