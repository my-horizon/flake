{ ... }:
{
  flake.nixosModules.services =
    { pkgs, ... }:
    {
      services.displayManager.ly = {
        enable = true;
      };

      services.desktopManager.gnome = {
        enable = true;
      };

      services.gnome = {
        core-apps.enable = false;
        core-developer-tools.enable = false;
        games.enable = false;
      };

      fileSystems."/mnt/data" = {
        device = "//192.168.30.50/data";
        fsType = "cifs";
        options = [
          "credentials=/home/unknown/.cifs-credentials"
          "uid=1000"
          "gid=100"
          "vers=3.0"
        ];
        neededForBoot = false;
      };

      fonts = {
        fontconfig.enable = true;
        packages = with pkgs; [
          nerd-fonts.jetbrains-mono
        ];
      };
    };
}
