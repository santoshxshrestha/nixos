{
  pkgs,
  colors,
  tmux-session-manager,
  ...
}:
let
  floax = import ./plugins/floax.nix { inherit pkgs colors; };
  # prefixHighlight = import ./plugins/prefix-highlight.nix { inherit pkgs colors; };
  # battery = import ./plugins/battery.nix { inherit pkgs; };
  misc = import ./plugins/misc.nix { inherit pkgs tmux-session-manager; };
in
misc
++ [
  floax
  # prefixHighlight
  # battery
]
