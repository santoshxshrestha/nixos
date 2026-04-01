{ pkgs, ... }:
let
  quick-rm = pkgs.writeShellScriptBin "quick-rm" ''
    #!/usr/bin/env bash

               ${pkgs.fzf}/bin/fzf --reverse --multi --prompt="✦ ❯ " \
                   --color="pointer:#ffffff,marker:#000000" \
                   --ignore-case \
                   --wrap \
                   --info=hidden \
                   --input-border=rounded \
                   --preview='${pkgs.bat}/bin/bat --color=always --style=plain --paging=never {}' \
                   --preview-border=rounded \
                   --preview-window=right:50%:wrap | xargs -r rm -vf
  '';
in
{
  home.packages = [ quick-rm ];
}
