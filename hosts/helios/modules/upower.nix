{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    upower.enable = lib.mkEnableOption "Enable upower (power actions service)";
  };
  config = lib.mkIf config.upower.enable {
    environment.systemPackages = [
      pkgs.upower-notify
    ];
    services.upower = {
      enable = true;
      percentageAction = 2;
      percentageLow = 20;
      percentageCritical = 10;
      criticalPowerAction = "Hibernate";
      allowRiskyCriticalPowerAction = true;
    };
  };
}
