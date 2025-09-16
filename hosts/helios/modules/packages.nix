# List packages installed in system profile. To search, run:
# $ nix search wget
{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    #    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    vim
    neovim
    hyprland
    stow
    networkmanagerapplet
    pavucontrol
    fzf
    unzip
    bat
    fd
    tree
  ];
  users.users.santosh.packages = with pkgs; [
    # rose-pine-hyprcursor
  ];

  fonts.packages = with pkgs; [ jetbrains-mono ];

}
