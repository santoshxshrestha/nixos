{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "hyprlock && notify-send -t 3000 'Zzz'";
        after_sleep_cmd =
          "hyprctl dispatch dpms on ; notify-send -t 3000 'Awake!'";
        unlock_cmd = "notify-send -t 2000 'Unlocked!'";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
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
