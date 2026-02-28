# dotfiles
My configuration files for every setup I own.

## Description
Dotfiles are user-specific configuration files whose names traditionally start with a dot. This repository contains my personal configuration files for the apps and systems I use daily, tracked with Git to keep everything consistent across different machines. You can use the provided scripts for automatic installation or copy the files manually.

## Getting Started

### Dependencies
* Windows 10 or later
* Applications you want to configure (VS Code, Zed, etc.)

### Installing
* Clone the repository:
```bash
git clone https://github.com/dincertekin/dotfiles.git
cd dotfiles/
```

* Run the auto-installer for your platform:
```powershell
./install.ps1
```

* Or manually copy the config files from the relevant folders to their target locations.

### Executing program
* For automatic installation, simply run the script and follow any prompts.
* For manual installation, refer to each application's folder for the config files.

## Help
If the install script fails, make sure you have the necessary permissions to run `.ps1` files on Windows.

```powershell
Set-ExecutionPolicy RemoteSigned
```

## Contents

### Operating Systems
* [Windows Settings](windows/)

### Applications
* [Visual Studio Code](.vscode/)
* [Zed](zed/)

## License
This project is licensed under the [MIT](LICENSE) License - see the LICENSE.md file for details
