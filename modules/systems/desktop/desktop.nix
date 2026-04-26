{ ... }:
{
  flake.nixosModules.desktop =
    { pkgs, config, ... }:
    {

      nix.settings = {

        experimental-features = [
          "nix-command"
          "flakes"
        ];
      };

      # bootloader
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # use latest kernel
      boot.kernelPackages = pkgs.linuxPackages_latest;

      # for makemkv
      boot.kernelModules = [ "sg" ];

      # active shell
      programs.zsh.enable = true;

      # define hostname
      networking.hostName = "desktop";

      # enable networking
      networking.networkmanager.enable = true;

      # set your time zone
      time.timeZone = "Europe/Berlin";

      # select internationalisation properties
      i18n.defaultLocale = "de_DE.UTF-8";

      i18n.extraLocaleSettings = {
        LC_ADDRESS = "de_DE.UTF-8";
        LC_IDENTIFICATION = "de_DE.UTF-8";
        LC_MEASUREMENT = "de_DE.UTF-8";
        LC_MONETARY = "de_DE.UTF-8";
        LC_NAME = "de_DE.UTF-8";
        LC_NUMERIC = "de_DE.UTF-8";
        LC_PAPER = "de_DE.UTF-8";
        LC_TELEPHONE = "de_DE.UTF-8";
        LC_TIME = "de_DE.UTF-8";
      };

      # define a user account / don't forget to set a password with ‘passwd’
      users.users.${config.myConfig.user.name} = {
        isNormalUser = true;
        description = config.myConfig.user.name;
        shell = pkgs.zsh;

        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };

      system.stateVersion = "25.11";
    };
}
