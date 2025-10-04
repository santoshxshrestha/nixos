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
    WALLPAPER=$(find "$WALLPAPER_DIR" | fzf)

    # WALLPAPER=$(kitty -e bash -c "fzf $(find "$WALLPAPER_DIR")")
    # WALLPAPER=$(kitty -e bash -c "fzf $(find "$WALLPAPER_DIR") || exit")
    # WALLPAPER=$(kitty -e bash -c "$WALLPAPER_DIR" | fzf)
    # WALLPAPER=
    # for a in "$WALLPAPER_DIR"/*; do
    #     echo -en "$a\0icon\x1f$a\n"
    # done | rofi -dmenu

    # WALLPAPER=$(find "$WALLPAPER_DIR" | rofi -dmenu -p "wallpaper selector" -theme ~/.config/rofi/themes/clipboard.rasi)

    hyprctl hyprpaper reload ,"$WALLPAPER"
  '';
in
{
  home.packages = [ rofi-wallpaper-selector ];

}
