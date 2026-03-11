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
            window-padding-x = 10;
            window-padding-y = 10;
          };
        };
      };
  };
}
