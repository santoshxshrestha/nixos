{ pkgs, ... }:
let
  play = pkgs.writeShellScriptBin "play" ''

    url_haven="https://youtube.com/playlist?list=PLBBcaljFGSiSz8czPRv3tX3C4nKo4On4j&si=pXh1Ru-7vK-3evs5"
    url_lofi="https://youtube.com/playlist?list=PLBBcaljFGSiSMYqaq-Vs-1hmnMyCvzW7D&si=Lcd-U9CV3pMydS6k"

    if [[ -z "$1" || "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Usage: play [--select|-s] <url|haven|lofi>"
    exit 1
    fi

    select_mode=false
    if [[ "$1" == "--select" || "$1" == "-s" ]]; then
    select_mode=true
    shift
    fi

    if [[ "$select_mode" == true && "$1" == "haven" ]]; then
    selected=$(${pkgs.yt-dlp}/bin/yt-dlp --flat-playlist -J "$url_haven" | ${pkgs.jq}/bin/jq -r '.entries[] | .title + " " + .url' | ${pkgs.fzf}/bin/fzf | awk '{print $NF}')
    if [[ -n "$selected" ]]; then
    ${pkgs.mpv}/bin/mpv --no-video "$selected"
    else
    echo "No selection made."
    fi
    fi

    if [[ "$select_mode" == false && "$1" == "haven" ]]; then
    ${pkgs.mpv}/bin/mpv --no-video --shuffle --loop-playlist=inf "$url_haven"
    fi

    if [[ "$select_mode" == true && "$1" == "lofi" ]]; then
    selected=$(${pkgs.yt-dlp}/bin/yt-dlp --flat-playlist -J "$url_lofi" | ${pkgs.jq}/bin/jq -r '.entries[] | .title + " " + .url' | ${pkgs.fzf}/bin/fzf | awk '{print $NF}')
    if [[ -n "$selected" ]]; then
    ${pkgs.mpv}/bin/mpv --no-video "$selected"
    else
    echo "No selection made."
    fi
    fi

    if [[ "$select_mode" == false && "$1" == "lofi" ]]; then
    ${pkgs.mpv}/bin/mpv --no-video --shuffle --loop-playlist=inf "$url_lofi"
    fi

    if [[ "$select_mode" == true && "$1" != "haven" && "$1" != "lofi" ]]; then
    selected=$(${pkgs.yt-dlp}/bin/yt-dlp --flat-playlist -J "$1" | jq -r '.entries[] | .title + " " + .url' | ${pkgs.fzf}/bin/fzf | awk '{print $NF}')
    if [[ -n "$selected" ]]; then
    ${pkgs.mpv}/bin/mpv --no-video "$selected"
    else
    echo "No selection made."
    fi
    fi

    # I dong think so I will ever play single song from url so no need to handle that case
    # just shuffle and play the whole playlist
    if [[ "$1" != "haven" && "$1" != "lofi" ]]; then
    ${pkgs.mpv}/bin/mpv --no-video --shuffle --loop-playlist=inf "$1"
    fi
  '';
in
{
  home.packages = [ play ];
}
