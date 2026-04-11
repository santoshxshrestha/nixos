{ pkgs, ... }:
let
  tmux-sm = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-sm";
    rtpFilePath = "main.tmux";
    version = "unstable-2026-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "vimlinuz";
      repo = "tmux-sm";
      rev = "b4c3a5d79e329791976a5d51bdcad036e3861522";
      hash = "sha256-VmTVeQcva0TCYncCHTybt4vsqh5hGURJ1DC1H7me5Rs=";
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
