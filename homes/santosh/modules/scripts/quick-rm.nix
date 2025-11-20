{ pkgs, ... }:
let
  quick-rm = pkgs.writeShellScriptBin "quick-rm" ''
    #!/usr/bin/env bash

           target=$(
               ${pkgs.fzf}/bin/fzf --reverse --prompt="✦ ❯ " --header="━━━━━━━━━━━━━━━ ✦ quick-rm✦ ━━━━━━━━━━━━━━━" \
                   --header-first \
                   --color="header:italic" \
                   --ignore-case \
                   --wrap \
                   --info=hidden \
                   --input-border=rounded \
                   --preview='${pkgs.coreutils}/bin/cat {}' \
                   --preview-border=rounded \
                   --preview-window=right:50%:wrap
          )
           if [[ -n "$target" ]]; then
             rm -rf "$target"
           fi
  '';
in
{
  home.packages = [ quick-rm ];
}
