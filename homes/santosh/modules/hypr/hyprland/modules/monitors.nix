{
  ################
  ### MONITORS ###
  ################

  # See https://wiki.hyprland.org/Configuring/Monitors/
  wayland.windowManager.hyprland.settings.monitor = [
    "eDP-1,1920x1080@60.00,0x0,1"

    # Projector / Extended monitor config
    # Automatically configure the projector (HDMI-A-1) to use its preferred resolution
    # and mirror the internal display (eDP-1). This ensures the projector matches its
    # native resolution and displays the same content as the laptop screen.
    "HDMI-A-1,preferred,auto,1,mirror,eDP-1"

    # Alternative manual configuration:
    # "HDMI-A-1,1920x1080@60,auto,1,mirror,eDP-1"
  ];
}
