{ config, pkgs, ... }:

{
  imports =
    [
      ./hyprland
      ./terminal.nix
    ]; 

  home.username = "maycon";
  home.homeDirectory = "/home/maycon";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fish
    firefox
    pavucontrol
    wofi
    hyprcursor
    nwg-look
    bibata-cursors
    yazi
    swww
    papirus-icon-theme
    prismlauncher
    discord
    ncspot
    killall
    wl-clipboard
    # cliphist	# clipse	# show 
    hyprshot	# printscreen
    fastfetch
    starship
    brightnessctl	# # control brightness
    inotify-tools	# detect changes on some files
    dmidecode	# show hw info
    lshw	# show hw info
    lm_sensors	# show temperatures
    pipes
    cbonsai
    brave
    vscode
    nodejs
    mako 	# notif daemon
    # orchis-theme
    gnome-themes-extra
    gh
    
  ];

  fonts.fontconfig.enable = true;

  programs.waybar = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "mekafuyu";
    userEmail = "mayconbrunob@hotmail.com";
  };

  

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 16;
  };

  gtk = {
    enable = false;
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    theme = {
      package = pkgs.orchis-theme;
      name = "Orchis";
    };
    cursorTheme.name = "Bibata-Modern-Ice";
  };

  qt = {
    enable = false;
    style.name = "Orchis";
  };
  
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
