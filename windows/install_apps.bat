@echo off
set LOGFILE=%USERPROFILE%\Desktop\winget_install.log

echo Starting installation... > %LOGFILE%
echo. >> %LOGFILE%

winget install --id=Microsoft.PowerToys -e >> %LOGFILE% 2>&1
winget install --id=Mozilla.Firefox -e >> %LOGFILE% 2>&1
winget install --id=voidtools.Everything -e >> %LOGFILE% 2>&1
winget install --id=EpicGames.EpicGamesLauncher -e >> %LOGFILE% 2>&1
winget install --id=qBittorrent.qBittorrent -e >> %LOGFILE% 2>&1
winget install --id=Spotify.Spotify -e >> %LOGFILE% 2>&1
winget install --id=Microsoft.VisualStudioCode -e --override "/SILENT /mergetasks=!runcode,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath" >> %LOGFILE% 2>&1
winget install --id=VideoLAN.VLC -e --override "/S" >> %LOGFILE% 2>&1
winget install --id=M2Team.NanaZip -e >> %LOGFILE% 2>&1
winget install --id=Valve.Steam -e >> %LOGFILE% 2>&1
winget install --id=OBSProject.OBSStudio -e >> %LOGFILE% 2>&1
winget install --id=Git.Git -e --override "/VERYSILENT /NORESTART" >> %LOGFILE% 2>&1
winget install --id=Obsidian.Obsidian -e >> %LOGFILE% 2>&1
winget install --id=Google.AndroidStudio -e >> %LOGFILE% 2>&1
winget install --id=Microsoft.VisualStudio.2022.Community -e >> %LOGFILE% 2>&1
winget install --id=Docker.DockerDesktop -e --override "/quiet" >> %LOGFILE% 2>&1

echo. >> %LOGFILE%
echo Installation completed! Check for errors in the log file: %LOGFILE% >> %LOGFILE%

echo Installation completed! Check the log at: %LOGFILE%
pause
