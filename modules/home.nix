{ inputs, ... }:
{
  flake.nixosModules.home =
    { pkgs, config, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        users.${config.myConfig.user.name} = {
          home.stateVersion = "25.11";
          programs.home-manager.enable = true;
          imports = [ inputs.catppuccin.homeModules.catppuccin ];

          # cursor
          home.pointerCursor = {
            name = "Bibata-Modern-Classic";
            package = pkgs.bibata-cursors;
            size = 24;
            gtk.enable = true;
          };

          # catppuccin global
          catppuccin = {
            enable = true;
            flavor = "mocha";
            accent = "lavender";
          };

          # theme
          gtk = {
            enable = true;
            theme = {
              name = "Adwaita-dark";
              package = pkgs.gnome-themes-extra;
            };
          };
        };
      };
    };
}
