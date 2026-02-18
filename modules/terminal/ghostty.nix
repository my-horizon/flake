{ ... }:
{
  flake.nixosModules.ghostty = {
    home-manager.users.unknown =
      { pkgs, ... }:
      {
        programs.ghostty = {
          enable = true;
          settings = {

            # terminal
            term = "xterm";

            # font
            font-family = "JetBrainsMono Nerd Font";
            font-size = 12;

            # cursor
            cursor-style = "block";

            # window
            background-opacity = 1.0;
            window-padding-x = 10;
            window-padding-y = 10;

            # theme
            theme = "Catppuccin Mocha";
          };
        };
      };
  };
}
