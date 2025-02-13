{ config, pkgs, ... }:

{
  imports =
  [
    ./starship.nix
  ]; 

  home.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "Iosevka"
        "FiraCode"
      ];
    })
  ];

  programs.kitty = {
    enable = true;
    settings = {
      font_family = "Iosevka Nerd Font Mono";
      bold_font = "Iosevka Nerd Font Mono Bold";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 14;
      background_opacity = 0.8;
      background_blur = 1;
    };
  };
  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # # custom settings
    # settings = {
    #   add_newline = false;
    #   aws.disabled = true;
    #   gcloud.disabled = true;
    #   line_break.disabled = true;
    # };
  };

  programs.fish = {
    interactiveShellInit = "starship init fish | source";
  };
}