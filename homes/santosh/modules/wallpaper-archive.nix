{ pkgs, inputs, lib, ... }:
let
  #  wallpapers = inputs.wallpaper-archive;
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    # sha256 = lib.fakeSha256;
    sha256 = "sha256-gdoheRh1CdiHCLi408K/3Rg/4BnQ39IuqL3wcQppjnU=";
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
