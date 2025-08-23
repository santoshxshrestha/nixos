{ config, pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layers = "top";
        position = "top";
        height = 24;
        spacing = 2;
        margin-top = 4;
        margin-left = 8;
        margin-right = 8;

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-center = [ "clock" ];
        modules-right = [
          "network"
          "backlight"
          "pulseaudio"
          "pulseaudio#microphone"
          "battery"
          "tray"
          "custom/notification"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
          format = "{name}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "10";
          };
          persistent_workspaces = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        # Window title
        "hyprland/window" = {
          format = "{}";
          max-length = 30;
          separate-outputs = true;
        };

        clock = {
          timezone = "Asia/Kathmandu";
          format = "{:%I:%M %p}";
          format-alt = "{:%A, %B %d, %Y}";
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            weeks-pos = "right";
            on-scroll = 1;
            on-click-right = "mode";
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'>{}</span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-right = "mode";
            on-click-forward = "tz_up";
            on-click-backward = "tz_down";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        # Network - Changed to show only WiFi icon, name on hover
        network = {
          format-wifi = "  {signalStrength}%";
          format-ethernet = "󰈀  {signalStrength}%";
          format-disconnected = "󰤮 ";
          tooltip-format = "{ifname} via {gwaddr}";
          tooltip-format-wifi = ''
            {essid} ({signalStrength}%) 󰤨
            {frequency}MHz'';
          tooltip-format-ethernet = ''
            {ifname} 󰈀
            IP: {ipaddr}'';
          tooltip-format-disconnected = "Disconnected";
          max-length = 20;
          on-click = "nm-connection-editor";
          interval = 5;
        };

        # Custom notification module
        "custom/notification" = {
          tooltip = false;
          format = "";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification =
              "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification =
              "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        # Battery - Added brightness control on scroll
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󱐋{capacity}%";
          format-plugged = "󱟢{capacity}%";
          format-alt = "{icon} {time}";
          format-icons = [ "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹" ];
          # on-scroll-up = "brightnessctl set +5%";
          # on-scroll-down = "brightnessctl set 5%-";
          tooltip-format = ''
            Battery: {capacity}%
            {timeTo}
            Power: {power}W'';
          interval = 60;
          max-length = 25;
        };

        # Audio - Added proper sound icons
        pulseaudio = {
          format = "{icon} {volume}%";
          format-muted = "󰝟 {volume}%";
          format-icons = {
            headphone = "󰋋";
            hands-free = "󰏴";
            headset = "󰋎";
            phone = "󰏲";
            portable = "󰦧";
            car = "󰄋";
            default = [ "󰕿" "󰖀" "󰕾" ];
          };
          on-click = "pavucontrol";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          on-scroll-up = "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
          on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
          tooltip-format = ''
            Volume: {volume}%
            Device: {desc}
            Scroll to adjust volume'';
          max-length = 20;
          smooth-scrolling-threshold = 1.0;
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "󰍬 {volume}%";
          format-source-muted = "󰍭";
          on-click = "pavucontrol --tab=4";
          on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle ";
          on-scroll-up = "wpctl set-volume -l 1 @DEFAULT_SOURCE@ .05+";
          on-scroll-down = "wpctl set-volume @DEFAULT_SOURCE@ .05-";
          scroll-step = 5;
          smooth-scrolling-threshold = 1;
          tooltip = true;
          tooltip-format = ''
            Microphone: {volume}%{format_source}
            Scroll to adjust microphone volume'';
        };

        backlight = {
          device = "intel_backlight";
          format = " {percent}%";
          on-scroll-up = "brightnessctl s 5%+";
          on-scroll-down = "brightnessctl s 5%-";
          smooth-scrolling-threshold = 1.0;
          tooltip-format = ''
            Brightness: {percent}%
            Scroll to adjust brightness'';
        };

        # System tray
        tray = { spacing = 8; };
      };
    };
    style = ''

      * {
          border: none;
          border-radius: 0;
          font-family: "JetBrains Mono Nerd Font", "Fira Code Nerd Font", monospace;
          font-size: 11px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(0, 0, 0, 0.6);
          /* more transparent */
          /* background: rgba(0, 0, 0, 0.3); */
          color: #b8b5c7;
          transition-property: background-color;
          transition-duration: .5s;
          border-radius: 8px;
          margin: 0;
          padding: 0;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      /* Workspaces */
      #workspaces {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 3px;
      }

      #workspaces button {
          padding: 0 6px;
          background: transparent;
          color: #b8b5c7;
          border-radius: 4px;
          transition: all 0.3s ease;
          font-weight: bold;
      }

      #workspaces button:hover {
          background: rgba(82, 79, 103, 0.3);
          color: #d4d1e0;
      }

      #workspaces button.active {
          background: rgba(82, 79, 103, 0.5);
          color: #ffffff;
          font-weight: bold;
      }

      #workspaces button.urgent {
          background: rgba(255, 0, 0, 0.3);
          color: #ff8a80;
      }

      /* Window title */
      #window {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #b8b5c7;
          font-weight: normal;
      }

      /* Clock */
      #clock {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #ffffff;
          font-weight: bold;
      }

      #clock:hover {
          background: rgba(82, 79, 103, 0.3);
      }

      /* Network */
      #network {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #b8b5c7;
          font-size: 13px;
          /* Slightly larger for better icon visibility */
          transition: all 0.3s ease;
      }

      #network:hover {
          background: rgba(82, 79, 103, 0.3);
      }

      #network.disconnected {
          background: rgba(255, 0, 0, 0.2);
          color: #ff8a80;
      }

      /* Custom notification */
      #custom-notification {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #b8b5c7;
      }

      #custom-notification:hover {
          background: rgba(82, 79, 103, 0.3);
      }

      /* Battery */
      #battery {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #b8b5c7;
          font-size: 13px;
          /* Slightly larger for better icon visibility */
          transition: all 0.3s ease;
      }

      #battery:hover {
          background: rgba(82, 79, 103, 0.3);
          transition: all 0.3s ease;
      }

      #battery.charging {
          background: rgba(0, 255, 0, 0.2);
          color: #66ff66;
      }

      #battery.warning:not(.charging) {
          background: rgba(255, 165, 0, 0.2);
          color: #ffcc66;
      }

      #battery.critical:not(.charging) {
          background: rgba(255, 0, 0, 0.2);
          color: #ff6666;
          animation: blink 0.5s linear infinite alternate;
      }

      @keyframes blink {
          to {
              background: rgba(255, 0, 0, 0.4);
          }
      }

      /* Audio */
      #pulseaudio {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #b8b5c7;
          font-size: 13px;
          /* Slightly larger for better icon visibility */
          transition: all 0.3s ease;
      }

      #pulseaudio:hover {
          background: rgba(82, 79, 103, 0.3);
      }

      #pulseaudio.muted {
          background: rgba(255, 0, 0, 0.2);
          color: #ff6666;
      }

      /* Microphone module base styling - matching your audio theme */
      #pulseaudio.microphone {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #b8b5c7;
          font-size: 13px;
      }

      /* Animation for volume changes */
      #pulseaudio.microphone {
          animation: pulse 0.3s ease-in-out;
      }

      #pulseaudio.microphone.source-muted {
          background: rgba(255, 0, 0, 0.2);
          color: #ff6666;
      }


      #backlight {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 10px;
          color: #b8b5c7;
          font-size: 13px;
          transition: all 0.3s ease;
      }

      /* System tray */
      #tray {
          background: rgba(82, 79, 103, 0.2);
          border-radius: 6px;
          margin: 2px;
          padding: 0 8px;
      }

      #tray>.passive {
          -gtk-icon-effect: dim;
      }

      #tray>.needs-attention {
          -gtk-icon-effect: highlight;
          background: rgba(255, 215, 0, 0.2);
      }

      /* Tooltip */
      tooltip {
          background: rgba(0, 0, 0, 0.8);
          border-radius: 6px;
          border: 1px solid rgba(82, 79, 103, 0.5);
          color: #b8b5c7;
      }

      tooltip label {
          color: #b8b5c7;
      }
    '';
  };
}
