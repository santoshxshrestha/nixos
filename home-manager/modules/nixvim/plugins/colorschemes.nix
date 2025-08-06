{ pkgs, ... }: {
  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = false;
        settings = {
          show_end_of_buffer = false;
          transparent_background = false;
          flavor = "mocha";
        };
      };

      rose-pine = {
        enable = true;
        settings = {
          show_end_of_buffer = false;
          flavor = "main";
          disable_background = true;
          disable_float_background = true;
        };
      };
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "vague-nvim";
        version = "2024-01-01";
        src = pkgs.fetchFromGitHub {
          owner = "vague2k";
          repo = "vague.nvim";
          rev = "main";
          sha256 = "sha256-rJe0pJu6/JKCCdhKTwPFdHlZ2CUaIJc++nlsEdYXQOY=";
        };
      })
    ];

    extraConfigLua = ''
      require('vague').setup({
        transparent = true,
        -- style = {
        --   boolean = "italic",
        --   number = "none",
        --   float = "none",
        --   error = "none",
        --   comments = "italic",
        --   conditionals = "none",
        --   functions = "none",
        --   headings = "bold",
        --   operators = "none",
        --   strings = "none",
        --   variables = "none",
        --   keywords = "none",
        --   keyword_return = "none",
        --   keywords_loop = "none",
        --   keywords_label = "none",
        --   keywords_exception = "none",
        -- },
      })
      -- vim.cmd('colorscheme vague')
    '';
  };
}
