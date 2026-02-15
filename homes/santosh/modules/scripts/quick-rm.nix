{ pkgs, ... }:
let
  quick-rm = pkgs.writeShellScriptBin "quick-rm" ''
    #!/usr/bin/env bash

               ${pkgs.fzf}/bin/fzf --reverse --multi --prompt="✦ ❯ " --header="━━━━━━━━━━━━━━━ ✦ quick-rm✦ ━━━━━━━━━━━━━━━" \
                   --header-first \
                   --color="header:italic" \
                   --ignore-case \
                   --wrap \
                   --info=hidden \
                   --input-border=rounded \
                   --preview='${pkgs.coreutils}/bin/cat {}' \
                   --preview-border=rounded \
                   --preview-window=right:50%:wrap | xargs -r rm -vf
  '';
in
{
  home.packages = [ quick-rm ];
}
