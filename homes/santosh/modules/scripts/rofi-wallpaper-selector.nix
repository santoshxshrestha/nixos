{
  pkgs,
  ...
}:
let
  rofi-wallpaper-selector = pkgs.writeShellScriptBin "rofi-wallpaper-selector" ''
    #!/usr/bin/env bash
    WALLPAPER_DIR="$WALLPAPER_ARCHIVE_PATH/Static-Wallpapers"
    CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded)

    if ! pgrep hyprpaper >/dev/null; then
    hyprpaper &
    sleep 1
    fi

    WALLPAPER=$( for a in "$WALLPAPER_DIR"/*; do
    echo -en "$a\0icon\x1f$a\n"
    done | rofi -dmenu -p "wallpaper selector" -theme ~/nixos/homes/santosh/config/rofi/themes/wallpaper-selector.rasi)

    if [ -z "$WALLPAPER" ]; then
    notify-send "Wallpaper-selector" "No wallpaper selected, exiting..."
    exit 1
    fi

    hyprctl hyprpaper reload ,"$WALLPAPER"
    notify-send "Wallpaper-selector" "Wallpaper changed to $(basename "$WALLPAPER")"
    ln -sf "$WALLPAPER" ~/.current_wallpaper
  '';
in
{
  home.packages = [ rofi-wallpaper-selector ];

}
