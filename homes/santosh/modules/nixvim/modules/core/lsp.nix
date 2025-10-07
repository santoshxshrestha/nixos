{ config, lib, ... }:
{
  options = {
    lsp.enable = lib.mkEnableOption "Enable/disable custom lsp setup";
  };
  config = lib.mkIf config.lsp.enable {
    # for docs and other feat related to lsp
    programs.nixvim.plugins.lspsaga = {
      enable = true;
      # ui = { border = "rounded"; };
      settings = {
        diagnostic = {
          diagnostic_only_current = true;
          showCodeAction = true;
          # extend_related_information = true;
        };
        lightbulb = {
          enable = false;
        };
        beacon.enable = true;
        implement.enable = false;
        symbol_in_winbar = {
          enable = false;
          delay = 300;
          folder_level = 1;
          hide_keyword = true;
        };
      };
      # hover = {
      #   maxWidth = 0.5;
      #   maxHeight = 0.3;
      # };
    };

    # programs.nixvim.diagnostic = {
    #   settings = {
    #     virtual_text = {
    #       spacing = 2;
    #       prefix = "";
    #     };
    #     update_in_insert = true;
    #     severity_sort = true;
    #     signs = true;
    #   };
    # };

    programs.nixvim.plugins.lsp = {
      enable = true;
      servers = {
        # rust
        rust_analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };

        # markdown
        marksman = {
          enable = true;
        };

        # htmx
        htmx = {
          enable = true;
        };

        # nix
        nil_ls = {
          enable = true;
        };

        # c / c++
        clangd = {
          enable = true;
        };

        # lua
        lua_ls = {
          enable = false;
        };

        # bash
        bashls = {
          enable = true;
        };

        # nushell
        nushell = {
          enable = true;
        };

        # css
        cssls = {
          enable = true;
        };

        # Go
        gopls = {
          enable = false;
        };

        # html
        html = {
          enable = true;
        };

        # tailwindcss
        tailwindcss = {
          enable = true;
        };

        # typescript
        ts_ls = {
          enable = true;
        };

        # emment snippet
        emmet_language_server = {
          enable = true;
        };

        # dockerfile
        dockerls = {
          enable = false;
        };

        # json
        jsonls = {
          enable = false;
        };

      };
    };
    programs.nixvim.lsp.inlayHints.enable = true;
  };
}
