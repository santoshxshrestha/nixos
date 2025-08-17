{ pkgs, ... }: {
  programs.nixvim = {
    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
          show_end_of_buffer = false;
          transparent_background = true;
          flavor = "mocha";
          float = {
            transparent = true;
            solid = false;
          };
          no_italic = false;
          no_bold = true;
          no_underline = false;
        };
      };

      rose-pine = {
        enable = false;
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
        version = "1.4.1";
        src = pkgs.fetchFromGitHub {
          owner = "vague2k";
          repo = "vague.nvim";
          rev = "v1.4.1";
          sha256 = "sha256-isROQFePz8ofJg0qa3Avbwh4Ml4p9Ii2d+VAAkbeGO8=";
        };
      })
    ];

    extraConfigLua = ''
      require('vague').setup({
          transparent = true,
          on_highlights = function(highlights, colors)
              -- Treesitter Context
              highlights.TreesitterContext = { bg = "NONE", fg = colors.fg }
              highlights.TreesitterContextLineNumber = { bg = "NONE", fg = colors.fg }
              highlights.TreesitterContextBottom = { underline = true, sp = colors.plus }

              -- GitSigns
              highlights.GitSignsAdd = { fg = colors.plus, bg = "NONE" }
              highlights.GitSignsChange = { fg = colors.delta, bg = "NONE" }
              highlights.GitSignsDelete = { fg = colors.error, bg = "NONE" }

              -- IndentBlankline
              highlights.IndentBlanklineChar = { fg = "#3b3b3b", nocombine = true }
              highlights.IndentBlanklineContextChar = { fg = colors.plus, nocombine = true }
              highlights.IndentBlanklineSpaceChar = { fg = "#444444", nocombine = true }
          end,

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
