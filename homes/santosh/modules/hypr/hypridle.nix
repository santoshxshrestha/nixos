{
  services.hypridle = {
    enable = false;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "notify-send -t 4500 'Zzz!'";
        }
        {
          timeout = 185;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on && notify-send -t 2000 'Awake!'";
        }
        {
          timeout = 300;
          on-timeout = "hyprlock";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend-then-hibernate";
        }
      ];
    };
  };
}
