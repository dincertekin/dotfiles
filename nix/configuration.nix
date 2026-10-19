{ config, pkgs, lib, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    dash-to-dock
    blur-my-shell
    appindicator
    just-perfection
    logo-menu
  ];
in
{
  imports = [ ./hardware-configuration.nix ];

  # Boot
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # System
  networking.hostName = "hacklab";
  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Vilnius";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;

  # Desktop
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    geary
    gnome-music
    totem
    yelp
  ];

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # User
  users.users.dincertekin = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "wireshark" "libvirtd" ];
  };

  # Development
  virtualisation.docker = {
    enable = true;
    # Published ports bypass the firewall, so bind them to localhost by default
    daemon.settings.ip = "127.0.0.1";
  };

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.nix-ld.enable = true;
  programs.direnv.enable = true;

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };

  # Security
  networking.firewall.enable = true;

  networking.networkmanager = {
    wifi.macAddress = "stable-ssid";
    ethernet.macAddress = "stable";
    connectionConfig = {
      "ipv4.dhcp-send-hostname" = false;
      "ipv6.dhcp-send-hostname" = false;
      "ipv6.ip6-privacy" = 2;
    };
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNS = [ "9.9.9.9#dns.quad9.net" "149.112.112.112#dns.quad9.net" ];
      FallbackDNS = [ "9.9.9.9#dns.quad9.net" "149.112.112.112#dns.quad9.net" ];
      Domains = [ "~." ];
      DNSOverTLS = "true";
      LLMNR = "false";
    };
  };

  security.protectKernelImage = true;
  boot.kernel.sysctl = {
    "kernel.kptr_restrict" = 2;
    "kernel.dmesg_restrict" = 1;
    "kernel.yama.ptrace_scope" = 1;
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.all.accept_source_route" = 0;
    "net.ipv6.conf.all.accept_source_route" = 0;
  };

  security.sudo.execWheelOnly = true;

  hardware.enableRedistributableFirmware = true;
  services.fwupd.enable = true;

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    allowReboot = false;
  };

  environment.etc."brave/policies/managed/privacy.json".text = builtins.toJSON {
    BraveP3AEnabled = false;
    BraveStatsPingEnabled = false;
    BraveWebDiscoveryEnabled = false;
    MetricsReportingEnabled = false;
    BraveRewardsDisabled = true;
    BraveWalletDisabled = true;
    BraveVPNDisabled = true;
    BraveNewsDisabled = true;
    BraveTalkDisabled = true;
    BraveAIChatEnabled = false;
  };

  # Packages
  environment.systemPackages = with pkgs; [
    brave
    zed-editor
    gnome-tweaks

    # Core
    git
    gh
    lazygit
    neovim
    tmux
    curl
    wget
    unzip
    zip

    # CLI
    ripgrep
    fd
    fzf
    jq
    bat
    eza
    btop

    # Languages
    gcc
    gnumake
    cmake
    python3
    nodejs
    go
    rustup
    docker-compose

    # Network
    nmap
    tcpdump
    netcat-gnu
    aircrack-ng

    # Web
    burpsuite
    zap
    sqlmap
    ffuf
    gobuster
    nikto

    # Passwords
    john
    hashcat
    thc-hydra

    # Exploitation and reversing
    metasploit
    ghidra
    binwalk
    exiftool
  ] ++ extensions;

  # GNOME settings
  programs.dconf.enable = true;
  programs.dconf.profiles.user.databases = [
    {
      settings = {
        "org/gnome/desktop/wm/preferences" = {
          button-layout = "close,minimize,maximize:";
        };

        "org/gnome/desktop/interface" = {
          clock-format = "12h";
          enable-hot-corners = false;
        };

        "org/gnome/desktop/peripherals/touchpad" = {
          tap-to-click = true;
          natural-scroll = true;
          two-finger-scrolling-enabled = true;
        };

        "org/gnome/system/location" = {
          enabled = false;
        };

        "org/gnome/desktop/privacy" = {
          remember-recent-files = false;
          remove-old-trash-files = true;
          remove-old-temp-files = true;
          old-files-age = lib.gvariant.mkUint32 7;
          report-technical-problems = false;
          send-software-usage-stats = false;
        };

        "org/gnome/desktop/session" = {
          idle-delay = lib.gvariant.mkUint32 300;
        };

        "org/gnome/desktop/screensaver" = {
          lock-enabled = true;
          lock-delay = lib.gvariant.mkUint32 0;
        };

        "org/gnome/desktop/notifications" = {
          show-in-lock-screen = false;
        };

        "org/gnome/mutter" = {
          center-new-windows = true;
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = map (e: e.extensionUuid) extensions;
          favorite-apps = [
            "org.gnome.Nautilus.desktop"
            "brave-browser.desktop"
            "dev.zed.Zed.desktop"
            "org.gnome.Console.desktop"
            "org.gnome.Settings.desktop"
          ];
        };

        "org/gnome/shell/extensions/dash-to-dock" = {
          dock-position = "BOTTOM";
          extend-height = false;
          dock-fixed = false;
          autohide = true;
          intellihide = true;
          dash-max-icon-size = lib.gvariant.mkInt32 48;
          show-trash = true;
          show-mounts = false;
          click-action = "minimize";
          transparency-mode = "DYNAMIC";
        };
      };
    }
  ];

  # Nix
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  # !!! Don't forget to change this if you use newer version!
  system.stateVersion = "26.05";
}
