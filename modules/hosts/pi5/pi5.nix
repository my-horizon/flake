{ inputs, self, ... }:
{
  flake.nixosConfigurations.pi5 = inputs.nixos-raspberrypi.lib.nixosSystem {
    system = "aarch64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      ../../../hardware/pi5/pi5-hardware.nix
      inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
      inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.page-size-16k

      self.nixosModules.user
      self.nixosModules.pi5
    ];
  };
}
