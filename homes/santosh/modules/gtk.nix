{ pkgs, ... }:
{
  gtk = {
    enable = true;

    colorScheme = "dark";

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    gtk2 = {
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

      font = {
        name = "JetBrainsMono Nerd Font";
        size = 8;
      };

    };

    gtk4 = {
      theme = null;
    };

  };
}
