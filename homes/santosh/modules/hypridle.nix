{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "hyprlock";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        unlock_cmd = "notify-send -t 5000 'Unlocked!'";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "notify-send -t 5000 'Zzz!'";
        }
        {
          timeout = 185;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume =
            "hyprctl dispatch dpms on && notify-send -t 2000 'Awake!'";
        }
        {
          timeout = 300;
          on-timeout = "hyprlock";
          on-resume = "notify-send -t 2000 'Welcome back'";
        }
        {
          timeout = 900;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };
}
