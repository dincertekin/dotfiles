# Run as Administrator, then sign out or reboot

function Set-Reg($path, $name, $value, $type = "DWord") {
    if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
    Set-ItemProperty -Path $path -Name $name -Value $value -Type $type
}

# Disable Telemetry (fully off only on Enterprise/Education, "required only" on Home/Pro)
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0

# Disable Advertising ID
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0

# Disable Activity History
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "EnableActivityFeed" 0
Set-Reg "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "PublishUserActivities" 0

# Disable AutoPlay (stops drives from launching things on their own)
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoplayHandlers" "DisableAutoplay" 1

# Enable Firewall for all profiles
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True

# Quad9 DNS (IPv4 + IPv6) on connected adapters
$dnsServers = "9.9.9.9","149.112.112.112","2620:fe::fe","2620:fe::9"
Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Set-DnsClientServerAddress -ServerAddresses $dnsServers -ErrorAction SilentlyContinue

# Debloat
$appsToRemove = @(
    "Microsoft.ZuneVideo",                     # Movies & TV
    "Microsoft.YourPhone",                     # Phone Link
    "Microsoft.BingNews",                      # News
    "Microsoft.BingWeather",                   # Weather
    "Microsoft.BingSearch",                    # Bing Search
    "Microsoft.WindowsMaps",                   # Maps
    "Microsoft.GetHelp",                       # Get Help
    "Microsoft.Getstarted",                    # Tips
    "Microsoft.Office.OneNote",                # OneNote
    "Microsoft.MicrosoftOfficeHub",            # Microsoft 365 app
    "Microsoft.MicrosoftSolitaireCollection",  # Solitaire
    "Clipchamp.Clipchamp"                      # Clipchamp
)

foreach ($app in $appsToRemove) {
    Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue
}

# Show file extensions
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

# Hide Taskbar Chat icon
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarMn" 0

# Disable Sticky Keys prompt
Set-Reg "HKCU:\Control Panel\Accessibility\StickyKeys" "Flags" "506" "String"
