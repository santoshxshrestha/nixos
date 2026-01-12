{ pkgs, inputs }:
with pkgs;
[
  ffmpeg
  wl-clipboard
  brightnessctl
  playerctl
  ripgrep
  vscode
  gimp
  discord
  mdwatch
  opencode

  obs-studio
  xwayland-satellite
  vlc
  mpv
  swaybg

  # Provided via flake inputs (not nixpkgs).
  inputs.quickshell.packages.${pkgs.system}.default
  inputs.qml-niri.packages.${pkgs.system}.quickshell
]
