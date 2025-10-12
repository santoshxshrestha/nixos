{ lib, ... }:
let
  voxel = import ./modules/voxel.nix { inherit lib; };
in
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = voxel.programs.starship.settings;
  };
}
