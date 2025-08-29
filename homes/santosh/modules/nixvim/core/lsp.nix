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
      # rust
      rust_analyzer = { enable = true; };

      # markdown
      marksman = { enable = true; };

      # htmx
      htmx = { enable = false; };

      # nix
      nil_ls = { enable = true; };

      # c / c++
      clangd = { enable = false; };

      # lua
      lua_ls = { enable = false; };
      # bash
      bashls = { enable = true; };

      # css
      cssls = { enable = true; };

      # Go
      gopls = { enable = false; };

      # html
      html = { enable = true; };

      # tailwindcss
      tailwindcss = { enable = false; };

      # typescript
      ts_ls = { enable = false; };

      # emment snippet
      emmet_language_server = { enable = false; };

      # dockerfile
      dockerls = { enable = false; };

      # json
      jsonls = { enable = false; };

    };
  };
  programs.nixvim.lsp.inlayHints.enable = true;
}
