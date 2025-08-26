{
  # for docs and other feat related to lsp
  programs.nixvim.plugins.lspsaga = {
    enable = true;
    # ui = { border = "rounded"; };
    settings = {
      diagnostic = {
        diagnostic_only_current = true;
        # extend_related_information = true;
      };
      lightbulb = { enable = false; };
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
      # "*" = {
      # Global settings for all servers
      #   capabilities = {
      #     textDocument = {
      #       semanticTokens = { multilineTokenSupport = true; };
      #     };
      #   };
      #   root_markers = [ ".git" ];
      # };

      # markdown
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
      # emment snippet
      emmet_language_server = { enable = true; };
      # dockerfile
      dockerls = { enable = true; };
      # json
      jsonls = { enable = true; };

    };
  };
  programs.nixvim.lsp.inlayHints.enable = true;
}
