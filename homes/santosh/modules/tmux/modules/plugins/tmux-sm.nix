{ pkgs, ... }:
let
  tmux-sm = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-sm";
    rtpFilePath = "main.tmux";
    version = "unstable-2026-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "vimlinuz";
      repo = "tmux-sm";
      rev = "d821614efa75abc6d5246cf3a47608293c4b4a51";
      hash = "sha256-kmVUFiDg8R9BHfhnkAuzIDX4RNHMm/f3EjgqfFux0rE=";
    };
  };

in
{
  plugin = tmux-sm;
  extraConfig = ''
    set -g @session_switcher_key 'j'
    # I will use the one that I alraedy use for creation of session
    set -g @session_create_key 'S'
    set -g @session_popup_width '80%'
    set -g @session_popup_height '60%'
    set -g @session_switcher_header ' '
    set -g @session_creator_header ' '
  '';
}
