{ inputs, self, ... }:
{

  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    modules = [
      ../../../hardware/desktop/desktop-hardware.nix
      self.nixosModules.user
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
      self.nixosModules.yazi
      self.nixosModules.firefox
      self.nixosModules.thunderbird
      self.nixosModules.programs
    ];
  };
}
