let useAesthetics = true;
in {
  imports = if useAesthetics then
    [ ./tmux_aesthetics.nix ]
  else
    [ ./tmux_performance.nix ];
  programs.tmux = { enable = true; };
}
