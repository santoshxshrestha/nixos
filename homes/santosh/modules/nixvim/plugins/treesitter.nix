{ config, lib, ... }: {
  options = {
    treesitter.enable = lib.mkEnableOption "Enable treesitter and related plugins";
  };
  config = lib.mkIf config.treesitter.enable {
    programs.nixvim.plugins.treesitter = {
      enable = true;
      folding = false;
      settings = { indent.enable = true; };
    };

    programs.nixvim.plugins.treesitter-context = {
      enable = true;
      settings = {
        enable = true;
        max_lines = 0;
        min_window_height = 0;
        line_numbers = true;
        multiline_threshold = 20;
        trim_scope = "outer";
        mode = "cursor";
        separator = null;
        zindex = 50;
      };
    };

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
  };
}
