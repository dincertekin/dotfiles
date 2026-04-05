# dotfiles

![Platform](https://img.shields.io/badge/platform-Windows%2010%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)

My personal configuration files for the apps and tools I use daily, tracked with Git to stay consistent across machines. Learn more about dotfiles on the [Arch Wiki](https://wiki.archlinux.org/title/Dotfiles).

## Contents

| Category | Config |
|---|---|
| OS | [Windows Settings](windows/) |
| Editor | [VS Code](.vscode/) |
| Editor | [Zed](zed/) |

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/dincertekin/dotfiles.git
   cd dotfiles/
   ```

2. Run the auto-installer:
   ```powershell
   ./install.ps1
   ```

   Or manually copy the config files from each folder to their target locations.

## Troubleshooting

If the install script fails, make sure PowerShell allows script execution:
```powershell
Set-ExecutionPolicy RemoteSigned
```

## License

MIT License — see [LICENSE](./LICENSE) for details.
