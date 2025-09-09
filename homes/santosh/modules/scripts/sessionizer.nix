{ pkgs, config, ... }:

let
  sessionizer = pkgs.writeShellScriptBin "sessionizer" ''
    if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(
            find ${config.home.homeDirectory} -mindepth 1 -maxdepth 4 -type d | ${pkgs.fzf}/bin/fzf --reverse --prompt="✦ ❯ " --header="━━━━━━━━━━━━━━━ ✦ SESSIONIZER ✦ ━━━━━━━━━━━━━━━" \
                --header-first \
                --border="rounded" \
                --color="header:italic" \
                --preview='${pkgs.tree}/bin/tree -C -L 3 -I "node_modules|.git|target" {}' \
                --preview-window=right:50%:wrap
        )
    fi

    if [[ -z $selected ]]; then
        exit 0
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(${pkgs.procps}/bin/pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        ${pkgs.tmux}/bin/tmux new-session -s "$selected_name" -c "$selected"
        exit 0
    fi

    if ! ${pkgs.tmux}/bin/tmux has-session -t="$selected_name" 2>/dev/null; then
        ${pkgs.tmux}/bin/tmux new-session -ds "$selected_name" -c "$selected"
    fi

    if [[ -z $TMUX ]]; then
        ${pkgs.tmux}/bin/tmux attach-session -t "$selected_name"
        exit 0
    else
        ${pkgs.tmux}/bin/tmux switch-client -t "$selected_name"
    fi
  '';
in { home.packages = [ sessionizer ]; }
