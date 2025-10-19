{ pkgs, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    hash = "sha256-9vOvahmZu2uldxwoGySds+kKdq+sBzTEggEIug9+TPU=";
  };
in
{
  home.sessionVariables = {
    WALLPAPER_ARCHIVE_PATH = "${wallpapers}";
  };
}
