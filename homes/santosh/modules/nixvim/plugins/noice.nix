{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      lsp = {
        hover.enable = true;
        message.enable = true;
        signature.enable = true;
        progress.enable = true;
      };
    };
  };
}
