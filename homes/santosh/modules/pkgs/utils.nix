{ pkgs, inputs }:
with pkgs;
[
  ffmpeg
  brightnessctl
  playerctl
  ripgrep
  vscode
  gimp
  discord
  mdwatch
  opencode

  obs-studio
  vlc
  mpv
  swaybg

  # Provided via flake inputs (not nixpkgs).
  # inputs.quickshell.packages.${stdenv.hostPlatform.system}.default
  inputs.qml-niri.packages.${stdenv.hostPlatform.system}.quickshell

  (import ./rust/crane-rs.nix {
    lib = lib;
    rustPlatform = pkgs.rustPlatform;
    fetchFromGitHub = pkgs.fetchFromGitHub;
  })
]
