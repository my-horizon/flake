{ ... }:
{
  flake.nixosModules.rofi =
    { pkgs, ... }:
    {
      home-manager.users.unknown = {
        programs.rofi = {
          enable = true;
          terminal = "ghostty";
          package = pkgs.rofi;
          theme = ./rofi-theme.rasi;

          extraConfig = {
            modi = "drun";
            show-icons = true;
            display-run = "Apps";
            drun-display-format = "{name}";
          };
        };
      };
    };
}
