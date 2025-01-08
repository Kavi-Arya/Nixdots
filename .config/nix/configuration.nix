# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  hardware.bluetooth.enable = true; # enables support for Bluetooth
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  networking.hostName = "NixBox"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.


  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };


  programs.zsh.enable = true;
  programs.hyprland.enable = true;
  fonts.fontDir.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs.hyprland.withUWSM  = true;

  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    windowManager.awesome.enable = true; 
    wacom.enable = true;

    # Enable DWM with custom source path
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs (oldAttrs: {
        src = /home/kvl/.config/dwm;  # Custom source directory
      });
    };
  };

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kvl = {
    isNormalUser = true;
    description = "Kavi Arya";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    kitty
    zsh
    neovim
    fastfetch
    git
    gnumake
    xorg.xset
    xorg.xsetroot
    xorg.setxkbmap
    nitrogen
    eza
    firefox
    libgcc
    zoxide
    clang
    xorg.libX11.dev
    xorg.libXft
    xorg.libXinerama
    swww
    rofi
    pcmanfm
    waybar
    ripgrep
    nerdfonts
    keepassxc
    dwt1-shell-color-scripts
    sass
    rubyPackages_3_4.sass
    python3
    lxappearance
    rose-pine-gtk-theme
    rose-pine-icon-theme
    hyprcursor
    gparted
    nwg-look
    htop
    btop
    intel-undervolt
    gamescope
    hollywood
    spotify
    python312Packages.pip
    python312Packages.pycairo
    python312Packages.pygobject-stubs
    pavucontrol
    pulsemixer
    wlprop
    neovide
    lf
    glibcLocales
    hyprlandPlugins.hyprscroller
    hyprshot
    cmake
    meson
    xf86_input_wacom
    libwacom
    tmux
    lua
    luarocks
    luaformatter
    wl-clipboard
    xclip
    shellcheck
    texliveFull
    stdenv
    zathura
    kdePackages.okular
    themechanger
    ghostty
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
