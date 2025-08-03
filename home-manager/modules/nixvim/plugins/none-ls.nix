{
  programs.nixvim.plugins.none-ls.sources.formatting.prettier.disableTsServerFormatter =
    true;

  programs.nixvim.plugins.lsp-format.enable = true;
  programs.nixvim.plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    sources.formatting = {
      prettier = {
        enable = true;
        settings.filetypes = [ "html" "json" "yaml" "markdown" "javascript" ];
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

  programs.nixvim.autoCmd = [{
    event = "BufWritePre";
    pattern = "*";
    callback.__raw = ''
      function()
      vim.lsp.buf.format({ async = false })
      end
    '';
  }];
}
