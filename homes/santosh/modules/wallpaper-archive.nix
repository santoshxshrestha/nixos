{ inputs, ... }:
let wallpapers = inputs.wallpaper-archive;
in { home.sessionVariables = { WALLPAPER_ARCHIVE_PATH = "${wallpapers}"; }; }
