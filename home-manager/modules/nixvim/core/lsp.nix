{ config, ... }: {
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
      rust_analyzer = {
        enable = true;
        installCargo = true;
        installRustc = true;

        # Rust-analyzer settings
        settings = {
          "rust-analyzer" = {
            cargo = {
              allFeatures = true;
              loadOutDirsFromCheck = true;
              buildScripts = { enable = true; };
            };
            checkOnSave = {
              command = "clippy"; # or "check"
              extraArgs = [ "--target-dir" "target/rust-analyzer" ];
            };
            procMacro = { enable = false; };
          };
        };
      };
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
