{
  programs.nixvim.plugins.lsp-format.enable = true;
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources.formatting = {
      prettier = {
        enable = true;
        settings.filetypes =
          [ "html" "json" "yaml" "markdown" "javascript" "typescript" ];
        # Disable the TypeScript Language Server's built-in formatter to avoid conflicts
        disableTsServerFormatter = true;
      };

      stylua.enable = true;

      shfmt = {
        enable = true;
        settings.extra_args = [ "-i" "4" ];
      };

      clang_format.enable = true;

      nixfmt.enable = true;
    };
  };

  # programs.nixvim.autoCmd = [{
  #   event = "BufWritePre";
  #   pattern = "*";
  #   callback.__raw = ''
  #     function()
  #     vim.lsp.buf.format({ async = false })
  #     end
  #   '';
  # }];
  # This is commented out to avoid conflicts with lsp-format or none-ls,
  # which already handle formatting on save.
}
