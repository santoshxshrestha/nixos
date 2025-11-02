{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "dark-funeral";
      command = "${pkgs.nushell}/bin/nu";

      font-family = "JetBrainsMono Nerd Font";
      font-family-bold = "JetBrainsMono Nerd Font";
      font-family-italic = "JetBrainsMono Nerd Font";
      font-family-bold-italic = "JetBrainsMono Nerd Font";
      custom-shader-animation = true;
      custom-shader = "/home/santosh/nixos/homes/santosh/modules/terminals/ghostty/shaders/coil.glsl";
      # custom-shader = "/home/santosh/nixos/homes/santosh/modules/terminals/ghostty/shaders/glow.glsl";
      mouse-hide-while-typing = true;
    };
    themes = {
      dark-funeral = {
        # vim:ft=ghostty

        # name: DARK-FUNERAL colors for Ghostty
        # url: https://ghostty.org/
        # upstream: ${upstream}
        # author: Andrea Schiavini (original code by Casey Miller)

        background = "#000000";
        # alternate, darker background #060f23
        foreground = "#c1c1c1";
        selection-background = "#333333";
        selection-foreground = "#c1c1c1";
        cursor-color = "#c1c1c1";
        palette = [
          # normal
          "0=#060f23"
          "1=#5f8787"
          "2=#c1c1c1"
          "3=#888888"
          "4=#aaaaaa"
          "5=#999999"
          "6=#fbcb97"
          "7=#c1c1c1"
          # bright
          "8=#505050"
          "9=#5f8787"
          "10=#c1c1c1"
          "11=#888888"
          "12=#aaaaaa"
          "13=#d0dfee"
          "14=#fbcb97"
          "15=#c1c1c1"
        ];
        background-opacity = 0.8;
      };
    };
  };
}
