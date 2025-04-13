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
  
  ];
  users.users.santosh.packages = with pkgs; [
  rose-pine-hyprcursor
  mpvpaper
  hyprpaper
  btop
  fastfetch
  ];

  nixpkgs.config.allowUnfree = true;
  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk-sans
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  ];

  }
