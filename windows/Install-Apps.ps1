# Daily Browse
winget install --id=Brave.Brave -e
winget install --id=VideoLAN.VLC -e
winget install --id 9NCBCSZSJRSB -e --source msstore # Spotify
winget install --id=qBittorrent.qBittorrent -e
winget install --id=OBSProject.OBSStudio -e

# System Tools
winget install --id=9N8G7TSCL18R -e --source msstore # NanaZip
winget install --id=voidtools.Everything -e
winget install --id=XP89DCGQ3K6VLD -e --source msstore # PowerToys
winget install --id=WinSCP.WinSCP -e

# Development
winget install --id=ZedIndustries.Zed -e
winget install --id=Microsoft.VisualStudioCode -e --override "/SILENT /mergetasks=!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath"

# IDE
winget install --id=Google.AndroidStudio -e
winget install --id=Microsoft.VisualStudio.2022.Community -e

# Final Maintenance
winget upgrade --all

# WSL Installation
wsl --install
