{ pkgs, colors, ... }:
{
  plugin = pkgs.tmuxPlugins.tmux-floax;
  extraConfig = ''

    # Floax Configuration
    # set -g @floax-border-color '#7195D2'
    set -g @floax-border-color '${colors.rose_subtle}'
    # M- means "hold Meta/Alt"
    set -g @floax-bind '-n M-o'
    set -g @floax-title  '   #{user}@#{host} '
    set -g @floax-width '100%'
    set -g @floax-height '100%'
  '';
}
