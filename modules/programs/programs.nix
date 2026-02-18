{ ... }:
{
  flake.nixosModules.programs =
    { pkgs, ... }:
    {
      # Install the following packages
      environment.systemPackages = with pkgs; [
        networkmanagerapplet
        pwvucontrol
        yazi
        git
        unzip
        zip
        cifs-utils
        evince
        kdePackages.okular
        libreoffice-still
        hyphenDicts.de_DE
        grim
        slurp
        wl-clipboard
        nerd-fonts.jetbrains-mono
        xwayland
      ];
    };
}
