{ pkgs, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "commit hash";
    hash = "";
  };
in {
  home.file = {
    "Pictures/wallpaper-archive" = {
      source = "${wallpapers}/wallpaper-archive";
    };
  };
  # stylix.image = "${wallpapers}/path/to/wallpaper.png";
}
