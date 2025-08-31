{
  programs.nixvim.plugins.noice = {
    enable = true;
    settings = {
      cmdline.enabled = true;
      notify.enabled = false;
      lsp = {
        hover.enabled = true;
        message.enabled = true;
        signature.enabled = true;
        progress.enabled = false;
      };
    };
  };
}
