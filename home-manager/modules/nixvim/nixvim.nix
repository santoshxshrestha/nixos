{ config, ... }: {
  imports = [
    #core
    ./core/keymaps.nix
    ./core/lsp.nix
    ./core/autocompletion.nix
    ./core/opts.nix

  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    globals.mapleader = " ";

    globals.maplocalleader = " ";

    plugins = {
      lualine.enable = true;
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
      none-ls = {
        enable = true;
        sources = {
          formatting.nixfmt.enable = true;
          # You can add other formatters here
          formatting.stylua.enable = true;
        };
      };
    };

    lsp.inlayHints.enable = true;
  };
}
