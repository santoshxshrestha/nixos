{
  pkgs,
  colors,
  ...
}:
let
  floax = import ./plugins/floax.nix { inherit pkgs colors; };
  prefixHighlight = import ./plugins/prefix-highlight.nix { inherit pkgs colors; };
  # battery = import ./plugins/battery.nix { inherit pkgs; };
  misc = import ./plugins/misc.nix { inherit pkgs; };
  tmux-sm = import ./plugins/tmux-sm.nix { inherit pkgs; };

in
misc
++ [
  floax
  prefixHighlight
  # battery
  tmux-sm
]
