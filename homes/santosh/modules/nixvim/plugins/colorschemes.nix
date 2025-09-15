{ pkgs, ... }: {
  programs.nixvim = {
    colorschemes = {

      catppuccin = {
        enable = true;
        settings = {
          show_end_of_buffer = false;
          transparent_background = false;
          flavor = "mocha";
          float = {
            transparent = true;
            solid = false;
          };
          color_overrides = { all = { base = "#191d33"; }; };
          no_italic = false;
          no_bold = true;
          no_underline = false;
        };
      };

      kanagawa = {
        enable = false;
        settings = {
          transparent = false;
          commonStyle = {
            italic = true;
            bold = false;
          };
          undercurl = true;
        };
      };

      palette = {
        enable = false;
        settings = {
          italics = true;
          bolds = false;
          transparent_background = true;
        };
      };

      rose-pine = {
        enable = false;
        settings = {
          show_end_of_buffer = false;
          flavor = "main";
          disable_background = true;
          disable_float_background = true;
          styles = {
            bold = false;
            italic = true;
            transparency = true;
          };
        };
      };
    };

    extraPlugins = [
      (pkgs.vimPlugins.falcon)

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

      (pkgs.vimUtils.buildVimPlugin {
        pname = "black-metal-theme-neovim";
        version = "6d0207871387077f40d5396ab1ae90520e688d36";
        src = pkgs.fetchFromGitHub {
          owner = "metalelf0";
          repo = "black-metal-theme-neovim";
          rev = "6d0207871387077f40d5396ab1ae90520e688d36";
          sha256 = "sha256-sRbXxekmQuL412AJKrSkI1EdcuYQkKm1qfcIyMNhLBA=";
        };
      })

    ];

    extraConfigLua = ''
      require('vague').setup({
          transparent = false,
          bold = false,
          italic = true,
          -- colors = {
          --     bg = "#191d33",
          -- },
          on_highlights = function(highlights, colors)
              -- GitSigns
              highlights.GitSignsAdd = { fg = "#ffffff", bg = "NONE" }
              highlights.GitSignsChange = { fg = "#aaaaaa", bg = "NONE" }
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
