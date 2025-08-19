{ pkgs, ... }: {
  stylix = {
    enable = true;

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

    image = ../wallpapers/nix-dark.png;
    polarity = "dark";
  };
}
