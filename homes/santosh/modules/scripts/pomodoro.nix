{ pkgs, ... }:
let
  paplay = "${pkgs.pulseaudio}/bin/paplay";
  sound = "${pkgs.sound-theme-freedesktop}/share/sounds/freedesktop/stereo";
  pomodoro = pkgs.writeShellScriptBin "pomodoro" ''
        #!/usr/bin/env bash
    START_SOUND="${sound}/window-question.oga"
        ${paplay} "$START_SOUND"
        ${paplay} "$START_SOUND"

        WORK_TIME=1500 # 25 minutes
        BREAK_TIME=300 # 5 minutes

         ALERT_SOUND="${sound}/complete.oga"

        ${pkgs.libnotify}/bin/notify-send "Pomodoro Started" "25 minutes of focus time!"
        sleep $WORK_TIME

        ${paplay} "$ALERT_SOUND" # Play sound
        ${pkgs.libnotify}/bin/notify-send "Time's Up!" "Take a 5-minute break!"
        sleep $BREAK_TIME

        ${paplay} "${sound}/alarm-clock-elapsed.oga"
        ${pkgs.libnotify}/bin/notify-send "Break Over!" "Ready for another session?" --icon=dialog-information

  '';
in
{
  home.packages = [ pomodoro ];
}
