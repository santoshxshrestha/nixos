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
  # inputs.quickshell.packages.${stdenv.hostPlatform.system}.default
  inputs.qml-niri.packages.${stdenv.hostPlatform.system}.quickshell
]
