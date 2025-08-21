{ pkgs, lib, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    sha256 = lib.fakeSha256;
  };
in {
  home.file = {
    "Pictures/wallpaper-archive" = {
      source = "${wallpapers}/wallpaper-archive";
      recursive = true;
    };
  };
  # stylix.image = "${wallpapers}/path/to/wallpaper.png";
}
