{ pkgs, ... }:
let
  colors = import ./modules/colors.nix;
  tmux-session-manager = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-session-manager";
    name = "tmux-session-manager";
    src = pkgs.fetchFromGitHub {
      owner = "santoshxshrestha";
      repo = "tmux-session-manager";
      rev = "07c0d4447a40248bea4f04ab9b61263512394500";
      sha256 = "sha256-94s2I7NUKy0rTdNcI5105LPK/TNDdF2Cuegdxuz6qYA=";
    };
  };
in
{
  programs.tmux = {
    enable = true;
    mouse = true;
    prefix = "C-a";
    # shell = "${pkgs.fish}/bin/fish";
    shell = "${pkgs.nushell}/bin/nu";
    terminal = "xterm-256color";
    escapeTime = 0;
    baseIndex = 1;
    plugins = import ./modules/plugins.nix { inherit pkgs colors tmux-session-manager; };

    extraConfig = import ./modules/config.nix { inherit colors; };
  };
}
