{ config, pkgs, ... }: {
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    # withUWSM = true;
    # xwayland.enable = true;
    # systemd.enable = true;
    settings = {
      # #######################################################################################
      # HYPRLAND CONFIGURATION
      # This configuration is based on the example from the Hyprland wiki
      # https://wiki.hyprland.org/Configuring/
      #
      # Please note not all available settings / options are set here.
      # For a full list, see the wiki
      # #######################################################################################

      ################
      ### MONITORS ###
      ################

      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [
        "eDP-1,1920x1080@60.00,0x0,1"

        # Projector / Extended monitor config
        # Automatically configure the projector (HDMI-A-1) to use its preferred resolution
        # and mirror the internal display (eDP-1). This ensures the projector matches its
        # native resolution and displays the same content as the laptop screen.
        "HDMI-A-1,preferred,auto,1,mirror,eDP-1"

        # Alternative manual configuration:
        # "HDMI-A-1,1920x1080@60,auto,1,mirror,eDP-1"
      ];

      ###################
      ### MY PROGRAMS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/
      # Set programs that you use
      "$terminal" = "kitty";
      # "$terminal" = "alacritty";  # Alternative terminal
      "$fileManager" = "thunar";
      # "$menu" = "wofi --show drun";  # Alternative launcher
      "$menu" = "rofi -show drun";
      # "$browser" = "zen-browser";  # Alternative browser
      "$browser" = "firefox";

      #################
      ### AUTOSTART ###
      #################

      # Autostart necessary processes (like notifications daemons, status bars, etc.)
      # Or execute your favorite apps at launch like this:
      exec-once = [
        # "mpvpaper -s -o \"no-audio loop\" eDP-1 ~/Pictures/wallpaper-archive/Dynamic-Wallpapers/yoriichi-tsugikuni-2.1920x1080.mp4"
        "swaync" # Notification center
        # "waybar" # Status bar
        "${config.home.homeDirectory}/.local/scripts/switch-to-static"
        # "hyprpanel"  # Alternative status bar
        # "hypridle"   # Idle management
        # "hyprsunset" # Blue light filter
        "wl-paste --type text --watch cliphist store" # Clipboard history for text
        "wl-paste --type image --watch cliphist store" # Clipboard history for images
      ];

      #############################
      ### ENVIRONMENT VARIABLES ###
      #############################

      # See https://wiki.hyprland.org/Configuring/Environment-variables/
      # Uncomment and modify as needed:
      # env = [
      #   "XCURSOR_SIZE,20"
      #   "XCURSOR_THEME,Night Diamond(Red)"
      #   "HYPRCURSOR_SIZE,20"
      #   "HYPRCURSOR_THEME,rose-pine-hyprcursor"
      # ];

      #####################
      ### LOOK AND FEEL ###
      #####################

      # Refer to https://wiki.hyprland.org/Configuring/Variables/
      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 5;
        gaps_out = 10;
        border_size = 1;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
        # Alternative color schemes:
        # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        # "col.inactive_border" = "rgba(595959aa)";

        # rose-pine
        # "col.active_border" = "rgba(33ccffee) rgba(ff0088ee) 45deg";
        # "col.inactive_border" = "rgba(222222aa)";

        # vague
        "col.active_border" = "rgba(64,64,64,1) rgba(96,96,96,1) 45deg";
        "col.inactive_border" = "rgba(32,32,32,1)";

        # Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false;

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false;

        layout = "dwindle";
      };

      # -----------------------------------------------------
      # General window decoration
      # Current: "Default" with transparency and blur effects
      # Alternative "No Border" configuration commented below
      # -----------------------------------------------------

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 10;

        # Change transparency of focused and unfocused windows
        active_opacity = 0.95;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1;

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 0;
          passes = 0;
          new_optimizations = true;
          ignore_opacity = true;
          xray = true;
          brightness = 0.6;
          # vibrancy = 0.1696;  # Alternative blur setting
        };

        shadow = {
          enabled = true;
          range = 30;
          render_power = 3;
          color = "0x66000000";
          # Alternative shadow settings:
          # range = 4;
          # color = "rgba(1a1a1aee)";
        };
      };

      # Alternative "No Border" decoration configuration:
      # decoration = {
      #   rounding = 5;
      #      #  Change transparency of focused and unfocused windows
      #   active_opacity = 1.0;
      #   inactive_opacity = 1.0;

      #   shadow = {
      #     enabled = true;
      #     range = 4;
      #     render_power = 3;
      #     color = "rgba(1a1a1aee)";
      #   };

      #     # https://wiki.hyprland.org/Configuring/Variables/#blur
      #   blur = {
      #     enabled = true;
      #     size = 3;
      #     passes = 1;
      #     vibrancy = 0.1696;
      #   };
      # };

      # -----------------------------------------------------
      # Animations
      # Current: "Dynamic" style (disabled for performance)
      # Alternative configurations commented below
      # -----------------------------------------------------

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = false; # Set to true to enable animations
        bezier = [
          "wind,0.05,0.9,0.1,1.05"
          "winIn,0.1,1.1,0.1,1.1"
          "winOut,0.3,-0.3,0,1"
          "liner,1,1,1,1"
        ];
        animation = [
          "windows,1,6,wind,slide"
          "windowsIn,1,6,winIn,slide"
          "windowsOut,1,5,winOut,slide"
          "windowsMove,1,5,wind,slide"
          "border,1,1,liner"
          "borderangle,1,30,liner,loop"
          "fade,1,10,default"
          "workspaces,1,5,wind"
        ];
      };

      # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      # Alternative "Default" animations configuration:
      # animations = {
      #   enabled = true;  # yes, please :)
      #   bezier = [
      #     "easeOutQuint,0.23,1,0.32,1"
      #     "easeInOutCubic,0.65,0.05,0.36,1"
      #     "linear,0,0,1,1"
      #     "almostLinear,0.5,0.5,0.75,1.0"
      #     "quick,0.15,0,0.1,1"
      #   ];
      #   animation = [
      #     "global,1,10,default"
      #     "border,1,5.39,easeOutQuint"
      #     "windows,1,4.79,easeOutQuint"
      #     "windowsIn,1,4.1,easeOutQuint,popin 87%"
      #     "windowsOut,1,1.49,linear,popin 87%"
      #     "fadeIn,1,1.73,almostLinear"
      #     "fadeOut,1,1.46,almostLinear"
      #     "fade,1,3.03,quick"
      #     "layers,1,3.81,easeOutQuint"
      #     "layersIn,1,4,easeOutQuint,fade"
      #     "layersOut,1,1.5,linear,fade"
      #     "fadeLayersIn,1,1.79,almostLinear"
      #     "fadeLayersOut,1,1.39,almostLinear"
      #     "workspaces,1,1.94,almostLinear,fade"
      #     "workspacesIn,1,1.21,almostLinear,fade"
      #     "workspacesOut,1,1.94,almostLinear,fade"
      #   ];
      # };

      # Alternative "Fast" animations configuration:
      # animations = {
      #   enabled = true;
      #   bezier = [
      #     "linear,0,0,1,1"
      #     "md3_standard,0.2,0,0,1"
      #     "md3_decel,0.05,0.7,0.1,1"
      #     "md3_accel,0.3,0,0.8,0.15"
      #     "overshot,0.05,0.9,0.1,1.1"
      #     "crazyshot,0.1,1.5,0.76,0.92"
      #     "hyprnostretch,0.05,0.9,0.1,1.0"
      #     "fluent_decel,0.1,1,0,1"
      #     "easeInOutCirc,0.85,0,0.15,1"
      #     "easeOutCirc,0,0.55,0.45,1"
      #     "easeOutExpo,0.16,1,0.3,1"
      #   ];
      #   animation = [
      #     "windows,1,3,md3_decel,popin 60%"
      #     "border,1,10,default"
      #     "fade,1,2.5,md3_decel"
      #     "workspaces,1,3.5,easeOutExpo,slide"
      #     "specialWorkspace,1,3,md3_decel,slidevert"
      #   ];
      # };

      # windowrulev2 are defined at the end
      # Ref https://wiki.hyprland.org/Configuring/Workspace-Rules/
      # "Smart gaps" / "No gaps when only" - uncomment all if you wish to use that:
      # workspace = [
      #   "w[tv1],gapsout:0,gapsin:0"
      #   "f[1],gapsout:0,gapsin:0"
      # ];

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile =
          true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = { new_status = "master"; };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper =
          -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo =
          false; # If true disables the random hyprland logo / anime girl background. :(
      };

      #############
      ### INPUT ###
      #############

      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";

        follow_mouse = 1;

        sensitivity = 0.45; # -1.0 - 1.0, 0 means no modification.

        touchpad = {
          natural_scroll = true;
          tap-to-click = true;
          tap-and-drag = true;
          disable_while_typing = true;
          clickfinger_behavior = true;
          # 1 for time out and 0 for disable and 2 for drag lock with out time out
          drag_lock = 0;
        };
      };

      # https://wiki.hyprland.org/Configuring/Variables/#gestures
      gestures = {
        workspace_swipe_distance = 300;
        workspace_swipe_invert = true;
        workspace_swipe_min_speed_to_force = 30;
        workspace_swipe_cancel_ratio = 0.5;
        workspace_swipe_create_new = true;
        workspace_swipe_forever = false;
      };

      # Gesture configurations
      gesture = [
        # Three-finger gesture to resize floating window
        "3, up, resize"
        "3, down, resize"
        "3, left, resize"
        "3, right, resize"
      ];

      # Three-finger gesture configurations

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      ###################
      ### KEYBINDINGS ###
      ###################

      # See https://wiki.hyprland.org/Configuring/Keywords/
      # "$mainMod" = "SUPER";  # Sets "Windows" key as main modifier
      "$mainMod" = "ALT";

      bind = [
        # Custom script bindings
        "$mainMod,w,exec,~/.local/scripts/switch-to-static"
        "$mainMod,d,exec,~/.local/scripts/switch-to-dynamic"
        "$mainMod,minus,exec,~/.local/scripts/waybar-toggle"

        # Clipboard history with rofi
        ''
          SUPER,V,exec,cliphist list | rofi -dmenu -p "Clipboard History" -theme ~/.config/rofi/themes/clipboard.rasi | cliphist decode | wl-copy''

        # Window management - see https://wiki.hyprland.org/Configuring/Binds/ for more
        "$mainMod,F,fullscreen"
        "$mainMod,RETURN,exec,$terminal"
        "$mainMod,C,killactive"
        "$mainMod,M,exit"
        "$mainMod,E,exec,$fileManager"
        "$mainMod,V,togglefloating"
        "$mainMod,P,pseudo" # dwindle: toggles pseudotiling for the focused window
        # "$mainMod,J,togglesplit"  # dwindle: toggles split orientation - commented to avoid vim motion interference
        "$mainMod,space,exec,$menu"
        "$mainMod,b,exec,$browser"

        # Screenshot bindings
        # Note: HYPRSHOT_DIR command has issues, so forcing specific directory
        "$mainMod,PRINT,exec,hyprshot -m window -o /home/santosh/Pictures/Screenshots" # Screenshot a window
        ",PRINT,exec,hyprshot -m output -o /home/santosh/Pictures/Screenshots" # Screenshot a monitor
        "SHIFT,PRINT,exec,hyprshot -m region -o /home/santosh/Pictures/Screenshots" # Screenshot a region
        "$mainMod,s,exec,hyprshot -m region -o /home/santosh/Pictures/Screenshots --clipboard-only" # Screenshot region to clipboard only

        # Lock screen
        "SUPER_SHIFT,l,exec,hyprlock"

        # Move focus with mainMod + vim-style keys
        "$mainMod,h,movefocus,l"
        "$mainMod,l,movefocus,r"
        "$mainMod,k,movefocus,u"
        "$mainMod,j,movefocus,d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod,1,workspace,1"
        "$mainMod,2,workspace,2"
        "$mainMod,3,workspace,3"
        "$mainMod,4,workspace,4"
        "$mainMod,5,workspace,5"
        "$mainMod,6,workspace,6"
        "$mainMod,7,workspace,7"
        "$mainMod,8,workspace,8"
        "$mainMod,9,workspace,9"
        "$mainMod,0,workspace,10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT,1,movetoworkspace,1"
        "$mainMod SHIFT,2,movetoworkspace,2"
        "$mainMod SHIFT,3,movetoworkspace,3"
        "$mainMod SHIFT,4,movetoworkspace,4"
        "$mainMod SHIFT,5,movetoworkspace,5"
        "$mainMod SHIFT,6,movetoworkspace,6"
        "$mainMod SHIFT,7,movetoworkspace,7"
        "$mainMod SHIFT,8,movetoworkspace,8"
        "$mainMod SHIFT,9,movetoworkspace,9"
        "$mainMod SHIFT,0,movetoworkspace,10"

        # Example special workspace (scratchpad) - uncomment to enable:
        # "$mainMod,S,togglespecialworkspace,magic"
        # "$mainMod SHIFT,S,movetoworkspace,special:magic"

        # Scroll through existing workspaces with mainMod + scroll - uncomment to enable:
        # "$mainMod,mouse_down,workspace,e+1"
        # "$mainMod,mouse_up,workspace,e-1"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm =
        [ "$mainMod,mouse:272,movewindow" "$mainMod,mouse:273,resizewindow" ];

      # Laptop multimedia keys for volume and LCD brightness
      bindel = [
        # Volume controls - using wpctl with 150% volume limit
        ",XF86AudioRaiseVolume,exec,wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute,exec,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # Brightness controls
        ",XF86MonBrightnessUp,exec,brightnessctl s 10%+"
        ",XF86MonBrightnessDown,exec,brightnessctl s 10%-"
      ];

      # Media player controls (requires playerctl)
      bindl = [
        ",XF86AudioNext,exec,playerctl next"
        ",XF86AudioPause,exec,playerctl play-pause"
        ",XF86AudioPlay,exec,playerctl play-pause"
        ",XF86AudioPrev,exec,playerctl previous"
      ];

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule v1
      # windowrulev = [
      # "float,class:^(kitty)$"
      # ];

      windowrulev2 = [
        # Example window rules - v2 uncomment and modify as needed:
        # "float,class:^(kitty)$,title:^(kitty)$"

        # "Smart gaps" / "No gaps when only" window rules - uncomment to enable:
        # "bordersize 0,floating:0,onworkspace:w[tv1]"
        # "rounding 0,floating:0,onworkspace:w[tv1]"
        # "bordersize 0,floating:0,onworkspace:f[1]"
        # "rounding 0,floating:0,onworkspace:f[1]"

        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize,class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
