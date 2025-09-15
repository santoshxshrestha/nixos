{ pkgs, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    sha256 = "sha256-YGuw+ADfTIeguvdi5rjJhQrtpOdEEQ/hG2wID4ilFfc=";
  };
in { home.sessionVariables = { WALLPAPER_ARCHIVE_PATH = "${wallpapers}"; }; }
