{
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
        inhibited-notification = "<span foreground='red'><sup></sup></span>";
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
}
