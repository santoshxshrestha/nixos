{ pkgs, lib, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    # sha256 = lib.fakeSha256;
    sha256 = "sha256-MwWc27LiZcg5oi+brOmZV4JkWrAezRuN+Z2hQBh7q3I=";
  };
in {
  # home.file = {
  #   "Pictures/wallpaper-archive" = {
  #     source = "${wallpapers}";
  #     recursive = true;
  #   };
  home.sessionVariables = { WALLPAPER_ARCHIVE_PATH = "${wallpapers}"; };
  # stylix.image = "${wallpapers}/path/to/wallpaper.png";
}
