{
  description = "my flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgfs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
    nvf.url = "github:notashelf/nvf";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      imports = [ (inputs.import-tree ./modules) ];
    };
}
