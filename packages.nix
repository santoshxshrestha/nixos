  # List packages installed in system profile. To search, run:
  # $ nix search wget
  {pkgs, ...} :
  {
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neovim
    firefox
    hyprland
    starship
    hyprpaper
    kitty
    tmux
    zsh
    stow
    rofi-wayland
    waybar
    networkmanagerapplet
    pavucontrol
    wl-clipboard
    brightnessctl
    hyprlock
    fzf
    unzip
    hyprcursor
    rose-pine-hyprcursor

  ];
  }
