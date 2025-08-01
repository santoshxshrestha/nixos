{ config, pkgs, ... }: {
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source =
          "${config.home.homeDirectory}/nixos/home-manager/assets/nixos.png";
        height = 15;
        width = 40;
        padding = {
          right = 2;
          top = 1;
        };
        color = {
          "1" = "blue";
          "2" = "cyan";
        };
      };

      display = {
        size = {
          binaryPrefix = "si";
          ndigits = 2;
        };
        color = {
          keys = "blue";
          output = "cyan";
        };
        separator = " ❯ ";
        key.width = 12;
      };

      modules = [
        # System Info Header
        {
          type = "title";
          color = {
            user = "blue";
            at = "white";
            host = "cyan";
          };
        }
        "break"

        # Date & Time with better formatting
        {
          type = "datetime";
          key = "󰃭 Date";
          format = "{1}/{3}/{11}";
        }
        {
          type = "datetime";
          key = "󰥔 Time";
          format = "{15}:{17} {21}";
        }
        {
          type = "uptime";
          key = "󰅐 Uptime";
        }
        "break"

        # System Information
        {
          type = "os";
          key = "󱄅 OS";
        }
        {
          type = "host";
          key = "󰌢 Host";
        }
        {
          type = "kernel";
          key = "󰌽 Kernel";
        }
        {
          type = "packages";
          key = "󰏖 Packages";
        }
        {
          type = "shell";
          key = "󰆍 Shell";
        }
        {
          type = "display";
          key = "󰍹 Display";
        }
        {
          type = "de";
          key = "󰧨 DE";
        }
        {
          type = "wm";
          key = "󰨇 WM";
        }
        {
          type = "wmtheme";
          key = "󰉼 WM Theme";
        }
        {
          type = "theme";
          key = "󰉼 Theme";
        }
        {
          type = "icons";
          key = "󰀻 Icons";
        }
        {
          type = "terminal";
          key = " Terminal";
        }
        {
          type = "terminalfont";
          key = "󰛖 Term Font";
        }
        "break"

        # Hardware Information
        {
          type = "cpu";
          key = " CPU";
          showPeCoreCount = true;
        }
        {
          type = "gpu";
          key = "󰢮 GPU";
          hideType = "integrated";
        }
        {
          type = "memory";
          key = " Memory";
        }
        {
          type = "swap";
          key = "󰓡 Swap";
        }
        {
          type = "disk";
          key = "󰋊 Storage";
          folders = "/";
        }
        "break"

        # Media & Performance
        {
          type = "player";
          key = "󰎆 Now Playing";
        }
        {
          type = "media";
          key = "󰝚 Media";
        }
      ];
    };
  };
}
