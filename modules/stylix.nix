{ pkgs, ... }: {
  stylix = {
    enable = true;
    image = ../wallpapers/anime-night-sky-illustration.jpg;

    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";

    # base16Scheme = {
    #   base00 = "#1c1c1c";
    #   base01 = "#2a2a2a";
    #   base02 = "#3a3a3a";
    #   base03 = "#505050";
    #   base04 = "#b0b0b0";
    #   base05 = "#d0d0d0";
    #   base06 = "#e0e0e0";
    #   base07 = "#ffffff";
    #   base08 = "#fb4934";
    #   base09 = "#fe8019";
    #   base0A = "#fabd2f";
    #   base0B = "#8ec07c";
    #   base0C = "#8ec0c0";
    #   base0D = "#83a598";
    #   base0E = "#d3869b";
    #   base0F = "#d65d0e";
    # };

    fonts = {
      serif = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };

      sansSerif = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font";
      };

      monospace = {
        package = pkgs.nerd-fonts.hack;
        name = "Hack Nerd Font Mono";
      };

      emoji = {
        name = "Noto Emoji";
        package = pkgs.noto-fonts-monochrome-emoji;
      };

      sizes = {
        applications = 10;
        terminal = 10;
        desktop = 10;
        popups = 10;
      };

    };
  };
}
