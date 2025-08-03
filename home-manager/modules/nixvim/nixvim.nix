{ config, ... }: {
  imports = [
    #core
    ./core/keymaps.nix
    ./core/lsp.nix
    ./core/autocompletion.nix
    ./core/code-runner.nix
    ./core/opts.nix

    #plugins
    ./plugins/harpoon.nix
    ./plugins/surround.nix
    ./plugins/none-ls.nix
    ./plugins/comment.nix
    ./plugins/indent-blankline.nix
    ./plugins/gitsigns.nix
    ./plugins/lualine.nix

  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    globals.mapleader = " ";

    globals.maplocalleader = " ";

    plugins = {
      telescope = {
        enable = true;

        extensions = {
          fzf-native = {
            enable = true;
            settings = {
              fuzzy = true;
              override_generic_sorter = true;
              override_file_sorter = true;
              case_mode = "smart_case";
            };
          };
        };
      };
      web-devicons.enable = true;
    };

    lsp.inlayHints.enable = true;
  };
}
