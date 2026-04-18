{ ... }:
{
  flake.nixosModules.rofi =
    { pkgs, config, ... }:
    {
      home-manager.users.${config.myConfig.user.name} = {
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

        catppuccin.rofi = {
          enable = false;
        };
      };
    };
}
