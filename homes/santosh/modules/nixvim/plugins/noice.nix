{
  # Better notifications
  programs.nixvim.plugins.notify = {
    enable = true;
    settings = {
      # simple is also good option here
      render = "compact";
      stages = "slide";
      background_colour = "#000000";
      fps = 60;
      level = "info";
    };
  };
  programs.nixvim.plugins.noice = {
    enable = false;
    settings = {
      notify.enable = true;
      lsp = {
        hover.enable = true;
        message.enable = true;
        signature.enable = true;
        progress.enable = true;
      };
    };
  };
}
