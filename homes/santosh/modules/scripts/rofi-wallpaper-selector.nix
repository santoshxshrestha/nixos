{
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

    WALLPAPER=$( for a in "$WALLPAPER_DIR"/*; do
    # echo -en "$a\0icon\x1f$a\n"
    echo -en "$(basename "$a")\0icon\x1f$a\n"
    done | rofi -dmenu -p "wallpaper selector" -theme ~/nixos/homes/santosh/config/rofi/themes/wallpaper-selector.rasi)

    if [ -z "$WALLPAPER" ]; then
    notify-send "Wallpaper-selector" "No wallpaper selected, exiting..."
    exit 1
    fi

    NEW_WALLPAPER=$WALLPAPER_DIR/$WALLPAPER

    hyprctl hyprpaper reload ,"$NEW_WALLPAPER"
    notify-send "Wallpaper-selector" "Wallpaper changed to $WALLPAPER"
    ln -sf "$NEW_WALLPAPER" ~/.current_wallpaper
  '';
in
{
  home.packages = [ rofi-wallpaper-selector ];
}
