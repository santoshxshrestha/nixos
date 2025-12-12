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
      package = inputs.nh.packages.${pkgs.system}.nh;
    };
  };
}
