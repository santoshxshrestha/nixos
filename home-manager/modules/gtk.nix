{ pkgs, lib, ... }: {
  gtk = {
    enable = true;
    iconTheme = { name = "Papirus"; };
    # font = {
    #   name = "JetBrainsMono Nerd Font";
    #   size = 8;
    # };
  };
}
