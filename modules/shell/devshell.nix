{ ... }:
{
  perSystem =
    { pkgs, ... }:
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
        movie = pkgs.mkShell {
          packages = with pkgs; [
            makemkv
            handbrake
            vlc
          ];
        };
      };
    };
}
