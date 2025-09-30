{ pkgs, ... }:
let
  play = pkgs.writeShellScriptBin "play" ''
    if [[ -z "$1" ]]; then
      echo "Usage: play <url|haven>"
      exit 1
    fi

    if [[ "$1" == "haven" ]]; then
      "${pkgs.mpv}/bin/mpv" --no-video --shuffle --loop-playlist=inf "https://youtube.com/playlist?list=PLBBcaljFGSiSz8czPRv3tX3C4nKo4On4j&si=pXh1Ru-7vK-3evs5"
    elif [[ "$1" == "lofi" ]]; then
      "${pkgs.mpv}/bin/mpv" --no-video --shuffle --loop-playlist=inf "https://youtube.com/playlist?list=PLBBcaljFGSiSMYqaq-Vs-1hmnMyCvzW7D&si=Lcd-U9CV3pMydS6k"
    else
      "${pkgs.mpv}/bin/mpv" --no-video "$1"
    fi
  '';
in
{
  home.packages = [ play ];
}
