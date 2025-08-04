{
  programs.nixvim.plugins.treesitter-textobjects = {
    enable = true;
    select = {
      enable = true;
      lookahead = true;

      keymaps = {
        "af" = "@function.outer";
        "if" = "@function.inner";
        "ac" = "@class.outer";
        "ic" = {
          query = "@class.inner";
          desc = "Select inner class";
        };
        "as" = {
          query = "@local.scope";
          queryGroup = "locals";
          desc = "Select language scope";
        };
        "aa" = "@parameter.outer";
        "ia" = "@parameter.inner";
        "il" = "@loop.inner";
        "al" = "@loop.outer";
      };

      selectionModes = {
        "@parameter.outer" = "v";
        "@function.outer" = "V";
        "@class.outer" = "<c-v>";
      };

      includeSurroundingWhitespace = true;
    };
  };
}
