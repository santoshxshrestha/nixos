{ config, ... }:
{
  #################
  ### AUTOSTART ###
  #################
  # Autostart necessary processes (like notifications daemons, status bars, etc.)
  # Or execute your favorite apps at launch like this:

  wayland.windowManager.hyprland.settings = {
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
  };
}
