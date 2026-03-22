{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = {
    plymouth.enable = lib.mkEnableOption "Enable Plymouth for a graphical boot splash screen";
  };
  config = lib.mkIf config.plymouth.enable {
    boot = {
      plymouth = {
        enable = true;
        theme = "cuts_alt";
        themePackages = with pkgs; [
          # adi1090x-plymouth-themes
          (adi1090x-plymouth-themes.override {
            selected_themes = [
              "connect"
              "circle_hud"
              "cuts_alt"
              "deus_ex"
              "double"
              "hexagon_dots"
              "hud_3"
              "spinner_alt"
            ];
          })
        ];
      };

      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "udev.log_level=3"
        "systemd.show_status=auto"
      ];

    };
  };
}
