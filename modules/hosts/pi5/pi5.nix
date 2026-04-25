{ inputs, self, ... }:
{
  flake.nixosConfigurations.pi5 = inputs.nixos-raspberrypi.lib.nixosSystem {
    system = "aarch64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.base
      inputs.nixos-raspberrypi.nixosModules.raspberry-pi-5.page-size-16k

      self.nixosModules.user
      self.nixosModules.pi5
    ];
  };
}
