# Disabling Telemetry (Deep)
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0
# Disable AutoPlay for USB (Security measure against BadUSB)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" -Name "DisableAutoplay" -Value 1

# Quad9 DNS for Security
# We use -ErrorAction SilentlyContinue because some devices might not have both Ethernet and Wi-Fi active
$dnsServers = "9.9.9.9","149.112.112.112"
Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Set-DnsClientServerAddress -ServerAddresses $dnsServers -ErrorAction SilentlyContinue

# Aggressive Debloating (Keeping the System Lean)
$appsToRemove = @(
    "Microsoft.549981C3F5F10",  # Cortana
    "Microsoft.ZuneMusic",      # Groove Music
    "Microsoft.ZuneVideo",      # Movies & TV
    "Microsoft.People",
    "Microsoft.YourPhone",      # Phone Link
    "Microsoft.News",
    "Microsoft.BingWeather",
    "Microsoft.BingSearch",     # Bing search in Start Menu
    "Microsoft.WindowsMaps",
    "Microsoft.GetHelp",
    "Microsoft.GetStarted",
    "Microsoft.SkypeApp",
    "Microsoft.Office.OneNote"
)

foreach ($app in $appsToRemove) {
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
}

# Persistent alias for Python (Works for the current session)
Set-Alias -Name python3 -Value python

# Show file extensions (Vital for security & dev)
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0
# Hide Taskbar Meet Now/Chat icons
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Value 0
