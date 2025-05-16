{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  programs.hyprland.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Prague";

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # services.xserver.enable = true; # old qtile config (maybe will never be used again)
  # services.xserver = {
  #   enable = true;
  #   windowManager.qtile.enable = true;
  #  displayManager.setupCommands = ''
  #     CENTER='DVI-I-1'
  #     RIGHT='HDMI-A-0'
  #     ${pkgs.xorg.xrandr}/bin/xrandr --output $CENTER --rotate left --output $RIGHT --right-of $CENTER
  #   '';
  #   displayManager.sessionCommands = ''
  #     xwallpaper --zoom ~/walls/wallpaper1.jpg
  #     xset r rate 200 35 &
  #   '';
  # };
  
  programs.bash.promptInit = ''
    PS1='\[\e[31m\]\u@\h\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$ '
  '';

  services.picom = {
    enable = true;
    backend = "glx";
    fade = true;
  };

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  users.users.mts = {
    isNormalUser = true;
    home = "/home/mts";
    shell = pkgs.bash;
    extraGroups = [ "wheel" ];
  };

  programs.firefox.enable = true;
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    tree
    neovim
    alacritty
    brave
    python312Packages.adblock
    unzip
    btop
    networkmanager
    blueman
    dolphin
    git
    gnumake
    gcc
    brightnessctl
    neofetch
    zathura
    spotify
    obs-studio
    gimp
    vscode
    vlc
    imv
    usbutils
    udiskie
    udisks
    waybar
    eww
    dunst
    libnotify
    swww
    rofi-wayland
    hyprland
    font-awesome
    papirus-icon-theme
    power-profiles-daemon
    obsidian
  ];

  services.power-profiles-daemon.enable = true;
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    nerdfonts
    roboto-mono
    font-awesome
  ];

  # environment.variables = { # using for qtile on 4k monitor
  #   GDK_SCALE = "2";
  #   GDK_DPI_SCALE = "0.5";
  #   QT_SCALE_FACTOR = "2";
  # };

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  system.stateVersion = "24.11";

}

