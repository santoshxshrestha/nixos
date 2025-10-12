{ lib, ... }:
let
  voxel = import ./modules/voxel.nix { inherit lib; };
  prime = import ./modules/prime.nix { inherit lib; };
in
{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    settings = voxel.settings;
  };
}
