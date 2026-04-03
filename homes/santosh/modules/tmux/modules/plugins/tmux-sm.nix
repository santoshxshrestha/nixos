{ pkgs, ... }:
let
  tmux-sm = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-sm";
    version = "unstable-2026-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "vimlinuz";
      repo = "tmux-sm";
      rev = "2f99e1e230e8a8c99e419dee478cf0ba5ff118e3";
      sha256 = "sha256-8/vjFWL3s1/y0CSFH7e72nq1YLH4FCaxERXJsNRkECw=";
    };
  };

in
{
  plugin = tmux-sm;
  extraConfig = ''
    set -g @session_switcher_key 'S'
    set -g @session_create_key 'J'
    set -g @session_popup_width '80%'
    set -g @session_popup_height '60%'
    set -g @session_switcher_header ""
    set -g @session_creator_header ""
  '';
}
