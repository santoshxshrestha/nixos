{
  programs.nixvim.plugins.comment = {
    enable = true;
    settings = {
      # Comment.nvim default settings
      padding = true;
      sticky = true;
      ignore = null;
      mappings = {
        basic = false;
        extra = false;
      };
      pre_hook = null;
      post_hook = null;
    };
  };
}
