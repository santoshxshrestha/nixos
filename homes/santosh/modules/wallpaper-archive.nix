{ pkgs, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    hash = "sha256-XsZzGU3ej+Ubn6WSeyZDunZHmfyb+sLooEbZ9dui/oc=";
  };
in
{
  home.sessionVariables = {
    WALLPAPER_ARCHIVE_PATH = "${wallpapers}";
  };
}
