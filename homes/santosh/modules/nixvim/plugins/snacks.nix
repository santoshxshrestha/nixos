{
  programs.nixvim.plugins.snacks = {
    enable = true;
    settings = {
      notifies = { enable = false; };
      bigfile = {
        enable = true;
        notify = true;
      };
      quickfile = { enable = false; };
      statuscolumn.enable = false;

    };
  };
}
