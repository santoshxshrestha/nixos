{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      notify.enable = false;
      lsp = {
        hover.enable = true;
        message.enable = true;
        signature.enable = true;
        progress.enable = true;
      };
    };
  };
}
