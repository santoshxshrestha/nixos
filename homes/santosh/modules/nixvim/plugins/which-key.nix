{
  programs.nixvim.plugins.which-key = {
    enable = true;
    settings = {
      win = { wo.winblend = 100; };
      # preset = "modern";
      preset = "helix";
      plugins = {
        marks = true;
        registers = true;
      };
    };
  };
}
