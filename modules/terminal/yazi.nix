{ ... }:
{
  flake.nixosModules.yazi =
    { pkgs, config, ... }:
    {
      home-manager.users.${config.myConfig.user.name} = {
        programs.yazi = {
          enable = true;
          enableZshIntegration = true;

          plugins = {
            inherit (pkgs.yaziPlugins) git;
          };

          initLua = ''
            require("git"):setup()
          '';

          settings = {
            mgr = {
              show_hidden = false;
              sort_by = "natural";
              sort_dir_first = true;
              sort_sensitive = false;
              sort_reverse = false;
              linemode = "none";
            };
            plugin = {
              prepend_fetchers = [
                {
                  id = "git";
                  name = "*";
                  run = "git";
                }
                {
                  id = "git";
                  name = "*/";
                  run = "git";
                }
              ];
            };
          };

          keymap = {
            mgr.prepend_keymap = [
              {
                on = [ "h" ];
                run = "leave";
                desc = "Go to parent directory";
              }
              {
                on = [ "j" ];
                run = "arrow 1";
                desc = "Move cursor down";
              }

              {
                on = [ "k" ];
                run = "arrow -1";
                desc = "Move cursor up";
              }
              {
                on = [ "l" ];
                run = "enter";
                desc = "Enter directory";
              }
              {
                on = [
                  "g"
                  "g"
                ];
                run = "arrow -99999999";
                desc = "Go to top";
              }
              {
                on = [ "G" ];
                run = "arrow 99999999";
                desc = "Go to bottom";
              }
              {
                on = [ "/" ];
                run = "find --smart";
                desc = "Find";
              }
              {
                on = [ "y" ];
                run = "yank";
                desc = "Yank (copy)";
              }
              {
                on = [ "d" ];
                run = "remove";
                desc = "Delete";
              }
              {
                on = [ "p" ];
                run = "paste";
                desc = "Paste";
              }
              {
                on = [ "r" ];
                run = "rename";
                desc = "Rename";
              }
              {
                on = [ "." ];
                run = "hidden toggle";
                desc = "Toggle hidden files";
              }
              {
                on = [ "q" ];
                run = "quit";
                desc = "Quit";
              }
              {
                on = [ "<Esc>" ];
                run = "escape";
                desc = "Escape";
              }
            ];
          };
        };
      };
    };
}
