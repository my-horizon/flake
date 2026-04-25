{ ... }:
{
  flake.nixosModules.zsh =
    { config, ... }:
    {
      home-manager.users.${config.myConfig.user.name} = {
        programs.zsh = {

          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;

          shellAliases = {

            # nixos
            update = "nix flake update";
            rebuild = "sudo nixos-rebuild switch --flake .#desktop";
            garbage = "sudo nix-collect-garbage -d";

            # git
            status = "git status";
            add = "git add";
            commit = "git commit -m";
            push = "git push";
          };
        };
      };
    };
}
