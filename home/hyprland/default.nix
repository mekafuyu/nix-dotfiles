{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    # package = null;
    # portalPackage = null;
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$menu" = "wofi --show drun";
      "$fileManager" = "";
      exec-once =
        [
          "waybar"
        ]; 
      bind =
        [
          "$mod, Q, exec, $terminal"
          "$mod, C, killactive"
          "$mod, SPACE, exec, $menu"
          "$mod, M, exit,"
          "$mod, E, exec, $fileManager"
          "$mod, V, togglefloating,"
          "$mod, R, exec, $menu"
          "$mod, P, pseudo, # dwindle"
          "$mod, J, togglesplit, # dwindle"
          "$mod, left, movefocus, l"
          "$mod, right, movefocus, r"
          "$mod, up, movefocus, u"
          "$mod, down, movefocus, d"
        ]
        ++ (
          ## Workspaces
          builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9)
        );
      bindm =
        [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      bindel = 
        [
          ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
          ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
        ];
      input =
        {
          "kb_layout" = "br";
          "kb_variant" = "thinkpad"; 
        };
      windowrulev2 = 
        [
          "suppressevent maximize, class:.*"
          "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
        ];
      general = {
        gaps_out = 10;
        border_size = 2;
        "col.active_border" = "0xff000000 0xffff0000 0xff000000 45deg";
        "col.inactive_border" = "0xff000000 0xff404040 0xff000000 45deg";
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 4;
          passes = 2;
        };
      };
    };
  };
}
