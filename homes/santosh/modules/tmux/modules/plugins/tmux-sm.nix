{ pkgs, ... }:
let
  tmux-sm = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-sm";
    rtpFilePath = "main.tmux";
    version = "unstable-2026-04-03";
    src = pkgs.fetchFromGitHub {
      owner = "vimlinuz";
      repo = "tmux-sm";
      rev = "0821275f3c347fa22a184f02487a238adb66d8ad";
      hash = "sha256-VXwW7UWa8tiQkP66OnqKIDTWwQS1mmnBazEe+WbSIhU=";
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
    set -g @session_switcher_header ""
    set -g @session_creator_header ""
  '';
}
