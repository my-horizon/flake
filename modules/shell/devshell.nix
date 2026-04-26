{ inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:

    # needed for makemkv
    let

      unfreePkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {

      devShells = {

        # projects
        default = pkgs.mkShell {

          packages = with pkgs; [
            clang
          ];
        };

        # movie ripping
        movie = unfreePkgs.mkShell {

          packages = with unfreePkgs; [
            makemkv
            handbrake
          ];
        };
      };
    };
}
