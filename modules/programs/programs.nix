{ ... }:
{
  flake.nixosModules.programs =
    { pkgs, ... }:
    {
      # Install the following packages
      environment.systemPackages = with pkgs; [
        networkmanagerapplet
        pwvucontrol
        git
        zip
        unzip
        cifs-utils
        evince
        pdfarranger
        libreoffice-still
        hyphenDicts.de_DE
        grim
        slurp
        wl-clipboard
        vlc
        nerd-fonts.jetbrains-mono
        xwayland
      ];
    };
}
