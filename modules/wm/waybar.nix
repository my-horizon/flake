{ ... }:
{
  flake.nixosModules.waybar =
    { pkgs, ... }:
    {
      home-manager.users.unknown = {
        programs.waybar = {
          enable = true;
          settings = {

            mainBar = {

              # location
              layer = "top";
              spacing = 0;
              margin-top = 10;
              margin-bottom = 0;
              position = "top";
              margin-left = 300;
              margin-right = 300;

              # modules
              modules-left = [ "hyprland/workspaces" ];
              modules-center = [ "clock" ];
              modules-right = [
                "cpu"
                "memory"
                "network"
                "pulseaudio"
              ];

              "hyprland/workspaces" = {
                format = "{id}: {icon}";
                format-icons = {
                  active = " ";
                  default = " ";
                  empty = " ";
                };
                disable-scroll = true;
                all-outputs = false;
                tooltip = false;
              };

              clock = {
                format = "{:%d.%m | %H:%M}";
                tooltip = false;
              };

              cpu = {
                format = "  {usage}%";
                interval = 1;
                tooltip = false;
              };

              memory = {
                format = "  {used:0.1f}G";
                interval = 1;
                tooltip = false;
              };

              network = {
                format-wifi = "󰤨  {percent}%";
                format-ethernet = "󰈀  up";
                format-disconnected = "󰤭  down";
                interval = 5;
                on-click = "nm-connection-editor";
                tooltip = false;
              };

              pulseaudio = {
                scroll-step = 5;
                format = "  {volume}%";
                format-muted = "󰝟  {muted}";
                on-click = "pwvucontrol";
                tooltip = false;
              };
            };
          };

          # appearance
          style = ''
            * {
            font-family: "JetbrainsMono Nerd Font", monospace;
            font-size: 15px;
            min-height: 0;
            }

            window#waybar {
            background: transparent;
            border: none;
            }

            #workspaces {
            background-color: #1e1e2e;
            border-radius: 10px;
            padding: 2px 8px;
            margin: 0 3px;
            }

            #workspaces button {
            color: #cdd6f4;
            background-color: transparent;
            border-radius: 10px;
            padding: 2px 8px;
            margin: 0 3px;
            }

            #workspaces button.active {
            color: #cdd6f4;
            }

            #workspaces button.urgent {
            color: #f38ba8;
            }

            #workspaces button:hover {
            box-shadow: none;
            background-image: none;
            }

            #clock {
            color: #cdd6f4;
            background-color: #1e1e2e;
            border-radius: 10px;
            padding: 2px 8px;
            margin: 0 3px;
            }

            .modules-right {
            background-color: #1e1e2e;
            border-radius: 10px;
            padding: 2px 8px;
            }

            #cpu,
            #memory,
            #network,
            #pulseaudio {
            color: #cdd6f4;
            background-color: transparent;
            margin: 0 3px;
            }
          '';
        };
      };
    };
}
