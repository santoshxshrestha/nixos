{
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      notifier = {
        enabled = false;
        style = "fancy";
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
