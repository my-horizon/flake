{ inputs, ... }:
{
  flake.nixosModules.home =
    { pkgs, ... }:
    {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;

        users.unknown = {
          home.stateVersion = "25.11";
          programs.home-manager.enable = true;

          # cursor
          home.pointerCursor = {
            name = "Bibata-Modern-Classic";
            package = pkgs.bibata-cursors;
            size = 24;
            gtk.enable = true;
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
