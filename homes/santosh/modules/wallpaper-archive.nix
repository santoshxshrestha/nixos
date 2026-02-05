{ pkgs, ... }:
let
  wallpapers = pkgs.fetchFromGitHub {
    owner = "santoshxshrestha";
    repo = "wallpaper-archive";
    rev = "main";
    hash = "sha256-e2qm4awZN9Jkeo3VhJcVVcMr0/RZ1VqCYeUo7FEpwd4=";
  };
in
{
  home.sessionVariables = {
    WALLPAPER_ARCHIVE_PATH = "${wallpapers}";
  };
}
