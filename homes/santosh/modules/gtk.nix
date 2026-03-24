{ pkgs, ... }:
{
  gtk = {
    enable = true;

    colorScheme = "dark";

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 8;
    };

    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyonight-gtk-theme;
    };

    gtk2 = {
      iconTheme = {
        name = "Papirus-Dark";
        package = pkgs.papirus-icon-theme;
      };

    };

    gtk4 = {
      theme = null;
    };

  };
}
