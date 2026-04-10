{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    systemd.enable = lib.mkEnableOption "Enable systemd settings";
  };
  config = lib.mkIf config.systemd.enable {
    systemd = {
      sleep.settings.Sleep = {
        HibernateDelaySec = "20min";
      };
      # services.capslock-blink = {
      #   wantedBy = [ "multi-user.target" ];
      #
      #   serviceConfig = {
      #     ExecStart = pkgs.writeShellScript "blink" ''
      #       LED=/sys/class/leds/input11::capslock/brightness
      #       while true; do
      #         printf 1 > "$LED"
      #         sleep 0.2
      #         printf 0 > "$LED"
      #         sleep 0.2
      #       done
      #     '';
      #     Restart = "always";
      #     User = "root";
      #   };
      # };
    };
  };
}
