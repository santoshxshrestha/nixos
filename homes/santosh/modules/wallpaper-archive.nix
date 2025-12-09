{ pkgs, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    hash = "sha256-dxtfii4Qxb/MdMnjmTTALKI8IYVhB28OogEj7E9DXV4=";
  };
in
{
  home.sessionVariables = {
    WALLPAPER_ARCHIVE_PATH = "${wallpapers}";
  };
}
