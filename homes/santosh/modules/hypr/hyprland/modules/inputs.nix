#############
### INPUT ###
#############
# https://wiki.hyprland.org/Configuring/Variables/#input
{
  wayland.windowManager.hyprland.settings = {
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
  };
}
