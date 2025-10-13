{
  # -----------------------------------------------------
  # General window decoration
  # Current: "Default" with transparency and blur effects
  # Alternative "No Border" configuration commented below
  # -----------------------------------------------------

  # https://wiki.hyprland.org/Configuring/Variables/#decoration
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 10;

      # Change transparency of focused and unfocused windows
      active_opacity = 0.95;
      inactive_opacity = 0.95;
      # inactive_opacity = 0.8;
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
        # color = "0x66000000";
        color = "0x66505050";
        color_inactive = "0x66202020";
        sharp = false;
        ignore_window = true;
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
  };
}
