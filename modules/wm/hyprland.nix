{ ... }:
{
  flake.nixosModules.hyprland =
    { pkgs, ... }:
    {
      programs.hyprland = {
        enable = true;
      };

      xdg.portal = {
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
      };

      environment.systemPackages = with pkgs; [
        hyprpaper
        hyprshot
      ];

      home-manager.users.unknown = {
        wayland.windowManager.hyprland = {
          enable = true;

          settings = {

            # monitor
            monitor = "HDMI-A-2, 3840x2160@120, 0x0, 1.5";

            # workspace
            workspace = [
              "1, persistent:true"
              "2, persistent:true"
              "3, persistent:true"
            ];

            # appearance
            general = {
              gaps_in = 5;
              gaps_out = 10;

              border_size = 3;

              "col.active_border" = "rgb(b4befe)";
              "col.inactive_border" = "rgb(11111b)";

              resize_on_border = false;

              allow_tearing = false;

              layout = "dwindle";
            };

            # decoration
            decoration = {
              rounding = 10;
              rounding_power = 3;

              active_opacity = 1.0;
              inactive_opacity = 0.9;
              fullscreen_opacity = 1.0;
            };

            # animations
            animations = {
              enabled = false;
            };

            # behavior
            dwindle = {
              preserve_split = true;
              force_split = 2;
            };

            # misc
            misc = {
              disable_hyprland_logo = true;
            };

            # programs
            "$terminal" = "ghostty";
            "$menu" = "rofi -show drun";
            "$mail_client" = "thunderbird";
            "$web_browser" = "firefox";
            "$screenshot" = "hyprshot";

            # main key
            "$mainMod" = "SUPER";

            # keybinds
            bind = [

              # launch & kill
              "$mainMod, Return, exec, $terminal"
              "$mainMod, Q, killactive,"
              "$mainMod, D, exec, $menu"
              "$mainMod, T, exec, $mail_client"
              "$mainMod, F, exec, $web_browser"
              "$mainMod, P, exec, $screenshot -m region"
              "$mainMod, Z, togglefloating,"
              "$mainMod, X, togglesplit,"
              "$mainMod SHIFT, E, exec, hyprlock"
              "$mainMod SHIFT, T, exit"

              # move focus (vim)
              "$mainMod, H, movefocus, l"
              "$mainMod, J, movefocus, d"
              "$mainMod, K, movefocus, u"
              "$mainMod, L, movefocus, r"

              # go to workspace
              "$mainMod, 1, workspace, 1"
              "$mainMod, 2, workspace, 2"
              "$mainMod, 3, workspace, 3"
              "$mainMod, 4, workspace, 4"
              "$mainMod, 5, workspace, 5"
              "$mainMod, 6, workspace, 6"
              "$mainMod, 7, workspace, 7"
              "$mainMod, 8, workspace, 8"
              "$mainMod, 9, workspace, 9"
              "$mainMod, 0, workspace, 10"

              # move focused window (vim)
              "$mainMod SHIFT, H, movewindow, l"
              "$mainMod SHIFT, J, movewindow, d"
              "$mainMod SHIFT, K, movewindow, u"
              "$mainMod SHIFT, L, movewindow, r"

              # move focused window to workspace
              "$mainMod SHIFT, 1, movetoworkspace, 1"
              "$mainMod SHIFT, 2, movetoworkspace, 2"
              "$mainMod SHIFT, 3, movetoworkspace, 3"
              "$mainMod SHIFT, 4, movetoworkspace, 4"
              "$mainMod SHIFT, 5, movetoworkspace, 5"
              "$mainMod SHIFT, 6, movetoworkspace, 6"
              "$mainMod SHIFT, 7, movetoworkspace, 7"
              "$mainMod SHIFT, 8, movetoworkspace, 8"
              "$mainMod SHIFT, 9, movetoworkspace, 9"
              "$mainMod SHIFT, 0, movetoworkspace, 10"
            ];

            # mousebind
            bindm = [

              # move window with mouse (left)
              "$mainMod, mouse:272, movewindow"

              # resize window with mouse (right)
              "$mainMod, mouse:273, resizewindow"
            ];

            # auto-execute
            exec-once = [
              "waybar"
              "hyprpaper"
            ];

            # windowrule
            windowrule = [
              "suppressevent maximize, class:.*"
              "nofocus, class:^$, title:^$, xwayland:1, floating:1, fullscreen:0, pinned:0"
            ];
          };
        };

        xdg.configFile."hypr/hyprpaper.conf".text = ''
          preload = /home/unknown/wallpaper/dark-background-abstract.png
          wallpaper = HDMI-A-2, /home/unknown/wallpaper/dark-background-abstract.png
        '';
      };
    };
}
