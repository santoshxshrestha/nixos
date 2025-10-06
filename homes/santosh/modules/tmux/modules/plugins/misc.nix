{ pkgs, tmux-session-manager }:
with pkgs;
[
  tmuxPlugins.sensible
  tmuxPlugins.vim-tmux-navigator

  # {
  #   plugin = tmux-session-manager;
  #   extraConfig = ''
  #     set -g @session_manager_key 'j'
  #   '';
  # }
]
