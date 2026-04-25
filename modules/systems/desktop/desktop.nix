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

      # Bootloader
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # Use latest kernel
      boot.kernelPackages = pkgs.linuxPackages_latest;

      # for makemkv
      boot.kernelModules = [ "sg" ];

      # active shell
      programs.zsh.enable = true;

      # Define hostname
      networking.hostName = "desktop";

      # Enable networking
      networking.networkmanager.enable = true;

      # Set your time zone
      time.timeZone = "Europe/Berlin";

      # Select internationalisation properties
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

      # Define a user account. Don't forget to set a password with ‘passwd’
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
