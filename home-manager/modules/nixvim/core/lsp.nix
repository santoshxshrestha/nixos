{ config, ... }: {
  # for docs and other feat related to lsp
  programs.nixvim.plugins.lspsaga = {
    enable = true;
    # ui = { border = "rounded"; };
    lightbulb = { enable = false; };
    # hover = {
    #   maxWidth = 0.5;
    #   maxHeight = 0.3;
    # };
  };

  programs.nixvim.diagnostic = {
    settings = {
      virtual_text = {
        spacing = 2;
        prefix = "";
      };
      update_in_insert = true;
      severity_sort = true;
      signs = true;
    };
  };

  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      # "*" = {
      # Global settings for all servers
      #   capabilities = {
      #     textDocument = {
      #       semanticTokens = { multilineTokenSupport = true; };
      #     };
      #   };
      #   root_markers = [ ".git" ];
      # };
      marksman = { enable = true; };
      # htmx
      htmx = { enable = true; };
      # nix
      nil_ls = {
        enable = true;
        settings = { formatting = { command = [ "nixfmt" ]; }; };
      };
      # c / c++
      clangd = { enable = true; };
      # lua
      lua_ls = { enable = true; };
      # bash
      bashls = { enable = true; };
      # css
      cssls = { enable = true; };
      # Go
      gopls = { enable = true; };
      # html
      html = { enable = true; };
      # tailwindcss 
      tailwindcss = { enable = true; };
      # typescript
      ts_ls = { enable = true; };
      emmet_language_server = { enable = true; };
      dockerls = { enable = true; };
      jsonls = { enable = true; };

    };
  };
  programs.nixvim.lsp.inlayHints.enable = true;
}
