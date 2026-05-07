# Disable Telemetry
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0

# Disable Advertising ID
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value 0

# Disable Activity History
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Value 0

# Disable AutoPlay for USB (against BadUSB)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Value 1

# Enable Firewall for all profiles
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Quad9 DNS for Security
$dnsServers = "9.9.9.9","149.112.112.112"
Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Set-DnsClientServerAddress -ServerAddresses $dnsServers -ErrorAction SilentlyContinue

# Debloat
$appsToRemove = @(
    "Microsoft.549981C3F5F10",  # Cortana
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo",
    "Microsoft.People",
    "Microsoft.PhoneLink",
    "Microsoft.YourPhone",
    "Microsoft.News",
    "Microsoft.BingWeather",
    "Microsoft.BingSearch",
    "Microsoft.WindowsMaps",
    "Microsoft.GetHelp",
    "Microsoft.GetStarted",
    "Microsoft.SkypeApp",
    "Microsoft.Office.OneNote"
)

foreach ($app in $appsToRemove) {
    Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue
}

# Show file extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0

# Hide Taskbar Meet Now/Chat icons
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Value 0

# Disable Sticky Keys prompt
Set-ItemProperty -Path "HKCU:\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Value "506"
