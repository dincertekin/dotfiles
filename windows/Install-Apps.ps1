# WSL Installation
# Note: System restart might be required after this command
wsl --install

# Browser and Daily
winget install --id=Brave.Brave -e
winget install --id=VideoLAN.VLC -e
winget install --id=Spotify.Spotify -e --source msstore
winget install --id=qBittorrent.qBittorrent -e

# System Tools
winget install --id=M2Team.NanaZip -e
winget install --id=voidtools.Everything -e
winget install --id=Microsoft.PowerToys -e
winget install --id=WinSCP.WinSCP -e

# Development and Writing
winget install --id=ZedIndustries.Zed -e
winget install --id=Microsoft.VisualStudioCode -e --override "/SILENT /mergetasks=!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath"
winget install --id=Obsidian.Obsidian -e

# Heavy Development Suites
winget install --id=Google.AndroidStudio -e
winget install --id=Microsoft.VisualStudio.2022.Community -e
winget install --id=OBSProject.OBSStudio -e

# Final Maintenance
winget upgrade --all
