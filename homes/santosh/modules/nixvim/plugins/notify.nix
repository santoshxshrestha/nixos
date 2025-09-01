{
  programs.nixvim.plugins.notify = {
    enable = true;
    settings = {
      # simple is also good option here
      render = "simple";
      stages = "slide";
      background_colour = "#000000";
      fps = 60;
      level = "info";
    };
  };
}
