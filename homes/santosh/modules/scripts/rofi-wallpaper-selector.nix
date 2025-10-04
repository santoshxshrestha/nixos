{
  lib,
  config,
  pkgs,
  ...
}:
let
  rofi-wallpaper-selector = pkgs.writeShellScriptBin "rofi-wallpaper-selector" ''
    #!/usr/bin/env bash
    WALLPAPER_DIR="$WALLPAPER_ARCHIVE_PATH/Static-Wallpapers"

    if ! pgrep hyprpaper >/dev/null; then
    hyprpaper &
    sleep 1
    fi
    # WALLPAPER=$(find "$WALLPAPER_DIR" | fzf)

    WALLPAPER=$( for a in "$WALLPAPER_DIR"/*; do
    echo -en "$a\0icon\x1f$a\n"
    done | rofi -dmenu -p "wallpaper selector" -theme ~/.config/rofi/themes/wallpaper-selector.rasi)

    # WALLPAPER=$(find "$WALLPAPER_DIR" | rofi -dmenu -p "wallpaper selector" -theme ~/.config/rofi/themes/clipboard.rasi)
    if [ -z "$WALLPAPER" ]; then
    notify-send "No wallpaper selected, exiting..."
    fi

    hyprctl hyprpaper reload ,"$WALLPAPER"
    notify-send "Wallpaper changed to $(basename "$WALLPAPER")"
  '';
in
{
  home.packages = [ rofi-wallpaper-selector ];

}
