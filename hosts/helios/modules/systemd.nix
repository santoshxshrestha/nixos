{ config, lib, ... }:
{
  options = {
    systemd.enable = lib.mkEnableOption "Enable systemd settings";
  };
  config = lib.mkIf config.systemd.enable {
    systemd = {
      sleep.settings.Sleep = {
        HibernateDelaySec = "20min";
      };
    };
  };
}
