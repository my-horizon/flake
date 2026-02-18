{ ... }:
{
  flake.nixosModules.zsh =
    { ... }:
    {
      home-manager.users.unknown = {
        programs.zsh = {

          enable = true;

          enableCompletion = true;

          autosuggestion.enable = true;

          syntaxHighlighting.enable = true;

          shellAliases = {

            # nixos
            update = "sudo nix flake update";
            rebuild = "sudo nixos-rebuild switch --flake";
            garbage = "sudo nix-collect-garbage -d";

            # git
            add = "git add";
            commit = "git commit -m";
            push = "git push";
            status = "git status";
          };
        };
      };
    };
}
