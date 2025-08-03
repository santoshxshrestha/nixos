{ config, ... }: {
  imports = [
    #core
    ./core/keymaps.nix
    ./core/lsp.nix

  ];
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;
    globals.mapleader = " ";

    globals.maplocalleader = " ";

    plugins = {
      lualine.enable = true;
      lspconfig.enable = true;
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

    lsp.servers = {

      "*" = {
        settings = {
          capabilities = {
            textDocument = {
              semanticTokens = { multilineTokenSupport = true; };
            };
          };
          root_markers = [ ".git" ];
        };
      };
      nixd = {
        enable = true;
        settings = {
          # Optional: configure nixd settings
          formatting = { command = [ "nixfmt" ]; };
        };
      };

      clangd = {
        enable = true;
        settings = { filetypes = [ "c" "cpp" ]; };
      };

      lua_ls.enable = true;
    };
    lsp.inlayHints.enable = true;

  };
}
