{ inputs, ... }:
{
  perSystem =
    { pkgs, system, ... }:
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

        # college
        uni = pkgs.mkShell {
          packages = with pkgs; [
            racket
          ];
        };

        # movie ripping
        movie = unfreePkgs.mkShell {
          packages = with unfreePkgs; [
            makemkv
            handbrake
            vlc
          ];
        };
      };
    };
}
