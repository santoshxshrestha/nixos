{
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
}
