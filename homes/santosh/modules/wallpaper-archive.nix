{ pkgs, lib, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    sha256 = "sha256-0OmIh1WFPMbvsioTmhGjCTNBuFrPoLgMvIN49vhm7d8=";
  };
in { home.sessionVariables = { WALLPAPER_ARCHIVE_PATH = "${wallpapers}"; }; }
