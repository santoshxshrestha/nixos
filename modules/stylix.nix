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
        applications = 8;

        terminal = 11;
        desktop = 10;
        popups = 10;
      };
    };

    image = ../../home-manager/assets/nixos.png;
    polarity = "dark";
  };
}
