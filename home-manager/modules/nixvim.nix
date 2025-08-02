{ config, ... }: {
  programs.nixvim = {
    enable = true;

    colorschemes.catppuccin.enable = true;

    plugins = {
      lualine.enable = true;

      lspconfig = { enable = true; };

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

      clangd = {
        enable = true;
        settings = { filetypes = [ "c" "cpp" ]; };
      };

      lua_ls.enable = true;
    };
    # lsp.servers.clangd.enable = true;
    # lsp.servers.lua_ls.enable = true;
    lsp.inlayHints.enable = true;
    lsp.keymaps =

      [
        {
          key = "gd";
          lspBufAction = "definition";
        }
        {
          key = "gD";
          lspBufAction = "references";
        }
        {
          key = "gt";
          lspBufAction = "type_definition";
        }
        {
          key = "gi";
          lspBufAction = "implementation";
        }
        {
          key = "K";
          lspBufAction = "hover";
        }
        {
          action = "<CMD>Lspsaga hover_doc<Enter>";
          key = "K";
        }
      ];

  };
}
