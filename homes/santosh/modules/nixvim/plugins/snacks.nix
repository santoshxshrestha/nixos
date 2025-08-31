{
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      notifier = {
        enabled = true;
        # style = "minimal";
      };
      bigfile = {
        enabled = true;
        notify = true;
      };
      quickfile = { enabled = true; };
      statuscolumn.enabled = true;
    };
  };
}
