{ pkgs, ... }:
let
  tmux-sm = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-sm";
    rtpFilePath = "main.tmux";
    version = "unstable-2026-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "vimlinuz";
      repo = "tmux-sm";
      rev = "8ed7878bb8c8e62e6e96ad7c9fb930e5f6c8c5ef";
      hash = "sha256-ZOiTv3E4NdqztHpmdgLjmBZDkOUNwqkvBUhvq7zctkY=";
    };
  };

in
{
  plugin = tmux-sm;
  extraConfig = ''
    set -g @session_switcher_key 'j'
    # I will use the one that I alraedy use for creation of session
    set -g @session_create_key 'S'
    set -g @session_popup_width '30%'
    set -g @session_popup_height '20%'
  '';
}
