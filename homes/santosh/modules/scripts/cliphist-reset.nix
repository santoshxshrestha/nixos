{ pkgs, config, ... }:
let
  cliphistReset = pkgs.writeShellScriptBin "cliphist-reset" ''
    #!/usr/bin/env bash
    DB="${config.home.homeDirectory}/.cache/cliphist/db";
    if [[ -f "$DB" ]]; then
    rm "$DB"
    echo "Cliphist database reset."
    else
    ${pkgs.cliphist}/bin/cliphist wipe
    echo "Cliphist data wiped ."
    fi
  '';
in
{
  home.packages = [ cliphistReset ];
}
