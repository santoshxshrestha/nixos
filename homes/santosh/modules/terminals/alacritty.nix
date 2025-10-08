{ cofnig, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;

    settings = {
      env = {
        TERM = "xterm-256color";
        LANG = "en_US.UTF-8";
        LC_ALL = "en_US.UTF-8";
      };
      terminal = {
        shell = "${pkgs.nushell}/bin/nu";
      };

      window = {
        padding = {
          x = 2;
          y = 2;
        };
        dynamic_padding = true;
        decorations = "full";
        opacity = 0.8;
        blur = true;
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        bold = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "JetBrainsMono Nerd Font";
          style = "Bold Italic";
        };
        size = 11.25;
        offset = {
          x = 0;
          y = 0;
        };
        glyph_offset = {
          x = 0;
          y = 0;
        };
        builtin_box_drawing = true;
      };

      colors = {
        primary = {
          foreground = "#e0def4";
          background = "#191724";
          dim_foreground = "#908caa";
          bright_foreground = "#e0def4";
        };

        cursor = {
          text = "#e0def4";
          cursor = "#524f67";
        };

        vi_mode_cursor = {
          text = "#e0def4";
          cursor = "#524f67";
        };

        search = {
          matches = {
            foreground = "#908caa";
            background = "#26233a";
          };
          focused_match = {
            foreground = "#191724";
            background = "#ebbcba";
          };
        };

        hints = {
          start = {
            foreground = "#908caa";
            background = "#1f1d2e";
          };
          end = {
            foreground = "#6e6a86";
            background = "#1f1d2e";
          };
        };

        line_indicator = {
          foreground = "None";
          background = "None";
        };

        footer_bar = {
          foreground = "#e0def4";
          background = "#1f1d2e";
        };

        selection = {
          text = "#e0def4";
          background = "#403d52";
        };

        normal = {
          black = "#26233a";
          red = "#eb6f92";
          green = "#31748f";
          yellow = "#f6c177";
          blue = "#9ccfd8";
          magenta = "#c4a7e7";
          cyan = "#ebbcba";
          white = "#e0def4";
        };

        bright = {
          black = "#6e6a86";
          red = "#eb6f92";
          green = "#31748f";
          yellow = "#f6c177";
          blue = "#9ccfd8";
          magenta = "#c4a7e7";
          cyan = "#ebbcba";
          white = "#e0def4";
        };

        dim = {
          black = "#6e6a86";
          red = "#eb6f92";
          green = "#31748f";
          yellow = "#f6c177";
          blue = "#9ccfd8";
          magenta = "#c4a7e7";
          cyan = "#ebbcba";
          white = "#e0def4";
        };

        indexed_colors = [
          {
            index = 16;
            color = "#FAB387";
          }
          {
            index = 17;
            color = "#F5E0DC";
          }
        ];

        transparent_background_colors = false;
        draw_bold_text_with_bright_colors = true;
      };
    };
  };
}
