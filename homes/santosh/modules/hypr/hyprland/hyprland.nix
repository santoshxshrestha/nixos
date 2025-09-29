{ config, pkgs, ... }:
{
  imports = [
    ./modules/monitors.nix
    ./modules/decoration.nix
    ./modules/animations.nix
    ./modules/autostart.nix
    ./modules/keymaps.nix
  ];
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
        gaps_out = 8;
        border_size = 1;

        # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
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

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # You probably want this
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };

      # https://wiki.hyprland.org/Configuring/Variables/#misc
      misc = {
        force_default_wallpaper = -1; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = false; # If true disables the random hyprland logo / anime girl background. :(
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

      ##############################
      ### WINDOWS AND WORKSPACES ###
      ##############################

      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      # See https://wiki.hyprland.org/Configuring/Workspace-Rules/ for workspace rules

      # Example windowrule v1
      # windowrulev = [
      # "float,class:^(kitty)$"
      # ];

      layerrule = [
        "animation slide,rofi"
      ];

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
