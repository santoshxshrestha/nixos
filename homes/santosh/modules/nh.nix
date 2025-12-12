{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:
{
  options = {
    nh.enable = lib.mkEnableOption "Enable nh";
  };
  config = lib.mkIf config.nh.enable {
    programs.nh = {
      enable = true;
      package = inputs.nh.packages.${pkgs.stdenv.hostPlatform.system}.nh;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "${config.home.homeDirectory}/nixos";
    };
  };
}
