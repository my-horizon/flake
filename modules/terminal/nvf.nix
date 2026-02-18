{ inputs, ... }:
{
  flake.nixosModules.nvf =
    { ... }:
    {
      home-manager.users.unknown = {
        imports = [ inputs.nvf.homeManagerModules.default ];

        programs.nvf = {
          enable = true;

          settings = {

            vim.visuals.indent-blankline.enable = true;
            vim.statusline.lualine.enable = true;

            # lsp's
            vim.lsp.enable = true;
            vim.autocomplete.nvim-cmp.enable = true;
            vim.languages.nix.enable = true;
            vim.languages.lua.enable = true;
            vim.languages.clang.enable = true;
            vim.languages.json.enable = true;
            vim.languages.yaml.enable = true;

            # formatters
            vim.formatter.conform-nvim.enable = true;
            vim.languages.nix.format.enable = true;
            vim.languages.lua.format.enable = true;
            vim.languages.json.format.enable = true;

            # leader key
            vim.globals.mapleader = " ";

            # custom keymaps
            vim.keymaps = [
              {
                mode = "n";
                key = "<leader>w";
                action = "<cmd>w<CR>";
                desc = "Save";
              }
              {
                mode = "n";
                key = "<leader>q";
                action = "<cmd>q<CR>";
                desc = "Quit";
              }
              {
                mode = "n";
                key = "<leader>wa";
                action = "<cmd>wa<CR>";
                desc = "Save all files";
              }
              {
                mode = "n";
                key = "<leader>wq";
                action = "<cmd>wq<CR>";
                desc = "Write and quit the file";
              }
              {
                mode = "n";
                key = "<leader>qa";
                action = "<cmd>qa<CR>";
                desc = "Quit all";
              }
              {
                mode = "n";
                key = "<leader>wqa";
                action = "<cmd>wqa<CR>";
                desc = "Save and quit all files";
              }
            ];

            # lsp's
            vim.lsp.mappings.hover = "K";
            vim.lsp.mappings.goToDefinition = "<leader>gd";
            vim.lsp.mappings.goToDeclaration = "<leader>gD";
            vim.lsp.mappings.listImplementations = "<leader>gi";
            vim.lsp.mappings.listReferences = "<leader>gr";
            vim.lsp.mappings.previousDiagnostic = "<leader>[d";
            vim.lsp.mappings.nextDiagnostic = "<leader>]d";
            vim.lsp.mappings.openDiagnosticFloat = "<leader>ld";
            vim.lsp.mappings.renameSymbol = "<leader>rn";
            vim.lsp.mappings.codeAction = "<leader>ca";

            # nvim-tree
            vim.filetree.nvimTree.enable = true;
            vim.filetree.nvimTree.mappings.toggle = "<leader>e";
            vim.filetree.nvimTree.mappings.focus = "<leader>s";

            # telescope
            vim.telescope.enable = true;
            vim.telescope.mappings.findFiles = "<leader>ff";
            vim.telescope.mappings.liveGrep = "<leader>fg";
            vim.telescope.mappings.buffers = "<leader>fb";
            vim.telescope.mappings.helpTags = "<leader>fh";

            # color theme
            vim.theme.enable = true;
            vim.theme.name = "catppuccin";
            vim.theme.style = "mocha";
          };
        };
      };
    };
}
