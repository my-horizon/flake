{ inputs, self, ... }:
{
  flake.nixosModules.desktop =
    { pkgs, ... }:
    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];

      # Bootloader
      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      # Use latest kernel
      boot.kernelPackages = pkgs.linuxPackages_latest;

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
      users.users.unknown = {
        isNormalUser = true;
        description = "unknown";
        shell = pkgs.zsh;
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
      };
      system.stateVersion = "25.11";
    };

  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      ../hardware-configuration.nix
      self.nixosModules.desktop
      self.nixosModules.services
      self.nixosModules.home
      self.nixosModules.hyprland
      self.nixosModules.hyprlock
      self.nixosModules.waybar
      self.nixosModules.rofi
      self.nixosModules.zsh
      self.nixosModules.ghostty
      self.nixosModules.nvf
      self.nixosModules.firefox
      self.nixosModules.thunderbird
      self.nixosModules.programs
    ];
  };
}
