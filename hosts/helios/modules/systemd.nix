{ config, lib, ... }:
{
  options = {
    systemd.enable = lib.mkEnableOption "Enable systemd settings";
  };
  config = lib.mkIf config.systemd.enable {
    systemd = {
      sleep.extraConfig = ''
        HibernateDelaySec=20min
      '';
    };
  };
}
