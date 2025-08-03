{ config , ... }: {
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
      nixd = {
        enable = true;
        settings = {
          formatting = { command = [ "nixfmt" ]; };
        };
      };
      clangd = {
        enable = true;
      };
      lua_ls = {
        enable = true;
      };
    };
   # inlayHints.enable = true;
  };
}
