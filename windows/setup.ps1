# Daily
winget install --id=Brave.Brave -e                      # Brave
winget install --id=VideoLAN.VLC -e                     # VLC
winget install --id=9NCBCSZSJRSB -e --source msstore    # Spotify
winget install --id=qBittorrent.qBittorrent -e          # qBittorrent
winget install --id=OBSProject.OBSStudio -e             # OBS Studio

# System Tools
winget install --id=9N8G7TSCL18R -e --source msstore    # NanaZip
winget install --id=voidtools.Everything -e             # Everything
winget install --id=XP89DCGQ3K6VLD -e --source msstore  # PowerToys
winget install --id=WinSCP.WinSCP -e                    # WinSCP

# Development
winget install --id=ZedIndustries.Zed -e               # Zed
winget install --id=Git.Git -e                          # Git
winget install --id=OpenJS.NodeJS.LTS -e                # Node.js LTS
winget install --id=Microsoft.OpenJDK.17 -e             # JDK 17
winget install --id=9NQ7512CXL7T -e --source msstore    # Python

# Auto Update (daily at 12:00)
schtasks /create /tn "Winget Auto Update" /tr "`"$env:LOCALAPPDATA\Microsoft\WindowsApps\winget.exe`" upgrade --all --silent --accept-package-agreements --accept-source-agreements" /sc daily /st 12:00 /rl highest /f
