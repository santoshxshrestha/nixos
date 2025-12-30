{ pkgs, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    hash = "sha256-luLahZ6VrSUNSm2Lx91pGYagZQyyynEjCOqjIwHFRpE=";
  };
in
{
  home.sessionVariables = {
    WALLPAPER_ARCHIVE_PATH = "${wallpapers}";
  };
}
