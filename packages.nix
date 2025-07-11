  # List packages installed in system profile. To search, run:
  # $ nix search wget
  {pkgs, ...} :
  {
  environment.systemPackages = with pkgs; [
#    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neovim
    firefox
    hyprland
    starship
    stow
    networkmanagerapplet
    pavucontrol
    fzf
    unzip
  ];
  users.users.santosh.packages = with pkgs; [
   # rose-pine-hyprcursor
  ];

  fonts.packages = with pkgs; [
  jetbrains-mono
  ];

  }
