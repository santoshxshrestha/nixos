{ pkgs, ... }:
let
  tmux-sm = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-sm";
    rtpFilePath = "main.tmux";
    version = "unstable-2026-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "vimlinuz";
      repo = "tmux-sm";
      rev = "97d411a11d124443c982d17fde03c1e09809d7b1";
      hash = "sha256-7HW/TLP/yyQp4j0/utA0tibTv+suV1B2K56pUS3Z004=";
    };
  };

in
{
  plugin = tmux-sm;
  extraConfig = ''
    set -g @sessionizer_key '-n M-i'
    set -g @sessionizer_height '70%'
    set -g @sessionizer_width '80%'
    set -g @session_manager_width '35%'
  '';
}
