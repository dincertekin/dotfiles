# dotfiles

My Windows setup, NixOS configuration and editor settings, kept in Git so a
new machine feels like home in minutes. New to dotfiles? See the
[Arch Wiki](https://wiki.archlinux.org/title/Dotfiles).

## What's inside

| Folder | What it is |
|---|---|
| [`windows/setup.ps1`](windows/setup.ps1) | Installs my apps with winget (browser, media, dev tools, PowerToys, Everything…) and schedules a daily `winget upgrade --all` |
| [`windows/tweaks.ps1`](windows/tweaks.ps1) | Privacy and quality-of-life tweaks: telemetry, advertising ID and activity history off, AutoPlay off, firewall on, Quad9 DNS, debloat, file extensions shown |
| [`nix/configuration.nix`](nix/configuration.nix) | NixOS with GNOME, systemd-boot and my GNOME extensions |
| [`zed/settings.json`](zed/settings.json) | Zed editor settings |
| [`.vscode/settings.json`](.vscode/settings.json) | VS Code settings |

## Windows

Read the scripts first: they install software and change system settings.

```powershell
git clone https://github.com/dincertekin/dotfiles.git
cd dotfiles\windows
.\setup.ps1      # install apps
.\tweaks.ps1     # in a terminal opened as Administrator, then sign out or reboot
```

If PowerShell refuses to run the scripts, allow local scripts for your user
first:

```powershell
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

## NixOS

Copy the configuration over your own, keeping your
`hardware-configuration.nix`, then rebuild. Change `networking.hostName` and
`time.timeZone` to yours.

```bash
sudo cp nix/configuration.nix /etc/nixos/configuration.nix
sudo nixos-rebuild switch
```

## Editors

Copy the settings file to your editor's config folder:

| Editor | Windows | Linux |
|---|---|---|
| Zed | `%APPDATA%\Zed\settings.json` | `~/.config/zed/settings.json` |
| VS Code | `%APPDATA%\Code\User\settings.json` | `~/.config/Code/User/settings.json` |

## License

[MIT](LICENSE): take whatever is useful.
