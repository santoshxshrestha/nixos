{ pkgs, ... }:
let
  play = pkgs.writeShellScriptBin "play" ''
    if [[ -z "$1" ]]; then
    echo "Usage: play [--select] <url|haven|lofi>"
    exit 1
    fi

    select_mode=false
    if [[ "$1" == "--select" ]]; then
    select_mode=true
    shift
    fi

    if [[ "$1" == "haven" ]]; then
    url="https://youtube.com/playlist?list=PLBBcaljFGSiSz8czPRv3tX3C4nKo4On4j&si=pXh1Ru-7vK-3evs5"
    if $select_mode; then
    selected=$("${pkgs.yt-dlp}/bin/yt-dlp" --flat-playlist -J "$url" | "${pkgs.jq}/bin/jq" -r '.entries[] | .title + " " + .url' | "${pkgs.fzf}/bin/fzf" | awk '{print $NF}')
    if [[ -n "$selected" ]]; then
    "${pkgs.mpv}/bin/mpv" --no-video "$selected"
    else
    echo "No selection made."
    fi
    fi
    fi

    if [[ "$1" == "lofi" ]]; then
    url="https://youtube.com/playlist?list=PLBBcaljFGSiSMYqaq-Vs-1hmnMyCvzW7D&si=Lcd-U9CV3pMydS6k"
    if $select_mode; then
    selected=$("${pkgs.yt-dlp}/bin/yt-dlp" --flat-playlist -J "$url" | "${pkgs.jq}/bin/jq" -r '.entries[] | .title + " " + .url' | "${pkgs.fzf}/bin/fzf" | awk '{print $NF}')
    if [[ -n "$selected" ]]; then
    "${pkgs.mpv}/bin/mpv" --no-video "$selected"
    else
    echo "No selection made."
    fi
    else
    "${pkgs.mpv}/bin/mpv" --no-video --shuffle --loop-playlist=inf "$url"
    fi
    fi

    if [[ "$1" != "haven" && "$1" != "lofi" ]]; then
    "${pkgs.mpv}/bin/mpv" --no-video "$1"
    fi
  '';
in
{
  home.packages = [ play ];
}
